
var $signal : Object
var $signaled : Boolean


If (btnTrace)
	TRACE:C157
End if 

$signal:=New signal:C1641()

ON ERR CALL:C155("errorMethod")
lastError:=0

Use ($signal)
	If (Form:C1466.shared)
		$signal.products:=Form:C1466.products.copy(ck shared:K85:29)
	Else 
		$signal.products:=Form:C1466.products
	End if 
End use 
ON ERR CALL:C155("")


If (lastError=0)
	CALL WORKER:C1389("mailing"; "sendCatalog"; $signal)
	$signaled:=$signal.wait(1)
	
	If ($signaled)
		Form:C1466.catalog:=$signal.catalog
		Form:C1466.error:=""
	End if 
	
	OBJECT SET VISIBLE:C603(*; "ErrorNotShared"; False:C215)
	OBJECT SET VISIBLE:C603(*; "Catalog@"; True:C214)
	
Else 
	Form:C1466.error:=lastErrorMessage
	OBJECT SET VISIBLE:C603(*; "ErrorNotShared"; True:C214)
	OBJECT SET VISIBLE:C603(*; "Catalog@"; False:C215)
End if 

manageTexts
