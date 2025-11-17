/**
 * Provides a class for handling select-type fields in the framework.
 * @author Hiroki Nakazawa
 * @since  2025-11-09
 * @group  Query-Framework
 * @see    nlf_Field
 */
public class nlf_SelectField extends nlf_Field {
    
    /**
     * Basic constructor that initializes the properties.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @param field        Configuration information of the target field.
     * @param lookupFields Configuration information of lookup fields related to the target field.
     */
    public nlf_SelectField( Schema.SObjectField field , List<Schema.SObjectField> lookupFields ){
        super( field , lookupFields );
    }

    /**
     * Constructor derived from the basic constructor that omits lookup fields.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @param field Configuration information of the target field.
     */
    public nlf_SelectField( Schema.SObjectField field ){
        super( field );
    }

}