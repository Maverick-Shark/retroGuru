PROGRAM Regresion(INPUT,OUTPUT);
VAR
	x,y:PACKED ARRAY [1..100] OF REAL;
	n,cont:INTEGER;
 
FUNCTION SumX2Y:REAL;
VAR
	cont:INTEGER;
	suma:REAL;
BEGIN
	suma:=0;
	FOR cont:=1 TO n DO
		suma:=x[cont]*x[cont]*y[cont]+suma;
	SumX2Y:=suma
END;
 
FUNCTION SumXY:REAL;
VAR
	cont:INTEGER;
	suma:REAL;
BEGIN
	suma:=0;
	FOR cont:=1 TO n DO
		suma:=x[cont]*y[cont]+suma;
	SumXY:=suma
END;
 
FUNCTION SumY:REAL;
VAR
	cont:INTEGER;
	suma:REAL;
BEGIN
	suma:=0;
	FOR cont:=1 TO n DO
		suma:=y[cont]+suma;
	SumY:=suma
END;
 
FUNCTION SumX4:REAL;
VAR
	cont:INTEGER;
	suma:REAL;
BEGIN
	suma:=0;
	FOR cont:=1 TO n DO
		suma:=x[cont]*x[cont]*x[cont]*x[cont]+suma;
	SumX4:=suma
END;
 
FUNCTION SumX3:REAL;
VAR
	cont:INTEGER;
	suma:REAL;
BEGIN
	suma:=0;
	FOR cont:=1 TO n DO
		suma:=x[cont]*x[cont]*x[cont]+suma;
	SumX3:=suma
END;
 
FUNCTION SumX2:REAL;
VAR
	cont:INTEGER;
	suma:REAL;
BEGIN
	suma:=0;
	FOR cont:=1 TO n DO
		suma:=x[cont]*x[cont]+suma;
	SumX2:=suma
END;
 
FUNCTION SumX:REAL;
VAR
	cont:INTEGER;
	suma:REAL;
BEGIN
	suma:=0;
	FOR cont:=1 TO n DO
		suma:=x[cont]+suma;
	SumX:=suma
END;
         
FUNCTION St:REAL;
VAR
	cont:INTEGER;
	suma:REAL;
BEGIN
	suma:=0;
	FOR cont:=1 TO n DO
		suma:=(y[cont]-SumY/n)*(y[cont]-SumY/n)+suma;
	St:=suma
END;     
 
PROCEDURE Lineal;
VAR
	a0,a1,suma:REAL;
	
FUNCTION Sr:REAL;
VAR
	cont:INTEGER;
	suma:REAL;
BEGIN
	suma:=0;
	FOR cont:=1 TO n DO
		suma:=(y[cont]-a0-a1*x[cont])*(y[cont]-a0-a1*x[cont])+suma;
	Sr:=suma
END;
 
BEGIN
	a1:=(SumXY-n*SumX/n*SumY/n)/(SumX2-n*SumX/n*SumX/n);
	a0:=SumY/n-SumX/n*a1;
	WriteLn('La recta es: y=',a0:5:5,'+',a1:5:5,'x');
	WriteLn('El coeficiente de correlacion es: ',SQRT((St-Sr)/St):5:5);
	ReadLn
END;
 
PROCEDURE Parabolico;
VAR
	suma,a2,a1,a0:REAL; 
 
FUNCTION St:REAL;
VAR
	cont:INTEGER;
	suma:REAL;
BEGIN
	suma:=0;
	FOR cont:=1 TO n DO
		suma:=(y[cont]-SumY/n)*(y[cont]-SumY/n)+suma;
	St:=suma
END;     
 
FUNCTION Sr:REAL;
VAR
	cont:INTEGER;
	suma:REAL;
BEGIN
	suma:=0;
	FOR cont:=1 TO n DO
		suma:=(y[cont]-a0-a1*x[cont]-a2*x[cont]*x[cont])
		     *(y[cont]-a0-a1*x[cont]-a2*x[cont]*x[cont])+suma;
	Sr:=suma
END;
 
BEGIN
	a2:=( n*(SumX2*SumX2Y-SumXY*SumX3)-SumX*(SumX*SumX2Y-SumXY*SumX2)
		+SumY*(SumX*SumX3-SumX2*SumX2) )
		/
	    ( n*(SumX2*SumX4-SumX3*SumX3)-SumX*(SumX*SumX4-SumX3*SumX2)
		+SumX2*(SumX*SumX3-SumX2*SumX2) );
                                          
 
	a1:=( n*(SumXY*SumX4-SumX3*SumX2Y)-SumY*(SumX*SumX4-SumX3*SumX2)
		+SumX2*(SumX*SumX2Y-SumXY*SumX2) )
		/
	    ( n*(SumX2*SumX4-SumX3*SumX3)-SumX*(SumX*SumX4-SumX3*SumX2)
		+SumX2*(SumX*SumX3-SumX2*SumX2) );
                                          
 
	a0:=( SumY*(SumX2*SumX4-SumX3*SumX3)-SumX*(SumXY*SumX4-SumX3*SumX2Y)
		+SumX2*(SumXY*SumX3-SumX2*SumX2Y) )
		/
	    ( n*(SumX2*SumX4-SumX3*SumX3)-SumX*(SumX*SumX4-SumX3*SumX2)
		+SumX2*(SumX*SumX3-SumX2*SumX2) );
        
        WriteLn('La parabola es: y=',a0:5:5,'+',a1:5:5,'x +',a2:5:5,'x2');
        WriteLn('El coeficiente de correlacion es: ',SQRT((St-Sr)/St):5:5);
        ReadLn
END;
 
BEGIN
    Write('Dame el numero de elementos: ');
    ReadLn(n);
    WriteLn;
    FOR cont:=1 TO n DO
    BEGIN
      Write('Dame x[',cont:1,'] ');
      ReadLn(x[cont]) 
    END;
    WriteLn;
    FOR cont:=1 TO n DO
    BEGIN            
      Write('Dame y[',cont:1,'] ');
      ReadLn(y[cont])
    END;
    Lineal;
    Parabolico
END.