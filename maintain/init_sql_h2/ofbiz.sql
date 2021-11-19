create schema if not exists PUBLIC;
CREATE TABLE IF NOT EXISTS acctg_trans (
    acctg_trans_id varchar(20) NOT NULL,
    acctg_trans_type_id varchar(20) ,
    description varchar(255) ,
    transaction_date datetime(3) ,
    is_posted char(1) ,
    posted_date datetime(3) ,
    scheduled_posting_date datetime(3) ,
    gl_journal_id varchar(20) ,
    gl_fiscal_type_id varchar(20) ,
    voucher_ref varchar(60) ,
    voucher_date datetime(3) ,
    group_status_id varchar(20) ,
    fixed_asset_id varchar(20) ,
    inventory_item_id varchar(20) ,
    physical_inventory_id varchar(20) ,
    party_id varchar(20) ,
    role_type_id varchar(20) ,
    invoice_id varchar(20) ,
    payment_id varchar(20) ,
    fin_account_trans_id varchar(20) ,
    shipment_id varchar(20) ,
    receipt_id varchar(20) ,
    work_effort_id varchar(20) ,
    their_acctg_trans_id varchar(60) ,
    created_date datetime(3) ,
    created_by_user_login varchar(250) ,
    last_modified_date datetime(3) ,
    last_modified_by_user_login varchar(250) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`acctg_trans_id`) 
);

CREATE TABLE IF NOT EXISTS acctg_trans_entry (
    id varchar(20) NOT NULL,
    acctg_trans_id varchar(20) NOT NULL,
    acctg_trans_entry_seq_id varchar(20) NOT NULL,
    acctg_trans_entry_type_id varchar(20) ,
    description varchar(255) ,
    voucher_ref varchar(60) ,
    party_id varchar(20) ,
    role_type_id varchar(20) ,
    their_party_id varchar(20) ,
    product_id varchar(20) ,
    their_product_id varchar(20) ,
    inventory_item_id varchar(20) ,
    gl_account_type_id varchar(20) ,
    gl_account_id varchar(20) ,
    organization_party_id varchar(20) ,
    amount decimal(18,2) ,
    currency_uom_id varchar(20) ,
    orig_amount decimal(18,2) ,
    orig_currency_uom_id varchar(20) ,
    debit_credit_flag char(1) ,
    due_date date ,
    group_id varchar(20) ,
    tax_id varchar(20) ,
    reconcile_status_id varchar(20) ,
    settlement_term_id varchar(20) ,
    is_summary char(1) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_acctg_trans_entry (acctg_trans_id, acctg_trans_entry_seq_id) 
);

CREATE TABLE IF NOT EXISTS agreement (
    agreement_id varchar(20) NOT NULL,
    product_id varchar(20) ,
    party_id_from varchar(20) ,
    party_id_to varchar(20) ,
    role_type_id_from varchar(20) ,
    role_type_id_to varchar(20) ,
    agreement_type_id varchar(20) ,
    agreement_date datetime(3) ,
    from_date datetime(3) ,
    thru_date datetime(3) ,
    description varchar(255) ,
    text_data longtext ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    status_id varchar(20) ,
    
    PRIMARY KEY (`agreement_id`) 
);

CREATE TABLE IF NOT EXISTS agreement_item (
    id varchar(20) NOT NULL,
    agreement_id varchar(20) NOT NULL,
    agreement_item_seq_id varchar(20) NOT NULL,
    agreement_item_type_id varchar(20) ,
    currency_uom_id varchar(20) ,
    agreement_text longtext ,
    agreement_image longblob ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_agreement_item (agreement_id, agreement_item_seq_id) 
);

CREATE TABLE IF NOT EXISTS agreement_product_appl (
    id varchar(20) NOT NULL,
    agreement_id varchar(20) NOT NULL,
    agreement_item_seq_id varchar(20) NOT NULL,
    product_id varchar(20) NOT NULL,
    price decimal(18,3) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_agreement_product_appl (agreement_id, agreement_item_seq_id, product_id) 
);

CREATE TABLE IF NOT EXISTS agreement_term (
    agreement_term_id varchar(20) NOT NULL,
    term_type_id varchar(20) ,
    agreement_id varchar(20) ,
    agreement_item_seq_id varchar(20) ,
    invoice_item_type_id varchar(20) ,
    from_date datetime(3) ,
    thru_date datetime(3) ,
    term_value decimal(18,3) ,
    term_days decimal(20,0) ,
    text_value varchar(255) ,
    min_quantity double ,
    max_quantity double ,
    description varchar(255) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`agreement_term_id`) 
);

CREATE TABLE IF NOT EXISTS billing_account (
    billing_account_id varchar(20) NOT NULL,
    account_limit decimal(18,2) ,
    account_currency_uom_id varchar(20) ,
    contact_mech_id varchar(20) ,
    from_date datetime(3) ,
    thru_date datetime(3) ,
    description varchar(255) ,
    external_account_id varchar(20) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`billing_account_id`) 
);

CREATE TABLE IF NOT EXISTS billing_account_role (
    id varchar(20) NOT NULL,
    billing_account_id varchar(20) NOT NULL,
    party_id varchar(20) NOT NULL,
    role_type_id varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_billing_account_role (billing_account_id, party_id, role_type_id, from_date) 
);

CREATE TABLE IF NOT EXISTS carrier_shipment_box_type (
    id varchar(20) NOT NULL,
    shipment_box_type_id varchar(20) NOT NULL,
    party_id varchar(20) NOT NULL,
    packaging_type_code varchar(20) ,
    oversize_code varchar(10) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_carrier_shipment_box_type (shipment_box_type_id, party_id) 
);

CREATE TABLE IF NOT EXISTS carrier_shipment_method (
    id varchar(20) NOT NULL,
    shipment_method_type_id varchar(20) NOT NULL,
    party_id varchar(20) NOT NULL,
    role_type_id varchar(20) NOT NULL,
    sequence_number decimal(20,0) ,
    carrier_service_code varchar(60) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_carrier_shipment_method (shipment_method_type_id, party_id, role_type_id) 
);

CREATE TABLE IF NOT EXISTS contact_mech (
    contact_mech_id varchar(20) NOT NULL,
    contact_mech_type_id varchar(20) ,
    info_string varchar(255) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`contact_mech_id`) 
);

CREATE TABLE IF NOT EXISTS content (
    content_id varchar(20) NOT NULL,
    content_type_id varchar(20) ,
    owner_content_id varchar(20) ,
    decorator_content_id varchar(20) ,
    instance_of_content_id varchar(20) ,
    data_resource_id varchar(20) ,
    template_data_resource_id varchar(20) ,
    data_source_id varchar(20) ,
    status_id varchar(20) ,
    privilege_enum_id varchar(20) ,
    service_name varchar(255) ,
    custom_method_id varchar(20) ,
    content_name varchar(255) ,
    description varchar(255) ,
    locale_string varchar(10) ,
    mime_type_id varchar(250) ,
    character_set_id varchar(60) ,
    child_leaf_count decimal(20,0) ,
    child_branch_count decimal(20,0) ,
    created_date datetime(3) ,
    created_by_user_login varchar(250) ,
    last_modified_date datetime(3) ,
    last_modified_by_user_login varchar(250) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`content_id`) 
);

CREATE TABLE IF NOT EXISTS content_assoc (
    id varchar(20) NOT NULL,
    content_id varchar(20) NOT NULL,
    content_id_to varchar(20) NOT NULL,
    content_assoc_type_id varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    content_assoc_predicate_id varchar(20) ,
    data_source_id varchar(20) ,
    sequence_num decimal(20,0) ,
    map_key varchar(100) ,
    upper_coordinate decimal(20,0) ,
    left_coordinate decimal(20,0) ,
    created_date datetime(3) ,
    created_by_user_login varchar(250) ,
    last_modified_date datetime(3) ,
    last_modified_by_user_login varchar(250) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_content_assoc (content_id, content_id_to, content_assoc_type_id, from_date) 
);

CREATE TABLE IF NOT EXISTS credit_card (
    payment_method_id varchar(20) NOT NULL,
    card_type varchar(60) ,
    card_number varchar(255) ,
    valid_from_date varchar(7) ,
    expire_date varchar(7) ,
    issue_number varchar(7) ,
    company_name_on_card varchar(100) ,
    title_on_card varchar(100) ,
    first_name_on_card varchar(100) ,
    middle_name_on_card varchar(100) ,
    last_name_on_card varchar(100) ,
    suffix_on_card varchar(100) ,
    contact_mech_id varchar(20) ,
    consecutive_failed_auths decimal(20,0) ,
    last_failed_auth_date datetime(3) ,
    consecutive_failed_nsf decimal(20,0) ,
    last_failed_nsf_date datetime(3) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`payment_method_id`) 
);

CREATE TABLE IF NOT EXISTS cust_request (
    cust_request_id varchar(20) NOT NULL,
    cust_request_type_id varchar(20) ,
    cust_request_category_id varchar(20) ,
    status_id varchar(20) ,
    from_party_id varchar(20) ,
    priority decimal(20,0) ,
    cust_request_date datetime(3) ,
    response_required_date datetime(3) ,
    cust_request_name varchar(100) ,
    description varchar(255) ,
    maximum_amount_uom_id varchar(20) ,
    product_store_id varchar(20) ,
    sales_channel_enum_id varchar(20) ,
    fulfill_contact_mech_id varchar(20) ,
    currency_uom_id varchar(20) ,
    open_date_time datetime(3) ,
    closed_date_time datetime(3) ,
    internal_comment varchar(255) ,
    reason varchar(255) ,
    created_date datetime(3) ,
    created_by_user_login varchar(250) ,
    last_modified_date datetime(3) ,
    last_modified_by_user_login varchar(250) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`cust_request_id`) 
);

CREATE TABLE IF NOT EXISTS cust_request_item (
    id varchar(20) NOT NULL,
    cust_request_id varchar(20) NOT NULL,
    cust_request_item_seq_id varchar(20) NOT NULL,
    cust_request_resolution_id varchar(20) ,
    status_id varchar(20) ,
    priority decimal(20,0) ,
    sequence_num decimal(20,0) ,
    required_by_date datetime(3) ,
    product_id varchar(20) ,
    quantity decimal(18,6) ,
    selected_amount decimal(18,6) ,
    maximum_amount decimal(18,2) ,
    reserv_start datetime(3) ,
    reserv_length decimal(18,6) ,
    reserv_persons decimal(18,6) ,
    config_id varchar(20) ,
    description varchar(255) ,
    story longtext ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_cust_request_item (cust_request_id, cust_request_item_seq_id) 
);

CREATE TABLE IF NOT EXISTS cust_request_type (
    cust_request_type_id varchar(20) NOT NULL,
    parent_type_id varchar(20) ,
    has_table char(1) ,
    description varchar(255) ,
    party_id varchar(20) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`cust_request_type_id`) 
);

CREATE TABLE IF NOT EXISTS data_resource (
    data_resource_id varchar(20) NOT NULL,
    data_resource_type_id varchar(20) ,
    data_template_type_id varchar(20) ,
    data_category_id varchar(20) ,
    data_source_id varchar(20) ,
    status_id varchar(20) ,
    data_resource_name varchar(255) ,
    locale_string varchar(10) ,
    mime_type_id varchar(250) ,
    character_set_id varchar(60) ,
    object_info varchar(255) ,
    survey_id varchar(20) ,
    survey_response_id varchar(20) ,
    related_detail_id varchar(20) ,
    is_public char(1) ,
    created_date datetime(3) ,
    created_by_user_login varchar(250) ,
    last_modified_date datetime(3) ,
    last_modified_by_user_login varchar(250) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`data_resource_id`) 
);

CREATE TABLE IF NOT EXISTS electronic_text (
    data_resource_id varchar(20) NOT NULL,
    text_data longtext ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`data_resource_id`) 
);

CREATE TABLE IF NOT EXISTS facility_contact_mech (
    id varchar(20) NOT NULL,
    facility_id varchar(20) NOT NULL,
    contact_mech_id varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    extension varchar(10) ,
    comments varchar(255) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_facility_contact_mech (facility_id, contact_mech_id, from_date) 
);

CREATE TABLE IF NOT EXISTS facility_contact_mech_purpose (
    id varchar(20) NOT NULL,
    facility_id varchar(20) NOT NULL,
    contact_mech_id varchar(20) NOT NULL,
    contact_mech_purpose_type_id varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_facility_contact_mech_purpose (facility_id, contact_mech_id, contact_mech_purpose_type_id, from_date) 
);

CREATE TABLE IF NOT EXISTS facility_location (
    id varchar(20) NOT NULL,
    facility_id varchar(20) NOT NULL,
    location_seq_id varchar(20) NOT NULL,
    location_type_enum_id varchar(20) ,
    area_id varchar(20) ,
    aisle_id varchar(20) ,
    section_id varchar(20) ,
    level_id varchar(20) ,
    position_id varchar(20) ,
    geo_point_id varchar(20) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_facility_location (facility_id, location_seq_id) 
);

CREATE TABLE IF NOT EXISTS facility_location_geo_point (
    id varchar(20) NOT NULL,
    facility_id varchar(20) NOT NULL,
    location_seq_id varchar(20) NOT NULL,
    geo_point_id varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_facility_location_geo_point (facility_id, location_seq_id, geo_point_id, from_date) 
);

CREATE TABLE IF NOT EXISTS fixed_asset (
    fixed_asset_id varchar(20) NOT NULL,
    fixed_asset_type_id varchar(20) ,
    parent_fixed_asset_id varchar(20) ,
    instance_of_product_id varchar(20) ,
    class_enum_id varchar(20) ,
    party_id varchar(20) ,
    role_type_id varchar(20) ,
    fixed_asset_name varchar(100) ,
    acquire_order_id varchar(20) ,
    acquire_order_item_seq_id varchar(20) ,
    date_acquired datetime(3) ,
    date_last_serviced datetime(3) ,
    date_next_service datetime(3) ,
    expected_end_of_life date ,
    actual_end_of_life date ,
    production_capacity decimal(18,6) ,
    uom_id varchar(20) ,
    calendar_id varchar(20) ,
    serial_number varchar(255) ,
    located_at_facility_id varchar(20) ,
    located_at_location_seq_id varchar(20) ,
    salvage_value decimal(18,2) ,
    depreciation decimal(18,2) ,
    purchase_cost decimal(18,2) ,
    purchase_cost_uom_id varchar(20) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`fixed_asset_id`) 
);

CREATE TABLE IF NOT EXISTS fixed_asset_geo_point (
    id varchar(20) NOT NULL,
    fixed_asset_id varchar(20) NOT NULL,
    geo_point_id varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_fixed_asset_geo_point (fixed_asset_id, geo_point_id, from_date) 
);

CREATE TABLE IF NOT EXISTS fixed_asset_product (
    id varchar(20) NOT NULL,
    fixed_asset_id varchar(20) NOT NULL,
    product_id varchar(20) NOT NULL,
    fixed_asset_product_type_id varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    comments varchar(255) ,
    sequence_num decimal(20,0) ,
    quantity decimal(18,6) ,
    quantity_uom_id varchar(20) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_fixed_asset_product (fixed_asset_id, product_id, fixed_asset_product_type_id, from_date) 
);

CREATE TABLE IF NOT EXISTS inventory_item (
    inventory_item_id varchar(20) NOT NULL,
    inventory_item_type_id varchar(20) ,
    product_id varchar(20) ,
    party_id varchar(20) ,
    owner_party_id varchar(20) ,
    status_id varchar(20) ,
    datetime_received datetime(3) ,
    datetime_manufactured datetime(3) ,
    expire_date datetime(3) ,
    facility_id varchar(20) ,
    container_id varchar(20) ,
    lot_id varchar(20) ,
    uom_id varchar(20) ,
    bin_number varchar(20) ,
    location_seq_id varchar(20) ,
    comments varchar(255) ,
    quantity_on_hand_total decimal(18,6) ,
    available_to_promise_total decimal(18,6) ,
    accounting_quantity_total decimal(18,6) ,
    quantity_on_hand decimal(18,6) ,
    available_to_promise decimal(18,6) ,
    serial_number varchar(255) ,
    soft_identifier varchar(255) ,
    activation_number varchar(255) ,
    activation_valid_thru datetime(3) ,
    unit_cost decimal(18,6) ,
    currency_uom_id varchar(20) ,
    fixed_asset_id varchar(20) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`inventory_item_id`) 
);

CREATE TABLE IF NOT EXISTS inventory_item_detail (
    id varchar(20) NOT NULL,
    inventory_item_id varchar(20) NOT NULL,
    inventory_item_detail_seq_id varchar(20) NOT NULL,
    effective_date datetime(3) ,
    quantity_on_hand_diff decimal(18,6) ,
    available_to_promise_diff decimal(18,6) ,
    accounting_quantity_diff decimal(18,6) ,
    unit_cost decimal(18,6) ,
    order_id varchar(20) ,
    order_item_seq_id varchar(20) ,
    ship_group_seq_id varchar(20) ,
    shipment_id varchar(20) ,
    shipment_item_seq_id varchar(20) ,
    return_id varchar(20) ,
    return_item_seq_id varchar(20) ,
    work_effort_id varchar(20) ,
    fixed_asset_id varchar(20) ,
    maint_hist_seq_id varchar(20) ,
    item_issuance_id varchar(20) ,
    receipt_id varchar(20) ,
    physical_inventory_id varchar(20) ,
    reason_enum_id varchar(20) ,
    description varchar(255) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_inventory_item_detail (inventory_item_id, inventory_item_detail_seq_id) 
);

CREATE TABLE IF NOT EXISTS invoice (
    invoice_id varchar(20) NOT NULL,
    invoice_type_id varchar(20) ,
    party_id_from varchar(20) ,
    party_id varchar(20) ,
    role_type_id varchar(20) ,
    status_id varchar(20) ,
    billing_account_id varchar(20) ,
    contact_mech_id varchar(20) ,
    invoice_date datetime(3) ,
    due_date datetime(3) ,
    paid_date datetime(3) ,
    invoice_message varchar(255) ,
    reference_number varchar(60) ,
    description varchar(255) ,
    currency_uom_id varchar(20) ,
    recurrence_info_id varchar(20) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`invoice_id`) 
);

CREATE TABLE IF NOT EXISTS invoice_item (
    id varchar(20) NOT NULL,
    invoice_id varchar(20) NOT NULL,
    invoice_item_seq_id varchar(20) NOT NULL,
    invoice_item_type_id varchar(20) ,
    override_gl_account_id varchar(20) ,
    override_org_party_id varchar(20) ,
    inventory_item_id varchar(20) ,
    product_id varchar(20) ,
    product_feature_id varchar(20) ,
    parent_invoice_id varchar(20) ,
    parent_invoice_item_seq_id varchar(20) ,
    uom_id varchar(20) ,
    taxable_flag char(1) ,
    quantity decimal(18,6) ,
    amount decimal(18,3) ,
    description varchar(255) ,
    tax_auth_party_id varchar(20) ,
    tax_auth_geo_id varchar(20) ,
    tax_authority_rate_seq_id varchar(20) ,
    sales_opportunity_id varchar(20) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_invoice_item (invoice_id, invoice_item_seq_id) 
);

CREATE TABLE IF NOT EXISTS item_issuance (
    item_issuance_id varchar(20) NOT NULL,
    order_id varchar(20) ,
    order_item_seq_id varchar(20) ,
    ship_group_seq_id varchar(20) ,
    inventory_item_id varchar(20) ,
    shipment_id varchar(20) ,
    shipment_item_seq_id varchar(20) ,
    fixed_asset_id varchar(20) ,
    maint_hist_seq_id varchar(20) ,
    issued_date_time datetime(3) ,
    issued_by_user_login_id varchar(250) ,
    quantity decimal(18,6) ,
    cancel_quantity decimal(18,6) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`item_issuance_id`) 
);

CREATE TABLE IF NOT EXISTS order_adjustment (
    order_adjustment_id varchar(20) NOT NULL,
    order_adjustment_type_id varchar(20) ,
    order_id varchar(20) ,
    order_item_seq_id varchar(20) ,
    ship_group_seq_id varchar(20) ,
    comments varchar(255) ,
    description varchar(255) ,
    amount decimal(18,3) ,
    recurring_amount decimal(18,3) ,
    amount_already_included decimal(18,3) ,
    product_promo_id varchar(20) ,
    product_promo_rule_id varchar(20) ,
    product_promo_action_seq_id varchar(20) ,
    product_feature_id varchar(20) ,
    corresponding_product_id varchar(20) ,
    tax_authority_rate_seq_id varchar(20) ,
    source_reference_id varchar(60) ,
    source_percentage decimal(18,6) ,
    customer_reference_id varchar(60) ,
    primary_geo_id varchar(20) ,
    secondary_geo_id varchar(20) ,
    exempt_amount decimal(18,2) ,
    tax_auth_geo_id varchar(20) ,
    tax_auth_party_id varchar(20) ,
    override_gl_account_id varchar(20) ,
    include_in_tax char(1) ,
    include_in_shipping char(1) ,
    is_manual char(1) ,
    created_date datetime(3) ,
    created_by_user_login varchar(250) ,
    last_modified_date datetime(3) ,
    last_modified_by_user_login varchar(250) ,
    original_adjustment_id varchar(20) ,
    amount_per_quantity decimal(18,2) ,
    percentage double ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`order_adjustment_id`) 
);

CREATE TABLE IF NOT EXISTS order_adjustment_billing (
    id varchar(20) NOT NULL,
    order_adjustment_id varchar(20) NOT NULL,
    invoice_id varchar(20) NOT NULL,
    invoice_item_seq_id varchar(20) NOT NULL,
    amount decimal(18,2) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_order_adjustment_billing (order_adjustment_id, invoice_id, invoice_item_seq_id) 
);

CREATE TABLE IF NOT EXISTS order_contact_mech (
    id varchar(20) NOT NULL,
    order_id varchar(20) NOT NULL,
    contact_mech_purpose_type_id varchar(20) NOT NULL,
    contact_mech_id varchar(20) NOT NULL,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_order_contact_mech (order_id, contact_mech_purpose_type_id, contact_mech_id) 
);

CREATE TABLE IF NOT EXISTS order_header (
    order_id varchar(20) NOT NULL,
    order_type_id varchar(20) ,
    order_name varchar(100) ,
    external_id varchar(20) ,
    sales_channel_enum_id varchar(20) ,
    order_date datetime(3) ,
    priority char(1) ,
    entry_date datetime(3) ,
    pick_sheet_printed_date datetime(3) ,
    visit_id varchar(20) ,
    status_id varchar(20) ,
    created_by varchar(250) ,
    first_attempt_order_id varchar(20) ,
    currency_uom varchar(20) ,
    sync_status_id varchar(20) ,
    billing_account_id varchar(20) ,
    origin_facility_id varchar(20) ,
    web_site_id varchar(20) ,
    product_store_id varchar(20) ,
    agreement_id varchar(20) ,
    terminal_id varchar(60) ,
    transaction_id varchar(60) ,
    auto_order_shopping_list_id varchar(20) ,
    needs_inventory_issuance char(1) ,
    is_rush_order char(1) ,
    internal_code varchar(60) ,
    remaining_sub_total decimal(18,2) ,
    grand_total decimal(18,2) ,
    is_viewed char(1) ,
    invoice_per_shipment char(1) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`order_id`) 
);

CREATE TABLE IF NOT EXISTS order_item (
    id varchar(20) NOT NULL,
    order_id varchar(20) NOT NULL,
    order_item_seq_id varchar(20) NOT NULL,
    external_id varchar(20) ,
    order_item_type_id varchar(20) ,
    order_item_group_seq_id varchar(20) ,
    is_item_group_primary char(1) ,
    from_inventory_item_id varchar(20) ,
    budget_id varchar(20) ,
    budget_item_seq_id varchar(20) ,
    product_id varchar(20) ,
    supplier_product_id varchar(60) ,
    product_feature_id varchar(20) ,
    prod_catalog_id varchar(20) ,
    product_category_id varchar(20) ,
    is_promo char(1) ,
    quote_id varchar(20) ,
    quote_item_seq_id varchar(20) ,
    shopping_list_id varchar(20) ,
    shopping_list_item_seq_id varchar(20) ,
    subscription_id varchar(20) ,
    deployment_id varchar(20) ,
    quantity decimal(18,6) ,
    cancel_quantity decimal(18,6) ,
    selected_amount decimal(18,6) ,
    unit_price decimal(18,3) ,
    unit_list_price decimal(18,3) ,
    unit_average_cost decimal(18,2) ,
    unit_recurring_price decimal(18,2) ,
    is_modified_price char(1) ,
    recurring_freq_uom_id varchar(20) ,
    item_description varchar(255) ,
    comments varchar(255) ,
    corresponding_po_id varchar(20) ,
    status_id varchar(20) ,
    sync_status_id varchar(20) ,
    estimated_ship_date datetime(3) ,
    estimated_delivery_date datetime(3) ,
    auto_cancel_date datetime(3) ,
    dont_cancel_set_date datetime(3) ,
    dont_cancel_set_user_login varchar(250) ,
    ship_before_date datetime(3) ,
    ship_after_date datetime(3) ,
    cancel_back_order_date datetime(3) ,
    override_gl_account_id varchar(20) ,
    sales_opportunity_id varchar(20) ,
    change_by_user_login_id varchar(250) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    reserve_after_date datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_order_item (order_id, order_item_seq_id) 
);

CREATE TABLE IF NOT EXISTS order_item_billing (
    id varchar(20) NOT NULL,
    order_id varchar(20) NOT NULL,
    order_item_seq_id varchar(20) NOT NULL,
    invoice_id varchar(20) NOT NULL,
    invoice_item_seq_id varchar(20) NOT NULL,
    item_issuance_id varchar(20) ,
    shipment_receipt_id varchar(20) ,
    quantity decimal(18,6) ,
    amount decimal(18,2) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_order_item_billing (order_id, order_item_seq_id, invoice_id, invoice_item_seq_id) 
);

CREATE TABLE IF NOT EXISTS order_item_price_info (
    order_item_price_info_id varchar(20) NOT NULL,
    order_id varchar(20) ,
    order_item_seq_id varchar(20) ,
    product_price_rule_id varchar(20) ,
    product_price_action_seq_id varchar(20) ,
    modify_amount decimal(18,3) ,
    description varchar(255) ,
    rate_code varchar(60) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`order_item_price_info_id`) 
);

CREATE TABLE IF NOT EXISTS order_item_ship_group (
    id varchar(20) NOT NULL,
    order_id varchar(20) NOT NULL,
    ship_group_seq_id varchar(20) NOT NULL,
    shipment_method_type_id varchar(20) ,
    supplier_party_id varchar(20) ,
    supplier_agreement_id varchar(20) ,
    vendor_party_id varchar(20) ,
    carrier_party_id varchar(20) ,
    carrier_role_type_id varchar(20) ,
    facility_id varchar(20) ,
    contact_mech_id varchar(20) ,
    telecom_contact_mech_id varchar(20) ,
    tracking_number varchar(60) ,
    shipping_instructions varchar(255) ,
    may_split char(1) ,
    gift_message varchar(255) ,
    is_gift char(1) ,
    ship_after_date datetime(3) ,
    ship_by_date datetime(3) ,
    estimated_ship_date datetime(3) ,
    estimated_delivery_date datetime(3) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_order_item_ship_group (order_id, ship_group_seq_id) 
);

CREATE TABLE IF NOT EXISTS order_item_ship_group_assoc (
    id varchar(20) NOT NULL,
    order_id varchar(20) NOT NULL,
    order_item_seq_id varchar(20) NOT NULL,
    ship_group_seq_id varchar(20) NOT NULL,
    quantity decimal(18,6) ,
    cancel_quantity decimal(18,6) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_order_item_ship_group_assoc (order_id, order_item_seq_id, ship_group_seq_id) 
);

CREATE TABLE IF NOT EXISTS order_item_ship_grp_inv_res (
    id varchar(20) NOT NULL,
    order_id varchar(20) NOT NULL,
    ship_group_seq_id varchar(20) NOT NULL,
    order_item_seq_id varchar(20) NOT NULL,
    inventory_item_id varchar(20) NOT NULL,
    reserve_order_enum_id varchar(20) ,
    quantity decimal(18,6) ,
    quantity_not_available decimal(18,6) ,
    reserved_datetime datetime(3) ,
    created_datetime datetime(3) ,
    promised_datetime datetime(3) ,
    current_promised_date datetime(3) ,
    priority char(1) ,
    sequence_id decimal(20,0) ,
    pick_start_date datetime(3) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_order_item_ship_grp_inv_res (order_id, ship_group_seq_id, order_item_seq_id, inventory_item_id) 
);

CREATE TABLE IF NOT EXISTS order_payment_preference (
    order_payment_preference_id varchar(20) NOT NULL,
    order_id varchar(20) ,
    order_item_seq_id varchar(20) ,
    ship_group_seq_id varchar(20) ,
    product_price_purpose_id varchar(20) ,
    payment_method_type_id varchar(20) ,
    payment_method_id varchar(20) ,
    fin_account_id varchar(20) ,
    security_code varchar(255) ,
    track2 varchar(255) ,
    present_flag char(1) ,
    swiped_flag char(1) ,
    overflow_flag char(1) ,
    max_amount decimal(18,2) ,
    process_attempt decimal(20,0) ,
    billing_postal_code varchar(60) ,
    manual_auth_code varchar(60) ,
    manual_ref_num varchar(60) ,
    status_id varchar(20) ,
    needs_nsf_retry char(1) ,
    created_date datetime(3) ,
    created_by_user_login varchar(250) ,
    last_modified_date datetime(3) ,
    last_modified_by_user_login varchar(250) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`order_payment_preference_id`) 
);

CREATE TABLE IF NOT EXISTS order_role (
    id varchar(20) NOT NULL,
    order_id varchar(20) NOT NULL,
    party_id varchar(20) NOT NULL,
    role_type_id varchar(20) NOT NULL,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_order_role (order_id, party_id, role_type_id) 
);

CREATE TABLE IF NOT EXISTS order_status (
    order_status_id varchar(20) NOT NULL,
    status_id varchar(20) ,
    order_id varchar(20) ,
    order_item_seq_id varchar(20) ,
    order_payment_preference_id varchar(20) ,
    status_datetime datetime(3) ,
    status_user_login varchar(250) ,
    change_reason varchar(255) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`order_status_id`) 
);

CREATE TABLE IF NOT EXISTS party (
    party_id varchar(20) NOT NULL,
    party_type_id varchar(20) ,
    external_id varchar(20) ,
    preferred_currency_uom_id varchar(20) ,
    description longtext ,
    status_id varchar(20) ,
    created_date datetime(3) ,
    created_by_user_login varchar(250) ,
    last_modified_date datetime(3) ,
    last_modified_by_user_login varchar(250) ,
    data_source_id varchar(20) ,
    is_unread char(1) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`party_id`) 
);

CREATE TABLE IF NOT EXISTS party_contact_mech (
    id varchar(20) NOT NULL,
    party_id varchar(20) NOT NULL,
    contact_mech_id varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    role_type_id varchar(20) ,
    allow_solicitation char(1) ,
    extension varchar(255) ,
    verified char(1) ,
    comments varchar(255) ,
    years_with_contact_mech decimal(20,0) ,
    months_with_contact_mech decimal(20,0) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_party_contact_mech (party_id, contact_mech_id, from_date) 
);

CREATE TABLE IF NOT EXISTS party_contact_mech_purpose (
    id varchar(20) NOT NULL,
    party_id varchar(20) NOT NULL,
    contact_mech_id varchar(20) NOT NULL,
    contact_mech_purpose_type_id varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_party_contact_mech_purpose (party_id, contact_mech_id, contact_mech_purpose_type_id, from_date) 
);

CREATE TABLE IF NOT EXISTS party_geo_point (
    id varchar(20) NOT NULL,
    party_id varchar(20) NOT NULL,
    geo_point_id varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_party_geo_point (party_id, geo_point_id, from_date) 
);

CREATE TABLE IF NOT EXISTS party_group (
    party_id varchar(20) NOT NULL,
    group_name varchar(100) ,
    group_name_local varchar(100) ,
    office_site_name varchar(100) ,
    annual_revenue decimal(18,2) ,
    num_employees decimal(20,0) ,
    ticker_symbol varchar(10) ,
    comments varchar(255) ,
    logo_image_url varchar(2000) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`party_id`) 
);

CREATE TABLE IF NOT EXISTS party_relationship (
    id varchar(20) NOT NULL,
    party_id_from varchar(20) NOT NULL,
    party_id_to varchar(20) NOT NULL,
    role_type_id_from varchar(20) NOT NULL,
    role_type_id_to varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    status_id varchar(20) ,
    relationship_name varchar(100) ,
    security_group_id varchar(20) ,
    priority_type_id varchar(20) ,
    party_relationship_type_id varchar(20) ,
    permissions_enum_id varchar(20) ,
    position_title varchar(100) ,
    comments varchar(255) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_party_relationship (party_id_from, party_id_to, role_type_id_from, role_type_id_to, from_date) 
);

CREATE TABLE IF NOT EXISTS party_role (
    id varchar(20) NOT NULL,
    party_id varchar(20) NOT NULL,
    role_type_id varchar(20) NOT NULL,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    from_date datetime(3) ,
    thru_date datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_party_role (party_id, role_type_id) 
);

CREATE TABLE IF NOT EXISTS party_status (
    id varchar(20) NOT NULL,
    status_id varchar(20) NOT NULL,
    party_id varchar(20) NOT NULL,
    status_date datetime(3) NOT NULL,
    change_by_user_login_id varchar(250) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_party_status (status_id, party_id, status_date) 
);

CREATE TABLE IF NOT EXISTS party_tax_auth_info (
    id varchar(20) NOT NULL,
    party_id varchar(20) NOT NULL,
    tax_auth_geo_id varchar(20) NOT NULL,
    tax_auth_party_id varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    party_tax_id varchar(60) ,
    is_exempt char(1) ,
    is_nexus char(1) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_party_tax_auth_info (party_id, tax_auth_geo_id, tax_auth_party_id, from_date) 
);

CREATE TABLE IF NOT EXISTS payment (
    payment_id varchar(20) NOT NULL,
    payment_type_id varchar(20) ,
    payment_method_type_id varchar(20) ,
    payment_method_id varchar(20) ,
    payment_gateway_response_id varchar(20) ,
    payment_preference_id varchar(20) ,
    party_id_from varchar(20) ,
    party_id_to varchar(20) ,
    role_type_id_to varchar(20) ,
    status_id varchar(20) ,
    effective_date datetime(3) ,
    payment_ref_num varchar(60) ,
    amount decimal(18,2) ,
    currency_uom_id varchar(20) ,
    comments varchar(255) ,
    fin_account_trans_id varchar(20) ,
    override_gl_account_id varchar(20) ,
    actual_currency_amount decimal(18,2) ,
    actual_currency_uom_id varchar(20) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`payment_id`) 
);

CREATE TABLE IF NOT EXISTS payment_application (
    payment_application_id varchar(20) NOT NULL,
    payment_id varchar(20) ,
    invoice_id varchar(20) ,
    invoice_item_seq_id varchar(20) ,
    billing_account_id varchar(20) ,
    override_gl_account_id varchar(20) ,
    to_payment_id varchar(20) ,
    tax_auth_geo_id varchar(20) ,
    amount_applied decimal(18,2) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`payment_application_id`) 
);

CREATE TABLE IF NOT EXISTS payment_gateway_response (
    payment_gateway_response_id varchar(20) NOT NULL,
    payment_service_type_enum_id varchar(20) ,
    order_payment_preference_id varchar(20) ,
    payment_method_type_id varchar(20) ,
    payment_method_id varchar(20) ,
    trans_code_enum_id varchar(20) ,
    amount decimal(18,2) ,
    currency_uom_id varchar(20) ,
    reference_num varchar(60) ,
    alt_reference varchar(60) ,
    sub_reference varchar(60) ,
    gateway_code varchar(60) ,
    gateway_flag varchar(60) ,
    gateway_avs_result varchar(60) ,
    gateway_cv_result varchar(60) ,
    gateway_score_result varchar(60) ,
    gateway_message varchar(255) ,
    transaction_date datetime(3) ,
    result_declined char(1) ,
    result_nsf char(1) ,
    result_bad_expire char(1) ,
    result_bad_card_number char(1) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`payment_gateway_response_id`) 
);

CREATE TABLE IF NOT EXISTS payment_method (
    payment_method_id varchar(20) NOT NULL,
    payment_method_type_id varchar(20) ,
    party_id varchar(20) ,
    gl_account_id varchar(20) ,
    fin_account_id varchar(20) ,
    description varchar(255) ,
    from_date datetime(3) ,
    thru_date datetime(3) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`payment_method_id`) 
);

CREATE TABLE IF NOT EXISTS person (
    party_id varchar(20) NOT NULL,
    salutation varchar(100) ,
    first_name varchar(100) ,
    middle_name varchar(100) ,
    last_name varchar(100) ,
    personal_title varchar(100) ,
    suffix varchar(100) ,
    nickname varchar(100) ,
    first_name_local varchar(100) ,
    middle_name_local varchar(100) ,
    last_name_local varchar(100) ,
    other_local varchar(100) ,
    member_id varchar(20) ,
    gender char(1) ,
    birth_date date ,
    deceased_date date ,
    height double ,
    weight double ,
    mothers_maiden_name varchar(255) ,
    marital_status char(1) ,
    social_security_number varchar(255) ,
    passport_number varchar(255) ,
    passport_expire_date date ,
    total_years_work_experience double ,
    comments varchar(255) ,
    employment_status_enum_id varchar(20) ,
    residence_status_enum_id varchar(20) ,
    occupation varchar(100) ,
    years_with_employer decimal(20,0) ,
    months_with_employer decimal(20,0) ,
    existing_customer char(1) ,
    card_id varchar(60) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    marital_status_enum_id varchar(20) ,
    
    PRIMARY KEY (`party_id`) 
);

CREATE TABLE IF NOT EXISTS postal_address (
    contact_mech_id varchar(20) NOT NULL,
    to_name varchar(100) ,
    attn_name varchar(100) ,
    address1 varchar(255) ,
    address2 varchar(255) ,
    house_number decimal(20,0) ,
    house_number_ext varchar(60) ,
    directions varchar(255) ,
    city varchar(100) ,
    city_geo_id varchar(20) ,
    postal_code varchar(60) ,
    postal_code_ext varchar(60) ,
    country_geo_id varchar(20) ,
    state_province_geo_id varchar(20) ,
    county_geo_id varchar(20) ,
    municipality_geo_id varchar(20) ,
    postal_code_geo_id varchar(20) ,
    geo_point_id varchar(20) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`contact_mech_id`) 
);

CREATE TABLE IF NOT EXISTS prod_catalog (
    prod_catalog_id varchar(20) NOT NULL,
    catalog_name varchar(100) ,
    use_quick_add char(1) ,
    style_sheet varchar(2000) ,
    header_logo varchar(2000) ,
    content_path_prefix varchar(255) ,
    template_path_prefix varchar(255) ,
    view_allow_perm_reqd char(1) ,
    purchase_allow_perm_reqd char(1) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`prod_catalog_id`) 
);

CREATE TABLE IF NOT EXISTS prod_catalog_category (
    id varchar(20) NOT NULL,
    prod_catalog_id varchar(20) NOT NULL,
    product_category_id varchar(20) NOT NULL,
    prod_catalog_category_type_id varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    sequence_num decimal(20,0) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_prod_catalog_category (prod_catalog_id, product_category_id, prod_catalog_category_type_id, from_date) 
);

CREATE TABLE IF NOT EXISTS product (
    product_id varchar(20) NOT NULL,
    product_type_id varchar(20) ,
    primary_product_category_id varchar(20) ,
    facility_id varchar(20) ,
    introduction_date datetime(3) ,
    release_date datetime(3) ,
    support_discontinuation_date datetime(3) ,
    sales_discontinuation_date datetime(3) ,
    sales_disc_when_not_avail char(1) ,
    internal_name varchar(255) ,
    brand_name varchar(100) ,
    comments varchar(255) ,
    product_name varchar(100) ,
    description varchar(255) ,
    long_description longtext ,
    price_detail_text varchar(255) ,
    small_image_url varchar(2000) ,
    medium_image_url varchar(2000) ,
    large_image_url varchar(2000) ,
    detail_image_url varchar(2000) ,
    original_image_url varchar(2000) ,
    detail_screen varchar(255) ,
    inventory_message varchar(255) ,
    inventory_item_type_id varchar(20) ,
    require_inventory char(1) ,
    quantity_uom_id varchar(20) ,
    quantity_included decimal(18,6) ,
    pieces_included decimal(20,0) ,
    require_amount char(1) ,
    fixed_amount decimal(18,2) ,
    amount_uom_type_id varchar(20) ,
    weight_uom_id varchar(20) ,
    shipping_weight decimal(18,6) ,
    product_weight decimal(18,6) ,
    height_uom_id varchar(20) ,
    product_height decimal(18,6) ,
    shipping_height decimal(18,6) ,
    width_uom_id varchar(20) ,
    product_width decimal(18,6) ,
    shipping_width decimal(18,6) ,
    depth_uom_id varchar(20) ,
    product_depth decimal(18,6) ,
    shipping_depth decimal(18,6) ,
    diameter_uom_id varchar(20) ,
    product_diameter decimal(18,6) ,
    product_rating decimal(18,6) ,
    rating_type_enum varchar(20) ,
    returnable char(1) ,
    taxable char(1) ,
    charge_shipping char(1) ,
    auto_create_keywords char(1) ,
    include_in_promotions char(1) ,
    is_virtual char(1) ,
    is_variant char(1) ,
    virtual_variant_method_enum varchar(20) ,
    origin_geo_id varchar(20) ,
    requirement_method_enum_id varchar(20) ,
    bill_of_material_level decimal(20,0) ,
    reserv_max_persons decimal(18,6) ,
    reserv2nd_p_p_perc decimal(18,6) ,
    reserv_nth_p_p_perc decimal(18,6) ,
    config_id varchar(20) ,
    created_date datetime(3) ,
    created_by_user_login varchar(250) ,
    last_modified_date datetime(3) ,
    last_modified_by_user_login varchar(250) ,
    in_shipping_box char(1) ,
    default_shipment_box_type_id varchar(20) ,
    lot_id_filled_in varchar(255) ,
    order_decimal_quantity char(1) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`product_id`) 
);

CREATE TABLE IF NOT EXISTS product_assoc (
    id varchar(20) NOT NULL,
    product_id varchar(20) NOT NULL,
    product_id_to varchar(20) NOT NULL,
    product_assoc_type_id varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    sequence_num decimal(20,0) ,
    reason varchar(255) ,
    quantity decimal(18,6) ,
    scrap_factor decimal(18,6) ,
    instruction varchar(255) ,
    routing_work_effort_id varchar(20) ,
    estimate_calc_method varchar(20) ,
    recurrence_info_id varchar(20) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_assoc (product_id, product_id_to, product_assoc_type_id, from_date) 
);

CREATE TABLE IF NOT EXISTS product_category (
    product_category_id varchar(20) NOT NULL,
    product_category_type_id varchar(20) ,
    primary_parent_category_id varchar(20) ,
    category_name varchar(100) ,
    description varchar(255) ,
    long_description longtext ,
    category_image_url varchar(2000) ,
    link_one_image_url varchar(2000) ,
    link_two_image_url varchar(2000) ,
    detail_screen varchar(255) ,
    show_in_select char(1) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`product_category_id`) 
);

CREATE TABLE IF NOT EXISTS product_category_content (
    id varchar(20) NOT NULL,
    product_category_id varchar(20) NOT NULL,
    content_id varchar(20) NOT NULL,
    prod_cat_content_type_id varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    purchase_from_date datetime(3) ,
    purchase_thru_date datetime(3) ,
    use_count_limit decimal(20,0) ,
    use_days_limit decimal(18,6) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_category_content (product_category_id, content_id, prod_cat_content_type_id, from_date) 
);

CREATE TABLE IF NOT EXISTS product_category_link (
    id varchar(20) NOT NULL,
    product_category_id varchar(20) NOT NULL,
    link_seq_id varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    comments varchar(255) ,
    sequence_num decimal(20,0) ,
    title_text varchar(255) ,
    detail_text longtext ,
    image_url varchar(2000) ,
    image_two_url varchar(2000) ,
    link_type_enum_id varchar(20) ,
    link_info varchar(255) ,
    detail_sub_screen varchar(255) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_category_link (product_category_id, link_seq_id, from_date) 
);

CREATE TABLE IF NOT EXISTS product_category_member (
    id varchar(20) NOT NULL,
    product_category_id varchar(20) NOT NULL,
    product_id varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    comments varchar(255) ,
    sequence_num decimal(20,0) ,
    quantity decimal(18,6) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_category_member (product_category_id, product_id, from_date) 
);

CREATE TABLE IF NOT EXISTS product_category_role (
    id varchar(20) NOT NULL,
    product_category_id varchar(20) NOT NULL,
    party_id varchar(20) NOT NULL,
    role_type_id varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    comments varchar(255) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_category_role (product_category_id, party_id, role_type_id, from_date) 
);

CREATE TABLE IF NOT EXISTS product_category_rollup (
    id varchar(20) NOT NULL,
    product_category_id varchar(20) NOT NULL,
    parent_product_category_id varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    sequence_num decimal(20,0) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_category_rollup (product_category_id, parent_product_category_id, from_date) 
);

CREATE TABLE IF NOT EXISTS product_config (
    id varchar(20) NOT NULL,
    product_id varchar(20) NOT NULL,
    config_item_id varchar(20) NOT NULL,
    sequence_num decimal(20,0) NOT NULL,
    from_date datetime(3) NOT NULL,
    description varchar(255) ,
    long_description longtext ,
    config_type_id varchar(20) ,
    default_config_option_id varchar(20) ,
    thru_date datetime(3) ,
    is_mandatory char(1) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_config (product_id, config_item_id, sequence_num, from_date) 
);

CREATE TABLE IF NOT EXISTS product_config_item (
    config_item_id varchar(20) NOT NULL,
    config_item_type_id varchar(20) ,
    config_item_name varchar(100) ,
    description varchar(255) ,
    long_description longtext ,
    image_url varchar(2000) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`config_item_id`) 
);

CREATE TABLE IF NOT EXISTS product_config_option (
    id varchar(20) NOT NULL,
    config_item_id varchar(20) NOT NULL,
    config_option_id varchar(20) NOT NULL,
    config_option_name varchar(100) ,
    description varchar(255) ,
    sequence_num decimal(20,0) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    from_date datetime(3) ,
    thru_date datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_config_option (config_item_id, config_option_id) 
);

CREATE TABLE IF NOT EXISTS product_config_product (
    id varchar(20) NOT NULL,
    config_item_id varchar(20) NOT NULL,
    config_option_id varchar(20) NOT NULL,
    product_id varchar(20) NOT NULL,
    quantity decimal(18,6) ,
    sequence_num decimal(20,0) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_config_product (config_item_id, config_option_id, product_id) 
);

CREATE TABLE IF NOT EXISTS product_content (
    id varchar(20) NOT NULL,
    product_id varchar(20) NOT NULL,
    content_id varchar(20) NOT NULL,
    product_content_type_id varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    purchase_from_date datetime(3) ,
    purchase_thru_date datetime(3) ,
    use_count_limit decimal(20,0) ,
    use_time decimal(20,0) ,
    use_time_uom_id varchar(20) ,
    use_role_type_id varchar(20) ,
    sequence_num decimal(20,0) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_content (product_id, content_id, product_content_type_id, from_date) 
);

CREATE TABLE IF NOT EXISTS product_facility (
    id varchar(20) NOT NULL,
    product_id varchar(20) NOT NULL,
    facility_id varchar(20) NOT NULL,
    minimum_stock decimal(18,6) ,
    reorder_quantity decimal(18,6) ,
    days_to_ship decimal(20,0) ,
    last_inventory_count decimal(18,6) ,
    requirement_method_enum_id varchar(20) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    replenish_method_enum_id varchar(20) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_facility (product_id, facility_id) 
);

CREATE TABLE IF NOT EXISTS product_facility_location (
    id varchar(20) NOT NULL,
    product_id varchar(20) NOT NULL,
    facility_id varchar(20) NOT NULL,
    location_seq_id varchar(20) NOT NULL,
    minimum_stock decimal(18,6) ,
    move_quantity decimal(18,6) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_facility_location (product_id, facility_id, location_seq_id) 
);

CREATE TABLE IF NOT EXISTS product_feature (
    product_feature_id varchar(20) NOT NULL,
    product_feature_type_id varchar(20) ,
    product_feature_category_id varchar(20) ,
    description varchar(255) ,
    uom_id varchar(20) ,
    number_specified decimal(18,6) ,
    default_amount decimal(18,2) ,
    default_sequence_num decimal(20,0) ,
    abbrev varchar(20) ,
    id_code varchar(60) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`product_feature_id`) 
);

CREATE TABLE IF NOT EXISTS product_feature_appl (
    id varchar(20) NOT NULL,
    product_id varchar(20) NOT NULL,
    product_feature_id varchar(20) NOT NULL,
    product_feature_appl_type_id varchar(20) ,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    sequence_num decimal(20,0) ,
    amount decimal(18,2) ,
    recurring_amount decimal(18,2) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_feature_appl (product_id, product_feature_id, from_date) 
);

CREATE TABLE IF NOT EXISTS product_feature_category (
    product_feature_category_id varchar(20) NOT NULL,
    parent_category_id varchar(20) ,
    description varchar(255) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`product_feature_category_id`) 
);

CREATE TABLE IF NOT EXISTS product_feature_category_appl (
    id varchar(20) NOT NULL,
    product_category_id varchar(20) NOT NULL,
    product_feature_category_id varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_feature_category_appl (product_category_id, product_feature_category_id, from_date) 
);

CREATE TABLE IF NOT EXISTS product_feature_iactn (
    id varchar(20) NOT NULL,
    product_feature_id varchar(20) NOT NULL,
    product_feature_id_to varchar(20) NOT NULL,
    product_feature_iactn_type_id varchar(20) ,
    product_id varchar(20) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_feature_iactn (product_feature_id, product_feature_id_to) 
);

CREATE TABLE IF NOT EXISTS product_feature_price (
    id varchar(20) NOT NULL,
    product_feature_id varchar(20) NOT NULL,
    product_price_type_id varchar(20) NOT NULL,
    currency_uom_id varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    price decimal(18,3) ,
    created_date datetime(3) ,
    created_by_user_login varchar(250) ,
    last_modified_date datetime(3) ,
    last_modified_by_user_login varchar(250) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_feature_price (product_feature_id, product_price_type_id, currency_uom_id, from_date) 
);

CREATE TABLE IF NOT EXISTS product_price (
    id varchar(20) NOT NULL,
    product_id varchar(20) NOT NULL,
    product_price_type_id varchar(20) NOT NULL,
    product_price_purpose_id varchar(20) NOT NULL,
    currency_uom_id varchar(20) NOT NULL,
    product_store_group_id varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    price decimal(18,3) ,
    term_uom_id varchar(20) ,
    custom_price_calc_service varchar(20) ,
    price_without_tax decimal(18,3) ,
    price_with_tax decimal(18,3) ,
    tax_amount decimal(18,3) ,
    tax_percentage decimal(18,6) ,
    tax_auth_party_id varchar(20) ,
    tax_auth_geo_id varchar(20) ,
    tax_in_price char(1) ,
    created_date datetime(3) ,
    created_by_user_login varchar(250) ,
    last_modified_date datetime(3) ,
    last_modified_by_user_login varchar(250) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_price (product_id, product_price_type_id, product_price_purpose_id, currency_uom_id, product_store_group_id, from_date) 
);

CREATE TABLE IF NOT EXISTS product_price_action (
    id varchar(20) NOT NULL,
    product_price_rule_id varchar(20) NOT NULL,
    product_price_action_seq_id varchar(20) NOT NULL,
    product_price_action_type_id varchar(20) ,
    amount decimal(18,6) ,
    rate_code varchar(60) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_price_action (product_price_rule_id, product_price_action_seq_id) 
);

CREATE TABLE IF NOT EXISTS product_price_cond (
    id varchar(20) NOT NULL,
    product_price_rule_id varchar(20) NOT NULL,
    product_price_cond_seq_id varchar(20) NOT NULL,
    input_param_enum_id varchar(20) ,
    operator_enum_id varchar(20) ,
    cond_value varchar(255) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_price_cond (product_price_rule_id, product_price_cond_seq_id) 
);

CREATE TABLE IF NOT EXISTS product_price_rule (
    product_price_rule_id varchar(20) NOT NULL,
    rule_name varchar(100) ,
    description varchar(255) ,
    is_sale char(1) ,
    from_date datetime(3) ,
    thru_date datetime(3) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`product_price_rule_id`) 
);

CREATE TABLE IF NOT EXISTS product_promo (
    product_promo_id varchar(20) NOT NULL,
    promo_name varchar(100) ,
    promo_text varchar(255) ,
    user_entered char(1) ,
    show_to_customer char(1) ,
    require_code char(1) ,
    use_limit_per_order decimal(20,0) ,
    use_limit_per_customer decimal(20,0) ,
    use_limit_per_promotion decimal(20,0) ,
    billback_factor decimal(18,6) ,
    override_org_party_id varchar(20) ,
    created_date datetime(3) ,
    created_by_user_login varchar(250) ,
    last_modified_date datetime(3) ,
    last_modified_by_user_login varchar(250) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`product_promo_id`) 
);

CREATE TABLE IF NOT EXISTS product_promo_action (
    id varchar(20) NOT NULL,
    product_promo_id varchar(20) NOT NULL,
    product_promo_rule_id varchar(20) NOT NULL,
    product_promo_action_seq_id varchar(20) NOT NULL,
    product_promo_action_enum_id varchar(20) ,
    custom_method_id varchar(20) ,
    order_adjustment_type_id varchar(20) ,
    service_name varchar(255) ,
    quantity decimal(18,6) ,
    amount decimal(18,6) ,
    product_id varchar(20) ,
    party_id varchar(20) ,
    use_cart_quantity char(1) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_promo_action (product_promo_id, product_promo_rule_id, product_promo_action_seq_id) 
);

CREATE TABLE IF NOT EXISTS product_promo_category (
    id varchar(20) NOT NULL,
    product_promo_id varchar(20) NOT NULL,
    product_promo_rule_id varchar(20) NOT NULL,
    product_promo_action_seq_id varchar(20) NOT NULL,
    product_promo_cond_seq_id varchar(20) NOT NULL,
    product_category_id varchar(20) NOT NULL,
    and_group_id varchar(20) NOT NULL,
    product_promo_appl_enum_id varchar(20) ,
    include_sub_categories char(1) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_promo_category (product_promo_id, product_promo_rule_id, product_promo_action_seq_id, product_promo_cond_seq_id, product_category_id, and_group_id) 
);

CREATE TABLE IF NOT EXISTS product_promo_code (
    product_promo_code_id varchar(20) NOT NULL,
    product_promo_id varchar(20) ,
    user_entered char(1) ,
    require_email_or_party char(1) ,
    use_limit_per_code decimal(20,0) ,
    use_limit_per_customer decimal(20,0) ,
    from_date datetime(3) ,
    thru_date datetime(3) ,
    created_date datetime(3) ,
    created_by_user_login varchar(250) ,
    last_modified_date datetime(3) ,
    last_modified_by_user_login varchar(250) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`product_promo_code_id`) 
);

CREATE TABLE IF NOT EXISTS product_promo_cond (
    id varchar(20) NOT NULL,
    product_promo_id varchar(20) NOT NULL,
    product_promo_rule_id varchar(20) NOT NULL,
    product_promo_cond_seq_id varchar(20) NOT NULL,
    custom_method_id varchar(20) ,
    input_param_enum_id varchar(20) ,
    operator_enum_id varchar(20) ,
    cond_value varchar(255) ,
    other_value varchar(255) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_promo_cond (product_promo_id, product_promo_rule_id, product_promo_cond_seq_id) 
);

CREATE TABLE IF NOT EXISTS product_promo_product (
    id varchar(20) NOT NULL,
    product_promo_id varchar(20) NOT NULL,
    product_promo_rule_id varchar(20) NOT NULL,
    product_promo_action_seq_id varchar(20) NOT NULL,
    product_promo_cond_seq_id varchar(20) NOT NULL,
    product_id varchar(20) NOT NULL,
    product_promo_appl_enum_id varchar(20) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_promo_product (product_promo_id, product_promo_rule_id, product_promo_action_seq_id, product_promo_cond_seq_id, product_id) 
);

CREATE TABLE IF NOT EXISTS product_promo_rule (
    id varchar(20) NOT NULL,
    product_promo_id varchar(20) NOT NULL,
    product_promo_rule_id varchar(20) NOT NULL,
    rule_name varchar(100) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_promo_rule (product_promo_id, product_promo_rule_id) 
);

CREATE TABLE IF NOT EXISTS product_review (
    product_review_id varchar(20) NOT NULL,
    product_store_id varchar(20) ,
    product_id varchar(20) ,
    user_login_id varchar(250) ,
    status_id varchar(20) ,
    posted_anonymous char(1) ,
    posted_date_time datetime(3) ,
    product_rating decimal(18,6) ,
    product_review longtext ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`product_review_id`) 
);

CREATE TABLE IF NOT EXISTS product_store (
    product_store_id varchar(20) NOT NULL,
    primary_store_group_id varchar(20) ,
    store_name varchar(100) ,
    company_name varchar(100) ,
    title varchar(100) ,
    subtitle varchar(255) ,
    pay_to_party_id varchar(20) ,
    days_to_cancel_non_pay decimal(20,0) ,
    manual_auth_is_capture char(1) ,
    prorate_shipping char(1) ,
    prorate_taxes char(1) ,
    view_cart_on_add char(1) ,
    auto_save_cart char(1) ,
    auto_approve_reviews char(1) ,
    is_demo_store char(1) ,
    is_immediately_fulfilled char(1) ,
    inventory_facility_id varchar(20) ,
    one_inventory_facility char(1) ,
    check_inventory char(1) ,
    reserve_inventory char(1) ,
    reserve_order_enum_id varchar(20) ,
    require_inventory char(1) ,
    balance_res_on_order_creation char(1) ,
    requirement_method_enum_id varchar(20) ,
    order_number_prefix varchar(60) ,
    default_locale_string varchar(10) ,
    default_currency_uom_id varchar(20) ,
    default_time_zone_string varchar(60) ,
    default_sales_channel_enum_id varchar(20) ,
    allow_password char(1) ,
    default_password varchar(255) ,
    explode_order_items char(1) ,
    check_gc_balance char(1) ,
    retry_failed_auths char(1) ,
    header_approved_status varchar(20) ,
    item_approved_status varchar(20) ,
    digital_item_approved_status varchar(20) ,
    header_declined_status varchar(20) ,
    item_declined_status varchar(20) ,
    header_cancel_status varchar(20) ,
    item_cancel_status varchar(20) ,
    auth_declined_message varchar(255) ,
    auth_fraud_message varchar(255) ,
    auth_error_message varchar(255) ,
    visual_theme_id varchar(20) ,
    store_credit_account_enum_id varchar(20) ,
    use_primary_email_username char(1) ,
    require_customer_role char(1) ,
    auto_invoice_digital_items char(1) ,
    req_ship_addr_for_dig_items char(1) ,
    show_checkout_gift_options char(1) ,
    select_payment_type_per_item char(1) ,
    show_prices_with_vat_tax char(1) ,
    show_tax_is_exempt char(1) ,
    vat_tax_auth_geo_id varchar(20) ,
    vat_tax_auth_party_id varchar(20) ,
    enable_auto_suggestion_list char(1) ,
    enable_dig_prod_upload char(1) ,
    prod_search_exclude_variants char(1) ,
    dig_prod_upload_category_id varchar(20) ,
    auto_order_cc_try_exp char(1) ,
    auto_order_cc_try_other_cards char(1) ,
    auto_order_cc_try_later_nsf char(1) ,
    auto_order_cc_try_later_max decimal(20,0) ,
    store_credit_valid_days decimal(20,0) ,
    auto_approve_invoice char(1) ,
    auto_approve_order char(1) ,
    ship_if_capture_fails char(1) ,
    set_owner_upon_issuance char(1) ,
    req_return_inventory_receive char(1) ,
    add_to_cart_remove_incompat char(1) ,
    add_to_cart_replace_upsell char(1) ,
    split_pay_pref_per_shp_grp char(1) ,
    managed_by_lot char(1) ,
    show_out_of_stock_products char(1) ,
    order_decimal_quantity char(1) ,
    allow_comment char(1) ,
    style_sheet varchar(2000) ,
    header_logo varchar(2000) ,
    header_middle_background varchar(2000) ,
    header_right_background varchar(2000) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    allocate_inventory char(1) ,
    
    PRIMARY KEY (`product_store_id`) 
);

CREATE TABLE IF NOT EXISTS product_store_catalog (
    id varchar(20) NOT NULL,
    product_store_id varchar(20) NOT NULL,
    prod_catalog_id varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    sequence_num decimal(20,0) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_store_catalog (product_store_id, prod_catalog_id, from_date) 
);

CREATE TABLE IF NOT EXISTS product_store_email_setting (
    id varchar(20) NOT NULL,
    product_store_id varchar(20) NOT NULL,
    email_type varchar(20) NOT NULL,
    body_screen_location varchar(255) ,
    xslfo_attach_screen_location varchar(255) ,
    from_address varchar(320) ,
    cc_address varchar(320) ,
    bcc_address varchar(320) ,
    subject varchar(255) ,
    content_type varchar(255) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_store_email_setting (product_store_id, email_type) 
);

CREATE TABLE IF NOT EXISTS product_store_facility (
    id varchar(20) NOT NULL,
    product_store_id varchar(20) NOT NULL,
    facility_id varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    sequence_num decimal(20,0) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_store_facility (product_store_id, facility_id, from_date) 
);

CREATE TABLE IF NOT EXISTS product_store_keyword_ovrd (
    id varchar(20) NOT NULL,
    product_store_id varchar(20) NOT NULL,
    keyword varchar(60) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    target varchar(255) ,
    target_type_enum_id varchar(20) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_store_keyword_ovrd (product_store_id, keyword, from_date) 
);

CREATE TABLE IF NOT EXISTS product_store_payment_setting (
    id varchar(20) NOT NULL,
    product_store_id varchar(20) NOT NULL,
    payment_method_type_id varchar(20) NOT NULL,
    payment_service_type_enum_id varchar(20) NOT NULL,
    payment_service varchar(255) ,
    payment_custom_method_id varchar(20) ,
    payment_gateway_config_id varchar(20) ,
    payment_properties_path varchar(255) ,
    apply_to_all_products char(1) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_store_payment_setting (product_store_id, payment_method_type_id, payment_service_type_enum_id) 
);

CREATE TABLE IF NOT EXISTS product_store_promo_appl (
    id varchar(20) NOT NULL,
    product_store_id varchar(20) NOT NULL,
    product_promo_id varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    sequence_num decimal(20,0) ,
    manual_only char(1) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_store_promo_appl (product_store_id, product_promo_id, from_date) 
);

CREATE TABLE IF NOT EXISTS product_store_role (
    id varchar(20) NOT NULL,
    party_id varchar(20) NOT NULL,
    role_type_id varchar(20) NOT NULL,
    product_store_id varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    sequence_num decimal(20,0) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_store_role (party_id, role_type_id, product_store_id, from_date) 
);

CREATE TABLE IF NOT EXISTS product_store_shipment_meth (
    product_store_ship_meth_id varchar(20) NOT NULL,
    product_store_id varchar(20) ,
    shipment_method_type_id varchar(20) ,
    party_id varchar(20) ,
    role_type_id varchar(20) ,
    company_party_id varchar(20) ,
    min_weight decimal(18,6) ,
    max_weight decimal(18,6) ,
    min_size decimal(18,6) ,
    max_size decimal(18,6) ,
    min_total decimal(18,2) ,
    max_total decimal(18,2) ,
    allow_usps_addr char(1) ,
    require_usps_addr char(1) ,
    allow_company_addr char(1) ,
    require_company_addr char(1) ,
    include_no_charge_items char(1) ,
    include_feature_group varchar(20) ,
    exclude_feature_group varchar(20) ,
    include_geo_id varchar(20) ,
    exclude_geo_id varchar(20) ,
    service_name varchar(255) ,
    config_props varchar(255) ,
    shipment_custom_method_id varchar(20) ,
    shipment_gateway_config_id varchar(20) ,
    sequence_number decimal(20,0) ,
    allowance_percent decimal(18,6) ,
    minimum_price decimal(18,2) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`product_store_ship_meth_id`) 
);

CREATE TABLE IF NOT EXISTS product_subscription_resource (
    id varchar(20) NOT NULL,
    product_id varchar(20) NOT NULL,
    subscription_resource_id varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    purchase_from_date datetime(3) ,
    purchase_thru_date datetime(3) ,
    max_life_time decimal(20,0) ,
    max_life_time_uom_id varchar(20) ,
    available_time decimal(20,0) ,
    available_time_uom_id varchar(20) ,
    use_count_limit decimal(20,0) ,
    use_time decimal(20,0) ,
    use_time_uom_id varchar(20) ,
    use_role_type_id varchar(20) ,
    automatic_extend char(1) ,
    cancl_autm_ext_time decimal(20,0) ,
    cancl_autm_ext_time_uom_id varchar(20) ,
    grace_period_on_expiry decimal(20,0) ,
    grace_period_on_expiry_uom_id varchar(20) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_product_subscription_resource (product_id, subscription_resource_id, from_date) 
);

CREATE TABLE IF NOT EXISTS quantity_break (
    quantity_break_id varchar(20) NOT NULL,
    quantity_break_type_id varchar(20) ,
    from_quantity decimal(18,6) ,
    thru_quantity decimal(18,6) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`quantity_break_id`) 
);

CREATE TABLE IF NOT EXISTS quote (
    quote_id varchar(20) NOT NULL,
    quote_type_id varchar(20) ,
    party_id varchar(20) ,
    issue_date datetime(3) ,
    status_id varchar(20) ,
    currency_uom_id varchar(20) ,
    product_store_id varchar(20) ,
    sales_channel_enum_id varchar(20) ,
    valid_from_date datetime(3) ,
    valid_thru_date datetime(3) ,
    quote_name varchar(100) ,
    description varchar(255) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`quote_id`) 
);

CREATE TABLE IF NOT EXISTS quote_item (
    id varchar(20) NOT NULL,
    quote_id varchar(20) NOT NULL,
    quote_item_seq_id varchar(20) NOT NULL,
    product_id varchar(20) ,
    product_feature_id varchar(20) ,
    deliverable_type_id varchar(20) ,
    skill_type_id varchar(20) ,
    uom_id varchar(20) ,
    work_effort_id varchar(20) ,
    cust_request_id varchar(20) ,
    cust_request_item_seq_id varchar(20) ,
    quantity decimal(18,6) ,
    selected_amount decimal(18,6) ,
    quote_unit_price decimal(18,2) ,
    reserv_start datetime(3) ,
    reserv_length decimal(18,6) ,
    reserv_persons decimal(18,6) ,
    config_id varchar(20) ,
    estimated_delivery_date datetime(3) ,
    comments varchar(255) ,
    is_promo char(1) ,
    lead_time_days decimal(20,0) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_quote_item (quote_id, quote_item_seq_id) 
);

CREATE TABLE IF NOT EXISTS quote_role (
    id varchar(20) NOT NULL,
    quote_id varchar(20) NOT NULL,
    party_id varchar(20) NOT NULL,
    role_type_id varchar(20) NOT NULL,
    from_date datetime(3) ,
    thru_date datetime(3) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_quote_role (quote_id, party_id, role_type_id) 
);

CREATE TABLE IF NOT EXISTS quote_term (
    id varchar(20) NOT NULL,
    term_type_id varchar(20) NOT NULL,
    quote_id varchar(20) NOT NULL,
    quote_item_seq_id varchar(20) NOT NULL,
    term_value decimal(20,0) ,
    uom_id varchar(20) ,
    term_days decimal(20,0) ,
    text_value varchar(255) ,
    description varchar(255) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_quote_term (term_type_id, quote_id, quote_item_seq_id) 
);

CREATE TABLE IF NOT EXISTS recurrence_info (
    recurrence_info_id varchar(20) NOT NULL,
    start_date_time datetime(3) ,
    exception_date_times longtext ,
    recurrence_date_times longtext ,
    exception_rule_id varchar(20) ,
    recurrence_rule_id varchar(20) ,
    recurrence_count decimal(20,0) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`recurrence_info_id`) 
);

CREATE TABLE IF NOT EXISTS recurrence_rule (
    recurrence_rule_id varchar(20) NOT NULL,
    frequency varchar(60) ,
    until_date_time datetime(3) ,
    count_number decimal(20,0) ,
    interval_number decimal(20,0) ,
    by_second_list longtext ,
    by_minute_list longtext ,
    by_hour_list longtext ,
    by_day_list longtext ,
    by_month_day_list longtext ,
    by_year_day_list longtext ,
    by_week_no_list longtext ,
    by_month_list longtext ,
    by_set_pos_list longtext ,
    week_start varchar(60) ,
    x_name longtext ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`recurrence_rule_id`) 
);

CREATE TABLE IF NOT EXISTS security_group (
    group_id varchar(20) NOT NULL,
    group_name varchar(255) ,
    description varchar(255) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`group_id`) 
);

CREATE TABLE IF NOT EXISTS security_group_permission (
    id varchar(20) NOT NULL,
    group_id varchar(20) NOT NULL,
    permission_id varchar(60) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_security_group_permission (group_id, permission_id, from_date) 
);

CREATE TABLE IF NOT EXISTS shipment (
    shipment_id varchar(20) NOT NULL,
    shipment_type_id varchar(20) ,
    status_id varchar(20) ,
    primary_order_id varchar(20) ,
    primary_return_id varchar(20) ,
    primary_ship_group_seq_id varchar(20) ,
    picklist_bin_id varchar(20) ,
    estimated_ready_date datetime(3) ,
    estimated_ship_date datetime(3) ,
    estimated_ship_work_eff_id varchar(20) ,
    estimated_arrival_date datetime(3) ,
    estimated_arrival_work_eff_id varchar(20) ,
    latest_cancel_date datetime(3) ,
    estimated_ship_cost decimal(18,2) ,
    currency_uom_id varchar(20) ,
    handling_instructions varchar(255) ,
    origin_facility_id varchar(20) ,
    destination_facility_id varchar(20) ,
    origin_contact_mech_id varchar(20) ,
    origin_telecom_number_id varchar(20) ,
    destination_contact_mech_id varchar(20) ,
    destination_telecom_number_id varchar(20) ,
    party_id_to varchar(20) ,
    party_id_from varchar(20) ,
    additional_shipping_charge decimal(18,2) ,
    addtl_shipping_charge_desc varchar(255) ,
    created_date datetime(3) ,
    created_by_user_login varchar(250) ,
    last_modified_date datetime(3) ,
    last_modified_by_user_login varchar(250) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`shipment_id`) 
);

CREATE TABLE IF NOT EXISTS shipment_box_type (
    shipment_box_type_id varchar(20) NOT NULL,
    description varchar(255) ,
    dimension_uom_id varchar(20) ,
    box_length decimal(18,6) ,
    box_width decimal(18,6) ,
    box_height decimal(18,6) ,
    weight_uom_id varchar(20) ,
    box_weight decimal(18,6) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`shipment_box_type_id`) 
);

CREATE TABLE IF NOT EXISTS shipment_cost_estimate (
    shipment_cost_estimate_id varchar(20) NOT NULL,
    shipment_method_type_id varchar(20) ,
    carrier_party_id varchar(20) ,
    carrier_role_type_id varchar(20) ,
    product_store_ship_meth_id varchar(20) ,
    product_store_id varchar(20) ,
    party_id varchar(20) ,
    role_type_id varchar(20) ,
    geo_id_to varchar(20) ,
    geo_id_from varchar(20) ,
    weight_break_id varchar(20) ,
    weight_uom_id varchar(20) ,
    weight_unit_price decimal(18,2) ,
    quantity_break_id varchar(20) ,
    quantity_uom_id varchar(20) ,
    quantity_unit_price decimal(18,2) ,
    price_break_id varchar(20) ,
    price_uom_id varchar(20) ,
    price_unit_price decimal(18,2) ,
    order_flat_price decimal(18,2) ,
    order_price_percent decimal(18,6) ,
    order_item_flat_price decimal(18,2) ,
    shipping_price_percent decimal(18,6) ,
    product_feature_group_id varchar(20) ,
    oversize_unit decimal(18,6) ,
    oversize_price decimal(18,2) ,
    feature_percent decimal(18,6) ,
    feature_price decimal(18,2) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`shipment_cost_estimate_id`) 
);

CREATE TABLE IF NOT EXISTS shipment_item (
    id varchar(20) NOT NULL,
    shipment_id varchar(20) NOT NULL,
    shipment_item_seq_id varchar(20) NOT NULL,
    product_id varchar(20) ,
    quantity decimal(18,6) ,
    shipment_content_description varchar(255) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_shipment_item (shipment_id, shipment_item_seq_id) 
);

CREATE TABLE IF NOT EXISTS shipment_item_billing (
    id varchar(20) NOT NULL,
    shipment_id varchar(20) NOT NULL,
    shipment_item_seq_id varchar(20) NOT NULL,
    invoice_id varchar(20) NOT NULL,
    invoice_item_seq_id varchar(20) NOT NULL,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_shipment_item_billing (shipment_id, shipment_item_seq_id, invoice_id, invoice_item_seq_id) 
);

CREATE TABLE IF NOT EXISTS shipment_method_type (
    shipment_method_type_id varchar(20) NOT NULL,
    description varchar(255) ,
    sequence_num decimal(20,0) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`shipment_method_type_id`) 
);

CREATE TABLE IF NOT EXISTS shipment_package (
    id varchar(20) NOT NULL,
    shipment_id varchar(20) NOT NULL,
    shipment_package_seq_id varchar(20) NOT NULL,
    shipment_box_type_id varchar(20) ,
    date_created datetime(3) ,
    box_length decimal(18,6) ,
    box_height decimal(18,6) ,
    box_width decimal(18,6) ,
    dimension_uom_id varchar(20) ,
    weight decimal(18,6) ,
    weight_uom_id varchar(20) ,
    insured_value decimal(18,2) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_shipment_package (shipment_id, shipment_package_seq_id) 
);

CREATE TABLE IF NOT EXISTS shipment_package_content (
    id varchar(20) NOT NULL,
    shipment_id varchar(20) NOT NULL,
    shipment_package_seq_id varchar(20) NOT NULL,
    shipment_item_seq_id varchar(20) NOT NULL,
    quantity decimal(18,6) ,
    sub_product_id varchar(20) ,
    sub_product_quantity decimal(18,6) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_shipment_package_content (shipment_id, shipment_package_seq_id, shipment_item_seq_id) 
);

CREATE TABLE IF NOT EXISTS shipment_package_route_seg (
    id varchar(20) NOT NULL,
    shipment_id varchar(20) NOT NULL,
    shipment_package_seq_id varchar(20) NOT NULL,
    shipment_route_segment_id varchar(20) NOT NULL,
    tracking_code varchar(60) ,
    box_number varchar(60) ,
    label_image longblob ,
    label_intl_sign_image longblob ,
    label_html longtext ,
    label_printed char(1) ,
    international_invoice longblob ,
    package_transport_cost decimal(18,2) ,
    package_service_cost decimal(18,2) ,
    package_other_cost decimal(18,2) ,
    cod_amount decimal(18,2) ,
    insured_amount decimal(18,2) ,
    currency_uom_id varchar(20) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_shipment_package_route_seg (shipment_id, shipment_package_seq_id, shipment_route_segment_id) 
);

CREATE TABLE IF NOT EXISTS shipment_receipt (
    receipt_id varchar(20) NOT NULL,
    inventory_item_id varchar(20) ,
    product_id varchar(20) ,
    shipment_id varchar(20) ,
    shipment_item_seq_id varchar(20) ,
    shipment_package_seq_id varchar(20) ,
    order_id varchar(20) ,
    order_item_seq_id varchar(20) ,
    return_id varchar(20) ,
    return_item_seq_id varchar(20) ,
    rejection_id varchar(20) ,
    received_by_user_login_id varchar(250) ,
    datetime_received datetime(3) ,
    item_description varchar(255) ,
    quantity_accepted decimal(18,6) ,
    quantity_rejected decimal(18,6) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`receipt_id`) 
);

CREATE TABLE IF NOT EXISTS shipment_route_segment (
    id varchar(20) NOT NULL,
    shipment_id varchar(20) NOT NULL,
    shipment_route_segment_id varchar(20) NOT NULL,
    delivery_id varchar(20) ,
    origin_facility_id varchar(20) ,
    dest_facility_id varchar(20) ,
    origin_contact_mech_id varchar(20) ,
    origin_telecom_number_id varchar(20) ,
    dest_contact_mech_id varchar(20) ,
    dest_telecom_number_id varchar(20) ,
    carrier_party_id varchar(20) ,
    shipment_method_type_id varchar(20) ,
    carrier_service_status_id varchar(20) ,
    carrier_delivery_zone varchar(60) ,
    carrier_restriction_codes varchar(60) ,
    carrier_restriction_desc longtext ,
    billing_weight decimal(18,6) ,
    billing_weight_uom_id varchar(20) ,
    actual_transport_cost decimal(18,2) ,
    actual_service_cost decimal(18,2) ,
    actual_other_cost decimal(18,2) ,
    actual_cost decimal(18,2) ,
    currency_uom_id varchar(20) ,
    actual_start_date datetime(3) ,
    actual_arrival_date datetime(3) ,
    estimated_start_date datetime(3) ,
    estimated_arrival_date datetime(3) ,
    tracking_id_number varchar(60) ,
    tracking_digest longtext ,
    updated_by_user_login_id varchar(250) ,
    last_updated_date datetime(3) ,
    home_delivery_type varchar(20) ,
    home_delivery_date datetime(3) ,
    third_party_account_number varchar(20) ,
    third_party_postal_code varchar(20) ,
    third_party_country_geo_code varchar(20) ,
    ups_high_value_report longblob ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_shipment_route_segment (shipment_id, shipment_route_segment_id) 
);

CREATE TABLE IF NOT EXISTS shipment_status (
    id varchar(20) NOT NULL,
    status_id varchar(20) NOT NULL,
    shipment_id varchar(20) NOT NULL,
    status_date datetime(3) ,
    change_by_user_login_id varchar(250) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_shipment_status (status_id, shipment_id) 
);

CREATE TABLE IF NOT EXISTS subscription_resource (
    subscription_resource_id varchar(20) NOT NULL,
    parent_resource_id varchar(20) ,
    description varchar(255) ,
    content_id varchar(20) ,
    web_site_id varchar(20) ,
    service_name_on_expiry varchar(255) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`subscription_resource_id`) 
);

CREATE TABLE IF NOT EXISTS supplier_product (
    id varchar(20) NOT NULL,
    product_id varchar(20) NOT NULL,
    party_id varchar(20) NOT NULL,
    available_from_date datetime(3) NOT NULL,
    available_thru_date datetime(3) ,
    supplier_pref_order_id varchar(20) ,
    supplier_rating_type_id varchar(20) ,
    standard_lead_time_days decimal(18,6) ,
    minimum_order_quantity decimal(18,6) NOT NULL,
    order_qty_increments decimal(18,6) ,
    units_included decimal(18,6) ,
    quantity_uom_id varchar(20) ,
    agreement_id varchar(20) ,
    agreement_item_seq_id varchar(20) ,
    last_price decimal(18,3) ,
    shipping_price decimal(18,3) ,
    currency_uom_id varchar(20) NOT NULL,
    supplier_product_name varchar(100) ,
    supplier_product_id varchar(20) ,
    can_drop_ship char(1) ,
    comments varchar(255) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_supplier_product (product_id, party_id, available_from_date, minimum_order_quantity, currency_uom_id) 
);

CREATE TABLE IF NOT EXISTS telecom_number (
    contact_mech_id varchar(20) NOT NULL,
    country_code varchar(10) ,
    area_code varchar(10) ,
    contact_number varchar(60) ,
    ask_for_name varchar(100) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`contact_mech_id`) 
);

CREATE TABLE IF NOT EXISTS user_login (
    user_login_id varchar(250) NOT NULL,
    current_password varchar(255) ,
    password_hint varchar(255) ,
    is_system char(1) ,
    enabled char(1) ,
    has_logged_out char(1) ,
    require_password_change char(1) ,
    last_currency_uom varchar(20) ,
    last_locale varchar(10) ,
    last_time_zone varchar(60) ,
    disabled_date_time datetime(3) ,
    successive_failed_logins decimal(20,0) ,
    external_auth_id varchar(250) ,
    user_ldap_dn varchar(250) ,
    disabled_by varchar(250) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    party_id varchar(20) ,
    
    PRIMARY KEY (`user_login_id`) 
);

CREATE TABLE IF NOT EXISTS user_login_security_group (
    id varchar(20) NOT NULL,
    user_login_id varchar(250) NOT NULL,
    group_id varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_user_login_security_group (user_login_id, group_id, from_date) 
);

CREATE TABLE IF NOT EXISTS web_analytics_config (
    id varchar(20) NOT NULL,
    web_site_id varchar(20) NOT NULL,
    web_analytics_type_id varchar(20) NOT NULL,
    web_analytics_code longtext ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_web_analytics_config (web_site_id, web_analytics_type_id) 
);

CREATE TABLE IF NOT EXISTS web_site (
    web_site_id varchar(20) NOT NULL,
    site_name varchar(100) ,
    http_host varchar(255) ,
    http_port varchar(10) ,
    https_host varchar(255) ,
    https_port varchar(10) ,
    enable_https char(1) ,
    webapp_path varchar(255) ,
    standard_content_prefix varchar(2000) ,
    secure_content_prefix varchar(2000) ,
    cookie_domain varchar(255) ,
    visual_theme_set_id varchar(20) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    product_store_id varchar(20) ,
    allow_product_store_change char(1) ,
    hosted_path_alias varchar(60) ,
    is_default char(1) ,
    display_maintenance_page char(1) ,
    
    PRIMARY KEY (`web_site_id`) 
);

CREATE TABLE IF NOT EXISTS work_effort (
    work_effort_id varchar(20) NOT NULL,
    work_effort_type_id varchar(20) ,
    current_status_id varchar(20) ,
    last_status_update datetime(3) ,
    work_effort_purpose_type_id varchar(20) ,
    work_effort_parent_id varchar(20) ,
    scope_enum_id varchar(20) ,
    priority decimal(20,0) ,
    percent_complete decimal(20,0) ,
    work_effort_name varchar(100) ,
    show_as_enum_id varchar(20) ,
    send_notification_email char(1) ,
    description varchar(255) ,
    location_desc varchar(255) ,
    estimated_start_date datetime(3) ,
    estimated_completion_date datetime(3) ,
    actual_start_date datetime(3) ,
    actual_completion_date datetime(3) ,
    estimated_milli_seconds double ,
    estimated_setup_millis double ,
    estimate_calc_method varchar(20) ,
    actual_milli_seconds double ,
    actual_setup_millis double ,
    total_milli_seconds_allowed double ,
    total_money_allowed decimal(18,2) ,
    money_uom_id varchar(20) ,
    special_terms varchar(255) ,
    time_transparency decimal(20,0) ,
    universal_id varchar(60) ,
    source_reference_id varchar(60) ,
    fixed_asset_id varchar(20) ,
    facility_id varchar(20) ,
    info_url varchar(255) ,
    recurrence_info_id varchar(20) ,
    temp_expr_id varchar(20) ,
    runtime_data_id varchar(20) ,
    note_id varchar(20) ,
    service_loader_name varchar(100) ,
    quantity_to_produce decimal(18,6) ,
    quantity_produced decimal(18,6) ,
    quantity_rejected decimal(18,6) ,
    reserv_persons decimal(18,6) ,
    reserv2nd_p_p_perc decimal(18,6) ,
    reserv_nth_p_p_perc decimal(18,6) ,
    accommodation_map_id varchar(20) ,
    accommodation_spot_id varchar(20) ,
    revision_number decimal(20,0) ,
    created_date datetime(3) ,
    created_by_user_login varchar(250) ,
    last_modified_date datetime(3) ,
    last_modified_by_user_login varchar(250) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    sequence_num decimal(20,0) ,
    
    PRIMARY KEY (`work_effort_id`) 
);

CREATE TABLE IF NOT EXISTS work_effort_assoc (
    id varchar(20) NOT NULL,
    work_effort_id_from varchar(20) NOT NULL,
    work_effort_id_to varchar(20) NOT NULL,
    work_effort_assoc_type_id varchar(20) NOT NULL,
    sequence_num decimal(20,0) ,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_work_effort_assoc (work_effort_id_from, work_effort_id_to, work_effort_assoc_type_id, from_date) 
);

CREATE TABLE IF NOT EXISTS work_effort_good_standard (
    id varchar(20) NOT NULL,
    work_effort_id varchar(20) NOT NULL,
    product_id varchar(20) NOT NULL,
    work_effort_good_std_type_id varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    status_id varchar(20) ,
    estimated_quantity double ,
    estimated_cost decimal(18,2) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`) , UNIQUE KEY unique_work_effort_good_standard (work_effort_id, product_id, work_effort_good_std_type_id, from_date) 
);

