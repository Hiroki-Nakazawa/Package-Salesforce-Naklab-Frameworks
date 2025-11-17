/**
 * Test class for nlf_LogicalOperator.
 * @author Hiroki Nakazawa
 * @since  2025-10-29
 * @group  Query-Framework
 * @see    nlf_LogicalOperator
 */
@isTest
private class nlf_LogicalOperatorTest {
    
    /**
     * Tests that an instance of LogicalOperator can be created.
     * @author Hiroki Nakazawa
     * @since  2025-10-29
     */
    @isTest
    static void instanceTest(){
        // Test
        Test.startTest();
        nlf_LogicalOperator instance = new nlf_LogicalOperator();
        Test.stopTest();
    }

}