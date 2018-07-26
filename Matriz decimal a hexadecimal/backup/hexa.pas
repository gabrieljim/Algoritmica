program hexa;
uses crt;
type
  matriz = array[1..100,1..100]of integer;
  vector = array[1..100] of integer;
procedure hexadecimal(nro:integer);
var
  h: vector;
  r,i,j,aux:integer;
begin
  i := 1;
  while nro >= 16 do
  begin
    aux := nro MOD 16; nro := nro DIV 16;
    h[i] := aux;
    i := i+1;
  end;
  h[i] := nro;
  for j := i downto 1 do
  begin
    r := h[j];
    case r of
    10:write('A');
    11:write('B');
    12:write('C');
    13:write('D');
    14:write('E');
    15:write('F');
    else write(r);
    end;
  end;
end;
var
  f, c, i, j, suma:integer;
  tabla:matriz;
  sumas:vector;
begin
  randomize;
  writeln('Cuantas filas?'); read(f);
  writeln('Cuantas columnas?'); read(c);
  for i := 1 to f do
  begin
    for j := 1 to c do
    tabla[i,j] := random(101);
  end;
  for i := 1 to f do
  begin
    suma := 0;
    for j := 1 to c do
    suma := suma + tabla[i,j];
    sumas [i] := suma;
  end;
  writeln('Fila   >>>     Decimal      >>>      Suma    >>>      Hexadecimal');
  for i := 1 to f do
  begin
    write(' ',i,'  >>>  ');
    for j := 1 to c do
    write (tabla[i,j]:8);
    write(' >>>  ',sumas[i]:6, ' >>> '); hexadecimal(sumas[i]);
    writeln;
  end;  readkey;
end.

