view: dim_branch {
  sql_table_name: `MGB_motors.dim_branch` ;;

  dimension: branch_id {
    type: number
    sql: ${TABLE}.branch_id ;;
  }
  dimension: branch_name {
    type: string
    sql: ${TABLE}.branch_name ;;
  }
  measure: count {
    type: count
    drill_fields: [branch_name]
  }
}
