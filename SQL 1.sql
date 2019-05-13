CREATE TABLE roles
(
    id INT NOT NULL UNIQUE,
    "name"  VARCHAR(255) NOT NULL PRIMARY KEY
 );


CREATE TABLE UserInfo
(
    id INT NOT NULL PRIMARY KEY, 
    "name" VARCHAR(255), 
     surname VARCHAR(255)

);


CREATE TABLE "User"
(
    id INT NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL PRIMARY KEY, 
    password VARCHAR(255) NOT NULL, 
    info INT NOT NULL UNIQUE,
    CONSTRAINT user_info_id FOREIGN KEY (info) references UserInfo(id),
    "role" INT NOT NULL,
    CONSTRAINT role_info_id FOREIGN KEY ("role") references Roles(id)
);



CREATE TABLE "Order"
(
    id INT NOT NULL PRIMARY KEY,
    "user" INT NOT NULL,
    CONSTRAINT order_use_id FOREIGN KEY ("user") references "User"(id),
    created timestamp NOT NULL
);



CREATE TABLE Supplier
(
    id INT NOT NULL UNIQUE,
    "name" VARCHAR(255) PRIMARY KEY NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(255) NOT NULL,
    representative VARCHAR(255)


);

CREATE TABLE Product
(
    id INT NOT NULL UNIQUE,
    code VARCHAR(255) PRIMARY KEY NOT NULL,
    title VARCHAR(255) NOT NULL,
    supplier INT NOT NULL,
    CONSTRAINT product_supplier_id FOREIGN KEY (supplier) references Supplier(id),
    initial_price DOUBLE NOT NULL,
    retail_value DOUBLE NOT NULL
    
);


CREATE TABLE Order2Product
(
"order" INT NOT NULL,
product INT NOT NULL,
CONSTRAINT order_id FOREIGN KEY ("order") references "Order"(id),
CONSTRAINT product_id FOREIGN KEY (product) references Product(id)
);