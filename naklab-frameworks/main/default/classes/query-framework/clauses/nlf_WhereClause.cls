/**
 * Provides a class for handling the WHERE clause in SOQL queries in the framework.
 * @author Hiroki Nakazawa
 * @since  2025-11-09
 * @group  Query-Framework
 * @see    nlf_Clause
 */
public class nlf_WhereClause extends nlf_Clause {
    
    /**
     * Provide a list of fields used in the WHERE clause.
     */
    private List<nlf_WhereField> whereFields;

    /**
     * Provide a list of combined conditional clauses in the WHERE clause.
     */
    private List<nlf_WhereClause> whereClauses;

    /**
     * Provide a logical operator used in the WHERE clause.
     */
    private nlf_LogicalOperator.LogicalOperator operator;

    /**
     * Basic constructor that initializes the properties.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @param operator Configuration information of the logical operator.
     */
    public nlf_WhereClause( nlf_LogicalOperator.LogicalOperator operator ){
        super( nlf_ClauseName.ClauseName.CLAUSE_NAME_WHERE );
        this.whereFields  = new List<nlf_WhereField>();
        this.whereClauses = new List<nlf_WhereClause>();
        this.operator     = operator;
    }

    /**
     * Build the SOQL clause string.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @return The constructed SOQL clause string.
     */
    public override String build(){
        return this.getClauseNameAsString() + ' ' + this.buildContents();
    }

    /**
     * Build the contents of the clause.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @return The contents of the clause.
     */
    public override String buildContents(){
        List<String> contentStrings = new List<String>();
        for( nlf_WhereField whereField : this.whereFields ){
            contentStrings.add( whereField.build() );
        }
        for( nlf_WhereClause whereClause : this.whereClauses ){
            contentStrings.add( '(' + whereClause.buildContents() + ')' );
        }
        return String.join( contentStrings , ' ' + nlf_LogicalOperator.LOGICAL_OPERATOR_MAP.get( this.operator ) + ' ' );
    }

    /**
     * Addition of fields without parent relationship queries to the WHERE clause.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @param field              Configuration information of the target field.
     * @param comparisonOperator Configuration information of the comparison operator.
     * @param value              The value to be compared in the condition.
     * @return The current instance of nlf_WhereClause.
     */
    public nlf_WhereClause add( Schema.SObjectField field , nlf_ComparisonOperator.ComparisonOperator comparisonOperator , String value ){
        this.whereFields.add( new nlf_WhereField( field , comparisonOperator , value ) );
        return this;
    }

    /**
     * Addition of fields with parent relationship queries to the WHERE clause.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @param field              Configuration information of the target field.
     * @param lookupFields       Configuration information of lookup fields related to the target field.
     * @param comparisonOperator Configuration information of the comparison operator.
     * @param value              The value to be compared in the condition.
     * @return The current instance of nlf_WhereClause.
     */
    public nlf_WhereClause add( Schema.SObjectField field , List<Schema.SObjectField> lookupFields , nlf_ComparisonOperator.ComparisonOperator comparisonOperator , String value ){
        this.whereFields.add( new nlf_WhereField( field , lookupFields , comparisonOperator , value ) );
        return this;
    }

    /**
     * Addition of combined conditional clauses to the WHERE clause.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @param whereClause Configuration information of the combined conditional clause.
     * @return The current instance of nlf_WhereClause.
     */
    public nlf_WhereClause add( nlf_WhereClause whereClause ){
        this.whereClauses.add( whereClause );
        return this;
    }

}