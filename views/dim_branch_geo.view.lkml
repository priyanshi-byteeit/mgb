view: dim_branch_geo {
  sql_table_name: `byteeit-testing-project.MGB_motors.dim_branch_geo` ;;

  dimension: branch_id {
    type: number
    sql: ${TABLE}.branch_id ;;
  }

  dimension: branch_name {
    type: string
    sql: ${TABLE}.branch_name ;;
  }

  dimension: latitude {
    type: number
    hidden: yes
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    hidden: yes
    sql: ${TABLE}.longitude ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: zip_code {
    type: string
    sql: ${TABLE}.zip_code ;;
  }

  measure: count {
    type: count
    drill_fields: [branch_name]
  }
}
