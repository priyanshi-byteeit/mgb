- dashboard: mgb_executive_overview
  title: "MGB Motors – Executive Overview"
  layout: newspaper
  preferred_viewer: dashboards-next

  filters:
  - name: date_filter
    title: "Date Range"
    type: date_filter
    default_value: "1 years"

  - name: branch_filter
    title: "Dealer / Branch"
    type: field_filter
    default_value: ""
    explore: unified_revenue
    field: dim_branch.branch_name

  elements:

  # ===== SECTION 1: TOTAL REVENUE =====
  - title: "Total Revenue"
    name: total_revenue_kpi
    model: mgb_motors_dashboard
    explore: unified_revenue
    type: single_value
    fields: [unified_revenue.total_revenue]
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: greater than, value: 0, fields: !!null '',
        apply_formatting_to_row: false,
        cell_format: {background_color: "#0484C4", font_color: "#FFFFFF"},
        apply_to: allNumericFields}]
    listen:
      date_filter: unified_revenue.date_date
      branch_filter: dim_branch.branch_name
    row: 0
    col: 0
    width: 6
    height: 4

  - title: "Revenue by Stream"
    name: revenue_by_stream
    model: mgb_motors_dashboard
    explore: unified_revenue
    type: looker_pie
    fields: [unified_revenue.revenue_stream, unified_revenue.total_revenue]
    listen:
      date_filter: unified_revenue.date_date
      branch_filter: dim_branch.branch_name
    row: 4
    col: 0
    width: 8
    height: 8

  - title: "Monthly Revenue Trend"
    name: monthly_revenue_trend
    model: mgb_motors_dashboard
    explore: unified_revenue
    type: looker_line
    fields: [unified_revenue.date_month, unified_revenue.total_revenue]
    sorts: [unified_revenue.date_month]
    listen:
      date_filter: unified_revenue.date_date
      branch_filter: dim_branch.branch_name
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
    fields: [fact_machine_sales.total_invoice_amount]
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: greater than, value: 0, fields: !!null '',
        apply_formatting_to_row: false,
        cell_format: {background_color: "#009983", font_color: "#FFFFFF"},
        apply_to: allNumericFields}]
    listen:
      date_filter: fact_machine_sales.invoice_date
      branch_filter: dim_branch.branch_name
    row: 0
    col: 6
    width: 6
    height: 4

  - title: "Top Machine Models Sold"
    name: top_machine_models
    model: mgb_motors_dashboard
    explore: fact_machine_sales
    type: looker_bar
    fields: [fact_machine_sales.model, fact_machine_sales.total_quantity_sold]
    sorts: [fact_machine_sales.total_quantity_sold desc]
    limit: 10
    listen:
      date_filter: fact_machine_sales.invoice_date
      branch_filter: dim_branch.branch_name
    row: 12
    col: 0
    width: 12
    height: 8

  - title: "Dealer-wise Machine Sales"
    name: dealer_machine_sales
    model: mgb_motors_dashboard
    explore: fact_machine_sales
    type: looker_bar
    fields: [dim_branch.branch_name, fact_machine_sales.total_invoice_amount]
    sorts: [fact_machine_sales.total_invoice_amount desc]
    limit: 10
    listen:
      date_filter: fact_machine_sales.invoice_date
      branch_filter: dim_branch.branch_name
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
    fields: [fact_service_revenue.total_sale_amount]
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: greater than, value: 0, fields: !!null '',
        apply_formatting_to_row: false,
        cell_format: {background_color: "#E65768", font_color: "#FFFFFF"},
        apply_to: allNumericFields}]
    listen:
      date_filter: fact_service_revenue.doc_date
      branch_filter: dim_branch.branch_name
    row: 0
    col: 12
    width: 6
    height: 4

  - title: "Service Revenue by Type"
    name: service_revenue_by_type
    model: mgb_motors_dashboard
    explore: fact_service_revenue
    type: looker_bar
    fields: [fact_service_revenue.service_type, fact_service_revenue.total_sale_amount]
    listen:
      date_filter: fact_service_revenue.doc_date
      branch_filter: dim_branch.branch_name
    row: 20
    col: 0
    width: 12
    height: 8

  - title: "Top Service Centers"
    name: top_service_centers
    model: mgb_motors_dashboard
    explore: fact_service_revenue
    type: looker_bar
    fields: [dim_branch.branch_name, fact_service_revenue.total_sale_amount]
    sorts: [fact_service_revenue.total_sale_amount desc]
    limit: 10
    listen:
      date_filter: fact_service_revenue.doc_date
      branch_filter: dim_branch.branch_name
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
    fields: [fact_parts_sales.total_sales_amount]
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: greater than, value: 0, fields: !!null '',
        apply_formatting_to_row: false,
        cell_format: {background_color: "#9C40B8", font_color: "#FFFFFF"},
        apply_to: allNumericFields}]
    listen:
      date_filter: fact_parts_sales.invoice_date
      branch_filter: dim_branch.branch_name
    row: 0
    col: 18
    width: 6
    height: 4

  - title: "Parts Sales by Branch"
    name: parts_sales_by_branch
    model: mgb_motors_dashboard
    explore: fact_parts_sales
    type: looker_bar
    fields: [dim_branch.branch_name, fact_parts_sales.total_sales_amount]
    sorts: [fact_parts_sales.total_sales_amount desc]
    limit: 10
    listen:
      date_filter: fact_parts_sales.invoice_date
      branch_filter: dim_branch.branch_name
    row: 28
    col: 0
    width: 24
    height: 8
