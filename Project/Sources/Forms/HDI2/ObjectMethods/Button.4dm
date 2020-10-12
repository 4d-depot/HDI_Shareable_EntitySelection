
var $status : Object

$status:=Form:C1466.product.save()

Form:C1466.products.add(Form:C1466.product)

Form:C1466.products:=Form:C1466.products

Form:C1466.product:=ds:C1482.Products.new()

Form:C1466.index:=Form:C1466.index+1
If (Form:C1466.index>=Form:C1466.suggestions.length)
	Form:C1466.index:=0
End if 

Form:C1466.product.name:=Form:C1466.suggestions[Form:C1466.index].name
Form:C1466.product.price:=Form:C1466.suggestions[Form:C1466.index].price

handleButtons