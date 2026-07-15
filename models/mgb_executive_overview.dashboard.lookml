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
  # TOP-LEFT: SECTION 1 — TOTAL REVENUE
  # ===================================================
  - title: ""
    name: section_1_header
    type: text
    body_text: "**SECTION 1 — TOTAL REVENUE**"
    row: 0
    col: 0
    width: 12
    height: 1

  - title: Total Revenue
    name: total_revenue_kpi
    model: mgb_motors_dashboard
    explore: unified_revenue
    type: single_value
    fields: [unified_revenue.total_revenue]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: da8306b5-3b46-48aa-9ead-a3b32292f35c
      palette_id: 75905e81-dadc-472c-b9a2-a201f788d55d
    custom_color: "#0484c4"
    smart_single_value_size: true
    conditional_formatting: [{type: greater than, value: 0, fields: !!null '',
        apply_formatting_to_row: false, cell_format: {background_color: "#3e9cc4",
          font_color: "#FFFFFF", color_application: {collection_id: da8306b5-3b46-48aa-9ead-a3b32292f35c,
            palette_id: d9abd293-3cd0-448c-9540-4a55690e4ce1, options: {mirror: false,
              reverse: false, stepped: false}}, font_style: {bold: false, italic: false,
            strikethrough: false}}, row_format: {background_color: "#4A80BC", font_color: !!null '',
          color_application: {collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a,
            options: {mirror: false, reverse: false, stepped: false}, palette_id: 99d2d3ac-7579-41a0-b16c-a381b7ae96da},
          font_style: {bold: false, italic: false, strikethrough: false}}, apply_to: allNumericFields}]
    listen:
      date_filter: unified_revenue.date_date
      branch_filter: dim_branch.branch_name
    row: 1
    col: 0
    width: 4
    height: 7

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
    col: 4
    width: 4
    height: 7

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
    col: 8
    width: 4
    height: 7

  # ===================================================
  # TOP-RIGHT: SECTION 2 — MACHINE SALES
  # ===================================================
  - title: ""
    name: section_2_header
    type: text
    body_text: "**SECTION 2 — MACHINE SALES**"
    row: 0
    col: 12
    width: 12
    height: 1

  - title: Total Machine Sales
    name: total_machine_sales_kpi
    model: mgb_motors_dashboard
    explore: fact_machine_sales
    type: single_value
    fields: [fact_machine_sales.total_invoice_amount]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    smart_single_value_size: true
    conditional_formatting: [{type: greater than, value: 0, fields: !!null '', apply_formatting_to_row: false,
        cell_format: {background_color: "#68c487", font_color: "#FFFFFF", color_application: {
            collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab,
            options: {mirror: false, reverse: false, stepped: false}}, font_style: {
            bold: false, italic: false, strikethrough: false}}, row_format: {background_color: "#1A73E8",
          font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
            options: {mirror: false, reverse: false, stepped: false}}, font_style: {
            bold: false, italic: false, strikethrough: false}}, apply_to: allNumericFields}]
    listen:
      date_filter: fact_machine_sales.invoice_date
      branch_filter: dim_branch.branch_name
    row: 1
    col: 12
    width: 4
    height: 7

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
    row: 1
    col: 16
    width: 4
    height: 7

  - title: "Dealer-wise Machine Sales"
    name: dealer_machine_sales
    model: mgb_motors_dashboard
    explore: fact_machine_sales
    type: looker_bar
    fields: [dim_branch.branch_name, fact_machine_sales.total_invoice_amount]
    sorts: [fact_machine_sales.total_invoice_amount desc]
    limit: 6
    listen:
      date_filter: fact_machine_sales.invoice_date
      branch_filter: dim_branch.branch_name
    row: 1
    col: 20
    width: 4
    height: 7

  # ===================================================
  # BOTTOM-LEFT: SECTION 3 — SERVICE REVENUE
  # ===================================================
  - title: ""
    name: section_3_header
    type: text
    body_text: "**SECTION 3 — SERVICE REVENUE**"
    row: 8
    col: 0
    width: 12
    height: 1

  - title: Total Service Revenue
    name: total_service_revenue_kpi
    model: mgb_motors_dashboard
    explore: fact_service_revenue
    type: single_value
    fields: [fact_service_revenue.total_sale_amount]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    smart_single_value_size: true
    conditional_formatting: [{type: greater than, value: 0, fields: !!null '', apply_formatting_to_row: false,
        cell_format: {background_color: "#d67aa2", font_color: "#FFFFFF", color_application: {
            collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab,
            options: {mirror: false, reverse: false, stepped: false}}, font_style: {
            bold: false, italic: false, strikethrough: false}}, row_format: {background_color: "#1A73E8",
          font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
            options: {mirror: false, reverse: false, stepped: false}}, font_style: {
            bold: false, italic: false, strikethrough: false}}, apply_to: allNumericFields}]
    listen:
      date_filter: fact_service_revenue.doc_date
      branch_filter: dim_branch.branch_name
    row: 9
    col: 0
    width: 4
    height: 7

  - title: "Service Revenue by Type"
    name: service_revenue_by_type
    model: mgb_motors_dashboard
    explore: fact_service_revenue
    type: looker_bar
    fields: [fact_service_revenue.service_type, fact_service_revenue.total_sale_amount]
    listen:
      date_filter: fact_service_revenue.doc_date
      branch_filter: dim_branch.branch_name
    row: 9
    col: 4
    width: 4
    height: 7

  - title: "Top Service Centers"
    name: top_service_centers
    model: mgb_motors_dashboard
    explore: fact_service_revenue
    type: looker_bar
    fields: [dim_branch.branch_name, fact_service_revenue.total_sale_amount]
    sorts: [fact_service_revenue.total_sale_amount desc]
    limit: 6
    listen:
      date_filter: fact_service_revenue.doc_date
      branch_filter: dim_branch.branch_name
    row: 9
    col: 8
    width: 4
    height: 7

  # ===================================================
  # BOTTOM-RIGHT: SECTION 4 — PARTS SALES
  # ===================================================
  - title: ""
    name: section_4_header
    type: text
    body_text: "**SECTION 4 — PARTS SALES**"
    row: 8
    col: 12
    width: 12
    height: 1

  - title: Total Parts Sales
    name: total_parts_sales_kpi
    model: mgb_motors_dashboard
    explore: fact_parts_sales
    type: single_value
    fields: [fact_parts_sales.total_sales_amount]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    smart_single_value_size: true
    conditional_formatting: [{type: greater than, value: 0, fields: !!null '', apply_formatting_to_row: false,
        cell_format: {background_color: "#ae8fb8", font_color: "#FFFFFF", color_application: {
            collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab,
            options: {mirror: false, reverse: false, stepped: false}}, font_style: {
            bold: false, italic: false, strikethrough: false}}, row_format: {background_color: "#1A73E8",
          font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
            options: {mirror: false, reverse: false, stepped: false}}, font_style: {
            bold: false, italic: false, strikethrough: false}}, apply_to: allNumericFields}]
    listen:
      date_filter: fact_parts_sales.invoice_date
      branch_filter: dim_branch.branch_name
    row: 9
    col: 12
    width: 4
    height: 7

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
    row: 9
    col: 16
    width: 8
    height: 7
