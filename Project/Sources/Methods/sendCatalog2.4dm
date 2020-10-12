//%attributes = {"invisible":true,"preemptive":"capable"}

var $info; $1 : Object
var $products : cs:C1710.ProductsSelection
var $product : cs:C1710.ProductsEntity

$info:=$1
$products:=$info.products

Use ($info)
	$info.catalog:=New shared collection:C1527
End use 

For each ($product; $products)
	$info.catalog.push(New shared object:C1526("name"; $product.name+" ("+String:C10(Year of:C25($info.date))+")"; "price"; $product.price))
End for each 