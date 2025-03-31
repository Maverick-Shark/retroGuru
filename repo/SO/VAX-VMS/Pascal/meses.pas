PROGRAM MesesDelAnio (INPUT,OUTPUT);
 
TYPE
  meses=(ENERO,FEBRERO,MARZO,ABRIL,MAYO,JUNIO,JULIO,AGOSTO,SEPTIEMBRE,
OCTUBRE,NOVIEMBRE,DICIEMBRE);
 
VAR
  mes:meses;
  ano:INTEGER;
 
BEGIN
  WRITE('Dme el nombre de un mes: ');
  READLN(mes);
  IF mes=FEBRERO THEN
  BEGIN
    WRITE('Dame el aqo: ');
    READLN(ano);
  END;
  CASE mes OF
    ENERO,MARZO,MAYO,JULIO,AGOSTO,OCTUBRE,DICIEMBRE:
                WRITELN(mes, ' tiene 31 dmas.');
    FEBRERO: IF (ano MOD 4)<>0 THEN
                WRITELN(FEBRERO,' tiene 28 dlas.')ue
             ELSE
                WRITELN(FEBRERO,' tiene 29 dlas.');
    OTHERWISE
                WRITELN(mes,' tiene 30 dlas.')
  END
END.