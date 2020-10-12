//%attributes = {"invisible":true}

var $notDroped : cs:C1710.ProductsSelection

TRUNCATE TABLE:C1051([Products:3])
SET DATABASE PARAMETER:C642([Products:3]; Table sequence number:K37:31; 0)

$notDroped:=ds:C1482.Products.all().drop()