/**
 * Provides a class for handling order-type fields in the framework.
 * @author Hiroki Nakazawa
 * @since  2025-11-09
 * @group  Query-Framework
 * @see    nlf_Field
 */
public class nlf_OrderField extends nlf_Field {
    
    /**
     * Provide the sorting direction for the order clause.
     */
    private nlf_SortDirection.SortDirection direction;

    /**
     * Provide the handling of null values in the order clause.
     */
    private nlf_NullHandling.NullHandling nullHandling;
    
    /**
     * Basic constructor that initializes the properties.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @param field        Configuration information of the target field.
     * @param lookupFields Configuration information of lookup fields related to the target field.
     * @param direction    Sorting direction for the order clause.
     * @param nullHandling Handling of null values in the order clause.
     */
    public nlf_OrderField( Schema.SObjectField field , List<Schema.SObjectField> lookupFields , nlf_SortDirection.SortDirection direction , nlf_NullHandling.NullHandling nullHandling ){
        super( field , lookupFields );
        this.direction    = direction;
        this.nullHandling = nullHandling;
    }
    
    /**
     * Constructor derived from the basic constructor that omits lookup fields.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @param field        Configuration information of the target field.
     * @param direction    Sorting direction for the order clause.
     * @param nullHandling Handling of null values in the order clause.
     */
    public nlf_OrderField( Schema.SObjectField field , nlf_SortDirection.SortDirection direction , nlf_NullHandling.NullHandling nullHandling ){
        super( field );
        this.direction    = direction;
        this.nullHandling = nullHandling;
    }

    /**
     * Build a string representation of the order field including sorting direction and null handling.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @return String representation of the order field.
     */
    public override String build(){
        return super.build() + ' ' + nlf_SortDirection.SORT_DIRECTION_MAP.get( this.direction ) + ' ' + nlf_NullHandling.NULL_HANDLING_MAP.get( this.nullHandling );
    }

}