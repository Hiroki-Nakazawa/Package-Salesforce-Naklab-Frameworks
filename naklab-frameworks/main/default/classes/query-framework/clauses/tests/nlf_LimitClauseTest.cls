/**
 * Test class for nlf_LimitClause.
 * @author Hiroki Nakazawa
 * @since  2025-11-12
 * @group  Query-Framework
 * @see    nlf_LimitClause
 */
@isTest
private class nlf_LimitClauseTest {
    
    /**
     * Test the instantiation of the basic constructor.
     * @author Hiroki Nakazawa
     * @since  2025-11-12
     */
    @isTest
    static void instanceTest(){
        // Test
        Test.startTest();
        nlf_LimitClause clause = new nlf_LimitClause( 10 );
        Test.stopTest();
    }

    /**
     * Tests that the build method constructs the correct LIMIT clause string.
     * @author Hiroki Nakazawa
     * @since  2025-11-12
     * @see    nlf_LimitClause#build()
     */
    @isTest
    static void buildTest(){
        // Test Setup
        nlf_LimitClause clause = new nlf_LimitClause( 10 );
        // Test
        Test.startTest();
        String result = clause.build();
        Test.stopTest();
        // Verify
        Assert.areEqual( 'LIMIT 10' , result , 'The built LIMIT clause string is incorrect.' );
    }

}