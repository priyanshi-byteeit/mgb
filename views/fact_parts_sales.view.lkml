view: fact_parts_sales {
  sql_table_name: `MGB_motors.fact_parts_sales` ;;

  dimension: branch {
    type: string
    sql: ${TABLE}.branch ;;
  }
  dimension: customer {
    type: string
    sql: ${TABLE}.customer ;;
  }
  dimension: discount_amt {
    type: number
    sql: ${TABLE}.discount_amt ;;
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
  dimension: invoice_type {
    type: string
    sql: ${TABLE}.invoice_type ;;
  }
  dimension: mrp_amount {
    type: number
    sql: ${TABLE}.mrp_amount ;;
  }
  dimension: return_total {
    type: number
    sql: ${TABLE}.return_total ;;
  }
  dimension: revenue_stream {
    type: string
    sql: ${TABLE}.revenue_stream ;;
  }
  dimension: sales_employee {
    type: string
    sql: ${TABLE}.sales_employee ;;
  }
  dimension: sp_amount {
    type: number
    sql: ${TABLE}.sp_amount ;;
  }
  dimension: tax_amt {
    type: number
    sql: ${TABLE}.tax_amt ;;
  }
  measure: count {
    type: count
  }
  measure: total_sales_amount {
    type: sum
    sql: ${sp_amount} ;;
    value_format: "$0.00,,\"M\""
  }
  measure: total_discount_amount {
    type: sum
    sql: ${discount_amt} ;;
    value_format_name: usd
  }
  measure: total_return_amount {
    type: sum
    sql: ${return_total} ;;
    value_format_name: usd
  }
  measure: net_sales_amount {
    type: number
    label: "Net Sales (After Returns)"
    value_format_name: usd
    sql: SUM(${TABLE}.sp_amount) - SUM(${TABLE}.return_total) ;;
  }

  measure: return_rate {
    type: number
    label: "Return Rate"
    value_format_name: percent_1
    sql: 1.0 * SUM(${TABLE}.return_total) / NULLIF(SUM(${TABLE}.sp_amount), 0) ;;
  }
}
