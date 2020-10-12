
If (btnTrace)
	TRACE:C157
End if 


If (Storage:C1525.info=Null:C1517)
	Use (Storage:C1525)
		Storage:C1525.info:=New shared object:C1526()
	End use 
End if 

Use (Storage:C1525.info)
	//Put entity selections in a shared object
	Storage:C1525.info.paid:=ds:C1482.Invoices.query("status=:1"; "Paid")
	Storage:C1525.info.unpaid:=ds:C1482.Invoices.query("status=:1"; "Unpaid")
	Storage:C1525.info.win:=win  // Current window number
End use 

CALL WORKER:C1389("mailing"; "sendMails"; Storage:C1525.info)
