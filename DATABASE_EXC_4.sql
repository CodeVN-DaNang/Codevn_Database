create database DATABASE_EXC_4;
use DATABASE_EXC_4;

create table area(
    area_id VARCHAR(45) PRIMARY KEY,
    area_name NVARCHAR(45)
);

create table customer(
    customer_id VARCHAR(45) PRIMARY KEY,
    customer_name NVARCHAR(45),
    customer_storeName NVARCHAR(45),
    customer_address NVARCHAR(45),
    customer_area_id VARCHAR(45),
    FOREIGN KEY (customer_area_id) REFERENCES area(area_id),
    customer_phone VARCHAR(45),
    customer_email VARCHAR(45),
);

create table TypeProduct(
    TypeProduct_id VARCHAR(45) PRIMARY KEY,
    TypeProduct_name NVARCHAR(45)
);

create TABLE Service(
    service_id VARCHAR(45) PRIMARY KEY,
    service_name VARCHAR(45)
);

create table Interval(
    interval_id VARCHAR(45) PRIMARY KEY,
    interval_description VARCHAR(45)
);

create table DeliveryMember(
    deliveryMember_id VARCHAR(45) PRIMARY KEY,
    deliveryMember_name VARCHAR(45),
    deliveryMember_dob DATE,
    deliveryMember_gender BIT,
    deliveryMember_phone VARCHAR(45),
    deliveryMember_address VARCHAR(45)
);

create TABLE DeliveryRegistry(
    interval_id VARCHAR(45),
    FOREIGN KEY (interval_id) REFERENCES INTERVAL(interval_id),
    deliveryMember_id VARCHAR(45),
    FOREIGN KEY (deliveryMember_id) REFERENCES DeliveryMember(deliveryMember_id),
    PRIMARY KEY (interval_id, deliveryMember_id)
);

create table [order](
    order_id VARCHAR(45) PRIMARY KEY,
    order_toName VARCHAR(45),
    order_toAddress VARCHAR(45),
    order_toPhone VARCHAR(45),
    order_toDay VARCHAR(45),
    order_payment VARCHAR(45),
    order_statusConfirm VARCHAR(45),
    order_statusDelivery VARCHAR(45),
    customer_id VARCHAR(45),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    deliveryMember_id VARCHAR(45),
    FOREIGN KEY (deliveryMember_id) REFERENCES DeliveryMember(deliveryMember_id),
    service_id VARCHAR(45),
    FOREIGN KEY (service_id) REFERENCES Service(service_id),
    area_id VARCHAR(45),
    FOREIGN KEY (area_id) REFERENCES Area(area_id),
    interval_id VARCHAR(45),
    FOREIGN KEY (interval_id) REFERENCES Interval(interval_id)
);

create table DetailDelivery(
    detailDelivery_id VARCHAR(45),
    FOREIGN KEY (detailDelivery_id) REFERENCES [order](order_id),
    detailDelivery_name VARCHAR(45),
    detailDelivery_amount int,
    detailDelivery_weight DECIMAL(2,2),
    typeProduct_id VARCHAR(45),
    FOREIGN KEY (typeProduct_id) REFERENCES TypeProduct(typeProduct_id),
    detailDelivery_deposit int,
    PRIMARY KEY (detailDelivery_id, detailDelivery_name)
);


