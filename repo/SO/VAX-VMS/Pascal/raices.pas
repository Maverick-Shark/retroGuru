PROGRAM RaicesCuadraticas (INPUT,OUTPUT);
 
  VAR
    CoefA,CoefB,CoefC:REAL;
    Discriminante:REAL;
    Raiz1,Raiz2:REAL;
 
BEGIN
  WRITELN('Dame los coeficientes A, B, y C: ');
  READLN(CoefA,CoefB,CoefC);
  Discriminante:=(SQR(CoefB)-4*CoefA*CoefC);
  IF CoefA=0 THEN
  WRITELN('Esta ecuacirn no es cuadr`tica')
  ELSE
  BEGIN
    IF Discriminante>=0 THEN
    BEGIN
      Discriminante:=SQRT(Discriminante);
      Raiz1:=(-CoefB+Discriminante)/(2*CoefA);
      Raiz2:=(-CoefB-Discriminante)/(2*CoefA);
      WRITELN('Las Raices son: ',Raiz1:10:3,' y ',Raiz2:10:3)
    END
    ELSE
    BEGIN
      Raiz1:=(-CoefB/(2*CoefA));
      Raiz2:=(SQRT(ABS(DISCRIMINANTE))/(2*CoefA));
      WRITELN('Las Raices son: ',Raiz1:10:3,+Raiz2:10:3,'i');
      WRITELN('Las Raices son: ',Raiz1:10:3,-Raiz2:10:3,'i')
    END
  END
END.