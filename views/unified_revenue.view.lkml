view: unified_revenue {
  sql_table_name: `MGB_motors.unified_revenue` ;;

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }
  dimension: branch {
    type: string
    sql: ${TABLE}.branch ;;
  }
  dimension_group: date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.date ;;
  }
  dimension: date_id {
    type: number
    sql: ${TABLE}.date_id ;;
  }
  dimension: revenue_stream {
    type: string
    sql: ${TABLE}.revenue_stream ;;
  }
  measure: count {
    type: count
  }
  measure: total_revenue {
    type: sum
    sql: ${amount} ;;
    value_format: "$0.00,,\"M\""
  }
}
