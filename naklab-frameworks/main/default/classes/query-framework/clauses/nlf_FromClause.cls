/**
 * Provides a class for handling the FROM clause in SOQL queries in the framework.
 * @author Hiroki Nakazawa
 * @since  2025-11-09
 * @group  Query-Framework
 * @see    nlf_Clause
 */
public class nlf_FromClause extends nlf_Clause {
    
    /**
     * Provide the target object to be queried in the FROM clause.
     */
    private Schema.SObjectType sObjectType;

    /**
     * Basic constructor that initializes the properties.
     * @author Hiroki Nakazawa
     * @since  2025-11-09
     * @param sObjectType Configuration information of the target SObject type.
     */
    public nlf_FromClause( Schema.SObjectType sObjectType ){
        super( nlf_ClauseName.ClauseName.CLAUSE_NAME_FROM );
        this.sObjectType = sObjectType;
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
        return this.sObjectType.getDescribe().getName();
    }

}