/**
 * Test class for nlf_ScopeClause.
 * @author Hiroki Nakazawa
 * @since  2025-11-12
 * @group  Query-Framework
 * @see    nlf_ScopeClause
 */
@isTest
private class nlf_ScopeClauseTest {
    
    /**
     * Test the instantiation of the basic constructor.
     * @author Hiroki Nakazawa
     * @since  2025-11-12
     */
    @isTest
    static void instanceTest(){
        // Test
        Test.startTest();
        nlf_ScopeClause clause = new nlf_ScopeClause( nlf_ScopeName.scopeName.SCOPE_NAME_EVERYTHING );
        Test.stopTest();
    }

    /**
     * Tests that the build method constructs the correct SCOPE clause string.
     * @author Hiroki Nakazawa
     * @since  2025-11-12
     * @see    nlf_ScopeClause#build()
     */
    @isTest
    static void buildTest(){
        // Test Setup
        nlf_ScopeClause clause = new nlf_ScopeClause( nlf_ScopeName.scopeName.SCOPE_NAME_EVERYTHING );
        // Test
        Test.startTest();
        String result = clause.build();
        Test.stopTest();
        // Verify
        Assert.areEqual( 'USING SCOPE everything' , result , 'The built SCOPE clause string is incorrect.' );
    }

}