/**
 * Test class for nlf_ComparisonOperator.
 * @author Hiroki Nakazawa
 * @since  2025-10-29
 * @group  Query-Framework
 * @see    nlf_ComparisonOperator
 */
@isTest
private class nlf_ComparisonOperatorTest {
    
    /**
     * Tests that an instance of ComparisonOperator can be created.
     * @author Hiroki Nakazawa
     * @since  2025-10-29
     */
    @isTest
    static void instanceTest(){
        // Test
        Test.startTest();
        nlf_ComparisonOperator instance = new nlf_ComparisonOperator();
        Test.stopTest();
    }

}