/**
 * Provides a class for handling where-type fields in the framework.
 * @author Hiroki Nakazawa
 * @since  2025-11-09
 * @group  Query-Framework
 * @see    nlf_Field
 */
public class nlf_WhereField extends nlf_Field {
    
    /**
     * Provide comparison operators available for use in conditional clause.
     */
    private nlf_ComparisonOperator.ComparisonOperator operator;

    /**
     * Provide the value to be compared in the conditional clause.
     */
    private String value;

    /**
     * Basic constructor that initializes the properties.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @param field        Configuration information of the target field.
     * @param lookupFields Configuration information of lookup fields related to the target field.
     * @param operator     Comparison operator for the conditional clause.
     * @param value        Value to be compared in the conditional clause.
     */
    public nlf_WhereField( Schema.SObjectField field , List<Schema.SObjectField> lookupFields , nlf_ComparisonOperator.ComparisonOperator operator , String value ){
        super( field , lookupFields );
        this.operator = operator;
        this.value    = value;
    }

    /**
     * Constructor derived from the basic constructor that omits lookup fields.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @param field    Configuration information of the target field.
     * @param operator Comparison operator for the conditional clause.
     * @param value    Value to be compared in the conditional clause.
     */
    public nlf_WhereField( Schema.SObjectField field , nlf_ComparisonOperator.ComparisonOperator operator , String value ){
        super( field );
        this.operator = operator;
        this.value    = value;
    }

    /**
     * Build a string representation of the where field including the comparison operator and value.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @return String representation of the where field.
     */
    public override String build(){
        return super.build() + ' ' + nlf_ComparisonOperator.COMPARISON_OPERATOR_MAP.get( this.operator ) + ' ' + this.value;
    }

}