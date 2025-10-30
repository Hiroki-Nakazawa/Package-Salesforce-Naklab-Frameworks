/**
 * Provide the structure of SOQL clauses available in the framework.
 * @author Hiroki Nakazawa
 * @since  2025-10-29
 * @group  Query-Framework
 */
public class nlf_ClauseName {
    
    /**
     * Enumeration values of SOQL clauses available in the framework.
     * @author Hiroki Nakazawa
     * @since  2025-10-29
     */
    public enum ClauseName {
        CLAUSE_NAME_SELECT ,
        CLAUSE_NAME_FROM   ,
        CLAUSE_NAME_SCOPE  ,
        CLAUSE_NAME_WHERE  ,
        CLAUSE_NAME_ORDER  ,
        CLAUSE_NAME_LIMIT  ,
        CLAUSE_NAME_OFFSET ,
        CLAUSE_NAME_UPDATE
    }

    /**
     * Mapping of ClauseName enum values to their corresponding SOQL clause strings.
     */
    public static final Map<ClauseName,String> CLAUSE_NAME_MAP = new Map<ClauseName,String>{
        ClauseName.CLAUSE_NAME_SELECT => 'SELECT'      ,
        ClauseName.CLAUSE_NAME_FROM   => 'FROM'        ,
        ClauseName.CLAUSE_NAME_SCOPE  => 'USING SCOPE' ,
        ClauseName.CLAUSE_NAME_WHERE  => 'WHERE'       ,
        ClauseName.CLAUSE_NAME_ORDER  => 'ORDER BY'    ,
        ClauseName.CLAUSE_NAME_LIMIT  => 'LIMIT'       ,
        ClauseName.CLAUSE_NAME_OFFSET => 'OFFSET'      ,
        ClauseName.CLAUSE_NAME_UPDATE => 'FOR UPDATE'
    };

}