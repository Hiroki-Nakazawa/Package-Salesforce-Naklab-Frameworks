/**
 * Test class for nlf_Clause.
 * @author Hiroki Nakazawa
 * @since  2025-11-09
 * @group  Query-Framework
 * @see    nlf_Clause
 */
@isTest
private class nlf_ClauseTest {

    /**
     * Test the instantiation of the basic constructor.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     */
    @isTest
    static void instanceTest(){
        // Test
        Test.startTest();
        Clause clause = new Clause( nlf_ClauseName.ClauseName.CLAUSE_NAME_FROM );
        Test.stopTest();
    }

    /**
     * Tests that the build method constructs the correct clause string.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @see    nlf_Clause#build()
     */
    @isTest
    static void buildTest(){
        // Test Setup
        Clause clause = new Clause( nlf_ClauseName.ClauseName.CLAUSE_NAME_FROM );
        // Test
        Test.startTest();
        String result = clause.build();
        Test.stopTest();
        // Verify
        Assert.areEqual( 'FROM TEST_CONTENTS' , result , 'The built clause string is incorrect.' );
    }
    
    /**
     * Test Clause to supply test data.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @see    nlf_Clause
     */
    private class Clause extends nlf_Clause {

        /**
         * Basic constructor that initializes the properties.
         * @author Hiroki Nakazawa
         * @since  2025-11-09
         * @param clauseName Configuration information of the clause name.
         */
        public Clause( nlf_ClauseName.ClauseName clauseName ){
            super( clauseName );
        }

        /**
         * Build the SOQL clause string.
         * @author Hiroki Nakazawa
         * @since  2025-11-09
         * @return The constructed SOQL clause string.
         */
        public override String build(){
            return this.getClauseNameAsString() + ' ' + this.buildContents();
        }

        /**
         * Build the contents of the clause.
         * @author Hiroki Nakazawa
         * @since  2025-11-09
         * @return The contents of the clause.
         */
        public override String buildContents(){
            return 'TEST_CONTENTS';
        }

    }

}