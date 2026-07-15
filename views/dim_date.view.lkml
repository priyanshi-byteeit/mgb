view: dim_date {
  sql_table_name: `MGB_motors.dim_date` ;;

  dimension_group: date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.date ;;
  }
  dimension: date_id {
    type: number
    sql: ${TABLE}.date_id ;;
  }
  dimension: day {
    type: number
    sql: ${TABLE}.day ;;
  }
  dimension: is_weekend {
    type: yesno
    sql: ${TABLE}.is_weekend ;;
  }
  dimension: month {
    type: string
    sql: ${TABLE}.month ;;
  }
  dimension: week {
    type: number
    sql: ${TABLE}.week ;;
  }
  dimension: weekday {
    type: string
    sql: ${TABLE}.weekday ;;
  }
  measure: count {
    type: count
  }
}
