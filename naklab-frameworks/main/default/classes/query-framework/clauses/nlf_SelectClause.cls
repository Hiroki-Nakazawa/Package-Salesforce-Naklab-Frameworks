/**
 * Provides a class for handling the SELECT clause in SOQL queries in the framework.
 * @author Hiroki Nakazawa
 * @since  2025-11-09
 * @group  Query-Framework
 * @see    nlf_Clause
 */
public class nlf_SelectClause extends nlf_Clause {
    
    /**
     * Provide a list of fields to be queried in the SELECT clause.
     */
    private List<nlf_SelectField> selectFields;

    /**
     * Basic constructor that initializes the properties.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     */
    public nlf_SelectClause(){
        super( nlf_ClauseName.ClauseName.CLAUSE_NAME_SELECT );
        this.selectFields = new List<nlf_SelectField>();
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
        for( nlf_SelectField selectField : this.selectFields ){
            contentStrings.add( selectField.build() );
        }
        return String.join( contentStrings , ' , ' );
    }

    /**
     * Addition of fields without parent relationship queries.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @param field Configuration information of the target field.
     * @return The current instance of nlf_SelectClause.
     */
    public nlf_SelectClause add( Schema.SObjectField field ){
        this.selectFields.add( new nlf_SelectField( field ) );
        return this;
    }

    /**
     * Addition of fields with parent relationship queries.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @param field        Configuration information of the target field.
     * @param lookupFields Configuration information of lookup fields related to the target field.
     * @return The current instance of nlf_SelectClause.
     */
    public nlf_SelectClause add( Schema.SObjectField field , List<Schema.SObjectField> lookupFields ){
        this.selectFields.add( new nlf_SelectField( field , lookupFields ) );
        return this;
    }

}