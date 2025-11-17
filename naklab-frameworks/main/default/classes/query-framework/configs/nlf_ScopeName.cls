/**
 * Provide the structure of scope names available in the framework.
 * @author Hiroki Nakazawa
 * @since  2025-11-04
 * @group  Query-Framework
 */
public class nlf_ScopeName {
    
    /**
     * Enumeration values of scope names available in the framework.
     * @author Hiroki Nakazawa
     * @since  2025-11-04
     */
    public enum ScopeName {
        SCOPE_NAME_EVERYTHING         ,
        SCOPE_NAME_MINE               ,
        SCOPE_NAME_TEAM               ,
        SCOPE_NAME_MINE_AND_MY_GROUPS ,
        SCOPE_NAME_MY_TERRITORY       ,
        SCOPE_NAME_MY_TEAM_TERRITORY  ,
        SCOPE_NAME_DELEGATED          ,
        SCOPE_NAME_SCOPINGRULE
    }

    /**
     * Mapping of ScopeName enum values to their corresponding SOQL scope name strings.
     */
    public static final Map<ScopeName,String> SCOPE_NAME_MAP = new Map<ScopeName,String>{
        ScopeName.SCOPE_NAME_EVERYTHING         => 'everything'         ,
        ScopeName.SCOPE_NAME_MINE               => 'mine'               ,
        ScopeName.SCOPE_NAME_TEAM               => 'team'               ,
        ScopeName.SCOPE_NAME_MINE_AND_MY_GROUPS => 'mine_and_my_groups' ,
        ScopeName.SCOPE_NAME_MY_TERRITORY       => 'my_territory'       ,
        ScopeName.SCOPE_NAME_MY_TEAM_TERRITORY  => 'my_team_territory'  ,
        ScopeName.SCOPE_NAME_DELEGATED          => 'delegated'          ,
        ScopeName.SCOPE_NAME_SCOPINGRULE        => 'scopingRule'
    };

}