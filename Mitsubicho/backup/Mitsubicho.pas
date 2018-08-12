program Mitsubicho;
uses crt;
type
  matriz = array[1..100,1..100] of integer;
  vector = array[1..100] of integer;
  inception = array[1..100] of vector;
const
  modelos:array [1..4] of string = ('Popular', 'Sedan  ', 'Coupe  ', 'Carga  ');
  regiones:array [1..4] of string = ('Centro', 'Sur', 'Norte', 'Oeste');
procedure salu2(unidades:matriz; costos:vector);

var
  i, j, k, suma , sumac:integer;
  ventas, regiontotal: vector;
begin
  clrscr;
  writeln('Mitsubicho, C.A');
  writeln('Rif:J-00011115');
  writeln('La Rosaleda, Los Teques');
  writeln('Tlf:04244524545');
  writeln;
  writeln('               Estimado en unidades para el 2019');
  writeln('     __________________________________________________');
  writeln ('                        Clientes');
  writeln ('____________________________________________________________');
  writeln('        |     Centro      Sur     Norte     Oeste   | Total |');
  writeln ('________|___________________________________________|_______|');
  writeln ('        |                                           |       |');
  for i := 1 to 4 do
  begin
    suma := 0;
    for j := 1 to 4 do
    ventas[j] := unidades[i,j];
    write(modelos[i], ' |'); for k := 1 to 4 do begin write (ventas[k]:10); suma := suma + ventas[k]; end; writeln ('   |  ',suma, '   |');
    writeln ('        |                                           |       |');
  end;
  writeln ('________|___________________________________________|_______|');
  for i := 1 to 4 do
  begin
    sumac := 0;
    for j := 1 to 4 do
    sumac := sumac + (unidades[j,i]);
    regiontotal[i]:=sumac
  end;
  writeln('        |                                           |');
  write('Total   | '); for i := 1 to 4 do write (regiontotal[i]:10); write('  |');
  writeln;
  writeln ('________|___________________________________________|');
  readkey;
  clrscr;
  writeln('Mitsubicho, C.A');
  writeln('Rif:J-00011115');
  writeln('La Rosaleda, Los Teques');
  writeln('Tlf:04244524545');
  writeln;
  writeln('           Precios de venta estimados para el 2019');
  writeln('         ___________________________________________');
  writeln('_________________________________________________');
  writeln('        |                                        |');
  write ('Modelo  |');
  for i := 1 to 4 do
  write (modelos[i]:10); write('|');
  writeln; writeln('________|________________________________________|');
  writeln('        |                                        |');
  writeln('Precio  |                                        |':5);
  write ('($1.000)|');

  for i := 1 to 4 do
    write (costos[i]:9); write('    |');
    writeln; writeln('________|________________________________________|');
  readkey;

end;
procedure matrizlinda(matrizfea:matriz);
var
  i, j, k, suma, sumac:integer;
  ventas, regiontotal:vector;
begin
  writeln('____________________________________________________________');
  writeln('        |     Centro      Sur     Norte     Oeste   | Total |');
  writeln ('________|___________________________________________|_______|');
  writeln ('        |                                           |       |');
  for i := 1 to 4 do
  begin
    suma := 0;
    for j := 1 to 4 do
    ventas[j] := matrizfea[i,j];
    write(modelos[i], ' |'); for k := 1 to 4 do begin write (ventas[k]:10); suma := suma + ventas[k]; end; writeln ('   |',suma:7, '|');
    writeln ('        |                                           |       |');
  end;
  for i := 1 to 4 do
  begin
    sumac := 0;
    for j := 1 to 4 do
    sumac := sumac + (matrizfea[j,i]);
    regiontotal[i]:=sumac;
  end;
  writeln ('________|___________________________________________|_______|');
  writeln('        |                                           |');
  write('Total   | '); for i := 1 to 4 do write (regiontotal[i]:10); write('  |');
  writeln;
  writeln ('________|___________________________________________|');
end;
function bubblesort(lista:inception):inception;
var
  i,j:integer; aux:vector;
begin
  randomize;
  for i := 1 to 4 do
  begin
    for j :=1 to 4 do
    begin
      if lista [j][2] < lista [j+1][2] then
      begin
        aux := lista [j];
        lista [j] := lista [j+1];
        lista [j+1]:= aux;
      end;
    end;
  end;
  bubblesort := lista;
end;
var
  i, j, sumac, total:integer;
  precios, regiontotal, modelototal, posicion1, posicion2, posicion3, posicion4:vector;
  orden, modelototal2, regiontotal2:inception;
  vendidos:matriz;
begin
  randomize;
  for i := 1 to 4 do
  begin
    for j := 1 to 4 do
    vendidos[i,j] := random(26);
  end;

  for i := 1 to 4 do
  begin
  writeln('Indique precio de venta del modelo ', modelos[i]); readln (precios[i]);
  end;
  salu2(vendidos, precios);

  for i := 1 to 4 do
  begin
    for j := 1 to 4 do
    vendidos[i,j] := vendidos [i,j] * precios[i];
  end;
  clrscr;
  writeln;
  writeln;
  writeln;
  writeln;
  writeln('                      1. Total por modelo y por region'); readkey;
  writeln;
  writeln;
  writeln;
  writeln;
  clrscr;
  writeln;
  writeln;
  writeln;
  writeln('Matriz mostrando cada unidad por su valor segun la tabla de precios vista');
  matrizlinda(vendidos);
  readkey;
  for i := 1 to 4 do
  begin
    sumac := 0;
    for j := 1 to 4 do
    sumac := sumac + (vendidos[j,i]);
    regiontotal[i]:=sumac;
  end;
  for i := 1 to 4 do
  begin
    sumac := 0;
    for j := 1 to 4 do
    sumac := sumac + (vendidos[i,j]);
    modelototal[i]:=sumac;
  end;

  {La matriz con todas las unidades convertidas a su costo total esta guardada
  en "vendidos", el vector con los precios de cada modelo esta guardado en
  "precios", el vector con los pagos totales de cada region esta guardado en
  "regiontotal", el vector con los pagos totales de cada modelo esta en
  "modelototal"}

   clrscr;
   writeln;
   writeln;
   writeln;
   writeln;
   writeln('                      2. Modelo que produjo menores ventas');
   writeln;
   writeln;
   writeln;
   readkey;
   clrscr;
   writeln;
   writeln;
   writeln ('Se ordena el total de ventas por modelo en la siguiente tabla de mayor a menor');

   posicion1[1] := 1;
   posicion1[2] := modelototal[1];
   posicion2[1] := 2;
   posicion2[2] := modelototal[2];
   posicion3[1] := 3;
   posicion3[2] := modelototal[3];
   posicion4[1] := 4;
   posicion4[2] := modelototal[4];

   orden[1] := posicion1;
   orden[2] := posicion2;
   orden[3] := posicion3;
   orden[4] := posicion4;


   modelototal2 := bubblesort(orden);

   writeln;
   for i := 1 to 4 do
   begin
   write(modelos[modelototal2[i][1]]:5);
   write(modelototal2[i][2]:5);
   writeln;
   end;
   readkey;
   writeln;
   writeln ('De aca se observa claramente que el modelo que produjo menos');
   writeln('ventas fue el modelo ',modelos[modelototal2[4][1]]);
   readkey;

   clrscr;
   writeln;
   writeln;
   writeln;
   writeln;
   writeln('                      3. Cliente con  mayores ventas');
   writeln;
   writeln;
   writeln;
   readkey;
   clrscr;
   writeln;
   writeln;
   writeln ('De manera parecida, se ordena el total de ventas por cliente');
   writeln('en la siguiente tabla de mayor a menor');

   posicion1[1] := 1;
   posicion1[2] := regiontotal[1];
   posicion2[1] := 2;
   posicion2[2] := regiontotal[2];
   posicion3[1] := 3;
   posicion3[2] := regiontotal[3];
   posicion4[1] := 4;
   posicion4[2] := regiontotal[4];

   orden[1] := posicion1;
   orden[2] := posicion2;
   orden[3] := posicion3;
   orden[4] := posicion4;
   regiontotal2 := bubblesort(orden);
   writeln;

   for i := 1 to 4 do
   begin
   write(regiones[regiontotal2[i][1]]:7);
   write(regiontotal2[i][2]:5);
   writeln;
   end;
   readkey;
   writeln;
   writeln('El cliente con mayores ventas fue el ', regiones[regiontotal2[1][1]]);
   readkey;

   clrscr;
   writeln;
   writeln;
   writeln;
   writeln;
   writeln('                      4. Ventas totales para el 2019');
   writeln;
   writeln;
   writeln;
   readkey;
   clrscr;
   writeln;
   writeln;
   total := 0;
   for i := 1 to 4 do
   begin
     for j := 1 to 4 do
     total := total + vendidos[i,j];
   end;
   total := total * 1000;
   writeln('Se estima un total de $', total, ' de ganancia para el anio 2019');
   readkey;
   clrscr;
   writeln;
   writeln;
   writeln;
   writeln;
   writeln('                              Fin del programa');
   readkey;
end.

