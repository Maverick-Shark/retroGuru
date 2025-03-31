PROGRAM Triangulo(INPUT,OUTPUT);

TYPE

  Ren=1..20;

VAR

  num,cont1,cont3:Ren;

 

PROCEDURE Pide_Renglones(VAR num:INTEGER);

BEGIN

  REPEAT

    Write('Dame el numero de renglones: ');

    ReadLn(num);

  UNTIL (num<=20) AND (num>0)

END;

 

PROCEDURE Pon_Espacios(num,cont1,cont3:Ren);

VAR

  cont2:Ren;

BEGIN

  FOR cont2:= 1 TO num-cont1+cont3 DO

    Write(' ');

END;

 

PROCEDURE Pon_Ascendente(cont1:Ren);

VAR

  cont2:Ren;

BEGIN

  FOR cont2:= 1 TO cont1 DO

    Write(cont2:2)

END;

 

PROCEDURE Pon_Descendente(cont1:Ren);

VAR

  cont2:Ren;

BEGIN

  FOR cont2:= cont1-1 DOWNTO 1 DO

    Write(cont2:2)

END;

 

PROCEDURE Escribe_Linea(VAR cont3:Ren;sentido:INTEGER);

BEGIN

  IF sentido=1 THEN

    cont3:=cont3-1

  ELSE 

    cont3:=cont3+1;

  WriteLn;

END;

 

PROCEDURE Despliega_Linea(num,cont1:Ren;VAR cont3:Ren;sentido:INTEGER);

BEGIN

  Pon_Espacios(num,cont1,cont3);

  Pon_Ascendente(cont1);

  Pon_Descendente(cont1);

  Escribe_Linea(cont3,sentido);

END;

 

BEGIN

  Pide_Renglones(num);

  cont3:=num;

  FOR cont1:= 1 TO num DO

    Despliega_Linea(num,cont1,cont3,1);

  cont3:=2;

  FOR cont1:= num-1 DOWNTO 1 DO

    Despliega_Linea(num,cont1,cont3,2);

  ReadLn;

END.