/**
 * Provide the structure of sort directions available in the framework.
 * @author Hiroki Nakazawa
 * @since  2025-10-30
 * @group  Query-Framework
 */
public class nlf_SortDirection {
    
    /**
     * Enumeration values of sort directions available in the framework.
     * @author Hiroki Nakazawa
     * @since  2025-10-30
     */
    public enum SortDirection {
        SORT_DIRECTION_ASC  ,
        SORT_DIRECTION_DESC
    }

    /**
     * Mapping of SortDirection enum values to their corresponding SOQL direction strings.
     */
    public static final Map<SortDirection,String> SORT_DIRECTION_MAP = new Map<SortDirection,String>{
        SortDirection.SORT_DIRECTION_ASC  => 'ASC'  ,
        SortDirection.SORT_DIRECTION_DESC => 'DESC'
    };

}