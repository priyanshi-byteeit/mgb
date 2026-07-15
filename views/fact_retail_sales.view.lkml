view: fact_retail_sales {
  sql_table_name: `MGB_motors.fact_retail_sales` ;;

  dimension: branch_location {
    type: string
    sql: ${TABLE}.branch_location ;;
  }
  dimension: customer {
    type: string
    sql: ${TABLE}.customer ;;
  }
  dimension: gst_amt {
    type: number
    sql: ${TABLE}.gst_amt ;;
  }
  dimension: hsn_code {
    type: string
    sql: ${TABLE}.hsn_code ;;
  }
  dimension_group: invoice {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.invoice_date ;;
  }
  dimension: invoice_no {
    type: number
    sql: ${TABLE}.invoice_no ;;
  }
  dimension: invoice_total {
    type: number
    sql: ${TABLE}.invoice_total ;;
  }
  dimension: net_amt {
    type: number
    sql: ${TABLE}.net_amt ;;
  }
  dimension: place_of_supply {
    type: string
    sql: ${TABLE}.place_of_supply ;;
  }
  dimension: qty {
    type: number
    sql: ${TABLE}.qty ;;
  }
  dimension: revenue_stream {
    type: string
    sql: ${TABLE}.revenue_stream ;;
  }
  measure: count {
    type: count
  }
  measure: total_invoice_amount {
    type: sum
    sql: ${invoice_total} ;;
    value_format_name: usd
  }

  measure: total_net_amount {
    type: sum
    sql: ${net_amt} ;;
    value_format_name: usd
  }

  measure: total_gst_amount {
    type: sum
    sql: ${gst_amt} ;;
    value_format_name: usd
  }

  measure: total_quantity_sold {
    type: sum
    sql: ${qty} ;;
  }

  measure: average_invoice_value {
    type: average
    sql: ${invoice_total} ;;
    value_format_name: usd
  }
}
