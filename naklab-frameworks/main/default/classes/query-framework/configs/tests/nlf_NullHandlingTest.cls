/**
 * Test class for nlf_NullHandling.
 * @author Hiroki Nakazawa 
 * @since  2025-10-30
 * @group  Query-Framework
 * @see    nlf_NullHandling
 */
@isTest
private class nlf_NullHandlingTest {
    
    /**
     * Tests that an instance of NullHandling can be created.
     * @author Hiroki Nakazawa
     * @since  2025-10-30
     */
    @isTest
    static void instanceTest(){
        // Test
        Test.startTest();
        nlf_NullHandling instance = new nlf_NullHandling();
        Test.stopTest();
    }

}