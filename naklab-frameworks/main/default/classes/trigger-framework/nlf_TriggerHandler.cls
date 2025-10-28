/**
 * Abstract base class for trigger handlers.
 * @author Hiroki Nakazawa
 * @since  2025-10-23
 * @group  Trigger-Framework
 */
public abstract class nlf_TriggerHandler {
    
    /**
     * Provides access to trigger context data.
     */
    @TestVisible
    public nlf_TriggerContextProvider context { get; private set; }
    
    /**
     * Initializer to set the default context provider.
     */
    { context = new nlf_TriggerContextProvider(); }
    
    /**
     * List of new records in the trigger context.
     */
    protected List<SObject> newList { get { return newList == null ? newList = context.newList() : newList; } private set; }

    /**
     * List of old records in the trigger context.
     */
    protected List<SObject> oldList { get { return oldList == null ? oldList = context.oldList() : oldList; } private set; }

    /**
     * Map of new records in the trigger context.
     */
    protected Map<Id,SObject> newMap { get { return newMap == null ? newMap = context.newMap() : newMap; } private set; }

    /**
     * Map of old records in the trigger context.
     */
    protected Map<Id,SObject> oldMap { get { return oldMap == null ? oldMap = context.oldMap() : oldMap; } private set; }

    /**
     * Operation type of the trigger context.
     */
    protected TriggerOperation operationType { get { return operationType == null ? operationType = context.operationType() : operationType; } private set; }

    /**
     * Main entry point to run the appropriate handler based on the trigger operation type.
     * @author Hiroki Nakazawa
     * @since  2025-10-24
     */
    public void run(){
        switch on operationType {
            when BEFORE_INSERT  { this.beforeInsert();  }
            when AFTER_INSERT   { this.afterInsert();   }
            when BEFORE_UPDATE  { this.beforeUpdate();  }
            when AFTER_UPDATE   { this.afterUpdate();   }
            when BEFORE_DELETE  { this.beforeDelete();  }
            when AFTER_DELETE   { this.afterDelete();   }
            when AFTER_UNDELETE { this.afterUndelete(); }
        }
    }

    /**
     * Handler for before insert operation.
     * @author Hiroki Nakazawa
     * @since  2025-10-24
     */
    protected virtual void beforeInsert(){}

    /**
     * Handler for after insert operation.
     * @author Hiroki Nakazawa
     * @since  2025-10-24
     */
    protected virtual void afterInsert(){}

    /**
     * Handler for before update operation.
     * @author Hiroki Nakazawa
     * @since  2025-10-24
     */
    protected virtual void beforeUpdate(){}

    /**
     * Handler for after update operation.
     * @author Hiroki Nakazawa
     * @since  2025-10-24
     */
    protected virtual void afterUpdate(){}

    /**
     * Handler for before delete operation.
     * @author Hiroki Nakazawa
     * @since  2025-10-24
     */
    protected virtual void beforeDelete(){}

    /**
     * Handler for after delete operation.
     * @author Hiroki Nakazawa
     * @since  2025-10-24
     */
    protected virtual void afterDelete(){}

    /**
     * Handler for after undelete operation.
     * @author Hiroki Nakazawa
     * @since  2025-10-24
     */
    protected virtual void afterUndelete(){}

}
