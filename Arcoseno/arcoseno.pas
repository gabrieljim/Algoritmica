program arcoseno;
uses crt;
function power(base:real; expo: integer):real;
var i: integer;
  aux: real;
begin
  aux := 1;
  if expo = 0 then power := 1
  else
  begin
    for i := 1 to expo do
    aux := aux*base;
    power := aux;
  end;
end;
function factr(nro:integer):longint;
var
  i, aux:integer;
begin
  aux := 1;
  for i:=1 to nro do
  aux := aux*i;
  factr := aux;
end;
function pkx(k:integer; x:real):real;
var i:integer;
  primera, segunda, tercera, aux: real;

begin
  aux := 0;
  for i:=0 to k do
  begin
    primera := factr(k)/(factr(i)*factr(k-i));
    segunda := factr(k+i)/(factr(i)*factr(k));
    tercera := power(((x-1)/2),i);
    aux := aux + (primera*segunda*tercera);
  end;
  pkx := aux;
end;
var
  x, p2n, senh:real;
  n: integer;
begin
  readln(x);
  x:=x*3.1416/180;
  senh := 0;
  for n := 0 to 8 do
  begin
    p2n := pkx(2*n,x);
    senh := senh + ((p2n/(2*n+1)) * power(x,2*n-1));
  end;
  writeln(senh:5:2);
  readkey;
end.
