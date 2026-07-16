- dashboard: parts_dashboard
  title: Parts Sales Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100
  description: "Executive view of parts sales, discounts, returns, and employee performance."

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
    explore: fact_parts_sales
    field: fact_parts_sales.invoice_date

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
    explore: fact_parts_sales
    field: fact_parts_sales.branch

  - name: invoice_type_filter
    title: Invoice Type
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: mgb_motors_dashboard
    explore: fact_parts_sales
    field: fact_parts_sales.invoice_type

  elements:

  # ================= KPI ROW (navy / teal / coral / orange) =================
  - title: Total Sales Amount
    name: kpi_total_sales_amount
    model: mgb_motors_dashboard
    explore: fact_parts_sales
    type: single_value
    fields: [fact_parts_sales.total_sales_amount]
    custom_color_enabled: true
    custom_color: "#0B3D59"
    listen:
      invoice_date_filter: fact_parts_sales.invoice_date
      branch_filter: fact_parts_sales.branch
      invoice_type_filter: fact_parts_sales.invoice_type
    row: 0
    col: 0
    width: 6
    height: 3

  - title: Net Sales (After Returns)
    name: kpi_net_sales
    model: mgb_motors_dashboard
    explore: fact_parts_sales
    type: single_value
    fields: [fact_parts_sales.net_sales_amount]
    custom_color_enabled: true
    custom_color: "#17A2B8"
    listen:
      invoice_date_filter: fact_parts_sales.invoice_date
      branch_filter: fact_parts_sales.branch
      invoice_type_filter: fact_parts_sales.invoice_type
    row: 0
    col: 6
    width: 6
    height: 3

  - title: Return Rate
    name: return_rate_kpi
    model: mgb_motors_dashboard
    explore: fact_parts_sales
    type: single_value
    fields: [fact_parts_sales.return_rate]
    custom_color_enabled: true
    custom_color: "#E4572E"
    listen:
      invoice_date_filter: fact_parts_sales.invoice_date
      branch_filter: fact_parts_sales.branch
      invoice_type_filter: fact_parts_sales.invoice_type
    row: 0
    col: 12
    width: 6
    height: 3

  - title: Invoice Count
    name: kpi_invoice_count
    model: mgb_motors_dashboard
    explore: fact_parts_sales
    type: single_value
    fields: [fact_parts_sales.count]
    custom_color_enabled: true
    custom_color: "#F2A65A"
    listen:
      invoice_date_filter: fact_parts_sales.invoice_date
      branch_filter: fact_parts_sales.branch
      invoice_type_filter: fact_parts_sales.invoice_type
    row: 0
    col: 18
    width: 6
    height: 3

  # ================= TREND (dual-line) =================
  - title: Weekly Parts Sales & Invoice Volume
    name: parts_trend
    model: mgb_motors_dashboard
    explore: fact_parts_sales
    type: looker_line
    fields: [fact_parts_sales.invoice_week, fact_parts_sales.total_sales_amount, fact_parts_sales.count]
    colors: ["#0B3D59", "#17A2B8"]
    point_style: circle
    interpolation: linear
    show_value_labels: false
    y_axes:
    - orientation: left
      series:
      - id: fact_parts_sales.total_sales_amount
        name: Total Sales Amount
    - orientation: right
      series:
      - id: fact_parts_sales.count
        name: Invoice Count
    listen:
      invoice_date_filter: fact_parts_sales.invoice_date
      branch_filter: fact_parts_sales.branch
      invoice_type_filter: fact_parts_sales.invoice_type
    row: 3
    col: 0
    width: 24
    height: 6

  # ================= BRANCH (bar) + INVOICE TYPE (donut) + BRANCH MAP =================
  - title: Sales by Branch
    name: sales_by_branch
    model: mgb_motors_dashboard
    explore: fact_parts_sales
    type: looker_column
    fields: [fact_parts_sales.branch, fact_parts_sales.total_sales_amount]
    sorts: [fact_parts_sales.total_sales_amount desc]
    limit: 10
    colors: ["#0B3D59"]
    show_value_labels: true
    listen:
      invoice_date_filter: fact_parts_sales.invoice_date
      branch_filter: fact_parts_sales.branch
      invoice_type_filter: fact_parts_sales.invoice_type
    row: 9
    col: 0
    width: 8
    height: 7

  - title: Sales Mix by Invoice Type
    name: sales_by_invoice_type
    model: mgb_motors_dashboard
    explore: fact_parts_sales
    type: looker_pie
    fields: [fact_parts_sales.invoice_type, fact_parts_sales.total_sales_amount]
    value_labels: legend
    label_type: labPer
    donut: true
    colors: ["#F2A65A", "#0B3D59", "#17A2B8", "#E4572E", "#B3B3B3"]
    listen:
      invoice_date_filter: fact_parts_sales.invoice_date
      branch_filter: fact_parts_sales.branch
      invoice_type_filter: fact_parts_sales.invoice_type
    row: 9
    col: 8
    width: 8
    height: 7

  - title: Sales by Branch Location
    name: branch_map
    model: mgb_motors_dashboard
    explore: fact_parts_sales
    type: looker_google_map
    fields: [dim_branch_geo.location, dim_branch_geo.branch_name, fact_parts_sales.total_sales_amount]
    map_marker_type: circle
    map_marker_radius_mode: proportional_value
    map_marker_radius_min: 4
    map_marker_radius_max: 18
    map_marker_units: pixels
    map_marker_color_mode: value
    show_view_all: false
    listen:
      invoice_date_filter: fact_parts_sales.invoice_date
      branch_filter: fact_parts_sales.branch
      invoice_type_filter: fact_parts_sales.invoice_type
    row: 9
    col: 16
    width: 8
    height: 7

  # ================= EMPLOYEES (table) + TOP CUSTOMERS (bar) =================
  - title: Top Sales Employees
    name: top_sales_employees
    model: mgb_motors_dashboard
    explore: fact_parts_sales
    type: table
    fields: [fact_parts_sales.sales_employee, fact_parts_sales.count, fact_parts_sales.total_sales_amount, fact_parts_sales.total_discount_amount]
    sorts: [fact_parts_sales.total_sales_amount desc]
    limit: 10
    listen:
      invoice_date_filter: fact_parts_sales.invoice_date
      branch_filter: fact_parts_sales.branch
      invoice_type_filter: fact_parts_sales.invoice_type
    row: 16
    col: 0
    width: 12
    height: 7

  - title: Top Customers by Purchase Value
    name: top_customers_parts
    model: mgb_motors_dashboard
    explore: fact_parts_sales
    type: looker_bar
    fields: [fact_parts_sales.customer, fact_parts_sales.total_sales_amount]
    sorts: [fact_parts_sales.total_sales_amount desc]
    limit: 10
    colors: ["#17A2B8"]
    show_value_labels: true
    listen:
      invoice_date_filter: fact_parts_sales.invoice_date
      branch_filter: fact_parts_sales.branch
      invoice_type_filter: fact_parts_sales.invoice_type
    row: 16
    col: 12
    width: 12
    height: 7
