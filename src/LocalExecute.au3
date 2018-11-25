; ===========================================================
; LocalExecute: launch / open all specified commands / files
;
; Version: 0.95
; Author: Leonardo Cocco
; Last Edit: 25/11/2018
; ===========================================================
; ---------------------------------------------------------------------------------------------
; Instructions:
; 1. In <filename>.lst (<filename> is name of this script) are listed all commands to execute,
;    or files to open with shell association
; 2. command is separated by parameters by tab
; ---------------------------------------------------------------------------------------------


Func Main()
	Dim $filename
	Dim $fhnd
	Dim $txt
	Dim $strarr
	
	$filename = @scriptname
	$filename = StringLeft($filename, StringLen($filename) - 4) & ".lst"
	$fhnd = FileOpen($filename)
	If $fhnd > 0 Then
		While True
			$txt = FileReadLine($fhnd)
			if $txt = "" Then
				ExitLoop
			EndIf
			
			$strarr = StringSplit($txt, Chr(9))
			If $strarr[0] == 1 Then
				ShellExecute($strarr[1])
			Else
				ShellExecute($strarr[1], $strarr[2])
			EndIf
		WEnd
		
		FileClose($fhnd)
	EndIf
EndFunc

Main()
