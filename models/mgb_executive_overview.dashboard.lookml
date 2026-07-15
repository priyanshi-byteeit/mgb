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

  # ===================================================
  # SECTION 1: TOTAL REVENUE
  # ===================================================
  - title: ""
    name: section_1_header
    type: text
    body_text: "**SECTION 1 — TOTAL REVENUE**"
    row: 0
    col: 0
    width: 24
    height: 1

  - title: "Total Revenue"
    name: total_revenue_kpi
    model: mgb_motors_dashboard
    explore: unified_revenue
    type: single_value
    fields: [unified_revenue.total_revenue]
    show_comparison: true
    comparison_type: change
    show_comparison_label: true
    comparison_label: "vs. previous period"
    listen:
      date_filter: unified_revenue.date_date
      branch_filter: dim_branch.branch_name
    row: 1
    col: 0
    width: 8
    height: 5

  - title: "Revenue by Stream"
    name: revenue_by_stream
    model: mgb_motors_dashboard
    explore: unified_revenue
    type: looker_pie
    fields: [unified_revenue.revenue_stream, unified_revenue.total_revenue]
    value_labels: legend
    label_type: labPer
    series_colors:
      Parts Sales (Dealer/Counter): "#EA4335"
      Machine Sales: "#80868B"
      Service Revenue: "#F9AB00"
    listen:
      date_filter: unified_revenue.date_date
      branch_filter: dim_branch.branch_name
    row: 1
    col: 8
    width: 8
    height: 8

  - title: "Monthly Revenue Trend"
    name: monthly_revenue_trend
    model: mgb_motors_dashboard
    explore: unified_revenue
    type: looker_line
    fields: [unified_revenue.total_revenue, dim_date.date_date]
    fill_fields: [dim_date.date_date]
    listen:
      date_filter: unified_revenue.date_date
      branch_filter: dim_branch.branch_name
    row: 1
    col: 16
    width: 8
    height: 8

  # ===================================================
  # SECTION 2: MACHINE SALES
  # ===================================================
  - title: ""
    name: section_2_header
    type: text
    body_text: "**SECTION 2 — MACHINE SALES**"
    row: 9
    col: 0
    width: 24
    height: 1

  - title: "Total Machine Sales"
    name: total_machine_sales_kpi
    model: mgb_motors_dashboard
    explore: fact_machine_sales
    type: single_value
    fields: [fact_machine_sales.total_invoice_amount]
    show_comparison: true
    comparison_type: change
    show_comparison_label: true
    comparison_label: "vs. previous period"
    listen:
      date_filter: fact_machine_sales.invoice_date
      branch_filter: dim_branch.branch_name
    row: 10
    col: 0
    width: 8
    height: 5

  - title: "Top Machine Models Sold"
    name: top_machine_models
    model: mgb_motors_dashboard
    explore: fact_machine_sales
    type: looker_bar
    fields: [fact_machine_sales.model, fact_machine_sales.total_quantity_sold]
    sorts: [fact_machine_sales.total_quantity_sold desc]
    limit: 8
    listen:
      date_filter: fact_machine_sales.invoice_date
      branch_filter: dim_branch.branch_name
    row: 10
    col: 8
    width: 8
    height: 8

  - title: "Dealer-wise Machine Sales"
    name: dealer_machine_sales
    model: mgb_motors_dashboard
    explore: fact_machine_sales
    type: looker_bar
    fields: [dim_branch.branch_name, fact_machine_sales.total_invoice_amount]
    sorts: [fact_machine_sales.total_invoice_amount desc]
    limit: 8
    listen:
      date_filter: fact_machine_sales.invoice_date
      branch_filter: dim_branch.branch_name
    row: 10
    col: 16
    width: 8
    height: 8

  # ===================================================
  # SECTION 3: SERVICE REVENUE
  # ===================================================
  - title: ""
    name: section_3_header
    type: text
    body_text: "**SECTION 3 — SERVICE REVENUE**"
    row: 18
    col: 0
    width: 24
    height: 1

  - title: "Total Service Revenue"
    name: total_service_revenue_kpi
    model: mgb_motors_dashboard
    explore: fact_service_revenue
    type: single_value
    fields: [fact_service_revenue.total_sale_amount]
    show_comparison: true
    comparison_type: change
    show_comparison_label: true
    comparison_label: "vs. previous period"
    listen:
      date_filter: fact_service_revenue.doc_date
      branch_filter: dim_branch.branch_name
    row: 19
    col: 0
    width: 8
    height: 5

  - title: "Service Revenue by Type"
    name: service_revenue_by_type
    model: mgb_motors_dashboard
    explore: fact_service_revenue
    type: looker_bar
    fields: [fact_service_revenue.service_type, fact_service_revenue.total_sale_amount]
    listen:
      date_filter: fact_service_revenue.doc_date
      branch_filter: dim_branch.branch_name
    row: 19
    col: 8
    width: 8
    height: 8

  - title: "Top Service Centers"
    name: top_service_centers
    model: mgb_motors_dashboard
    explore: fact_service_revenue
    type: looker_bar
    fields: [dim_branch.branch_name, fact_service_revenue.total_sale_amount]
    sorts: [fact_service_revenue.total_sale_amount desc]
    limit: 8
    listen:
      date_filter: fact_service_revenue.doc_date
      branch_filter: dim_branch.branch_name
    row: 19
    col: 16
    width: 8
    height: 8

  # ===================================================
  # SECTION 4: PARTS SALES
  # ===================================================
  - title: ""
    name: section_4_header
    type: text
    body_text: "**SECTION 4 — PARTS SALES**"
    row: 27
    col: 0
    width: 24
    height: 1

  - title: "Total Parts Sales"
    name: total_parts_sales_kpi
    model: mgb_motors_dashboard
    explore: fact_parts_sales
    type: single_value
    fields: [fact_parts_sales.total_sales_amount]
    show_comparison: true
    comparison_type: change
    show_comparison_label: true
    comparison_label: "vs. previous period"
    listen:
      date_filter: fact_parts_sales.invoice_date
      branch_filter: dim_branch.branch_name
    row: 28
    col: 0
    width: 8
    height: 5

  - title: "Parts Sales by Branch"
    name: parts_sales_by_branch
    model: mgb_motors_dashboard
    explore: fact_parts_sales
    type: looker_bar
    fields: [dim_branch.branch_name, fact_parts_sales.total_sales_amount]
    sorts: [fact_parts_sales.total_sales_amount desc]
    limit: 8
    listen:
      date_filter: fact_parts_sales.invoice_date
      branch_filter: dim_branch.branch_name
    row: 28
    col: 8
    width: 16
    height: 8
