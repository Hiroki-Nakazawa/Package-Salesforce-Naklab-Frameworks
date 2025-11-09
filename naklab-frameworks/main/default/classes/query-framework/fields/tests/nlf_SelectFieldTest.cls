/**
 * Test class for nlf_SelectField.
 * @author Hiroki Nakazawa
 * @since  2025-11-09
 * @group  Query-Framework
 * @see    nlf_SelectField
 */
@isTest
private class nlf_SelectFieldTest {
    
    /**
     * Test the instantiation of the basic constructor.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     */
    @isTest
    static void instanceBasicConstructorTest(){
        // Test
        Test.startTest();
        nlf_SelectField field = new nlf_SelectField( Schema.Profile.Id , new List<Schema.SObjectField>{ Schema.User.ProfileId } );
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
        nlf_SelectField field = new nlf_SelectField( Schema.Profile.Id );
        Test.stopTest();
    }

}