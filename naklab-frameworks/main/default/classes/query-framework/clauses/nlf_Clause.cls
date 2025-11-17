/**
 * Abstract class representing a SOQL clause in a query framework.
 * @author Hiroki Nakazawa
 * @since  2025-11-09
 * @group  Query-Framework
 */
public abstract class nlf_Clause {
    
    /**
     * Provide the types of clauses in SOQL.
     */
    private nlf_ClauseName.ClauseName clauseName;

    /**
     * Basic constructor that initializes the properties.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @param clauseName Configuration information of the clause name.
     */
    public nlf_Clause( nlf_ClauseName.ClauseName clauseName ){
        this.clauseName = clauseName;
    }

    /**
     * Retrieve the string representation of the configured clause in SOQL.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @return The string representation of the clause name.
     */
    protected String getClauseNameAsString(){
        return nlf_ClauseName.CLAUSE_NAME_MAP.get( this.clauseName );
    }

    /**
     * Build the SOQL clause string.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @return The constructed SOQL clause string.
     */
    public abstract String build();

    /**
     * Build the contents of the clause.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @return The contents of the clause.
     */
    public abstract String buildContents();

}