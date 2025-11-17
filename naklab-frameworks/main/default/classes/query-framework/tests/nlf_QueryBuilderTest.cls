/**
 * Test class for nlf_QueryBuilder.
 * @author Hiroki Nakazawa
 * @since  2025-11-17
 * @see    nlf_QueryBuilder
 */
@isTest
private class nlf_QueryBuilderTest {
    
    /**
     * Test the instantiation of the basic constructor.
     * @author Hiroki Nakazawa
     * @since  2025-11-17
     */
    @isTest
    static void instanceTest(){
        // Test
        Test.startTest();
        nlf_QueryBuilder builder = new nlf_QueryBuilder();
        Test.stopTest();
    }

    /**
     * Tests that the build method constructs the correct query string.
     * @author Hiroki Nakazawa
     * @since  2025-11-17
     * @see    nlf_QueryBuilder#build()
     */
    @isTest
    static void buildTest(){
        // Test Setup
        nlf_QueryBuilder builder = new nlf_QueryBuilder()
            .setSelectClause( new nlf_SelectClause().add( Schema.User.Id ) )
            .setFromClause( new nlf_FromClause( Schema.User.SObjectType ) )
            .setScopeClause( new nlf_ScopeClause( nlf_ScopeName.scopeName.SCOPE_NAME_EVERYTHING ) )
            .setWhereClause( new nlf_WhereClause( nlf_LogicalOperator.LogicalOperator.LOGICAL_OPERATOR_AND ).add( Schema.User.IsActive , nlf_ComparisonOperator.ComparisonOperator.COMPARISON_OPERATOR_EQUALS , 'TRUE' ) )
            .setOrderClause( new nlf_OrderClause().add( Schema.User.LastLoginDate , nlf_SortDirection.SortDirection.SORT_DIRECTION_DESC , nlf_NullHandling.NullHandling.NULL_HANDLING_LAST ) )
            .setLimitClause( new nlf_LimitClause( 10 ) )
            .setOffsetClause( new nlf_OffsetClause( 5 ) );
        // Test
        Test.startTest();
        String result = builder.build();
        Test.stopTest();
        // Verify
        Assert.areEqual( 'SELECT Id FROM User USING SCOPE everything WHERE IsActive = TRUE ORDER BY LastLoginDate DESC NULLS LAST LIMIT 10 OFFSET 5' , result , 'The built query string is incorrect.' );
    }

    /**
     * Tests that the query method executes the built query correctly without bind variables.
     * @author Hiroki Nakazawa
     * @since  2025-11-17
     * @see    nlf_QueryBuilder#query(System.AccessLevel)
     */
    @isTest
    static void queryWithoutBindTest(){
        // Test Setup
        nlf_QueryBuilder builder = new nlf_QueryBuilder()
            .setSelectClause( new nlf_SelectClause().add( Schema.User.Id ) )
            .setFromClause( new nlf_FromClause( Schema.User.SObjectType ) )
            .setWhereClause( new nlf_WhereClause( nlf_LogicalOperator.LogicalOperator.LOGICAL_OPERATOR_AND ).add( Schema.User.IsActive , nlf_ComparisonOperator.ComparisonOperator.COMPARISON_OPERATOR_EQUALS , 'TRUE' ) )
            .setLimitClause( new nlf_LimitClause( 200 ) );
        // Test
        Test.startTest();
        List<SObject> results = builder.query( System.AccessLevel.SYSTEM_MODE );
        Test.stopTest();
    }

    /**
     * Tests that the query method executes the built query correctly with bind variables.
     * @author Hiroki Nakazawa
     * @since  2025-11-17
     * @see    nlf_QueryBuilder#query(Map<String, Object>, System.AccessLevel)
     */
    @isTest
    static void queryWithBindTest(){
        // Test Setup
        nlf_QueryBuilder builder = new nlf_QueryBuilder()
            .setSelectClause( new nlf_SelectClause().add( Schema.User.Id ) )
            .setFromClause( new nlf_FromClause( Schema.User.SObjectType ) )
            .setWhereClause( new nlf_WhereClause( nlf_LogicalOperator.LogicalOperator.LOGICAL_OPERATOR_AND ).add( Schema.User.IsActive , nlf_ComparisonOperator.ComparisonOperator.COMPARISON_OPERATOR_EQUALS_WITH_BIND , 'active' ) )
            .setLimitClause( new nlf_LimitClause( 200 ) );
        // Test
        Test.startTest();
        List<SObject> results = builder.query( new Map<String,Object>{ 'active' => true } , System.AccessLevel.SYSTEM_MODE );
        Test.stopTest();
    }

    /**
     * Tests that the queryLocator method executes the built query correctly without bind variables.
     * @author Hiroki Nakazawa
     * @since  2025-11-17
     * @see    nlf_QueryBuilder#queryLocator(System.AccessLevel)
     */
    @isTest
    static void queryLocatorWithoutBidTest(){
        // Test Setup
        nlf_QueryBuilder builder = new nlf_QueryBuilder()
            .setSelectClause( new nlf_SelectClause().add( Schema.User.Id ) )
            .setFromClause( new nlf_FromClause( Schema.User.SObjectType ) )
            .setWhereClause( new nlf_WhereClause( nlf_LogicalOperator.LogicalOperator.LOGICAL_OPERATOR_AND ).add( Schema.User.IsActive , nlf_ComparisonOperator.ComparisonOperator.COMPARISON_OPERATOR_EQUALS , 'TRUE' ) )
            .setLimitClause( new nlf_LimitClause( 200 ) );
        // Test
        Test.startTest();
        Database.QueryLocator queryLocator = builder.queryLocator( System.AccessLevel.SYSTEM_MODE );
        Test.stopTest();
    }

    /**
     * Tests that the queryLocator method executes the built query correctly with bind variables.
     * @author Hiroki Nakazawa
     * @since  2025-11-17
     * @see    nlf_QueryBuilder#queryLocator(Map<String, Object>, System.AccessLevel)
     */
    @isTest
    static void queryLocatorWithBindTest(){
        // Test Setup
        nlf_QueryBuilder builder = new nlf_QueryBuilder()
            .setSelectClause( new nlf_SelectClause().add( Schema.User.Id ) )
            .setFromClause( new nlf_FromClause( Schema.User.SObjectType ) )
            .setWhereClause( new nlf_WhereClause( nlf_LogicalOperator.LogicalOperator.LOGICAL_OPERATOR_AND ).add( Schema.User.IsActive , nlf_ComparisonOperator.ComparisonOperator.COMPARISON_OPERATOR_EQUALS_WITH_BIND , 'active' ) )
            .setLimitClause( new nlf_LimitClause( 200 ) );
        // Test
        Test.startTest();
        Database.QueryLocator queryLocator = builder.queryLocator( new Map<String,Object>{ 'active' => true } , System.AccessLevel.SYSTEM_MODE );
        Test.stopTest();
    }

    /**
     * Tests setting the select clause in the query builder.
     * @author Hiroki Nakazawa
     * @since  2025-11-17
     * @see    nlf_QueryBuilder#setSelectClause(nlf_SelectClause)
     */
    @isTest
    static void setSelectClauseTest(){
        // Test Setup
        nlf_QueryBuilder builder = new nlf_QueryBuilder();
        nlf_SelectClause selectClause = new nlf_SelectClause().add( Schema.User.Id );
        // Test
        Test.startTest();
        builder.setSelectClause( selectClause );
        Test.stopTest();
    }

    /**
     * Tests setting the from clause in the query builder.
     * @author Hiroki Nakazawa
     * @since  2025-11-17
     * @see    nlf_QueryBuilder#setFromClause(nlf_FromClause)
     */
    @isTest
    static void setFromClauseTest(){
        // Test Setup
        nlf_QueryBuilder builder = new nlf_QueryBuilder();
        nlf_FromClause fromClause = new nlf_FromClause( Schema.User.SObjectType );
        // Test
        Test.startTest();
        builder.setFromClause( fromClause );
        Test.stopTest();
    }

    /**
     * Tests setting the where clause in the query builder.
     * @author Hiroki Nakazawa
     * @since  2025-11-17
     * @see    nlf_QueryBuilder#setWhereClause(nlf_WhereClause)
     */
    @isTest
    static void setWhereClauseTest(){
        // Test Setup
        nlf_QueryBuilder builder = new nlf_QueryBuilder();
        nlf_WhereClause whereClause = new nlf_WhereClause( nlf_LogicalOperator.LogicalOperator.LOGICAL_OPERATOR_AND ).add( Schema.User.IsActive , nlf_ComparisonOperator.ComparisonOperator.COMPARISON_OPERATOR_EQUALS , 'TRUE' );
        // Test
        Test.startTest();
        builder.setWhereClause( whereClause );
        Test.stopTest();
    }

    /**
     * Tests setting the order clause in the query builder.
     * @author Hiroki Nakazawa
     * @since  2025-11-17
     * @see    nlf_QueryBuilder#setOrderClause(nlf_OrderClause)
     */
    @isTest
    static void setOrderClauseTest(){
        // Test Setup
        nlf_QueryBuilder builder = new nlf_QueryBuilder();
        nlf_OrderClause orderClause = new nlf_OrderClause().add( Schema.User.LastLoginDate , nlf_SortDirection.SortDirection.SORT_DIRECTION_DESC , nlf_NullHandling.NullHandling.NULL_HANDLING_LAST );
        // Test
        Test.startTest();
        builder.setOrderClause( orderClause );
        Test.stopTest();
    }

    /**
     * Tests setting the limit clause in the query builder.
     * @author Hiroki Nakazawa
     * @since  2025-11-17
     * @see    nlf_QueryBuilder#setLimitClause(nlf_LimitClause)
     */
    @isTest
    static void setLimitClauseTest(){
        // Test Setup
        nlf_QueryBuilder builder = new nlf_QueryBuilder();
        nlf_LimitClause limitClause = new nlf_LimitClause( 10 );
        // Test
        Test.startTest();
        builder.setLimitClause( limitClause );
        Test.stopTest();
    }

    /**
     * Tests setting the offset clause in the query builder.
     * @author Hiroki Nakazawa
     * @since  2025-11-17
     * @see    nlf_QueryBuilder#setOffsetClause(nlf_OffsetClause)
     */
    @isTest
    static void setOffsetClauseTest(){
        // Test Setup
        nlf_QueryBuilder builder = new nlf_QueryBuilder();
        nlf_OffsetClause offsetClause = new nlf_OffsetClause( 5 );
        // Test
        Test.startTest();
        builder.setOffsetClause( offsetClause );
        Test.stopTest();
    }

    /**
     * Tests setting the scope clause in the query builder.
     * @author Hiroki Nakazawa
     * @since  2025-11-17
     * @see    nlf_QueryBuilder#setScopeClause(nlf_ScopeClause)
     */
    @isTest
    static void setScopeClauseTest(){
        // Test Setup
        nlf_QueryBuilder builder = new nlf_QueryBuilder();
        nlf_ScopeClause scopeClause = new nlf_ScopeClause( nlf_ScopeName.scopeName.SCOPE_NAME_EVERYTHING );
        // Test
        Test.startTest();
        builder.setScopeClause( scopeClause );
        Test.stopTest();
    }

    /**
     * Tests setting the isLock property in the query builder.
     * @author Hiroki Nakazawa
     * @since  2025-11-17
     * @see    nlf_QueryBuilder#isLock()
     */
    @isTest
    static void isLockTest(){
        // Test Setup
        nlf_QueryBuilder builder = new nlf_QueryBuilder();
        // Test
        Test.startTest();
        builder.isLock();
        Test.stopTest();
    }

    /**
     * Tests setting the isLock property to false in the query builder.
     * @author Hiroki Nakazawa
     * @since  2025-11-17
     * @see    nlf_QueryBuilder#isUnLock()
     */
    @isTest
    static void isUnLockTest(){
        // Test Setup
        nlf_QueryBuilder builder = new nlf_QueryBuilder();
        // Test
        Test.startTest();
        builder.isUnLock();
        Test.stopTest();
    }

}