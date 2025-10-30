/**
 * Test class for nlf_SortDirection.
 * @author Hiroki Nakazawa
 * @since  2025-10-30
 * @group  Query-Framework
 * @see    nlf_SortDirection
 */
@isTest
private class nlf_SortDirectionTest {
    
    /**
     * Tests that an instance of SortDirection can be created.
     * @author Hiroki Nakazawa
     * @since  2025-10-30
     */
    @isTest
    static void instanceTest(){
        // Test
        Test.startTest();
        nlf_SortDirection instance = new nlf_SortDirection();
        Test.stopTest();
    }

}