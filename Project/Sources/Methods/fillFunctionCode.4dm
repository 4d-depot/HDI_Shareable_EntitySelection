//%attributes = {"invisible":true}


C_LONGINT:C283($page; $1)

$page:=$1

Case of 
	: ($page=2)
		Form:C1466.content:=_TabLineCode{2}
		SET WINDOW TITLE:C213("sendMails method"; codeWindow)
		
	: ($page=3)
		Form:C1466.content:=_TabLineCode{9}
		SET WINDOW TITLE:C213("sendCatalog method"; codeWindow)
		
	: ($page=4)
		Form:C1466.content:=_TabLineCode{12}
		SET WINDOW TITLE:C213("sendCatalog2 method"; codeWindow)
		
	Else 
		Form:C1466.content:=""
End case 