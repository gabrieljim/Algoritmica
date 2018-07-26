program Saltos;
uses crt;
const
  paises:array [1..20] of string[10] = ('USA', 'VZLA', 'CROACIA', 'COREA', 'CHINA', 'JAPON', 'PERU', 'RUSIA',
                                       'BRASIL', 'CHILE', 'NIGERIA', 'FRANCIA', 'BELGICA', 'MEXICO', 'EGIPTO',
                                       'CUBA', 'BOLIVIA', 'PANAMA', 'ECUADOR', 'INDIA');
  pruebas:array[1..5] of string[30] = ('Salto doble adelante', 'Salto adelante con tirabuzon', 'Salto atras con doble mortal',
  'Salto triple mortal', 'Adelante con mortal atras');
  grado:array[1..5] of real = (1.8, 2.2, 3.2, 3.8, 3.5);
  votos:array[1..19] of real =(1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0, 5.5, 6.0, 6.5, 7.0, 7.5, 8.0, 8.5, 9.0, 9.5, 10.0);
type
  vector1 = array[1..20] of string;
  vector2 = array[1..100] of real;
  vector3 = array[1..100] of integer;
  inception = array[1..30] of vector2;
label
  uno;
procedure bubblesort(var lista:vector2);
  var
    i,j:integer; aux:real;
  begin
    for i := 1 to 7 do
    begin
      for j :=1 to 7 do
      begin
        if lista [j] < lista [j+1] then
        begin
          aux := lista [j];
          lista [j] := lista [j+1];
          lista [j+1]:= aux;
        end;
      end;
    end;
  end;
procedure bubbleindi(var lista:inception;var indi:vector3);
var
  i,j:integer; aux:vector2; aux2:integer;
begin
  randomize;
  for i := 1 to 4 do
  begin
    for j :=1 to 4 do
    begin
      if lista [j][6] < lista [j+1][6] then
      begin
        aux := lista [j];
        lista [j] := lista [j+1];
        lista [j+1]:= aux;
        aux2 := indi[j];
        indi[j] := indi[j+1];
        indi[j+1] := aux2;
      end;
    end;
  end;
end;
procedure salu2;
begin
  writeln;
  writeln;
  writeln;
  writeln;
  writeln;
  writeln('                        Bienvenido al torneo de saltos!');
  writeln;
  writeln;
  writeln;
  readkey;
  clrscr;
end;

var
  i, j, k, n:integer;
  voto, suma:real;
  participante:vector1;
  jueces, totales:vector2;
  indices:vector3;
  tabla, final, orden:inception;
begin
  randomize;
  salu2;
  writeln('Cuantos participantes habran?');
  readln(n);

  for i := 1 to n do
  indices[i] := i;

  for i := 1 to n do
  participante[i] := paises[i];

 for i := 1 to 5 do                                         {Cada prueba}
  begin
    clrscr;
    writeln('Prueba numero ', i);
    writeln;
    writeln(pruebas[i]:30);
    writeln('______________________________________');
    writeln;
    writeln('Grado de dificultad: ', grado[i]:1:2);
    readkey;
    for j := 1 to n do                                       {Cada participante}
    begin
      clrscr;
      writeln('                  ',participante[j]);
      writeln('________________________________________');
      writeln;
      writeln(participante[j],' realiza un ', pruebas[i],'!');
      writeln;
      writeln('Votos de los jueces:');
      for k := 1 to 7 do                                        {Cada juez}
      begin
        writeln;
        write ('Juez ', k, ' vota ');
        uno:
        voto := votos[random(21)];
        if voto = 0 then goto uno;
        write (voto:1:1);
        jueces[k] := voto;
        writeln;
      end;
     tabla [j] := jueces;
     bubblesort(jueces);
     writeln;
     suma := 0;
     for k := 2 to 6 do
     suma := suma + jueces[k];
     suma := suma * grado[i];
     writeln;
     writeln('La puntuacion total es ', suma:5:2);
     tabla[j][8] := suma;
     final[j][i] := suma;
     readkey;
    end;
    clrscr;
    writeln;
    write(pruebas[i]);
    writeln;
    writeln;
    writeln;
    write('       ');
    for j := 1 to 7 do
    write ('     J',j);
    write ('   Total');
    writeln;
    writeln;
    for j := 1 to n do
    begin
     write(paises[j]:7);
     for k := 1 to 8 do
     write (tabla[j][k]:7:1);
     writeln;
     writeln;
    end;
    readkey;
  end;
  for i := 1 to n do
    begin
  suma := 0;
  for j := 1 to 5 do
  suma := suma + final[i][j];
  totales[i] := suma;
  end;

  clrscr;
  writeln;
  writeln;
  writeln;
  writeln('                             Resultados finales');
  readkey;
  clrscr;
  writeln;
  writeln('          Prueba 1  Prueba 2   Prueba 3  Prueba 4  Prueba 5   Total');
  writeln;
  for i := 1 to n do
  begin
    for j := 1 to 5 do
    orden[i][j] := final[i][j];
    orden[i][6] := totales[i];
  end;

  bubbleindi(orden,indices);
  for i := 1 to n do
  begin
    write(paises[indices[i]]:7);
    for j := 1 to 6 do
    write(orden[i][j] :10:2);
    writeln;
    writeln;
  end;
  readkey;

  writeln;
  write('Felicidades a ', paises[indices[1]],'!');
  readkey;
end.

