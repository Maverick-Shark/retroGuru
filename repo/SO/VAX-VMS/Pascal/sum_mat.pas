PROGRAM SumaMatrices(INPUT,OUTPUT);
CONST
  ren=3;
  col=2;
TYPE
  Matriz=ARRAY [1..ren,1..col] OF REAL; 
VAR
  matrizA,matrizB,matrizC:Matriz;                                
    
PROCEDURE PideCoef(VAR mat:Matriz;nombre:CHAR);
VAR
  i,j: INTEGER;
BEGIN
  WriteLn('Dame los coeficientes de la matriz ',nombre);
  WriteLn;
  FOR i:= 1 TO ren DO
    FOR j:= 1 TO col DO
      BEGIN
        Write(nombre,'[',i:1,',',j:1,']: ');
        ReadLn(mat[i,j]);
      END;
    WriteLn
END;
                                                           
PROCEDURE Escribe(mat:Matriz;nombre:CHAR);
VAR
  i,j: INTEGER;
BEGIN
  WriteLn;
  WriteLn('Los coeficientes de la matriz ',nombre,' son:');
  WriteLn;
  FOR i:= 1 TO ren DO
  BEGIN
    FOR j:= 1 TO col DO
        Write(' ',nombre,'[',i:1,',',j:1,']: ',mat[i,j]:5:2);
    WriteLn
  END
END;                                                       
 
 
FUNCTION Suma(mat1,mat2:Matriz):Matriz;
VAR
  mat: Matriz;
  i,j: INTEGER;
BEGIN
  FOR i:= 1 TO ren DO
    FOR j:= 1 TO col DO
        mat[i,j]:=mat1[i,j]+mat2[i,j];
  Suma:=mat
END;       
 
BEGIN
  PideCoef(matrizA,'A');
  PideCoef(matrizB,'B');
  MatrizC:=Suma(matrizA,matrizB);
  Escribe(matrizC,'C');
  ReadLn
END.