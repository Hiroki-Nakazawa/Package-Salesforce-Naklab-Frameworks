/**
 * Test class for nlf_SelectClause.
 * @author Hiroki Nakazawa
 * @since  2025-11-09
 * @group  Query-Framework
 * @see    nlf_SelectClause
 */
@isTest
private class nlf_SelectClauseTest {
    
    /**
     * Test the instantiation of the basic constructor.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     */
    @isTest
    static void instanceTest(){
        // Test
        Test.startTest();
        nlf_SelectClause clause = new nlf_SelectClause();
        Test.stopTest();
    }

    /**
     * Tests that the build method constructs the correct SELECT clause string.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @see    nlf_SelectClause#build()
     */
    @isTest
    static void buildTest(){
        // Test Setup
        nlf_SelectClause clause = new nlf_SelectClause();
        clause.add( Schema.User.Id );
        clause.add( Schema.Profile.Id , new List<Schema.SObjectField>{ Schema.User.ProfileId } );
        // Test
        Test.startTest();
        String result = clause.build();
        Test.stopTest();
        // Verify
        Assert.areEqual( 'SELECT Id , Profile.Id' , result , 'The built SELECT clause string is incorrect.' );
    }

    /**
     * Test addition of fields without parent relationship queries.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @see    nlf_SelectClause#add(Schema.SObjectField)
     */
    @isTest
    static void addFieldWithoutParentRelationshipTest(){
        // Test Setup
        nlf_SelectClause clause = new nlf_SelectClause();
        // Test
        Test.startTest();
        clause.add( Schema.User.Id );
        Test.stopTest();
    }

    /**
     * Test addition of fields with parent relationship queries.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @see    nlf_SelectClause#add(Schema.SObjectField, List<Schema.SObjectField>)
     */
    @isTest
    static void addFieldWithParentRelationshipTest(){
        // Test Setup
        nlf_SelectClause clause = new nlf_SelectClause();
        // Test
        Test.startTest();
        clause.add( Schema.Profile.Id , new List<Schema.SObjectField>{ Schema.User.ProfileId } );
        Test.stopTest();
    }

}