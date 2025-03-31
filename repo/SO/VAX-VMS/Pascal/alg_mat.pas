PROGRAM algebraMatricial (Input, Output);

{Realiza algunas operaciones básicas de álgebra matricial, utilizando
esquemas para que los operandos puedan ser matrices de cualquier
tamaño.}

TYPE
	matriz (maxRen, maxCol:Integer)=
		ARRAY [1..maxRen, 1..maxCol] OF Real;

FUNCTION limite (nombreDeLaMatriz: String; limiteAPedir: String): Integer;

	{Pide al usuario el número de renglones/columnas (según el
	"límite a pedir") de la matriz llamada "nombreDeLaMatriz", y entrega
	un entero con el valor correspondiente. Se declara antes de la parte
	de declaración de variables, para poder definir las dimensiones de las matrices. }

	VAR
		elLimite: Integer;

	BEGIN {limite}
		WriteLn;
		Write('Dame el número máximo de ' + limiteAPedir +' de la matriz "'+
			nombreDeLaMatriz + '": ');
		ReadLn(elLimite);
		limite:= elLimite;
	END; {limite}

VAR
	matrizA: matriz(limite('A', 'renglones'), limite('A', 'columnas'));

FUNCTION maxRenglones: Integer;

	{Entrega el número de renglones de la matriz A}

	BEGIN {maxRenglones}
		maxRenglones:= matrizA.maxRen
	END; {maxRenglones}

FUNCTION maxColumnas: Integer;

	{Entrega el número de columnas de la matriz A}

	BEGIN {maxColumnas}
		maxColumnas:= matrizA.maxCol
	END; {maxColumnas}

VAR
	matrizB: matriz(maxRenglones, maxColumnas);
	{ matriz con idénticas dimensiones a matrizA; 2° operando de la
	suma }
	matrizC: matriz(maxColumnas, maxRenglones); {2° op. multipl.}
	{ matriz con dimensiones transpuestas matrizA; 2° operando de
	multiplicación }
	resultadoSuma: matriz(maxRenglones, maxColumnas);
	{ matriz con dimensiones idénticas a matrizA y matrizB }
	resultadoMult: matriz(maxRenglones, maxRenglones);
	{ matriz cuadrada para la multiplicación }

PROCEDURE pideCoeficientes (nombreMatriz: String; nombreElemento: Char;
	VAR unaMatriz: matriz);

	{ Pide al usuario que proporcione una matriz llamada "nombreMatriz",
	solicitando cada elemento llamado "nombreElemento" de i, j, y entrega
	el resultado en "unaMatriz". }

	VAR
		i, j: Integer;

	BEGIN {pideCoeficientes}
		WriteLn;
		WriteLn('Ingresa los coeficientes de la ' + nombreMatriz + ':');
		FOR i:=1 TO unaMatriz.maxRen DO
			FOR j:=1 TO unaMatriz.maxCol DO
			BEGIN
				Write('	' + nombreElemento + ' [', i:1, ', ', j:1, ']: ');
				ReadLn(unaMatriz[i,j])
			END;
	END; {pideCoeficientes}

PROCEDURE suma(matrizA, matrizB: matriz; VAR matrizC: matriz);

	{ Realiza la suma de dos matrices. }

	VAR
		i, j: Integer;

	BEGIN {suma}
		FOR i:=1 TO matrizC.maxRen DO
			FOR j:=1 TO matrizC.maxCol DO
				matrizC [i,j]:=matrizA [i,j] + matrizB [i,j];
	END; {suma}

PROCEDURE resta(matrizA, matrizB: matriz; VAR matrizC: matriz);

	{ Realiza la resta de dos matrices. }

	VAR
		i, j: Integer;

	BEGIN {resta}
		FOR i:=1 TO matrizC.maxRen DO
			FOR j:=1 TO matrizC.maxCol DO
				matrizC [i,j]:=matrizA [i,j] - matrizB [i,j];
	END; {resta}

PROCEDURE multiplica(matrizA:matriz; matrizB: matriz; VAR matrizC: matriz);

	{ Realiza la multiplicación de dos matrices conformantes. }

	VAR
		i, j, k: Integer;

	BEGIN {multiplica}
		FOR i:=1 TO matrizC.maxRen DO
			FOR j:=1 TO matrizC.maxCol DO
			BEGIN
				matrizC [i,j]:=0;
				FOR k:=1 TO matrizA.maxCol DO
					matrizC [i,j]:=matrizC [i,j] + matrizA [i,k] *
						matrizB [k,j]
			END
	END; {multiplica}

PROCEDURE escribeMatrices(texto: String; matrizA: matriz; matrizB: matriz; resultado: matriz);

	{ Escribe el tipo de operación definida por "texto", escribe los dos
	operandos ("matrizA" y "matrizB") y escribe la matriz "resultado". }

	PROCEDURE escribeMatriz(unaMatriz: matriz);

		{ Escribe una matriz en formato de columnas y renglones. }

		VAR
			i, j:Integer;

		BEGIN {escribeMatriz}
			FOR i:=1 TO unaMatriz.maxRen DO
			BEGIN
				Write('| ');
				FOR j:=1 TO unaMatriz.maxCol DO
					Write(unaMatriz[i,j]:7:2, ' ');
				WriteLn(' |');
			END
		END; {escribeMatriz}

	PROCEDURE esperaUsuario;

		{ Espera que el usuario oprima "Return" para continuar. }

		BEGIN {esperaUsuario}
			Write('Confirmar> '); ReadLn
		END; {esperaUsuario}

	BEGIN {escribeMatrices}
		WriteLn;
		WriteLn('La operación de ' + texto + ' de la matriz:');
		escribeMatriz(matrizA);
		esperaUsuario;
		WriteLn;
		WriteLn('con la matriz:');
		escribeMatriz(matrizB);
		esperaUsuario;
		WriteLn;
		WriteLn('da como resultado:');
		escribeMatriz(resultado);
		esperaUsuario;
	END; {escribeMatrices}

BEGIN {algebraMatricial}
	pideCoeficientes('matriz "A" (para todas las operaciones)', 'a',
			matrizA);
	pideCoeficientes('matriz "B" (para suma y resta)', 'b',	matrizB);
	pideCoeficientes('matriz "C" (para la multiplicación)', 'c',
			matrizC);
	suma (matrizA, matrizB, resultadoSuma);
	escribeMatrices('suma', matrizA, matrizB, resultadoSuma);
	resta (matrizA, matrizB, resultadoSuma);
	escribeMatrices('resta', matrizA, matrizB, resultadoSuma);
	multiplica(matrizA, matrizC, resultadoMult);
	escribeMatrices('multiplicación', matrizA, matrizC, resultadoMult)
END. {algebraMatricial}