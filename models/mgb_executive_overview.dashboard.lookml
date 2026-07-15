- dashboard: mgb_executive_overview
  title: "MGB Motor Dashboard"
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

  # ===== KPI ROW =====
  - title: "Total Revenue"
    name: total_revenue_kpi
    model: mgb_motors_dashboard
    explore: unified_revenue
    type: single_value
    fields: [unified_revenue.total_revenue]
    custom_color_enabled: true
    show_single_value_title: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: greater than, value: 0, fields: !!null '',
        apply_formatting_to_row: false,
        cell_format: {background_color: "#3730A3", font_color: "#FFFFFF",
          font_style: {bold: false, italic: false, strikethrough: false}},
        row_format: {background_color: "#3730A3", font_color: !!null '',
          font_style: {bold: false, italic: false, strikethrough: false}},
        apply_to: allNumericFields}]
    listen:
      date_filter: unified_revenue.date_date
      branch_filter: dim_branch.branch_name
    row: 0
    col: 0
    width: 8
    height: 4

  - title: "Machine Sales"
    name: total_machine_sales_kpi
    model: mgb_motors_dashboard
    explore: fact_machine_sales
    type: single_value
    fields: [fact_machine_sales.total_invoice_amount]
    custom_color_enabled: true
    show_single_value_title: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: greater than, value: 0, fields: !!null '',
        apply_formatting_to_row: false,
        cell_format: {background_color: "#FFFFFF", font_color: "#1F2937",
          font_style: {bold: false, italic: false, strikethrough: false}},
        row_format: {background_color: "#FFFFFF", font_color: !!null '',
          font_style: {bold: false, italic: false, strikethrough: false}},
        apply_to: allNumericFields}]
    listen:
      date_filter: fact_machine_sales.invoice_date
      branch_filter: dim_branch.branch_name
    row: 0
    col: 8
    width: 5
    height: 4

  - title: "Parts Sales"
    name: total_parts_sales_kpi
    model: mgb_motors_dashboard
    explore: fact_parts_sales
    type: single_value
    fields: [fact_parts_sales.total_sales_amount]
    custom_color_enabled: true
    show_single_value_title: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: greater than, value: 0, fields: !!null '',
        apply_formatting_to_row: false,
        cell_format: {background_color: "#FFFFFF", font_color: "#1F2937",
          font_style: {bold: false, italic: false, strikethrough: false}},
        row_format: {background_color: "#FFFFFF", font_color: !!null '',
          font_style: {bold: false, italic: false, strikethrough: false}},
        apply_to: allNumericFields}]
    listen:
      date_filter: fact_parts_sales.invoice_date
      branch_filter: dim_branch.branch_name
    row: 0
    col: 13
    width: 5
    height: 4

  - title: "Service Revenue"
    name: total_service_revenue_kpi
    model: mgb_motors_dashboard
    explore: fact_service_revenue
    type: single_value
    fields: [fact_service_revenue.total_sale_amount]
    custom_color_enabled: true
    show_single_value_title: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: greater than, value: 0, fields: !!null '',
        apply_formatting_to_row: false,
        cell_format: {background_color: "#FFFFFF", font_color: "#1F2937",
          font_style: {bold: false, italic: false, strikethrough: false}},
        row_format: {background_color: "#FFFFFF", font_color: !!null '',
          font_style: {bold: false, italic: false, strikethrough: false}},
        apply_to: allNumericFields}]
    listen:
      date_filter: fact_service_revenue.doc_date
      branch_filter: dim_branch.branch_name
    row: 0
    col: 18
    width: 6
    height: 4

  # ===== SECTION: REVENUE OVERVIEW =====
  - title: ""
    name: revenue_overview_header
    type: text
    body_text: "**REVENUE OVERVIEW**"
    row: 4
    col: 0
    width: 24
    height: 1

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
    row: 5
    col: 0
    width: 8
    height: 8

  - title: "Revenue by Branch"
    name: revenue_by_branch_map
    model: mgb_motors_dashboard
    explore: unified_revenue
    type: looker_google_map
    fields: [dim_branch_geo.location, unified_revenue.total_revenue]
    map_plot_mode: points
    map_tile_provider: light
    map_position: fit_data
    map_marker_type: circle
    map_marker_radius_mode: proportional_value
    map_marker_units: pixels
    map_marker_radius_min: 6
    map_marker_radius_max: 30
    map_marker_color_mode: value
    show_legend: true
    listen:
      date_filter: unified_revenue.date_date
      branch_filter: dim_branch.branch_name
    row: 5
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
    row: 5
    col: 16
    width: 8
    height: 8

  # ===== SECTION: CATEGORY PERFORMANCE =====
  - title: ""
    name: category_performance_header
    type: text
    body_text: "**CATEGORY PERFORMANCE**"
    row: 13
    col: 0
    width: 24
    height: 1

  - title: "Top Machine Models Sold"
    name: top_machine_models
    model: mgb_motors_dashboard
    explore: fact_machine_sales
    type: looker_bar
    fields: [fact_machine_sales.model, fact_machine_sales.total_quantity_sold]
    sorts: [fact_machine_sales.total_quantity_sold desc]
    limit: 6
    listen:
      date_filter: fact_machine_sales.invoice_date
      branch_filter: dim_branch.branch_name
    row: 14
    col: 0
    width: 8
    height: 8

  - title: "Service Revenue by Type"
    name: service_revenue_by_type
    model: mgb_motors_dashboard
    explore: fact_service_revenue
    type: looker_bar
    fields: [fact_service_revenue.service_type, fact_service_revenue.total_sale_amount]
    listen:
      date_filter: fact_service_revenue.doc_date
      branch_filter: dim_branch.branch_name
    row: 14
    col: 8
    width: 8
    height: 8

  - title: "Parts Sales by Branch"
    name: parts_sales_by_branch
    model: mgb_motors_dashboard
    explore: fact_parts_sales
    type: looker_bar
    fields: [dim_branch.branch_name, fact_parts_sales.total_sales_amount]
    sorts: [fact_parts_sales.total_sales_amount desc]
    limit: 6
    listen:
      date_filter: fact_parts_sales.invoice_date
      branch_filter: dim_branch.branch_name
    row: 14
    col: 16
    width: 8
    height: 8
