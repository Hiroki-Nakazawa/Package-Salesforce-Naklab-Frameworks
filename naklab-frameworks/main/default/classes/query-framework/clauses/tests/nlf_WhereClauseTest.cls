/**
 * Test class for nlf_WhereClause.
 * @author Hiroki Nakazawa
 * @since  2025-11-09
 * @group  Query-Framework
 * @see    nlf_WhereClause
 */
@isTest
private class nlf_WhereClauseTest {
    
    /**
     * Test the instantiation of the basic constructor.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     */
    @isTest
    static void instanceTest(){
        // Test
        Test.startTest();
        nlf_WhereClause clause = new nlf_WhereClause( nlf_LogicalOperator.LogicalOperator.LOGICAL_OPERATOR_AND );
        Test.stopTest();
    }

    /**
     * Tests that the build method constructs the correct WHERE clause string.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @see    nlf_WhereClause#build()
     */
    @isTest
    static void buildTest(){
        // Test Setup
        nlf_WhereClause childClause = new nlf_WhereClause( nlf_LogicalOperator.LogicalOperator.LOGICAL_OPERATOR_AND );
        childClause.add( Schema.User.Id , nlf_ComparisonOperator.ComparisonOperator.COMPARISON_OPERATOR_EQUALS_WITH_BIND , 'userId' );
        childClause.add( Schema.Profile.Id , new List<Schema.SObjectField>{ Schema.User.ProfileId } , nlf_ComparisonOperator.ComparisonOperator.COMPARISON_OPERATOR_EQUALS_WITH_BIND , 'profileId' );
        nlf_WhereClause clause = new nlf_WhereClause( nlf_LogicalOperator.LogicalOperator.LOGICAL_OPERATOR_AND );
        clause.add( Schema.User.Id , nlf_ComparisonOperator.ComparisonOperator.COMPARISON_OPERATOR_EQUALS_WITH_BIND , 'userId' );
        clause.add( Schema.Profile.Id , new List<Schema.SObjectField>{ Schema.User.ProfileId } , nlf_ComparisonOperator.ComparisonOperator.COMPARISON_OPERATOR_EQUALS_WITH_BIND , 'profileId' );
        clause.add( childClause );
        // Test
        Test.startTest();
        String result = clause.build();
        Test.stopTest();
        // Verify
        Assert.areEqual( 'WHERE Id = : userId AND Profile.Id = : profileId AND (Id = : userId AND Profile.Id = : profileId)' , result , 'The built WHERE clause string is incorrect.' );
    }

    /**
     * Test addition of fields without parent relationship queries.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @see    nlf_WhereClause#add(Schema.SObjectField, nlf_ComparisonOperator.ComparisonOperator, String)
     */
    @isTest
    static void addFieldWithoutParentRelationshipTest(){
        // Test Setup
        nlf_WhereClause clause = new nlf_WhereClause( nlf_LogicalOperator.LogicalOperator.LOGICAL_OPERATOR_AND );
        // Test
        Test.startTest();
        clause.add( Schema.User.Id , nlf_ComparisonOperator.ComparisonOperator.COMPARISON_OPERATOR_EQUALS_WITH_BIND , 'userId' );
        Test.stopTest();
    }

    /**
     * Test addition of fields with parent relationship queries.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @see    nlf_WhereClause#add(Schema.SObjectField, List<Schema.SObjectField>, nlf_ComparisonOperator.ComparisonOperator, String)
     */
    @isTest
    static void addFieldWithParentRelationshipTest(){
        // Test Setup
        nlf_WhereClause clause = new nlf_WhereClause( nlf_LogicalOperator.LogicalOperator.LOGICAL_OPERATOR_AND );
        // Test
        Test.startTest();
        clause.add( Schema.Profile.Id , new List<Schema.SObjectField>{ Schema.User.ProfileId } , nlf_ComparisonOperator.ComparisonOperator.COMPARISON_OPERATOR_EQUALS_WITH_BIND , 'profileId' );
        Test.stopTest();
    }

    /**
     * Test addition of nested WHERE clauses.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @see    nlf_WhereClause#add(nlf_WhereClause)
     */
    @isTest
    static void addNestedWhereClauseTest(){
        // Test Setup
        nlf_WhereClause clause = new nlf_WhereClause( nlf_LogicalOperator.LogicalOperator.LOGICAL_OPERATOR_AND );
        nlf_WhereClause childClause = new nlf_WhereClause( nlf_LogicalOperator.LogicalOperator.LOGICAL_OPERATOR_AND );
        // Test
        Test.startTest();
        clause.add( childClause );
        Test.stopTest();
    }

}