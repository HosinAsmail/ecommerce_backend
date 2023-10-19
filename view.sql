CREATE OR REPLACE VIEW productsview as SELECT products.* , categories.* FROM products INNER JOIN categories ON categories.categories_id=products.products_categories;





CREATE OR REPLACE VIEW ordersview as SELECT orders.*,address.* FROM orders LEFT JOIN address ON orders.orders_address=address.address_id;


CREATE OR REPLACE VIEW cartsview as SELECT productsview.*, cart.*,(products_price - (products_price*products_discount/100)) as products_price_discount 
FROM productsview
INNER JOIN cart ON cart.cart_productsid = productsview.products_id;

-- SELECT cartsview.*,ordersview.* FROM ordersview INNER JOIN cartsview ON ordersview.orders_usersid=cartsview.cart_usersid WHERE cartsview.cart_orders!=0;

CREATE OR REPLACE VIEW topselling as SELECT COUNT(cart.cart_productsid) as counttimes,cart.*,products.*,(products_price - (products_price*products_discount/100)) as products_price_discount FROM cart INNER JOIN products ON products.products_id=cart.cart_productsid WHERE cart_orders!=0 GROUP BY cart_productsid;