
var btnTrace : Boolean

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		btnTrace:=False:C215
		
		ARRAY TEXT:C222(_TabTitles; 0)
		ARRAY TEXT:C222(_Descriptions; 0)
		ARRAY TEXT:C222(_TabLineCode; 0)
		
		READ ONLY:C145([INFO:1])
		QUERY:C277([INFO:1]; [INFO:1]PageNumber:4<=9)
		ORDER BY:C49([INFO:1]; [INFO:1]PageNumber:4; >)
		SELECTION TO ARRAY:C260([INFO:1]TabTitle:3; _TabTitles; [INFO:1]Description:2; _Descriptions)
		
		QUERY:C277([INFO:1]; [INFO:1]PageNumber:4>=10)
		ORDER BY:C49([INFO:1]; [INFO:1]PageNumber:4; >)
		SELECTION TO ARRAY:C260([INFO:1]Description:2; _TabLineCode)
		
		Form:C1466.invoices:=ds:C1482.Invoices.all()
		
		Form:C1466.suggestions:=New collection:C1472()
		Form:C1466.suggestions.push(New object:C1471("name"; "Paper"; "price"; 10))
		Form:C1466.suggestions.push(New object:C1471("name"; "Ink"; "price"; 20))
		Form:C1466.suggestions.push(New object:C1471("name"; "Pencil"; "price"; 5))
		
		manageTexts
		
		RW
		
	: (Form event code:C388=On Page Change:K2:54)
		
		//Page 2
		Form:C1466.acknowledge:=New collection:C1472
		Form:C1466.reminder:=New collection:C1472
		
		If (Num:C11(codeWindow)#0)
			CALL FORM:C1391(codeWindow; "fillFunctionCode"; FORM Get current page:C276)
		End if 
		
		//Page 3
		Form:C1466.products:=ds:C1482.Products.newSelection()
		Form:C1466.product:=ds:C1482.Products.new()
		Form:C1466.index:=0
		Form:C1466.product.name:=Form:C1466.suggestions[Form:C1466.index].name
		Form:C1466.product.price:=Form:C1466.suggestions[Form:C1466.index].price
		Form:C1466.shared:=False:C215
		Form:C1466.catalog:=New collection:C1472
		Form:C1466.error:=""
		OBJECT SET VISIBLE:C603(*; "ErrorNotShared"; False:C215)
		OBJECT SET VISIBLE:C603(*; "Catalog@"; False:C215)
		handleButtons
		
		//Page 4
		Form:C1466.obj:=New object:C1471()
		Form:C1466.obj.date:=Current date:C33()
		Form:C1466.obj.products:=Form:C1466.products
		
		manageTexts
		
	: (Form event code:C388=On Unload:K2:2)
		
		If (Num:C11(codeWindow)#0)
			CALL FORM:C1391(codeWindow; "closeFunctionCode")
			//CLOSE WINDOW(codeWindow)
		End if 
		
End case 

