/**
 * Provides a class for handling the SCOPE clause in SOQL queries in the framework.
 * @author Hiroki Nakazawa
 * @since  2025-11-12
 * @group  Query-Framework
 * @see    nlf_Clause
 */
public class nlf_ScopeClause extends nlf_Clause {
    
    /**
     * Provide the scope name for the SCOPE clause.
     */
    private nlf_ScopeName.ScopeName scopeName;

    /**
     * Basic constructor that initializes the properties.
     * @author Hiroki Nakazawa
     * @since  2025-11-12
     * @param scopeName Configuration information of the scope name.
     */
    public nlf_ScopeClause( nlf_ScopeName.ScopeName scopeName ){
        super( nlf_ClauseName.ClauseName.CLAUSE_NAME_SCOPE );
        this.scopeName = scopeName;
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
        return nlf_ScopeName.SCOPE_NAME_MAP.get( this.scopeName );
    }

}