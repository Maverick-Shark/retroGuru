PROGRAM Factorial (Input, Output);
VAR
   Num: Real;
   Cont: Integer;

PROCEDURE Pide_Numero(VAR num:Real);
          VAR
             Numero: Integer;
          BEGIN
               REPEAT
                     WriteLn('Dame un n£mero entero: ');
                     ReadLn(Numero);
               UNTIL (Numero>=0) AND (Numero<=33);
               num:=Numero
          END;

FUNCTION Facto(Num:Real):Real;
         VAR
            Fac: Real;
            Cont: Integer;
         BEGIN
              Fac:=1;
              IF Num=0 THEN
                 Facto:=Fac
              ELSE
              BEGIN
                   FOR CONT:=1 TO Trunc(Num) DO
                       Fac:=Fac*Cont;
                   Facto:=Fac
              END
         END;

BEGIN
     Pide_Numero(Num);
     WriteLn('N£mero: Factorial:');
     FOR Cont:=0 TO Trunc(Num) DO
         WriteLn(Cont:4, ' ':8, Facto(cont):8:0);
     ReadLn;
END.