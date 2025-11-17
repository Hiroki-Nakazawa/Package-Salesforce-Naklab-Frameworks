/**
 * Test class for nlf_WhereField.
 * @author Hiroki Nakazawa
 * @since  2025-11-09
 * @group  Query-Framework
 * @see    nlf_WhereField
 */
@isTest
private class nlf_WhereFieldTest {
    
    /**
     * Test the instantiation of the basic constructor.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     */
    @isTest
    static void instanceBasicConstructorTest(){
        // Test
        Test.startTest();
        nlf_WhereField field = new nlf_WhereField( Schema.Profile.Id , new List<Schema.SObjectField>{ Schema.User.ProfileId } , nlf_ComparisonOperator.ComparisonOperator.COMPARISON_OPERATOR_EQUALS_WITH_BIND , 'profileId' );
        Test.stopTest();
    }

    /**
     * Test the instantiation of the constructor without lookup fields.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     */
    @isTest
    static void instanceNoLookupConstructorTest(){
        // Test
        Test.startTest();
        nlf_WhereField field = new nlf_WhereField( Schema.Profile.Id , nlf_ComparisonOperator.ComparisonOperator.COMPARISON_OPERATOR_EQUALS_WITH_BIND , 'profileId' );
        Test.stopTest();
    }

    /**
     * Tests that the build method constructs the correct where field string.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @see    nlf_WhereField#build()
     */
    @isTest
    static void buildTest(){
        // Test Setup
        nlf_WhereField field = new nlf_WhereField( Schema.Profile.Id , new List<Schema.SObjectField>{ Schema.User.ProfileId } , nlf_ComparisonOperator.ComparisonOperator.COMPARISON_OPERATOR_EQUALS_WITH_BIND , 'profileId' );
        // Test
        Test.startTest();
        String result = field.build();
        Test.stopTest();
        // Verify
        Assert.areEqual( 'Profile.Id = : profileId' , result , 'The built where field string is incorrect.' );
    }

}