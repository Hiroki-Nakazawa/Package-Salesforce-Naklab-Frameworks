/**
 * Provides a class for handling the ORDER BY clause in SOQL queries in the framework.
 * @author Hiroki Nakazawa
 * @since  2025-11-11
 * @group  Query-Framework
 * @see    nlf_Clause
 */
public class nlf_OrderClause extends nlf_Clause {
    
    /**
     * Provide a list of fields used in the ORDER BY clause.
     */
    private List<nlf_OrderField> orderFields;

    /**
     * Basic constructor that initializes the properties.
     * @author Hiroki Nakazawa
     * @since  2025-11-11
     */
    public nlf_OrderClause(){
        super( nlf_ClauseName.ClauseName.CLAUSE_NAME_ORDER );
        this.orderFields = new List<nlf_OrderField>();
    }

    /**
     * Build the SOQL clause string.
     * @author Hiroki Nakazawa
     * @since  2025-11-11
     * @return The constructed SOQL clause string.
     */
    public override String build(){
        return this.getClauseNameAsString() + ' ' + this.buildContents();
    }

    /**
     * Build the contents of the clause.
     * @author Hiroki Nakazawa
     * @since  2025-11-11
     * @return The contents of the clause.
     */
    public override String buildContents(){
        List<String> contentStrings = new List<String>();
        for( nlf_OrderField orderField : this.orderFields ){
            contentStrings.add( orderField.build() );
        }
        return String.join( contentStrings , ' , ' );
    }

    /**
     * Addition of fields without parent relationship queries to the ORDER BY clause.
     * @author Hiroki Nakazawa
     * @since  2025-11-11
     * @param field         Configuration information of the target field.
     * @param sortDirection Configuration information of the sort order.
     * @param nullHandling  Configuration information of the null handling.
     * @return The current instance of nlf_OrderClause.
     */
    public nlf_OrderClause add( Schema.SObjectField field , nlf_SortDirection.SortDirection sortDirection , nlf_NullHandling.NullHandling nullHandling ){
        this.orderFields.add( new nlf_OrderField( field , sortDirection , nullHandling ) );
        return this;
    }

    /**
     * Addition of fields with parent relationship queries to the ORDER BY clause.
     * @author Hiroki Nakazawa
     * @since  2025-11-11
     * @param field         Configuration information of the target field.
     * @param lookupFields  Configuration information of the parent relationship.
     * @param sortDirection Configuration information of the sort order.
     * @param nullHandling  Configuration information of the null handling.
     * @return The current instance of nlf_OrderClause.
     */
    public nlf_OrderClause add( Schema.SObjectField field , List<Schema.SObjectField> lookupFields , nlf_SortDirection.SortDirection sortDirection , nlf_NullHandling.NullHandling nullHandling ){
        this.orderFields.add( new nlf_OrderField( field , lookupFields , sortDirection , nullHandling ) );
        return this;
    }

}