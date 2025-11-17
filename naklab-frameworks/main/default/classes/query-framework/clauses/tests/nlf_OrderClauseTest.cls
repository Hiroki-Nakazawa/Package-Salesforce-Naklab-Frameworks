/**
 * Test class for nlf_OrderClause.
 * @author Hiroki Nakazawa
 * @since  2025-11-11
 * @group  Query-Framework
 * @see    nlf_OrderClause
 */
@isTest
private class nlf_OrderClauseTest {
    
    /**
     * Test the instantiation of the basic constructor.
     * @author Hiroki Nakazawa
     * @since  2025-11-11
     */
    @isTest
    static void instanceTest(){
        // Test
        Test.startTest();
        nlf_OrderClause clause = new nlf_OrderClause();
        Test.stopTest();
    }

    /**
     * Tests that the build method constructs the correct ORDER BY clause string.
     * @author Hiroki Nakazawa
     * @since  2025-11-11
     * @see    nlf_OrderClause#build()
     */
    @isTest
    static void buildTest(){
        // Test Setup
        nlf_OrderClause clause = new nlf_OrderClause();
        clause.add( Schema.User.Id , nlf_SortDirection.SortDirection.SORT_DIRECTION_ASC , nlf_NullHandling.NullHandling.NULL_HANDLING_FIRST );
        clause.add( Schema.Profile.Id , new List<Schema.SObjectField>{ Schema.User.ProfileId } , nlf_SortDirection.SortDirection.SORT_DIRECTION_ASC , nlf_NullHandling.NullHandling.NULL_HANDLING_FIRST );
        // Test
        Test.startTest();
        String result = clause.build();
        Test.stopTest();
        // Verify
        Assert.areEqual( 'ORDER BY Id ASC NULLS FIRST , Profile.Id ASC NULLS FIRST' , result , 'The built ORDER BY clause string is incorrect.' );
    }

    /**
     * Test addition of fields without parent relationship queries.
     * @author Hiroki Nakazawa
     * @since  2025-11-11
     * @see    nlf_OrderClause#add(Schema.SObjectField, nlf_SortDirection.SortDirection, nlf_NullHandling.NullHandling)
     */
    @isTest
    static void addFieldWithoutParentRelationshipTest(){
        // Test Setup
        nlf_OrderClause clause = new nlf_OrderClause();
        // Test
        Test.startTest();
        clause.add( Schema.User.Id , nlf_SortDirection.SortDirection.SORT_DIRECTION_ASC , nlf_NullHandling.NullHandling.NULL_HANDLING_FIRST );
        Test.stopTest();
    }

    /**
     * Test addition of fields with parent relationship queries.
     * @author Hiroki Nakazawa
     * @since  2025-11-11
     * @see    nlf_OrderClause#add(Schema.SObjectField, List<Schema.SObjectField>, nlf_SortDirection.SortDirection, nlf_NullHandling.NullHandling)
     */
    @isTest
    static void addFieldWithParentRelationshipTest(){
        // Test Setup
        nlf_OrderClause clause = new nlf_OrderClause();
        // Test
        Test.startTest();
        clause.add( Schema.Profile.Id , new List<Schema.SObjectField>{ Schema.User.ProfileId } , nlf_SortDirection.SortDirection.SORT_DIRECTION_ASC , nlf_NullHandling.NullHandling.NULL_HANDLING_FIRST );
        Test.stopTest();
    }

}