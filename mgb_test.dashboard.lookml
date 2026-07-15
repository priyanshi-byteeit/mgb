

- dashboard: mgb_test
  title: "MGB Motors – Executive Overview"
  layout: newspaper
  preferred_viewer: dashboards-next

  elements:

  # ===== SECTION 1: TOTAL REVENUE =====
  - title: "Total Revenue"
    name: total_revenue_kpi
    model: mgb_motors_dashboard
    explore: unified_revenue
    type: single_value
    fields: [unified_revenue.total_revenue]
    row: 0
    col: 0
    width: 6
    height: 4
    custom_color_enabled: true
    background_color: "#1A73B8"
    font_color: "#FFFFFF"
    value_format: "$#,##0.00,,\"M\""

  - title: "Revenue by Stream"
    name: revenue_by_stream
    model: mgb_motors_dashboard
    explore: unified_revenue
    type: looker_pie
    fields: [unified_revenue.revenue_stream, unified_revenue.total_revenue]
    row: 4
    col: 0
    width: 8
    height: 8

  - title: "Monthly Revenue Trend"
    name: monthly_revenue_trend
    model: mgb_motors_dashboard
    explore: unified_revenue
    type: looker_line
    fields: [dim_date.date_month, unified_revenue.total_revenue]
    sorts: [dim_date.date_month]
    row: 4
    col: 8
    width: 16
    height: 8

  # ===== SECTION 2: MACHINE SALES =====
  - title: "Total Machine Sales"
    name: total_machine_sales_kpi
    model: mgb_motors_dashboard
    explore: fact_machine_sales
    type: single_value
    fields: [fact_machine_sales.total_invoice]
    row: 0
    col: 6
    width: 6
    height: 4
    custom_color_enabled: true
    background_color: "#5CA271"
    font_color: "#FFFFFF"
    value_format: "$#,##0.00,,\"M\""

  - title: "Top Machine Models Sold"
    name: top_machine_models
    model: mgb_motors_dashboard
    explore: fact_machine_sales
    type: looker_bar
    fields: [fact_machine_sales.model, fact_machine_sales.total_qty]
    sorts: [fact_machine_sales.total_qty desc]
    limit: 10
    row: 12
    col: 0
    width: 12
    height: 8

  - title: "Dealer-wise Machine Sales"
    name: dealer_machine_sales
    model: mgb_motors_dashboard
    explore: fact_machine_sales
    type: looker_bar
    fields: [dim_branch.branch_name, fact_machine_sales.total_invoice]
    sorts: [fact_machine_sales.total_invoice desc]
    limit: 10
    row: 12
    col: 12
    width: 12
    height: 8

  # ===== SECTION 3: SERVICE REVENUE =====
  - title: "Total Service Revenue"
    name: total_service_revenue_kpi
    model: mgb_motors_dashboard
    explore: fact_service_revenue
    type: single_value
    fields: [fact_service_revenue.total_sale_amt]
    row: 0
    col: 12
    width: 6
    height: 4
    custom_color_enabled: true
    background_color: "#C97A9C"
    font_color: "#FFFFFF"
    value_format: "$#,##0.00,,\"M\""

  - title: "Service Revenue by Type"
    name: service_revenue_by_type
    model: mgb_motors_dashboard
    explore: fact_service_revenue
    type: looker_bar
    fields: [fact_service_revenue.service_type, fact_service_revenue.total_sale_amt]
    row: 20
    col: 0
    width: 12
    height: 8

  - title: "Top Service Centers"
    name: top_service_centers
    model: mgb_motors_dashboard
    explore: fact_service_revenue
    type: looker_bar
    fields: [dim_branch.branch_name, fact_service_revenue.total_sale_amt]
    sorts: [fact_service_revenue.total_sale_amt desc]
    limit: 10
    row: 20
    col: 12
    width: 12
    height: 8

  # ===== SECTION 4: PARTS SALES =====
  - title: "Total Parts Sales"
    name: total_parts_sales_kpi
    model: mgb_motors_dashboard
    explore: fact_parts_sales
    type: single_value
    fields: [fact_parts_sales.total_invoice]
    row: 0
    col: 18
    width: 6
    height: 4
    custom_color_enabled: true
    background_color: "#8B6FB5"
    font_color: "#FFFFFF"
    value_format: "$#,##0.00,,\"M\""

  - title: "Parts Sales by Branch"
    name: parts_sales_by_branch
    model: mgb_motors_dashboard
    explore: fact_parts_sales
    type: looker_bar
    fields: [dim_branch.branch_name, fact_parts_sales.total_invoice]
    sorts: [fact_parts_sales.total_invoice desc]
    limit: 10
    row: 28
    col: 0
    width: 24
    height: 8

  filters:
  - name: date_filter
    title: "Date Range"
    type: date_filter
    default_value: "1 years"
    model: mgb_motors_dashboard
    explore: unified_revenue
    field: dim_date.date

  - name: branch_filter
    title: "Dealer / Branch"
    type: field_filter
    model: mgb_motors_dashboard
    explore: unified_revenue
    field: dim_branch.branch_name
