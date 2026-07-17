- dashboard: total_revenue_dashboard
  title: Total Revenue Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100
  filters_bar_collapsed: true
  description: "Central executive rollup of all MGB revenue streams — Machine Sales, Parts Sales, and Service Revenue."

  filters:
  - name: date_filter
    title: Date
    type: field_filter
    default_value: 90 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: popover
    model: mgb_motors_dashboard
    explore: unified_revenue
    field: unified_revenue.date_date

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
    explore: unified_revenue
    field: unified_revenue.branch

  - name: revenue_stream_filter
    title: Revenue Stream
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: mgb_motors_dashboard
    explore: unified_revenue
    field: unified_revenue.revenue_stream

  elements:

  # ================= KPI ROW (maroon / gold / navy / slate) =================
  - title: Total Revenue
    name: kpi_total_revenue
    model: mgb_motors_dashboard
    explore: unified_revenue
    type: single_value
    fields: [unified_revenue.total_revenue]
    value_format: "$0.00,,\"M\""
    custom_color_enabled: true
    custom_color: "#8B1E3F"
    listen:
      date_filter: unified_revenue.date_date
      branch_filter: unified_revenue.branch
      revenue_stream_filter: unified_revenue.revenue_stream
    row: 0
    col: 0
    width: 6
    height: 2

  - title: Machine Sales Revenue
    name: kpi_machine_revenue
    model: mgb_motors_dashboard
    explore: unified_revenue
    type: single_value
    fields: [unified_revenue.machine_sales_revenue]
    value_format: "$0.00,,\"M\""
    custom_color_enabled: true
    custom_color: "#C9A227"
    listen:
      date_filter: unified_revenue.date_date
      branch_filter: unified_revenue.branch
      revenue_stream_filter: unified_revenue.revenue_stream
    row: 0
    col: 6
    width: 6
    height: 2

  - title: Parts Sales Revenue
    name: kpi_parts_revenue
    model: mgb_motors_dashboard
    explore: unified_revenue
    type: single_value
    fields: [unified_revenue.parts_sales_revenue]
    value_format: "$0.00,,\"M\""
    custom_color_enabled: true
    custom_color: "#1B2A4A"
    listen:
      date_filter: unified_revenue.date_date
      branch_filter: unified_revenue.branch
      revenue_stream_filter: unified_revenue.revenue_stream
    row: 0
    col: 12
    width: 6
    height: 2

  - title: Service Revenue
    name: kpi_service_revenue
    model: mgb_motors_dashboard
    explore: unified_revenue
    type: single_value
    fields: [unified_revenue.service_revenue_total]
    value_format: "$0.00,,\"M\""
    custom_color_enabled: true
    custom_color: "#4A4A4A"
    listen:
      date_filter: unified_revenue.date_date
      branch_filter: unified_revenue.branch
      revenue_stream_filter: unified_revenue.revenue_stream
    row: 0
    col: 18
    width: 6
    height: 2

  # ================= TREND + NAVIGATION BUTTONS =================
  - title: Weekly Revenue by Stream
    name: revenue_trend_stacked
    model: mgb_motors_dashboard
    explore: unified_revenue
    type: looker_column
    fields: [unified_revenue.date_week, unified_revenue.revenue_stream, unified_revenue.total_revenue]
    pivots: [unified_revenue.revenue_stream]
    stacking: normal
    colors: ["#8B1E3F", "#C9A227", "#1B2A4A"]
    show_value_labels: false
    listen:
      date_filter: unified_revenue.date_date
      branch_filter: unified_revenue.branch
      revenue_stream_filter: unified_revenue.revenue_stream
    row: 2
    col: 0
    width: 15
    height: 5

  - title: ""
    name: quick_links_heading
    type: text
    body_text: "<div style=\"text-align:center\"><strong>Explore each revenue stream in detail:</strong></div>"
    row: 2
    col: 15
    width: 9
    height: 1

  - name: btn_machine_sales
    type: button
    rich_content_json: '{ "text": "Machine Sales Dashboard", "newTab": true, "alignment": "center", "size": "medium", "style": "FILLED", "color": "#C9A227", "href": "https://byteeit.cloud.looker.com/dashboards/mgb_motors_dashboard::machine_sales_dashboard" }'
    row: 3
    col: 15
    width: 9
    height: 1

  - name: btn_parts_sales
    type: button
    rich_content_json: '{ "text": "Parts Sales Dashboard", "newTab": true, "alignment": "center", "size": "medium", "style": "FILLED", "color": "#1B2A4A", "href": "https://byteeit.cloud.looker.com/dashboards/mgb_motors_dashboard::parts_dashboard" }'
    row: 4
    col: 15
    width: 9
    height: 1

  - name: btn_service
    type: button
    rich_content_json: '{ "text": "Service Dashboard", "newTab": true, "alignment": "center", "size": "medium", "style": "FILLED", "color": "#4A4A4A", "href": "https://byteeit.cloud.looker.com/dashboards/mgb_motors_dashboard::service_dashboard" }'
    row: 5
    col: 15
    width: 9
    height: 1

  - title: ""
    name: quick_links_spacer
    type: text
    body_text: " "
    row: 6
    col: 15
    width: 9
    height: 1

  # ================= MIX (donut) + BRANCH (bar) + MAP =================
  - title: Revenue Mix by Stream
    name: revenue_mix
    model: mgb_motors_dashboard
    explore: unified_revenue
    type: looker_pie
    fields: [unified_revenue.revenue_stream, unified_revenue.total_revenue]
    value_labels: legend
    label_type: labPer
    donut: true
    colors: ["#8B1E3F", "#C9A227", "#1B2A4A"]
    listen:
      date_filter: unified_revenue.date_date
      branch_filter: unified_revenue.branch
      revenue_stream_filter: unified_revenue.revenue_stream
    row: 9
    col: 0
    width: 8
    height: 5

  - title: Revenue by Branch
    name: revenue_by_branch_master
    model: mgb_motors_dashboard
    explore: unified_revenue
    type: looker_column
    fields: [unified_revenue.branch, unified_revenue.total_revenue]
    sorts: [unified_revenue.total_revenue desc]
    limit: 15
    colors: ["#8B1E3F"]
    show_value_labels: true
    listen:
      date_filter: unified_revenue.date_date
      branch_filter: unified_revenue.branch
      revenue_stream_filter: unified_revenue.revenue_stream
    row: 9
    col: 8
    width: 8
    height: 5

  - title: Revenue by Branch Location
    name: branch_map_master
    model: mgb_motors_dashboard
    explore: unified_revenue
    type: looker_google_map
    fields: [dim_branch_geo.location, dim_branch_geo.branch_name, unified_revenue.total_revenue]
    map_marker_type: circle
    map_marker_radius_mode: proportional_value
    map_marker_radius_min: 4
    map_marker_radius_max: 18
    map_marker_units: pixels
    map_marker_color_mode: value
    show_view_all: false
    listen:
      date_filter: unified_revenue.date_date
      branch_filter: unified_revenue.branch
      revenue_stream_filter: unified_revenue.revenue_stream
    row: 9
    col: 16
    width: 8
    height: 5

  # ================= CROSS-TAB (full width) =================
  - title: Revenue by Branch & Stream
    name: branch_stream_crosstab
    model: mgb_motors_dashboard
    explore: unified_revenue
    type: looker_grid
    fields: [unified_revenue.branch, unified_revenue.revenue_stream, unified_revenue.total_revenue]
    pivots: [unified_revenue.revenue_stream]
    sorts: [unified_revenue.total_revenue desc]
    limit: 15
    listen:
      date_filter: unified_revenue.date_date
      branch_filter: unified_revenue.branch
      revenue_stream_filter: unified_revenue.revenue_stream
    row: 14
    col: 0
    width: 24
    height: 6
