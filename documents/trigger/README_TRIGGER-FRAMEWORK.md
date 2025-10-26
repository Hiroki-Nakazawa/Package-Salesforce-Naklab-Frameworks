# Trigger-Framework

This document describes the Trigger-Framework components included in this repo, focusing on `nlf_TriggerHandler` and `nlf_TriggerContextProvider`.

## Overview

The framework standardizes trigger logic by separating:

- Context acquisition (how `Trigger.new`/`Trigger.old`, maps, and operation are obtained)
- Operation dispatch (routing to lifecycle hooks)
- Testability (ability to inject a context provider, avoiding hard dependency on static Trigger variables)

## nlf_TriggerHandler

- Purpose
  - Base abstract class for trigger handlers. It centralizes orchestration for each `TriggerOperation` and exposes trigger context collections for use in concrete handlers.
- Responsibilities
  - Determine the current `TriggerOperation` and invoke the corresponding hook:
    - `beforeInsert`, `afterInsert`
    - `beforeUpdate`, `afterUpdate`
    - `beforeDelete`, `afterDelete`
    - `afterUndelete`
  - Provide read-only accessors to trigger context data:
    - `newList`, `oldList`
    - `newMap`, `oldMap`
    - `operationType`
  - Encapsulate guard logic and ensures run() is called once per operation in trigger code.

- Usage
  1. Create a subclass per SObject, e.g.:
     - `public with sharing class AccountTriggerHandler extends nlf_TriggerHandler { ... }`
  2. Override only the lifecycle hooks that you need for your business logic.
  3. In the trigger, instantiate the handler and call `run()` once.

- Example (pseudocode)

  ```apex
  trigger AccountTrigger on Account (
    before insert, after insert,
    before update, after update,
    before delete, after delete,
    after undelete
  ) {
    nlf_TriggerHandler handler = new AccountTriggerHandler();
    handler.run();
  }
  ```

- Testability
  - Handlers can be unit tested by providing a custom context provider. This allows validating orchestration behavior without inserting/updating real records.

## nlf_TriggerContextProvider

- Purpose
  - Abstracts the source of trigger context, decoupling handlers from direct usage of `Trigger.new` / `Trigger.old` / maps and `Trigger.isBefore`/`Trigger.isAfter` flags.

- Responsibilities
  - Provide the following to the handler:
    - `operationType()`: returns the current `TriggerOperation`
    - `newList()`, `oldList()`: lists for before/after contexts
    - `newMap()`, `oldMap()`: maps keyed by `Id` for after contexts where applicable

- Default Behavior
  - The production implementation reads from `Trigger.*` variables at runtime and translates them into the framework’s normalized context.

- Test Support
  - Tests can subclass `nlf_TriggerContextProvider` to inject:
    - A specific `operationType` (e.g. `BEFORE_UPDATE`)
    - Empty or fabricated lists/maps as needed
  - Benefit: write deterministic unit tests without DML or database setup.

- Example (from tests)
  - A private inner class extends `nlf_TriggerContextProvider` and overrides `operationType()` to return a desired `TriggerOperation` for the test; collections can be empty to assert orchestration and routing only.

## Typical Wiring

- For each SObject:
  - Create a concrete handler extending nlf_TriggerHandler.
  - In the trigger, construct the handler and call run().
- The handler overrides needed hooks and uses the provided context collections; if a hook is not overridden, the base class safely ignores it.

## Notes

- Keep business logic out of trigger bodies; delegate to handlers.
- Use dependency injection of the context provider for unit tests.
- Ensure one-time invocation of run() per trigger execution to avoid duplicate processing.
