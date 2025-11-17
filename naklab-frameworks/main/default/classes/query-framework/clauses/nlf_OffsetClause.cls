/**
 * Provides a class for handling the OFFSET clause in SOQL queries in the framework.
 * @author Hiroki Nakazawa
 * @since  2025-11-12
 * @group  Query-Framework
 * @see    nlf_Clause
 */
public class nlf_OffsetClause extends nlf_Clause {
    
    /**
     * Provide the offset number for the OFFSET clause.
     */
    private Integer offsetNumber;

    /**
     * Basic constructor that initializes the properties.
     * @author Hiroki Nakazawa
     * @since  2025-11-12
     * @param offsetNumber Configuration information of the offset number.
     */
    public nlf_OffsetClause( Integer offsetNumber ){
        super( nlf_ClauseName.ClauseName.CLAUSE_NAME_OFFSET );
        this.offsetNumber = offsetNumber;
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
        return String.valueOf( this.offsetNumber );
    }

}