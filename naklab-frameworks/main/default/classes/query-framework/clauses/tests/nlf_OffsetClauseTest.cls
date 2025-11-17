/**
 * Test class for nlf_OffsetClause.
 * @author Hiroki Nakazawa
 * @since  2025-11-12
 * @group  Query-Framework
 * @see    nlf_OffsetClause
 */
@isTest
private class nlf_OffsetClauseTest {
    
    /**
     * Test the instantiation of the basic constructor.
     * @author Hiroki Nakazawa
     * @since  2025-11-12
     */
    @isTest
    static void instanceTest(){
        // Test
        Test.startTest();
        nlf_OffsetClause clause = new nlf_OffsetClause( 5 );
        Test.stopTest();
    }

    /**
     * Tests that the build method constructs the correct OFFSET clause string.
     * @author Hiroki Nakazawa
     * @since  2025-11-12
     * @see    nlf_OffsetClause#build()
     */
    @isTest
    static void buildTest(){
        // Test Setup
        nlf_OffsetClause clause = new nlf_OffsetClause( 5 );
        // Test
        Test.startTest();
        String result = clause.build();
        Test.stopTest();
        // Verify
        Assert.areEqual( 'OFFSET 5' , result , 'The built OFFSET clause string is incorrect.' );
    }

}