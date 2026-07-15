view: fact_purchases {
  sql_table_name: `MGB_motors.fact_purchases` ;;

  dimension: ap_inv_no {
    type: number
    sql: ${TABLE}.ap_inv_no ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension_group: inv {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.inv_date ;;
  }
  dimension: inv_total {
    type: number
    sql: ${TABLE}.inv_total ;;
  }
  dimension: machine_no {
    type: number
    sql: ${TABLE}.machine_no ;;
  }
  dimension: net_amt {
    type: number
    sql: ${TABLE}.net_amt ;;
  }
  dimension: purchase_category {
    type: string
    sql: ${TABLE}.purchase_category ;;
  }
  dimension: qty {
    type: number
    sql: ${TABLE}.qty ;;
  }
  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
  }
  measure: count {
    type: count
    drill_fields: [vendor_name]
  }
  measure: total_invoice_amount {
    type: sum
    sql: ${inv_total} ;;
    value_format_name: usd
  }

  measure: total_net_amount {
    type: sum
    sql: ${net_amt} ;;
    value_format_name: usd
  }

  measure: total_quantity {
    type: sum
    sql: ${qty} ;;
  }
}
