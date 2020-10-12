//%attributes = {"invisible":true,"preemptive":"capable"}

var $signal; $1 : Object
var $products : cs:C1710.ProductsSelection
var $product : cs:C1710.ProductsEntity

$signal:=$1
$products:=$signal.products

Use ($signal)
	$signal.catalog:=New shared collection:C1527
End use 

For each ($product; $products)
	$signal.catalog.push(New shared object:C1526("name"; $product.name; "price"; $product.price))
End for each 

$signal.trigger()