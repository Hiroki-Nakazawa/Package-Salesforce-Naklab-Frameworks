/**
 * Provides access to trigger context data.
 * @author Hiroki Nakazawa
 * @since  2025-10-21
 * @group  Trigger-Framework
 */
public virtual class nlf_TriggerContextProvider {
    
    /**
     * Retrieve the list of new records in the trigger context.
     * @author Hiroki Nakazawa
     * @since  2025-10-21
     * @return List of new records in the trigger context
     */
    public virtual List<SObject> newList(){ return Trigger.new; }

    /**
     * Retrieve the list of old records in the trigger context.
     * @author Hiroki Nakazawa
     * @since  2025-10-21
     * @return List of old records in the trigger context
     */
    public virtual List<SObject> oldList(){ return Trigger.old; }

    /**
     * Retrieve the map of new records in the trigger context.
     * @author Hiroki Nakazawa
     * @since  2025-10-21
     * @return Map of new records in the trigger context
     */
    public virtual Map<Id,SObject> newMap(){ return Trigger.newMap; }

    /**
     * Retrieve the map of old records in the trigger context.
     * @author Hiroki Nakazawa
     * @since  2025-10-21
     * @return Map of old records in the trigger context
     */
    public virtual Map<Id,SObject> oldMap(){ return Trigger.oldMap; }

    /**
     * Retrieve the operation type of the trigger context.
     * @author Hiroki Nakazawa
     * @since  2025-10-21
     * @return Operation type of the trigger context
     */
    public virtual TriggerOperation operationType(){ return Trigger.operationType; }

}