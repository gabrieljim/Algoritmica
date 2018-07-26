program Binario;
uses crt;
type
  matriz = array[1..100,1..100]of integer;
  vector = array[1..100] of integer;
  inception = array[1..100] of vector;
function power(base:integer;expo:integer):integer;
var
  i, aux:integer;
begin
  aux := 1;
  if expo = 0 then power := 1
  else
  begin
    for i := 1 to expo do
    aux := aux * base;
    power := aux;
  end;
end;
function bintodec(arreglo:vector; c:integer):integer;
var
  i, j, aux:integer;
begin
  aux := 0;
  j:=0;
  for i := c downto 0 do
  begin
    if arreglo[i] = 1 then
    aux := aux + power(2,j);
    j:=j+1;
  end;
  bintodec := aux;
end;
var
  i, j, f, c:integer;
  tabla:matriz;
  fila, columna:vector;
  cadafila, cadacol:inception;
begin
  randomize;
  writeln('Cuantas filas?'); readln(f);
  writeln('Cuantas columnas?'); readln(c);    {Falta total por columna}
  clrscr;
  for i := 1 to f do
  begin
    for j := 1 to c do
    begin
      tabla[i,j] := random(2);
      fila[j] := tabla[i,j];
    end;
    cadafila[i] := fila;
  end;

  for j := 1 to c do
  begin
    for i := 1 to f do
    columna[i] := tabla[i,j];
    cadacol[j] := columna;
  end;

  for i := 1 to f do
  begin
    for j := 1 to c do
    write(tabla[i,j]:5);
    write(' |',bintodec(cadafila[i],c):5);
    writeln; writeln;
  end;
  for i := 1 to c do
  write(bintodec(cadacol[i],f):5);
  readkey;
end.

