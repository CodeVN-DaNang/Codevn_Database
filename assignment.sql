CREATE DATABASE assignment;
USE assignment;

create table TypeCustomer(
    idTypeCustomer int PRIMARY KEY IDENTITY(1,1),
    nameTypeCustomer VARCHAR(45)
);

create table TypePay(
    idPay int PRIMARY KEY IDENTITY(1,1),
    namePay VARCHAR(45)
);

CREATE TABLE Customer(
    idCustomer int PRIMARY KEY IDENTITY(1,1),
    nameCustomer VARCHAR(45),
    genderCustomer VARCHAR(45),
    ageCustomer int,
    phoneNumberCustomer VARCHAR(45),
    emailCustomer VARCHAR(45),
    addressCustomer VARCHAR(45),
    idCardCustomer VARCHAR(45),
    idTypeCustomer int,
    FOREIGN KEY (idTypeCustomer) REFERENCES TypeCustomer(idTypeCustomer),
    describeProduct VARCHAR(45),
    idPay int,
    FOREIGN KEY (idPay) REFERENCES TypePay(idPay)
);

CREATE TABLE TypeProduct(
    idTypeProduct int PRIMARY KEY IDENTITY(1,1),
    nameTypeProduct VARCHAR(45)
);

CREATE TABLE Product(
    idProduct int PRIMARY KEY IDENTITY(1,1),
    nameProduct VARCHAR(45),
    price VARCHAR(45),
    manufacturer VARCHAR(45),
    manufactureDate VARCHAR(45),
    expirationDate VARCHAR(45),
    quantityInStock int,
    idTypeProduct int,
    FOREIGN KEY (idTypeProduct) REFERENCES TypeProduct(idTypeProduct)
);

CREATE TABLE TypeShop(
    idTypeShop int PRIMARY KEY IDENTITY(1,1),
    nameTypeShop VARCHAR(45)
);

CREATE TABLE TypeShipping(
    idTypeShipping int PRIMARY KEY IDENTITY(1,1),
    nameTypeShipping VARCHAR(45)
);

CREATE TABLE Shop(
    idShop int PRIMARY KEY IDENTITY(1,1),
    nameShop VARCHAR(45),
    descriptionShop VARCHAR(45),
    addressShop VARCHAR(45),
    emailShop VARCHAR(45),
    numberPhoneShop VARCHAR(45),
    idTypeShop int,
    FOREIGN KEY (idTypeShop) REFERENCES TypeShop(idTypeShop),
    idTypeShipping int,
    FOREIGN KEY (idTypeShipping) REFERENCES TypeShipping(idTypeShipping)
);

--    private int orderId;
--     private String dateModified;
--     private boolean shopStatus;
--     private Product product;
--     private int amountProduct;
--     private Customer customer;
--     private boolean customerStatus;
CREATE TABLE Order_(
    idOrder int PRIMARY KEY IDENTITY(1,1),
    dateModified VARCHAR(45),
    shopStatus int,
    idProduct int,
    FOREIGN KEY (idProduct) REFERENCES Product(idProduct),
    amountProduct int,
    idCustomer int,
    FOREIGN KEY (idCustomer) REFERENCES Customer(idCustomer),
    customerStatus int
);


-- Adding data to TypeCustomer table
INSERT INTO TypeCustomer (nameTypeCustomer) VALUES
('Regular'),
('Premium'),
('Gold'),
('Silver'),
('Bronze');

-- Adding data to TypePay table
INSERT INTO TypePay (namePay) VALUES
('Credit Card'),
('Cash'),
('PayPal'),
('Bank Transfer'),
('Mobile Payment');

-- Adding data to Customer table
INSERT INTO Customer (nameCustomer, genderCustomer, ageCustomer, phoneNumberCustomer, emailCustomer, addressCustomer, idCardCustomer, idTypeCustomer, describeProduct, idPay) VALUES
('John Doe', 'Male', 30, '123-456-7890', 'john@example.com', '123 Main St', 'ABC123', 1, 'Regular customer', 1),
('Jane Smith', 'Female', 25, '987-654-3210', 'jane@example.com', '456 Oak St', 'XYZ456', 2, 'VIP customer', 2),
('Bob Johnson', 'Male', 40, '555-123-4567', 'bob@example.com', '789 Pine St', 'PQR789', 3, 'Gold member', 3),
('Alice Williams', 'Female', 35, '777-888-9999', 'alice@example.com', '321 Elm St', 'LMN012', 4, 'Special customer', 4),
('Chris Evans', 'Male', 28, '333-444-5555', 'chris@example.com', '567 Birch St', 'DEF345', 5, 'Preferred customer', 5);

-- Adding data to TypeProduct table
INSERT INTO TypeProduct (nameTypeProduct) VALUES
('Electronics'),
('Clothing'),
('Books'),
('Home Appliances'),
('Toys');

-- Adding data to Product table
INSERT INTO Product (nameProduct, price, manufacturer, manufactureDate, expirationDate, quantityInStock, idTypeProduct) VALUES
('Laptop', '1000', 'ABC Electronics', '2023-01-15', '2025-01-15', 50, 1),
('T-shirt', '20', 'XYZ Clothing', '2023-02-01', 'N/A', 100, 2),
('Book', '15', 'ReadMore Publications', '2022-12-10', 'N/A', 75, 3),
('Refrigerator', '800', 'CoolTech Appliances', '2022-11-20', '2025-11-20', 30, 4),
('Action Figure', '10', 'ToyCo', '2023-03-05', 'N/A', 200, 5);

-- Adding data to TypeShop table
INSERT INTO TypeShop (nameTypeShop) VALUES
('Electronics Store'),
('Clothing Store'),
('Bookstore'),
('Appliance Store'),
('Toy Store');

-- Adding data to TypeShipping table
INSERT INTO TypeShipping (nameTypeShipping) VALUES
('Standard Shipping'),
('Express Shipping'),
('Free Shipping'),
('Next-Day Delivery'),
('Pickup at Store');

-- Adding data to Shop table
INSERT INTO Shop (nameShop, descriptionShop, addressShop, emailShop, numberPhoneShop, idTypeShop, idTypeShipping) VALUES
('ElectroZone', 'Your one-stop electronics shop', '789 Tech Blvd', 'info@electrozone.com', '555-123-7890', 1, 2),
('FashionEmporium', 'Trendy fashion for everyone', '456 Style St', 'info@fashionemporium.com', '555-987-6543', 2, 3),
('BookHaven', 'Explore the world of literature', '123 Reader Lane', 'info@bookhaven.com', '555-567-8901', 3, 1),
('ApplianceWorld', 'Quality home appliances', '321 Home St', 'info@applianceworld.com', '555-234-5678', 4, 4),
('ToyLand', 'Toys for kids of all ages', '567 Play St', 'info@toyland.com', '555-678-9012', 5, 5);

-- Adding data to Order_ table
INSERT INTO Order_ (dateModified, shopStatus, idProduct, amountProduct, idCustomer, customerStatus) VALUES
('2024-01-23', 1, 1, 2, 1, 1),
('2024-01-24', 1, 3, 1, 2, 1),
('2024-01-25', 1, 5, 3, 3, 1),
('2024-01-26', 1, 2, 4, 4, 1),
('2024-01-27', 1, 4, 2, 5, 1);





