
var $sharedObj : Object
var $p : Integer


If (btnTrace)
	TRACE:C157
End if 

$sharedObj:=OB Copy:C1225(Form:C1466.obj; ck shared:K85:29)

$p:=New process:C317("sendCatalog2"; 0; "sendCatalog"; $sharedObj)

Form:C1466.catalog:=$sharedObj.catalog

OBJECT SET VISIBLE:C603(*; "Catalog@"; True:C214)

manageTexts