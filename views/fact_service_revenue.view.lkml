view: fact_service_revenue {
  sql_table_name: `MGB_motors.fact_service_revenue` ;;

  dimension: branch {
    type: string
    sql: ${TABLE}.branch ;;
  }
  dimension: call_id {
    type: number
    sql: ${TABLE}.call_id ;;
  }
  dimension: call_type {
    type: string
    sql: ${TABLE}.call_type ;;
  }
  dimension: customer {
    type: string
    sql: ${TABLE}.customer ;;
  }
  dimension_group: doc {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.doc_date ;;
  }
  dimension: doc_no {
    type: number
    sql: ${TABLE}.doc_no ;;
  }
  dimension: engineer {
    type: string
    sql: ${TABLE}.engineer ;;
  }
  dimension: gst_amt {
    type: number
    sql: ${TABLE}.gst_amt ;;
  }
  dimension: item_group {
    type: string
    sql: ${TABLE}.item_group ;;
  }
  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }
  dimension: qty {
    type: number
    sql: ${TABLE}.qty ;;
  }
  dimension: revenue_stream {
    type: string
    sql: ${TABLE}.revenue_stream ;;
  }
  dimension: sale_amt {
    type: number
    sql: ${TABLE}.sale_amt ;;
  }
  dimension: service_type {
    type: string
    sql: ${TABLE}.service_type ;;
  }
  dimension: sub_type {
    type: string
    sql: ${TABLE}.sub_type ;;
  }
  measure: count {
    type: count
  }
  measure: total_sale_amount {
    type: sum
    sql: ${sale_amt} ;;
    value_format: "$0.00,,\"M\""
  }

  measure: total_gst_amount {
    type: sum
    sql: ${gst_amt} ;;
    value_format_name: usd
  }

  measure: total_quantity {
    type: sum
    sql: ${qty} ;;
  }

  measure: average_sale_amount {
    type: average
    sql: ${sale_amt} ;;
    value_format_name: usd
  }

  measure: total_service_calls {
    type: count_distinct
    sql: ${call_id} ;;
  }
}
