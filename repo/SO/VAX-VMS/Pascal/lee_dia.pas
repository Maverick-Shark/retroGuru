PROGRAM LeeDia (INPUT,OUTPUT);
 
  TYPE
    DiasDeLaSemana=(DOMINGO,LUNES,MARTES,MIERCOLES,JUEVES,VIERNES,SABADO);
 
  VAR
    Dia:DiasDeLaSemana;
 
BEGIN
  WRITE('Qu‚ d¡a es hoy? ');
  READ(Dia);
  WRITELN('Me dijiste que hoy es ',dia);
  IF Dia=SABADO THEN
    WRITELN('Ma¤ana sera DOMINGO')
  ELSE
    WRITELN('Ma¤ana sera ',SUCC(Dia))
END.