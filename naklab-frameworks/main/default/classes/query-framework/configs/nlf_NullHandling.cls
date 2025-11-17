/**
 * Provide the structure of null handling options available in the framework.
 * @author Hiroki Nakazawa
 * @since  2025-10-30
 * @group  Query-Framework
 */
public class nlf_NullHandling {
    
    /**
     * Enumeration values of null handling options available in the framework.
     * @author Hiroki Nakazawa
     * @since  2025-10-30
     */
    public enum NullHandling {
        NULL_HANDLING_FIRST ,
        NULL_HANDLING_LAST
    }

    /**
     * Mapping of NullHandling enum values to their corresponding SOQL null handling strings.
     */
    public static final Map<NullHandling,String> NULL_HANDLING_MAP = new Map<NullHandling,String>{
        NullHandling.NULL_HANDLING_FIRST => 'NULLS FIRST',
        NullHandling.NULL_HANDLING_LAST  => 'NULLS LAST'
    };

}