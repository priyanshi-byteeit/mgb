view: fact_machine_sales {
  sql_table_name: `MGB_motors.fact_machine_sales` ;;

  dimension: basic_price {
    type: number
    sql: ${TABLE}.basic_price ;;
  }
  dimension: branch {
    type: string
    sql: ${TABLE}.branch ;;
  }
  dimension: customer {
    type: string
    sql: ${TABLE}.customer ;;
  }
  dimension: financier {
    type: string
    sql: ${TABLE}.financier ;;
  }
  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
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
  dimension: sales_employee {
    type: string
    sql: ${TABLE}.sales_employee ;;
  }
  dimension: tax_amt {
    type: number
    sql: ${TABLE}.tax_amt ;;
  }
  measure: count {
    type: count
  }
  measure: total_invoice_amount {
    type: sum
    sql: ${invoice_total} ;;
    value_format: "$0.00,,\"M\""
  }

  measure: total_basic_price {
    type: sum
    sql: ${basic_price} ;;
    value_format_name: usd
  }

  measure: total_quantity_sold {
    type: sum
    sql: ${qty} ;;
  }

  measure: average_price_per_machine {
    type: average
    sql: ${basic_price} ;;
    value_format_name: usd
  }
  measure: total_tax_amount {
    type: sum
    label: "Total Tax"
    sql: ${tax_amt} ;;
    value_format_name: usd
  }
}
