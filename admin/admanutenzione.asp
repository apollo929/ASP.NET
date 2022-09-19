<!--#include file=connessionesql.inc-->
<%
ON ERROR RESUME NEXT 

'CARRELLO NUOVI
sqlupd="ALTER TABLE carrello ADD COLUMN urlfoto VARCHAR(255) AFTER fornitore;"
connm.execute(sqlupd)
sqlupd="ALTER TABLE carrello ADD COLUMN aliqiva DOUBLE;"
connm.execute(sqlupd)


'SHOP PRODUCTS NEW
sqlupd="ALTER TABLE shop_products ADD COLUMN iva VARCHAR(2) NOT NULL DEFAULT 'si';"
connm.execute(sqlupd)
sqlupd="ALTER TABLE shop_products ADD COLUMN cprice1 DOUBLE NOT NULL DEFAULT '0';"
connm.execute(sqlupd)
sqlupd="ALTER TABLE shop_products ADD COLUMN cprice2 DOUBLE NOT NULL DEFAULT '0';"
connm.execute(sqlupd)
sqlupd="ALTER TABLE shop_products ADD COLUMN cprice3 DOUBLE NOT NULL DEFAULT '0';"
connm.execute(sqlupd)
sqlupd="ALTER TABLE shop_products ADD COLUMN qta1 DOUBLE NOT NULL DEFAULT '0';"
connm.execute(sqlupd)
sqlupd="ALTER TABLE shop_products ADD COLUMN qta2 DOUBLE NOT NULL DEFAULT '0';"
connm.execute(sqlupd)
sqlupd="ALTER TABLE shop_products ADD COLUMN qta3 DOUBLE NOT NULL DEFAULT '0';"
connm.execute(sqlupd)
sqlupd="ALTER TABLE shop_products ADD COLUMN aliqiva DOUBLE NOT NULL DEFAULT '22';"
connm.execute(sqlupd)
sqlupd="ALTER TABLE shop_products ADD COLUMN homepage tinyint(1) NOT NULL DEFAULT '0';"
connm.execute(sqlupd)


sqlupd="ALTER TABLE storico ADD COLUMN aliqiva DOUBLE;"
connm.execute(sqlupd)
sqlupd="ALTER TABLE ordine ADD COLUMN aliqiva DOUBLE;"
connm.execute(sqlupd)


%>
<!--#include file=closesql.inc-->