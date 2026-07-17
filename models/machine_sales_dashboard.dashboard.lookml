- dashboard: machine_sales_dashboard
  title: Machine Sales Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100
  filters_bar_collapsed: true
  description: "Executive view of machine sales performance across branches, models, and sales employees."

  filters:
  - name: invoice_date_filter
    title: Invoice Date
    type: field_filter
    default_value: 90 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: popover
    model: mgb_motors_dashboard
    explore: fact_machine_sales
    field: fact_machine_sales.invoice_date

  - name: branch_filter
    title: Branch
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: mgb_motors_dashboard
    explore: fact_machine_sales
    field: fact_machine_sales.branch

  - name: industry_filter
    title: Industry
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: mgb_motors_dashboard
    explore: fact_machine_sales
    field: fact_machine_sales.industry

  elements:

 # ================= KPI ROW (height 2) =================
  - title: Total Invoice Amount
    name: kpi_total_invoice_amount
    model: mgb_motors_dashboard
    explore: fact_machine_sales
    type: single_value
    fields: [fact_machine_sales.total_invoice_amount]
    value_format: "$0.00,,\"M\""
    custom_color_enabled: true
    custom_color: "#7C5CBF"
    listen:
      invoice_date_filter: fact_machine_sales.invoice_date
      branch_filter: fact_machine_sales.branch
      industry_filter: fact_machine_sales.industry
    row: 0
    col: 0
    width: 6
    height: 2

  - title: Total Basic Price
    name: kpi_total_basic_price
    model: mgb_motors_dashboard
    explore: fact_machine_sales
    type: single_value
    fields: [fact_machine_sales.total_basic_price]
    value_format: "$0.00,,\"M\""
    custom_color_enabled: true
    custom_color: "#2E5FA3"
    listen:
      invoice_date_filter: fact_machine_sales.invoice_date
      branch_filter: fact_machine_sales.branch
      industry_filter: fact_machine_sales.industry
    row: 0
    col: 6
    width: 6
    height: 2

  - title: Total Tax
    name: kpi_total_tax
    model: mgb_motors_dashboard
    explore: fact_machine_sales
    type: single_value
    fields: [fact_machine_sales.total_tax_amount]
    value_format: "$0.00,,\"M\""
    custom_color_enabled: true
    custom_color: "#1E9BD7"
    listen:
      invoice_date_filter: fact_machine_sales.invoice_date
      branch_filter: fact_machine_sales.branch
      industry_filter: fact_machine_sales.industry
    row: 0
    col: 12
    width: 6
    height: 2

  - title: Machines Sold (Qty)
    name: kpi_total_quantity_sold
    model: mgb_motors_dashboard
    explore: fact_machine_sales
    type: single_value
    fields: [fact_machine_sales.total_quantity_sold]

    custom_color_enabled: true
    custom_color: "#2FAE86"
    listen:
      invoice_date_filter: fact_machine_sales.invoice_date
      branch_filter: fact_machine_sales.branch
      industry_filter: fact_machine_sales.industry
    row: 0
    col: 18
    width: 6
    height: 2

  # ================= TREND (height 4, rows 3-7) =================
  - title: Weekly Revenue & Machines Sold
    name: revenue_trend
    model: mgb_motors_dashboard
    explore: fact_machine_sales
    type: looker_line
    fields: [fact_machine_sales.invoice_week, fact_machine_sales.total_invoice_amount, fact_machine_sales.total_quantity_sold]
    colors: ["#2E5FA3", "transparent"]
    series_colors:
      "Total Invoice Amount": "#2E5FA3"
      "Total Quantity Sold": "transparent"
    point_style: circle
    interpolation: linear
    show_value_labels: false
    y_axes:
    - orientation: left
      series:
      - id: fact_machine_sales.total_invoice_amount
        name: Total Invoice Amount
    - orientation: right
      series:
      - id: fact_machine_sales.total_quantity_sold
        name: Total Quantity Sold
    listen:
      invoice_date_filter: fact_machine_sales.invoice_date
      branch_filter: fact_machine_sales.branch
      industry_filter: fact_machine_sales.industry
    row: 3
    col: 0
    width: 24
    height: 4

  # ================= BRANCH + MODELS + SCATTER (height 6, rows 7-13) =================
  - title: Revenue by Branch
    name: revenue_by_branch
    model: mgb_motors_dashboard
    explore: fact_machine_sales
    type: looker_column
    fields: [fact_machine_sales.branch, fact_machine_sales.total_invoice_amount]
    sorts: [fact_machine_sales.total_invoice_amount desc]
    limit: 10
    colors: ["#2E5FA3"]
    show_value_labels: true
    listen:
      invoice_date_filter: fact_machine_sales.invoice_date
      branch_filter: fact_machine_sales.branch
      industry_filter: fact_machine_sales.industry
    row: 7
    col: 0
    width: 8
    height: 5

  - title: Top Machine Models by Revenue
    name: top_models
    model: mgb_motors_dashboard
    explore: fact_machine_sales
    type: looker_bar
    fields: [fact_machine_sales.model, fact_machine_sales.total_invoice_amount]
    sorts: [fact_machine_sales.total_invoice_amount desc]
    limit: 6
    colors: ["#1E9BD7"]
    show_value_labels: true
    listen:
      invoice_date_filter: fact_machine_sales.invoice_date
      branch_filter: fact_machine_sales.branch
      industry_filter: fact_machine_sales.industry
    row: 7
    col: 8
    width: 8
    height: 5

  - title: "Model Performance: Volume vs. Price"
    name: model_efficiency_scatter
    model: mgb_motors_dashboard
    explore: fact_machine_sales
    type: looker_scatter
    fields: [fact_machine_sales.model, fact_machine_sales.total_quantity_sold, fact_machine_sales.average_price_per_machine]
    colors: ["#2FAE86", "#7C5CBF"]
    listen:
      invoice_date_filter: fact_machine_sales.invoice_date
      branch_filter: fact_machine_sales.branch
      industry_filter: fact_machine_sales.industry
    row: 7
    col: 16
    width: 8
    height: 5

  # ================= DONUTS + TABLE (height 6, rows 13-19) =================
  - title: Revenue Mix by Industry
    name: sales_by_industry
    model: mgb_motors_dashboard
    explore: fact_machine_sales
    type: looker_pie
    fields: [fact_machine_sales.industry, fact_machine_sales.total_invoice_amount]
    value_labels: legend
    label_type: labPer
    donut: true
    colors: ["#2E5FA3", "#1E9BD7", "#7C5CBF", "#2FAE86", "#F2A65A", "#B3B3B3", "#8C6E00", "#4D4D4D"]
    listen:
      invoice_date_filter: fact_machine_sales.invoice_date
      branch_filter: fact_machine_sales.branch
      industry_filter: fact_machine_sales.industry
    row: 13
    col: 0
    width: 8
    height: 5

  - title: Revenue Mix by Financier
    name: sales_by_financier
    model: mgb_motors_dashboard
    explore: fact_machine_sales
    type: looker_pie
    fields: [fact_machine_sales.financier, fact_machine_sales.total_invoice_amount]
    value_labels: legend
    label_type: labPer
    donut: true
    colors: ["#7C5CBF", "#2E5FA3", "#1E9BD7", "#2FAE86", "#F2A65A", "#B3B3B3"]
    listen:
      invoice_date_filter: fact_machine_sales.invoice_date
      branch_filter: fact_machine_sales.branch
      industry_filter: fact_machine_sales.industry
    row: 13
    col: 8
    width: 8
    height: 5

  - title: Sales Employee Performance
    name: sales_employee_performance
    model: mgb_motors_dashboard
    explore: fact_machine_sales
    type: table
    fields: [fact_machine_sales.sales_employee, fact_machine_sales.count, fact_machine_sales.total_invoice_amount]
    sorts: [fact_machine_sales.total_invoice_amount desc]
    limit: 6
    listen:
      invoice_date_filter: fact_machine_sales.invoice_date
      branch_filter: fact_machine_sales.branch
      industry_filter: fact_machine_sales.industry
    row: 13
    col: 16
    width: 8
    height: 5
