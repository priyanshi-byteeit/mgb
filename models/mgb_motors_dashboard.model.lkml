connection: "mgb_motors"
include: "/views/*.view"
include: "/models/*.dashboard.lookml"


explore: unified_revenue {
  label: "Unified Revenue"
  join: dim_branch {
    type: left_outer
    sql_on: ${unified_revenue.branch} = ${dim_branch.branch_name} ;;
    relationship: many_to_one
  }
  join: dim_branch_geo {
    type: left_outer
    sql_on: ${dim_branch.branch_name} = ${dim_branch_geo.branch_name} ;;
    relationship: many_to_one
  }
  join: dim_date {
    type: left_outer
    sql_on: ${unified_revenue.date_id} = ${dim_date.date_id} ;;
    relationship: many_to_one
  }
}

explore: fact_machine_sales {
  label: "Machine Sales"
  join: dim_branch {
    type: left_outer
    sql_on: ${fact_machine_sales.branch} = ${dim_branch.branch_name} ;;
    relationship: many_to_one
  }
  join: dim_branch_geo {
    type: left_outer
    sql_on: ${dim_branch.branch_name} = ${dim_branch_geo.branch_name} ;;
    relationship: many_to_one
  }
  join: dim_date {
    type: left_outer
    sql_on: date(${fact_machine_sales.invoice_raw}) = date(${dim_date.date_raw}) ;;
    relationship: many_to_one
  }
}

explore: fact_parts_sales {
  label: "Parts Sales"
  join: dim_branch {
    type: left_outer
    sql_on: ${fact_parts_sales.branch} = ${dim_branch.branch_name} ;;
    relationship: many_to_one
  }
  join: dim_branch_geo {
    type: left_outer
    sql_on: ${dim_branch.branch_name} = ${dim_branch_geo.branch_name} ;;
    relationship: many_to_one
  }
  join: dim_date {
    type: left_outer
    sql_on: date(${fact_parts_sales.invoice_raw}) = date(${dim_date.date_raw}) ;;
    relationship: many_to_one
  }
}

explore: fact_retail_sales {
  label: "Retail Sales"
  join: dim_branch {
    type: left_outer
    sql_on: ${fact_retail_sales.branch_location} = ${dim_branch.branch_name} ;;
    relationship: many_to_one
  }
  join: dim_date {
    type: left_outer
    sql_on: date(${fact_retail_sales.invoice_raw}) = date(${dim_date.date_raw}) ;;
    relationship: many_to_one
  }
}

explore: fact_service_revenue {
  label: "Service Revenue"
  join: dim_branch {
    type: left_outer
    sql_on: ${fact_service_revenue.branch} = ${dim_branch.branch_name} ;;
    relationship: many_to_one
  }
  join: dim_branch_geo {
    type: left_outer
    sql_on: ${dim_branch.branch_name} = ${dim_branch_geo.branch_name} ;;
    relationship: many_to_one
  }
  join: dim_date {
    type: left_outer
    sql_on: date(${fact_service_revenue.doc_raw}) = date(${dim_date.date_raw}) ;;
    relationship: many_to_one
  }
}

explore: fact_purchases {
  label: "Purchases"
  join: dim_date {
    type: left_outer
    sql_on: date(${fact_purchases.inv_raw}) = date(${dim_date.date_raw}) ;;
    relationship: many_to_one
  }
}
