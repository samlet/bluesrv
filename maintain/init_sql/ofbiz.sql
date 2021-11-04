DROP TABLE IF EXISTS `item_issuance`;
CREATE TABLE item_issuance (
    id bigint(20) NOT NULL,
    nss varchar(20) NOT NULL,
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
    
    PRIMARY KEY (`id`),
    UNIQUE KEY unique_item_issuance (nss)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `order_item_ship_group`;
CREATE TABLE order_item_ship_group (
    id bigint(20) NOT NULL,
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
    
    PRIMARY KEY (`id`),
    UNIQUE KEY unique_order_item_ship_group (order_id, ship_group_seq_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `order_role`;
CREATE TABLE order_role (
    id bigint(20) NOT NULL,
    order_id varchar(20) NOT NULL,
    party_id varchar(20) NOT NULL,
    role_type_id varchar(20) NOT NULL,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`),
    UNIQUE KEY unique_order_role (order_id, party_id, role_type_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `party`;
CREATE TABLE party (
    id bigint(20) NOT NULL,
    nss varchar(20) NOT NULL,
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
    
    PRIMARY KEY (`id`),
    UNIQUE KEY unique_party (nss)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `party_geo_point`;
CREATE TABLE party_geo_point (
    id bigint(20) NOT NULL,
    party_id varchar(20) NOT NULL,
    geo_point_id varchar(20) NOT NULL,
    from_date datetime(3) NOT NULL,
    thru_date datetime(3) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`),
    UNIQUE KEY unique_party_geo_point (party_id, geo_point_id, from_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `party_group`;
CREATE TABLE party_group (
    id bigint(20) NOT NULL,
    nss varchar(20) NOT NULL,
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
    
    PRIMARY KEY (`id`),
    UNIQUE KEY unique_party_group (nss)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `party_role`;
CREATE TABLE party_role (
    id bigint(20) NOT NULL,
    party_id varchar(20) NOT NULL,
    role_type_id varchar(20) NOT NULL,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`),
    UNIQUE KEY unique_party_role (party_id, role_type_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `party_status`;
CREATE TABLE party_status (
    id bigint(20) NOT NULL,
    status_id varchar(20) NOT NULL,
    party_id varchar(20) NOT NULL,
    status_date datetime(3) NOT NULL,
    change_by_user_login_id varchar(250) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`),
    UNIQUE KEY unique_party_status (status_id, party_id, status_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `person`;
CREATE TABLE person (
    id bigint(20) NOT NULL,
    nss varchar(20) NOT NULL,
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
    
    PRIMARY KEY (`id`),
    UNIQUE KEY unique_person (nss)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `product`;
CREATE TABLE product (
    id bigint(20) NOT NULL,
    nss varchar(20) NOT NULL,
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
    
    PRIMARY KEY (`id`),
    UNIQUE KEY unique_product (nss)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `shipment`;
CREATE TABLE shipment (
    id bigint(20) NOT NULL,
    nss varchar(20) NOT NULL,
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
    
    PRIMARY KEY (`id`),
    UNIQUE KEY unique_shipment (nss)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `shipment_item`;
CREATE TABLE shipment_item (
    id bigint(20) NOT NULL,
    shipment_id varchar(20) NOT NULL,
    shipment_item_seq_id varchar(20) NOT NULL,
    product_id varchar(20) ,
    quantity decimal(18,6) ,
    shipment_content_description varchar(255) ,
    last_updated_stamp datetime(3) ,
    created_stamp datetime(3) ,
    
    PRIMARY KEY (`id`),
    UNIQUE KEY unique_shipment_item (shipment_id, shipment_item_seq_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `user_login`;
CREATE TABLE user_login (
    id bigint(20) NOT NULL,
    nss varchar(20) NOT NULL,
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
    
    PRIMARY KEY (`id`),
    UNIQUE KEY unique_user_login (nss)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

