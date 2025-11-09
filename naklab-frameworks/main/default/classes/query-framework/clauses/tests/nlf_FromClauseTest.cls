/**
 * Test class for nlf_FromClause.
 * @author Hiroki Nakazawa
 * @since  2025-11-09
 * @group  Query-Framework
 * @see    nlf_FromClause
 */
@isTest
private class nlf_FromClauseTest {
    
    /**
     * Test the instantiation of the basic constructor.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     */
    @isTest
    static void instanceTest(){
        // Test
        Test.startTest();
        nlf_FromClause clause = new nlf_FromClause( Schema.User.SObjectType );
        Test.stopTest();
    }

    /**
     * Tests that the build method constructs the correct FROM clause string.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @see    nlf_FromClause#build()
     */
    @isTest
    static void buildTest(){
        // Test Setup
        nlf_FromClause clause = new nlf_FromClause( Schema.User.SObjectType );
        // Test
        Test.startTest();
        String result = clause.build();
        Test.stopTest();
        // Verify
        Assert.areEqual( 'FROM User' , result , 'The built FROM clause string is incorrect.' );
    }

}