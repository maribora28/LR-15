program P4lr15;

type
  NodePtr = ^Node;
  Node = record
    data: Integer;
    next: NodePtr;
  end;

var
  head, current: NodePtr;
  maxElement, minElement: Integer;

procedure AddNode(var head: NodePtr; value: Integer);
var
  newNode: NodePtr;
begin
  New(newNode);
  newNode^.data := value;
  newNode^.next := head;
  head := newNode;
end;

procedure FindMinMax(head: NodePtr; var maxElement, minElement: Integer);
var
  currentNode: NodePtr;
begin
  if head = nil then
  begin
    maxElement := -1; // Предполагаем, что список не пустой, и устанавливаем начальные значения
    minElement := -1;
    Exit;
  end;

  currentNode := head;
  maxElement := currentNode^.data;
  minElement := currentNode^.data;

  while currentNode <> nil do
  begin
    if currentNode^.data > maxElement then
      maxElement := currentNode^.data;

    if currentNode^.data < minElement then
      minElement := currentNode^.data;

    currentNode := currentNode^.next;
  end;
end;

begin
  // Создаем пример односвязного списка
  head := nil;
  AddNode(head, 10);
  AddNode(head, 5);
  AddNode(head, 20);
  AddNode(head, 3);
  
  // Находим максимальный и минимальный элементы в списке
  FindMinMax(head, maxElement, minElement);

  // Выводим результаты
  writeln('Максимальный элемент в списке: ', maxElement);
  writeln('Минимальный элемент в списке: ', minElement);
end.
