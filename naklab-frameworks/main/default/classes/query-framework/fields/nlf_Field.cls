/**
 * Abstract class representing a field in a query framework.
 * @author Hiroki Nakazawa
 * @since  2025-11-04
 * @group  Query-Framework
 */
public abstract class nlf_Field {

    /**
     * Provide the schema information of the fields.
     */
    private Schema.SObjectField field;

    /**
     * Provide the schema information of lookup fields.
     */
    private List<Schema.SObjectField> lookupFields;

    /**
     * Basic constructor that initializes the properties.
     * @author Hiroki Nakazawa
     * @since  2025-11-04
     * @param field        Configuration information of the target field.
     * @param lookupFields Configuration information of lookup fields related to the target field.
     */
    public nlf_Field( Schema.SObjectField field , List<Schema.SObjectField> lookupFields ){
        this.field        = field;
        this.lookupFields = lookupFields;
    }

    /**
     * Constructor derived from the basic constructor that omits lookup fields.
     * @author Hiroki Nakazawa
     * @since  2025-11-04
     * @param field Configuration information of the target field.
     */
    public nlf_Field( Schema.SObjectField field ){
        this( field , new List<Schema.SObjectField>() );
    }

    /**
     * Build a string representation of the field including lookups.
     * @author Hiroki Nakazawa
     * @since  2025-11-04
     * @return String representation of the field.
     */
    public virtual String build(){
        return this.convertFieldName();
    }

    /**
     * Convert the field and lookup field names into a single string representation.
     * @author Hiroki Nakazawa
     * @since  2025-11-04
     * @return String representation of the field name with lookups.
     */
    private String convertFieldName(){
        List<String> fieldNames = this.convertLookupFieldNames();
        fieldNames.add( this.field.getDescribe().getName() );
        return String.join( fieldNames , '.' );
    }

    /**
     * Convert a list of lookup fields into a list of relationship name strings.
     * @author Hiroki Nakazawa
     * @since  2025-11-04
     * @return List of relationship name strings.
     */
    private List<String> convertLookupFieldNames(){
        List<String> lookupFieldNames = new List<String>();
        for( Schema.SObjectField lookupField : this.lookupFields ){
            lookupFieldNames.add( lookupField.getDescribe().getRelationshipName() );
        }
        return lookupFieldNames;
    }

}