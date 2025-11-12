/**
 * Provides a class for handling the LIMIT clause in SOQL queries in the framework.
 * @author Hiroki Nakazawa
 * @since  2025-11-12
 * @group  Query-Framework
 * @see    nlf_Clause
 */
public class nlf_LimitClause extends nlf_Clause {
    
    /**
     * Provide the limit number for the LIMIT clause.
     */
    private Integer limitNumber;

    /**
     * Basic constructor that initializes the properties.
     * @author Hiroki Nakazawa
     * @since  2025-11-12
     * @param limitNumber Configuration information of the limit number.
     */
    public nlf_LimitClause( Integer limitNumber ){
        super( nlf_ClauseName.ClauseName.CLAUSE_NAME_LIMIT );
        this.limitNumber = limitNumber;
    }

    /**
     * Build the SOQL clause string.
     * @author Hiroki Nakazawa
     * @since  2025-11-12
     * @return The constructed SOQL clause string.
     */
    public override String build(){
        return this.getClauseNameAsString() + ' ' + this.buildContents();
    }

    /**
     * Build the contents of the clause.
     * @author Hiroki Nakazawa
     * @since  2025-11-12
     * @return The contents of the clause.
     */
    public override String buildContents(){
        return String.valueOf( this.limitNumber );
    }

}