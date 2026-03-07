Dim notaA As Double
Dim notaB As Double
Dim notaC As Double
Dim pesoA As Integer
Dim pesoB As Integer
Dim pesoC As Integer
Dim resultadoMedia As Double

Print "Digite a primeira nota:"
Input notaA
Print "Digite o peso da primeira nota:"
Input pesoA

Print "Digite a segunda nota:"
Input notaB
Print "Digite o peso da segunda nota:"
Input pesoB

Print "Digite a terceira nota:"
Input notaC
Print "Digite o peso da terceira nota:"
Input pesoC

resultadoMedia = ((notaA * pesoA) + (notaB * pesoB) + (notaC * pesoC)) / (pesoA + pesoB + pesoC)

If resultadoMedia >= 70 Then
  Print "Aprovado direto"
Else
  Print "Reprovado direto"
End If

Sleep
