/**
 * Provide the structure of conditional operators available in the framework.
 * @author Hiroki Nakazawa
 * @since  2025-10-29
 * @group  Query-Framework
 */
public class nlf_ComparisonOperator {
    
    /**
     * Enumeration values of conditional operators available in the framework.
     * @author Hiroki Nakazawa
     * @since  2025-10-29
     */
    public Enum ComparisonOperator {
        COMPARISON_OPERATOR_EQUALS                     ,
        COMPARISON_OPERATOR_EQUALS_WITH_BIND           ,
        COMPARISON_OPERATOR_NOT_EQUALS                 ,
        COMPARISON_OPERATOR_NOT_EQUALS_WITH_BIND       ,
        COMPARISON_OPERATOR_IN                         ,
        COMPARISON_OPERATOR_IN_WITH_BIND               ,
        COMPARISON_OPERATOR_NOT_IN                     ,
        COMPARISON_OPERATOR_NOT_IN_WITH_BIND           ,
        COMPARISON_OPERATOR_LESS_THAN                  ,
        COMPARISON_OPERATOR_LESS_THAN_WITH_BIND        ,
        COMPARISON_OPERATOR_GREATER_THAN               ,
        COMPARISON_OPERATOR_GREATER_THAN_WITH_BIND     ,
        COMPARISON_OPERATOR_LESS_OR_EQUAL              ,
        COMPARISON_OPERATOR_LESS_OR_EQUAL_WITH_BIND    ,
        COMPARISON_OPERATOR_GREATER_OR_EQUAL           ,
        COMPARISON_OPERATOR_GREATER_OR_EQUAL_WITH_BIND ,
        COMPARISON_OPERATOR_LIKE                       ,
        COMPARISON_OPERATOR_LIKE_WITH_BIND             ,
        COMPARISON_OPERATOR_INCLUDES                   ,
        COMPARISON_OPERATOR_INCLUDES_WITH_BIND         ,
        COMPARISON_OPERATOR_EXCLUDES                   ,
        COMPARISON_OPERATOR_EXCLUDES_WITH_BIND
    }

    /**
     * Mapping of ComparisonOperator enum values to their corresponding SOQL operator strings.
     */
    public static final Map<ComparisonOperator,String> COMPARISON_OPERATOR_MAP = new Map<ComparisonOperator,String>{
        ComparisonOperator.COMPARISON_OPERATOR_EQUALS                     => '='          ,
        ComparisonOperator.COMPARISON_OPERATOR_EQUALS_WITH_BIND           => '= :'        ,
        ComparisonOperator.COMPARISON_OPERATOR_NOT_EQUALS                 => '!='         ,
        ComparisonOperator.COMPARISON_OPERATOR_NOT_EQUALS_WITH_BIND       => '!= :'       ,
        ComparisonOperator.COMPARISON_OPERATOR_IN                         => 'IN'         ,
        ComparisonOperator.COMPARISON_OPERATOR_IN_WITH_BIND               => 'IN :'       ,
        ComparisonOperator.COMPARISON_OPERATOR_NOT_IN                     => 'NOT IN'     ,
        ComparisonOperator.COMPARISON_OPERATOR_NOT_IN_WITH_BIND           => 'NOT IN :'   ,
        ComparisonOperator.COMPARISON_OPERATOR_LESS_THAN                  => '<'          ,
        ComparisonOperator.COMPARISON_OPERATOR_LESS_THAN_WITH_BIND        => '< :'        ,
        ComparisonOperator.COMPARISON_OPERATOR_GREATER_THAN               => '>'          ,
        ComparisonOperator.COMPARISON_OPERATOR_GREATER_THAN_WITH_BIND     => '> :'        ,
        ComparisonOperator.COMPARISON_OPERATOR_LESS_OR_EQUAL              => '<='         ,
        ComparisonOperator.COMPARISON_OPERATOR_LESS_OR_EQUAL_WITH_BIND    => '<= :'       ,
        ComparisonOperator.COMPARISON_OPERATOR_GREATER_OR_EQUAL           => '>='         ,
        ComparisonOperator.COMPARISON_OPERATOR_GREATER_OR_EQUAL_WITH_BIND => '>= :'       ,
        ComparisonOperator.COMPARISON_OPERATOR_LIKE                       => 'LIKE'       ,
        ComparisonOperator.COMPARISON_OPERATOR_LIKE_WITH_BIND             => 'LIKE :'     ,
        ComparisonOperator.COMPARISON_OPERATOR_INCLUDES                   => 'INCLUDES'   ,
        ComparisonOperator.COMPARISON_OPERATOR_INCLUDES_WITH_BIND         => 'INCLUDES :' ,
        ComparisonOperator.COMPARISON_OPERATOR_EXCLUDES                   => 'EXCLUDES'   ,
        ComparisonOperator.COMPARISON_OPERATOR_EXCLUDES_WITH_BIND         => 'EXCLUDES :'
    };
    
}