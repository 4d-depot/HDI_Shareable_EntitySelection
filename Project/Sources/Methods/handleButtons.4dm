//%attributes = {"invisible":true}



If (btnTrace)
	TRACE:C157
End if 

If (Form:C1466.products.length>=1)
	OBJECT SET ENABLED:C1123(*; "SendCatalogButton@"; True:C214)
Else 
	OBJECT SET ENABLED:C1123(*; "SendCatalogButton@"; False:C215)
End if 
