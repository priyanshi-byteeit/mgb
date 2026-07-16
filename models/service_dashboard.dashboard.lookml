- dashboard: service_dashboard
  title: Service Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100
  description: "Executive view of service call volume, revenue, and engineer performance."

  filters:
  - name: doc_date_filter
    title: Service Date
    type: field_filter
    default_value: 90 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: popover
    model: mgb_motors_dashboard
    explore: fact_service_revenue
    field: fact_service_revenue.doc_date

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
    explore: fact_service_revenue
    field: fact_service_revenue.branch

  - name: service_type_filter
    title: Service Type
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: mgb_motors_dashboard
    explore: fact_service_revenue
    field: fact_service_revenue.service_type

  elements:

  # ================= KPI ROW =================
  - title: Total Service Revenue
    name: kpi_total_sale_amount
    model: mgb_motors_dashboard
    explore: fact_service_revenue
    type: single_value
    fields: [fact_service_revenue.total_sale_amount]
    custom_color_enabled: true
    custom_color: "#7C5CBF"
    listen:
      doc_date_filter: fact_service_revenue.doc_date
      branch_filter: fact_service_revenue.branch
      service_type_filter: fact_service_revenue.service_type
    row: 0
    col: 0
    width: 6
    height: 3

  - title: Total Service Calls
    name: kpi_total_service_calls
    model: mgb_motors_dashboard
    explore: fact_service_revenue
    type: single_value
    fields: [fact_service_revenue.total_service_calls]
    custom_color_enabled: true
    custom_color: "#2E5FA3"
    listen:
      doc_date_filter: fact_service_revenue.doc_date
      branch_filter: fact_service_revenue.branch
      service_type_filter: fact_service_revenue.service_type
    row: 0
    col: 6
    width: 6
    height: 3

  - title: Average Sale Amount
    name: kpi_average_sale_amount
    model: mgb_motors_dashboard
    explore: fact_service_revenue
    type: single_value
    fields: [fact_service_revenue.average_sale_amount]
    custom_color_enabled: true
    custom_color: "#1E9BD7"
    listen:
      doc_date_filter: fact_service_revenue.doc_date
      branch_filter: fact_service_revenue.branch
      service_type_filter: fact_service_revenue.service_type
    row: 0
    col: 12
    width: 6
    height: 3

  - title: Total Quantity Serviced
    name: kpi_total_quantity
    model: mgb_motors_dashboard
    explore: fact_service_revenue
    type: single_value
    fields: [fact_service_revenue.total_quantity]
    custom_color_enabled: true
    custom_color: "#2FAE86"
    listen:
      doc_date_filter: fact_service_revenue.doc_date
      branch_filter: fact_service_revenue.branch
      service_type_filter: fact_service_revenue.service_type
    row: 0
    col: 18
    width: 6
    height: 3

  # ================= TREND (dual-line) =================
  - title: Weekly Service Revenue & Call Volume
    name: service_trend
    model: mgb_motors_dashboard
    explore: fact_service_revenue
    type: looker_line
    fields: [fact_service_revenue.doc_week, fact_service_revenue.total_sale_amount, fact_service_revenue.total_service_calls]
    colors: ["#2E5FA3", "#1E9BD7"]
    point_style: circle
    interpolation: linear
    show_value_labels: false
    y_axes:
    - orientation: left
      series:
      - id: fact_service_revenue.total_sale_amount
        name: Total Sale Amount
    - orientation: right
      series:
      - id: fact_service_revenue.total_service_calls
        name: Total Service Calls
    listen:
      doc_date_filter: fact_service_revenue.doc_date
      branch_filter: fact_service_revenue.branch
      service_type_filter: fact_service_revenue.service_type
    row: 3
    col: 0
    width: 24
    height: 6

  # ================= BRANCH + SERVICE TYPE + CALL TYPE =================
  - title: Revenue by Branch
    name: revenue_by_branch
    model: mgb_motors_dashboard
    explore: fact_service_revenue
    type: looker_column
    fields: [fact_service_revenue.branch, fact_service_revenue.total_sale_amount]
    sorts: [fact_service_revenue.total_sale_amount desc]
    limit: 10
    colors: ["#2E5FA3"]
    show_value_labels: true
    listen:
      doc_date_filter: fact_service_revenue.doc_date
      branch_filter: fact_service_revenue.branch
      service_type_filter: fact_service_revenue.service_type
    row: 9
    col: 0
    width: 8
    height: 7

  - title: Revenue Mix by Service Type
    name: revenue_by_service_type
    model: mgb_motors_dashboard
    explore: fact_service_revenue
    type: looker_pie
    fields: [fact_service_revenue.service_type, fact_service_revenue.total_sale_amount]
    value_labels: legend
    label_type: labPer
    donut: true
    colors: ["#7C5CBF", "#2E5FA3", "#1E9BD7", "#2FAE86", "#F2A65A", "#B3B3B3"]
    listen:
      doc_date_filter: fact_service_revenue.doc_date
      branch_filter: fact_service_revenue.branch
      service_type_filter: fact_service_revenue.service_type
    row: 9
    col: 8
    width: 8
    height: 7

  - title: Calls by Type
    name: calls_by_type
    model: mgb_motors_dashboard
    explore: fact_service_revenue
    type: looker_bar
    fields: [fact_service_revenue.call_type, fact_service_revenue.total_service_calls]
    sorts: [fact_service_revenue.total_service_calls desc]
    limit: 10
    colors: ["#1E9BD7"]
    show_value_labels: true
    listen:
      doc_date_filter: fact_service_revenue.doc_date
      branch_filter: fact_service_revenue.branch
      service_type_filter: fact_service_revenue.service_type
    row: 9
    col: 16
    width: 8
    height: 7

  # ================= ENGINEERS + ITEM GROUP + SUB TYPE =================
  - title: Top Engineers by Revenue
    name: top_engineers
    model: mgb_motors_dashboard
    explore: fact_service_revenue
    type: table
    fields: [fact_service_revenue.engineer, fact_service_revenue.total_service_calls, fact_service_revenue.total_sale_amount]
    sorts: [fact_service_revenue.total_sale_amount desc]
    limit: 8
    listen:
      doc_date_filter: fact_service_revenue.doc_date
      branch_filter: fact_service_revenue.branch
      service_type_filter: fact_service_revenue.service_type
    row: 16
    col: 0
    width: 8
    height: 7

  - title: Revenue by Item Group
    name: revenue_by_item_group
    model: mgb_motors_dashboard
    explore: fact_service_revenue
    type: looker_bar
    fields: [fact_service_revenue.item_group, fact_service_revenue.total_sale_amount]
    sorts: [fact_service_revenue.total_sale_amount desc]
    limit: 8
    colors: ["#2FAE86"]
    show_value_labels: true
    listen:
      doc_date_filter: fact_service_revenue.doc_date
      branch_filter: fact_service_revenue.branch
      service_type_filter: fact_service_revenue.service_type
    row: 16
    col: 8
    width: 8
    height: 7

  - title: Revenue by Sub Type
    name: revenue_by_sub_type
    model: mgb_motors_dashboard
    explore: fact_service_revenue
    type: looker_bar
    fields: [fact_service_revenue.sub_type, fact_service_revenue.total_sale_amount]
    sorts: [fact_service_revenue.total_sale_amount desc]
    limit: 8
    colors: ["#7C5CBF"]
    show_value_labels: true
    listen:
      doc_date_filter: fact_service_revenue.doc_date
      branch_filter: fact_service_revenue.branch
      service_type_filter: fact_service_revenue.service_type
    row: 16
    col: 16
    width: 8
    height: 7
