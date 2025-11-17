/**
 * Provide the configuration that controls query generation in the framework.
 * @author Hiroki Nakazawa
 * @since  2025-11-12
 */
public class nlf_QueryBuilder {
    
    /**
     * The SELECT clause of the query.
     */
    private nlf_SelectClause selectClause;

    /**
     * The FROM clause of the query.
     */
    private nlf_FromClause fromClause;

    /**
     * The WHERE clause of the query.
     */
    private nlf_WhereClause whereClause;

    /**
     * The ORDER clause of the query.
     */
    private nlf_OrderClause orderClause;

    /**
     * The LIMIT clause of the query.
     */
    private nlf_LimitClause limitClause;

    /**
     * The OFFSET clause of the query.
     */
    private nlf_OffsetClause offsetClause;

    /**
     * The SCOPE clause of the query.
     */
    private nlf_ScopeClause scopeClause;

    /**
     * The FOR clause of the query.
     */
    private Boolean isLock;

    /**
     * Constructor that instantiates the Query Builder class.
     */
    public nlf_QueryBuilder(){}

    /**
     * Build the query string from the configured clauses.
     * @author Hiroki Nakazawa
     * @since  2025-11-17
     * @return The built query string.
     */
    public String build(){
        List<nlf_Clause> clauses = new List<nlf_Clause>();
        if( selectClause != null ){ clauses.add( selectClause ); }
        if( fromClause   != null ){ clauses.add( fromClause   ); }
        if( scopeClause  != null ){ clauses.add( scopeClause  ); }
        if( whereClause  != null ){ clauses.add( whereClause  ); }
        if( orderClause  != null ){ clauses.add( orderClause  ); }
        if( limitClause  != null ){ clauses.add( limitClause  ); }
        if( offsetClause != null ){ clauses.add( offsetClause ); }
        List<String> buildedClauses = this.buildClauses( clauses );
        if( this.isLock != null && this.isLock ){ buildedClauses.add( nlf_ClauseName.CLAUSE_NAME_MAP.get( nlf_ClauseName.ClauseName.CLAUSE_NAME_UPDATE ) ); }
        return String.join( buildedClauses , ' ' );
    }

    /**
     * Build each clause and return as a list of strings.
     * @author Hiroki Nakazawa
     * @since  2025-11-17
     * @param clauses The list of clauses to build.
     * @return The list of built clause strings.
     */
    private List<String> buildClauses( List<nlf_Clause> clauses ){
        List<String> buildedClauses = new List<String>();
        for( nlf_Clause clause : clauses ){
            String builtClause = clause.build();
            if( String.isNotBlank( builtClause ) ){ buildedClauses.add( builtClause ); }
        }
        return buildedClauses;
    }

    /**
     * Execute the built query and return the results.
     * @author Hiroki Nakazawa
     * @since  2025-11-17
     * @param accessLevel The access level for the query execution.
     * @return The list of SObjects returned by the query.
     */
    public List<SObject> query( System.AccessLevel accessLevel ){
        return Database.query( this.build() , accessLevel );
    }

    /**
     * Execute the built query with bind variables and return the results.
     * @author Hiroki Nakazawa
     * @since  2025-11-17
     * @param bindMap     The map of bind variables for the query execution.
     * @param accessLevel The access level for the query execution.
     * @return The list of SObjects returned by the query.
     */
    public List<SObject> query( Map<String,Object> bindMap , System.AccessLevel accessLevel ){
        return Database.queryWithBinds( this.build() , bindMap , accessLevel );
    }

    /**
     * Get a QueryLocator for the built query.
     * @author Hiroki Nakazawa
     * @since  2025-11-17
     * @param accessLevel The access level for the query execution.
     * @return The QueryLocator for the built query.
     */
    public Database.QueryLocator queryLocator( System.AccessLevel accessLevel ){
        return Database.getQueryLocator( this.build() , accessLevel );
    }

    /**
     * Get a QueryLocator for the built query with bind variables.
     * @author Hiroki Nakazawa
     * @since  2025-11-17
     * @param bindMap     The map of bind variables for the query execution.
     * @param accessLevel The access level for the query execution.
     * @return The QueryLocator for the built query.
     */
    public Database.QueryLocator queryLocator( Map<String,Object> bindMap , System.AccessLevel accessLevel ){
        return Database.getQueryLocatorWithBinds( this.build() , bindMap , accessLevel );
    }

    /**
     * Set the SELECT clause for the query.
     * @author Hiroki Nakazawa
     * @since  2025-11-17
     * @param selectClause The SELECT clause to set.
     * @return The current instance of the QueryBuilder.
     */
    public nlf_QueryBuilder setSelectClause( nlf_SelectClause selectClause ){
        this.selectClause = selectClause;
        return this;
    }

    /**
     * Set the FROM clause for the query.
     * @author Hiroki Nakazawa
     * @since  2025-11-17
     * @param fromClause The FROM clause to set.
     * @return The current instance of the QueryBuilder.
     */
    public nlf_QueryBuilder setFromClause( nlf_FromClause fromClause ){
        this.fromClause = fromClause;
        return this;
    }

    /**
     * Set the WHERE clause for the query.
     * @author Hiroki Nakazawa
     * @since  2025-11-17
     * @param whereClause The WHERE clause to set.
     * @return The current instance of the QueryBuilder.
     */
    public nlf_QueryBuilder setWhereClause( nlf_WhereClause whereClause ){
        this.whereClause = whereClause;
        return this;
    }

    /**
     * Set the ORDER clause for the query.
     * @author Hiroki Nakazawa
     * @since  2025-11-17
     * @param orderClause The ORDER clause to set.
     * @return The current instance of the QueryBuilder.
     */
    public nlf_QueryBuilder setOrderClause( nlf_OrderClause orderClause ){
        this.orderClause = orderClause;
        return this;
    }

    /**
     * Set the LIMIT clause for the query.
     * @author Hiroki Nakazawa
     * @since  2025-11-17
     * @param limitClause The LIMIT clause to set.
     * @return The current instance of the QueryBuilder.
     */
    public nlf_QueryBuilder setLimitClause( nlf_LimitClause limitClause ){
        this.limitClause = limitClause;
        return this;
    }

    /**
     * Set the OFFSET clause for the query.
     * @author Hiroki Nakazawa
     * @since  2025-11-17
     * @param offsetClause The OFFSET clause to set.
     * @return The current instance of the QueryBuilder.
     */
    public nlf_QueryBuilder setOffsetClause( nlf_OffsetClause offsetClause ){
        this.offsetClause = offsetClause;
        return this;
    }

    /**
     * Set the SCOPE clause for the query.
     * @author Hiroki Nakazawa
     * @since  2025-11-17
     * @param scopeClause The SCOPE clause to set.
     * @return The current instance of the QueryBuilder.
     */
    public nlf_QueryBuilder setScopeClause( nlf_ScopeClause scopeClause ){
        this.scopeClause = scopeClause;
        return this;
    }

    /**
     * Set the query to be a locking query (FOR UPDATE).
     * @author Hiroki Nakazawa
     * @since  2025-11-17
     * @return The current instance of the QueryBuilder.
     */
    public nlf_QueryBuilder isLock(){
        this.isLock = true;
        return this;
    }

    /**
     * Set the query to be a non-locking query (no FOR UPDATE).
     * @author Hiroki Nakazawa
     * @since  2025-11-17
     * @return The current instance of the QueryBuilder.
     */
    public nlf_QueryBuilder isUnLock(){
        this.isLock = false;
        return this;
    }

}