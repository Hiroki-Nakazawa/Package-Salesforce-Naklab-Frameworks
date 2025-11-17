/**
 * Test class for nlf_OrderField.
 * @author Hiroki Nakazawa
 * @since  2025-11-09
 * @group  Query-Framework
 * @see    nlf_OrderField
 */
@isTest
private class nlf_OrderFieldTest {
    
    /**
     * Test the instantiation of the basic constructor.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     */
    @isTest
    static void instanceBasicConstructorTest(){
        // Test
        Test.startTest();
        nlf_OrderField field = new nlf_OrderField( Schema.Profile.Id , new List<Schema.SObjectField>{ Schema.User.ProfileId } , nlf_SortDirection.SortDirection.SORT_DIRECTION_ASC , nlf_NullHandling.NullHandling.NULL_HANDLING_FIRST );
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
        nlf_OrderField field = new nlf_OrderField( Schema.Profile.Id , nlf_SortDirection.SortDirection.SORT_DIRECTION_ASC , nlf_NullHandling.NullHandling.NULL_HANDLING_FIRST );
        Test.stopTest();
    }

    /**
     * Tests that the build method constructs the correct order field string.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @see    nlf_OrderField#build()
     */
    @isTest
    static void buildTest(){
        // Test Setup
        nlf_OrderField field = new nlf_OrderField( Schema.Profile.Id , new List<Schema.SObjectField>{ Schema.User.ProfileId } , nlf_SortDirection.SortDirection.SORT_DIRECTION_ASC , nlf_NullHandling.NullHandling.NULL_HANDLING_FIRST );
        // Test
        Test.startTest();
        String result = field.build();
        Test.stopTest();
        // Verify
        Assert.areEqual( 'Profile.Id ASC NULLS FIRST' , result , 'The built order field string is incorrect.' );
    }

}