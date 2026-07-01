# Tables

## `category_table`

Stores product category information.

| Field | Type |
|---|---|
| `CategoryID` | `varchar(10) NOT NULL` |
| `CategoryName` | `varchar(45) DEFAULT NULL` |

Primary key: ``CategoryID``


## `inventory_table`

Tracks stock quantities, stock on order and quantities sold.

| Field | Type |
|---|---|
| `InventoryID` | `varchar(10) NOT NULL` |
| `Quantity_Sold` | `int DEFAULT NULL` |
| `Quantity_on_Order` | `int DEFAULT NULL` |
| `Current_Stock_Levels` | `int DEFAULT NULL` |
| `ProductID(FK)` | `varchar(10) DEFAULT NULL` |

Primary key: ``InventoryID``


## `product_table`

Stores product details and links each product to a supplier and category.

| Field | Type |
|---|---|
| `Product ID` | `varchar(10) NOT NULL` |
| `Product Name` | `varchar(45) DEFAULT NULL` |
| `Description` | `varchar(60) DEFAULT NULL` |
| `Price` | `decimal(10` |
| `SupplierID(FK)` | `varchar(10) DEFAULT NULL` |
| `CategoryID(FK)` | `varchar(45) DEFAULT NULL` |

Primary key: ``Product ID``


## `sales_table`

Stores sales transaction information.

| Field | Type |
|---|---|
| `Sales Transaction ID` | `varchar(10) NOT NULL` |
| `Date` | `date DEFAULT NULL` |
| `Time` | `time DEFAULT NULL` |
| `Total Sales Amount` | `decimal(10` |

Primary key: ``Sales Transaction ID``


## `sold_relationship_table`

Links sales transactions to the products sold.

| Field | Type |
|---|---|
| `ProductID(FK)` | `varchar(10) NOT NULL` |
| `Sales_TransactionID(FK)` | `varchar(10) NOT NULL` |
| `Quantities` | `int DEFAULT NULL` |

Primary key: ``ProductID(FK`


## `supplier_table`

Stores supplier contact and address information.

| Field | Type |
|---|---|
| `SupplierID` | `varchar(10) NOT NULL` |
| `Supplier_Name` | `varchar(45) DEFAULT NULL` |
| `Address` | `varchar(45) DEFAULT NULL` |
| `Contact_Number` | `varchar(20) DEFAULT NULL` |

Primary key: ``SupplierID``

