/**
 * Test class for nlf_TriggerContextProvider.
 * @author Hiroki Nakazawa
 * @since  2025-10-24
 * @group  Trigger-Framework
 * @see    nlf_TriggerContextProvider
 */
@isTest
private class nlf_TriggerContextProviderTest {
    
    /**
     * Test for newList method.
     * @author Hiroki Nakazawa
     * @since  2025-10-24
     */
    @isTest
    static void newListTest(){
        // Test Setup
        nlf_TriggerContextProvider context = new nlf_TriggerContextProvider();
        // Test
        Test.startTest();
        List<SObject> newList = context.newList();
        Test.stopTest();
    }

    /**
     * Test for oldList method.
     * @author Hiroki Nakazawa
     * @since  2025-10-24
     */
    @isTest
    static void oldListTest(){
        // Test Setup
        nlf_TriggerContextProvider context = new nlf_TriggerContextProvider();
        // Test
        Test.startTest();
        List<SObject> oldList = context.oldList();
        Test.stopTest();
    }

    /**
     * Test for newMap method.
     * @author Hiroki Nakazawa
     * @since  2025-10-24
     */
    @isTest
    static void newMapTest(){
        // Test Setup
        nlf_TriggerContextProvider context = new nlf_TriggerContextProvider();
        // Test
        Test.startTest();
        Map<Id,SObject> newMap = context.newMap();
        Test.stopTest();
    }

    /**
     * Test for oldMap method.
     * @author Hiroki Nakazawa
     * @since  2025-10-24
     */
    @isTest
    static void oldMapTest(){
        // Test Setup
        nlf_TriggerContextProvider context = new nlf_TriggerContextProvider();
        // Test
        Test.startTest();
        Map<Id,SObject> oldMap = context.oldMap();
        Test.stopTest();
    }

    /**
     * Test for operationType method.
     * @author Hiroki Nakazawa
     * @since  2025-10-24
     */
    @isTest
    static void operationTypeTest(){
        // Test Setup
        nlf_TriggerContextProvider context = new nlf_TriggerContextProvider();
        // Test
        Test.startTest();
        TriggerOperation operationType = context.operationType();
        Test.stopTest();
    }
    
}