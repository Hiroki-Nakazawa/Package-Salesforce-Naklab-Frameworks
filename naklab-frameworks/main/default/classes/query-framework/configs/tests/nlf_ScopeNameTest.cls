/**
 * Test class for nlf_ScopeName.
 * @author Hiroki Nakazawa
 * @since  2025-11-04
 * @group  Query-Framework
 * @see    nlf_ScopeName
 */
@isTest
private class nlf_ScopeNameTest {
    
    /**
     * Tests that an instance of ScopeName can be created.
     * @author Hiroki Nakazawa
     * @since  2025-11-04
     */
    @isTest
    static void instanceTest(){
        // Test
        Test.startTest();
        nlf_ScopeName instance = new nlf_ScopeName();
        Test.stopTest();
    }

}