/**
 * Test class for nlf_ClauseName.
 * @author Hiroki Nakazawa
 * @since  2025-10-29
 * @group  Query-Framework
 * @see    nlf_ClauseName
 */
@isTest
private class nlf_ClauseNameTest {
    
    /**
     * Tests that an instance of ClauseName can be created.
     * @author Hiroki Nakazawa
     * @since  2025-10-29
     */
    @isTest
    static void instanceTest(){
        // Test
        Test.startTest();
        nlf_ClauseName instance = new nlf_ClauseName();
        Test.stopTest();
    }

}