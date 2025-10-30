/**
 * Provide the structure of logical operators available in the framework.
 * @author Hiroki Nakazawa
 * @since  2025-10-29
 * @group  Query-Framework
 */
public class nlf_LogicalOperator {
    
    /**
     * Enumeration values of logical operators available in the framework.
     * @author Hiroki Nakazawa
     * @since  2025-10-29
     */
    public enum LogicalOperator {
        LOGICAL_OPERATOR_AND ,
        LOGICAL_OPERATOR_OR
    }

    /**
     * Mapping of LogicalOperator enum values to their corresponding SOQL operator strings.
     */
    public static final Map<LogicalOperator,String> LOGICAL_OPERATOR_MAP = new Map<LogicalOperator,String>{
        LogicalOperator.LOGICAL_OPERATOR_AND => 'AND' ,
        LogicalOperator.LOGICAL_OPERATOR_OR  => 'OR'
    };

}