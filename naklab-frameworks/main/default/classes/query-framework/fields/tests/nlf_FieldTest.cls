/**
 * Test class for nlf_Field.
 * @author Hiroki Nakazawa
 * @since  2025-11-04
 * @group  Query-Framework
 * @see    nlf_Field
 */
@isTest
private class nlf_FieldTest {
    
    /**
     * Test the instantiation of the basic constructor.
     * @author Hiroki Nakazawa
     * @since  2025-11-04
     */
    @isTest
    static void instanceBasicConstructorTest(){
        // Test
        Test.startTest();
        Field field = new Field( Schema.Profile.Id , new List<Schema.SObjectField>{ Schema.User.ProfileId } );
        Test.stopTest();
    }

    /**
     * Test the instantiation of the constructor without lookup fields.
     * @author Hiroki Nakazawa
     * @since  2025-11-04
     */
    @isTest
    static void instanceNoLookupConstructorTest(){
        // Test
        Test.startTest();
        Field field = new Field( Schema.Profile.Id );
        Test.stopTest();
    }

    /**
     * Tests that the build method constructs the correct field string.
     * @author Hiroki Nakazawa
     * @since  2025-11-04
     * @see    nlf_Field#build()
     */
    @isTest
    static void buildTest(){
        // Test Setup
        Field field = new Field( Schema.Profile.Id , new List<Schema.SObjectField>{ Schema.User.ProfileId } );
        // Test
        Test.startTest();
        String result = field.build();
        Test.stopTest();
        // Verify
        Assert.areEqual( 'Profile.Id' , result , 'The built field string is incorrect.' );
    }

    /**
     * Test Field to supply test data.
     * @author Hiroki Nakazawa
     * @since  2025-11-04
     * @see    nlf_Field
     */
    private class Field extends nlf_Field {

        /**
         * Basic constructor that initializes the properties.
         * @author Hiroki Nakazawa
         * @since  2025-11-04
         * @param field        Configuration information of the target field.
         * @param lookupFields Configuration information of lookup fields related to the target field.
         */
        public Field( Schema.SObjectField field , List<Schema.SObjectField> lookupFields ){
            super( field , lookupFields );
        }

        /**
         * Constructor derived from the basic constructor that omits lookup fields.
         * @author Hiroki Nakazawa
         * @since  2025-11-04
         * @param field Configuration information of the target field.
         */
        public Field( Schema.SObjectField field ){
            super( field );
        }

    }
    
}