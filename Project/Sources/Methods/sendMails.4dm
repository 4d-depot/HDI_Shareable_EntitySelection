//%attributes = {"invisible":true}
var $info; $1 : Object
var $paid; $unpaid : cs:C1710.InvoicesSelection
var $invoice : cs:C1710.InvoicesEntity

$info:=$1
$paid:=$info.paid
$unpaid:=$info.unpaid

Use ($info)
	$info.acknowledge:=New shared collection:C1527
	$info.reminder:=New shared collection:C1527
End use 

For each ($invoice; $paid)
	$info.acknowledge.push(New shared object:C1526("to"; $invoice.customer; "content"; "Payment OK for invoice # "+String:C10($invoice.number)))
End for each 

For each ($invoice; $unpaid)
	$info.reminder.push(New shared object:C1526("to"; $invoice.customer; "content"; "Please pay invoice # "+String:C10($invoice.number)))
End for each 

CALL FORM:C1391(Storage:C1525.info.win; "refresh")
