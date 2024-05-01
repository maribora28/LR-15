program P3lr15;

var
  myArray: array[1..10] of Integer;
  i: Integer;

begin
  // Заполняем массив из десяти элементов
  for i := 1 to 10 do
    myArray[i] := i;

  // Выводим весь массив на экран
  writeln('Массив из десяти элементов:');
  for i := 1 to 10 do
    write(myArray[i], ' ');
  
  // Выводим только четные элементы массива
  writeln;
  writeln('Четные элементы массива:');
  for i := 1 to 10 do
    if myArray[i] mod 2 = 0 then
      write(myArray[i], ' ');
end.
