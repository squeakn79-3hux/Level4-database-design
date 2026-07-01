# Relationships

The database uses primary and foreign keys to connect the main business entities.

- `inventory_table` field `ProductID(FK)` references `product_table` field `Product ID`.
- `product_table` field `CategoryID(FK)` references `category_table` field `CategoryID`.
- `product_table` field `SupplierID(FK)` references `supplier_table` field `SupplierID`.
- `sold_relationship_table` field `Sales_TransactionID(FK)` references `sales_table` field `Sales Transaction ID`.

## Relationship Summary

- Suppliers provide products.
- Products belong to categories.
- Inventory records track product stock levels.
- Sales records store transaction information.
- The sold relationship table connects products to sales transactions.
