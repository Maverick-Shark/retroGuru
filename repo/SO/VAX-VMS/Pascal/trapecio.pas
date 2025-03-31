PROGRAM Trapecio(INPUT,OUTPUT);
VAR
  a,b:REAL;
  m:INTEGER;
 
FUNCTION H(x0,x1:REAL):REAL;
BEGIN
  h:=(x1-x0)/m
END;
 
FUNCTION F(x:REAL):REAL;
BEGIN
  f:=sin(X)
END;
 
FUNCTION Trape(x0,x1:REAL):REAL;
BEGIN
  Trape:=H(a,b)/2*(F(x0)+f(x1))
END;
 
FUNCTION Area(a,b:REAL):REAL;
VAR
  x1,x2,suma:REAL;
BEGIN
  suma:=0;
  x2:=a;
  REPEAT
    x1:=x2;
    x2:=x1+H(a,b);
    suma:=suma+Trape(x1,x2);
  UNTIL x2=b;
  Area:=suma
END;
 
BEGIN
  WriteLn;
  Write('Dame los limites de integracion: ');
  Read(a);
  Read(b);
  WriteLn;
  WriteLn('Cuantos trapecios uso? ');
  ReadLn(m);
  WriteLn;
  WriteLn('El area bajo tu curva es: ',area(a,b):5:5);
  ReadLn;
END.