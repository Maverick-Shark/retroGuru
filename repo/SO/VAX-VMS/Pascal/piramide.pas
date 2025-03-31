PROGRAM piramide (INPUT,OUTPUT);
 
VAR
  num,cont1,cont2,cont3:INTEGER;
 
BEGIN
  REPEAT
    WRITELN('Dame el nzmero de renglones: ');
    READLN(num);
  UNTIL (num<=20)AND(num>0);
  cont3:=num;
  FOR cont1:=1 TO num DO
  BEGIN
    FOR cont2:=1 TO num-cont1+cont3 DO
      WRITE(' ');
    FOR cont2:=1 TO cont1 DO
      WRITE(cont2:2);
    FOR cont2:=cont1-1 DOWNTO 1 DO
      WRITE(cont2:2);
    cont3:=cont3-1;
    WRITELN
  END
END.