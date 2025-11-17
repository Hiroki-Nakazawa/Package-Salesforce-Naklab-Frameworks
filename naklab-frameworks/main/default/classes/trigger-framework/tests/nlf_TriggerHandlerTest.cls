/**
 * Test class for nlf_TriggerHandler.
 * @author Hiroki Nakazawa
 * @since  2025-10-26
 * @group  Trigger-Framework
 * @see    nlf_TriggerHandler
 */
@isTest
private class nlf_TriggerHandlerTest {

    /**
     * Tests that an instance of TriggerHandler can be created.
     * @author Hiroki Nakazawa
     * @since  2025-10-26
     */
    @isTest
    static void instanceTest(){
        // Test
        Test.startTest();
        nlf_TriggerHandlerTest.TriggerHandler handler = new nlf_TriggerHandlerTest.TriggerHandler();
        Test.stopTest();
    }

    /**
     * Tests that the newList is correctly accessed in the TriggerHandler.
     * @author Hiroki Nakazawa
     * @since  2025-10-26
     */
    @isTest
    static void newListTest(){
        // Test Setup
        nlf_TriggerHandlerTest.TriggerHandler handler = new nlf_TriggerHandlerTest.TriggerHandler();
        // Test
        Test.startTest();
        List<SObject> newList = handler.newList();
        Test.stopTest();
    }

    /**
     * Tests that the oldList is correctly accessed in the TriggerHandler.
     * @author Hiroki Nakazawa
     * @since  2025-10-26
     */
    @isTest
    static void oldListTest(){
        // Test Setup
        nlf_TriggerHandlerTest.TriggerHandler handler = new nlf_TriggerHandlerTest.TriggerHandler();
        // Test
        Test.startTest();
        List<SObject> oldList = handler.oldList();
        Test.stopTest();
    }

    /**
     * Tests that the newMap is correctly accessed in the TriggerHandler.
     * @author Hiroki Nakazawa
     * @since  2025-10-26
     */
    @isTest
    static void newMapTest(){
        // Test Setup
        nlf_TriggerHandlerTest.TriggerHandler handler = new nlf_TriggerHandlerTest.TriggerHandler();
        // Test
        Test.startTest();
        Map<Id,SObject> newMap = handler.newMap();
        Test.stopTest();
    }

    /**
     * Tests that the oldMap is correctly accessed in the TriggerHandler.
     * @author Hiroki Nakazawa
     * @since  2025-10-26
     */
    @isTest
    static void oldMapTest(){
        // Test Setup
        nlf_TriggerHandlerTest.TriggerHandler handler = new nlf_TriggerHandlerTest.TriggerHandler();
        // Test
        Test.startTest();
        Map<Id,SObject> oldMap = handler.oldMap();
        Test.stopTest();
    }

    /**
     * Tests that the beforeInsert handler is correctly invoked.
     * @author Hiroki Nakazawa
     * @since  2025-10-26
     */
    @isTest
    static void beforeInsertTest(){
        // Test Setup
        nlf_TriggerHandlerTest.TriggerHandler handler = new nlf_TriggerHandlerTest.TriggerHandler();
        handler.context = new nlf_TriggerHandlerTest.TriggerContextProvider( TriggerOperation.BEFORE_INSERT );
        // Test
        Test.startTest();
        handler.run();
        Test.stopTest();
    }

    /**
     * Tests that the afterInsert handler is correctly invoked.
     * @author Hiroki Nakazawa
     * @since  2025-10-26
     */
    @isTest
    static void afterInsertTest(){
        // Test Setup
        nlf_TriggerHandlerTest.TriggerHandler handler = new nlf_TriggerHandlerTest.TriggerHandler();
        handler.context = new nlf_TriggerHandlerTest.TriggerContextProvider( TriggerOperation.AFTER_INSERT );
        // Test
        Test.startTest();
        handler.run();
        Test.stopTest();
    }

    /**
     * Tests that the beforeUpdate handler is correctly invoked.
     * @author Hiroki Nakazawa
     * @since  2025-10-26
     */
    @isTest
    static void beforeUpdateTest(){
        // Test Setup
        nlf_TriggerHandlerTest.TriggerHandler handler = new nlf_TriggerHandlerTest.TriggerHandler();
        handler.context = new nlf_TriggerHandlerTest.TriggerContextProvider( TriggerOperation.BEFORE_UPDATE );
        // Test
        Test.startTest();
        handler.run();
        Test.stopTest();
    }

    /**
     * Tests that the afterUpdate handler is correctly invoked.
     * @author Hiroki Nakazawa
     * @since  2025-10-26
     */
    @isTest
    static void afterUpdateTest(){
        // Test Setup
        nlf_TriggerHandlerTest.TriggerHandler handler = new nlf_TriggerHandlerTest.TriggerHandler();
        handler.context = new nlf_TriggerHandlerTest.TriggerContextProvider( TriggerOperation.AFTER_UPDATE );
        // Test
        Test.startTest();
        handler.run();
        Test.stopTest();
    }

    /**
     * Tests that the beforeDelete handler is correctly invoked.
     * @author Hiroki Nakazawa
     * @since  2025-10-26
     */
    @isTest
    static void beforeDeleteTest(){
        // Test Setup
        nlf_TriggerHandlerTest.TriggerHandler handler = new nlf_TriggerHandlerTest.TriggerHandler();
        handler.context = new nlf_TriggerHandlerTest.TriggerContextProvider( TriggerOperation.BEFORE_DELETE );
        // Test
        Test.startTest();
        handler.run();
        Test.stopTest();
    }

    /**
     * Tests that the afterDelete handler is correctly invoked.
     * @author Hiroki Nakazawa
     * @since  2025-10-26
     */
    @isTest
    static void afterDeleteTest(){
        // Test Setup
        nlf_TriggerHandlerTest.TriggerHandler handler = new nlf_TriggerHandlerTest.TriggerHandler();
        handler.context = new nlf_TriggerHandlerTest.TriggerContextProvider( TriggerOperation.AFTER_DELETE );
        // Test
        Test.startTest();
        handler.run();
        Test.stopTest();
    }

    /**
     * Tests that the afterUndelete handler is correctly invoked.
     * @author Hiroki Nakazawa
     * @since  2025-10-26
     */
    @isTest
    static void afterUndeleteTest(){
        // Test Setup
        nlf_TriggerHandlerTest.TriggerHandler handler = new nlf_TriggerHandlerTest.TriggerHandler();
        handler.context = new nlf_TriggerHandlerTest.TriggerContextProvider( TriggerOperation.AFTER_UNDELETE );
        // Test
        Test.startTest();
        handler.run();
        Test.stopTest();
    }
    
    /**
     * Tests that the context data is correctly accessed in the TriggerHandler.
     * @author Hiroki Nakazawa
     * @since  2025-10-26
     * @see    nlf_TriggerHandler
     */
    private class TriggerHandler extends nlf_TriggerHandler {
        
        /**
         * Returns the newList for testing purposes.
         * @author Hiroki Nakazawa
         * @since  2025-10-26
         * @return List of new records in the trigger context
         */
        public List<SObject> newList(){ return newList; }

        /**
         * Returns the oldList for testing purposes.
         * @author Hiroki Nakazawa
         * @since  2025-10-26
         * @return List of old records in the trigger context
         */
        public List<SObject> oldList(){ return oldList; }

        /**
         * Returns the newMap for testing purposes.
         * @author Hiroki Nakazawa
         * @since  2025-10-26
         * @return Map of new records in the trigger context
         */
        public Map<Id,SObject> newMap(){ return newMap; }

        /**
         * Returns the oldMap for testing purposes.
         * @author Hiroki Nakazawa
         * @since  2025-10-26
         * @return Map of old records in the trigger context
         */
        public Map<Id,SObject> oldMap(){ return oldMap; }

    }

    /**
     * Test TriggerContextProvider to supply test data.
     * @author Hiroki Nakazawa
     * @since  2025-10-26
     * @see    nlf_TriggerContextProvider
     */
    private class TriggerContextProvider extends nlf_TriggerContextProvider {

        /**
         * Trigger operation type for testing purposes.
         */
        private TriggerOperation operationType;

        /**
         * Constructor to set the operation type.
         * @author Hiroki Nakazawa
         * @since  2025-10-26
         * @param operationType Trigger operation type
         */
        public TriggerContextProvider( TriggerOperation operationType ){
            this.operationType = operationType;
        }

        /**
         * Override to return the test operation type.
         * @author Hiroki Nakazawa
         * @since  2025-10-26
         * @return Trigger operation type
         */
        public override TriggerOperation operationType(){
            return this.operationType;
        }

    }

}
