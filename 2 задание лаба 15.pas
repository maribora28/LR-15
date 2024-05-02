program lr15z2;

uses
  SysUtils;

type
  NodePtr = ^Node;
  Node = record
    word: string;
    count: Integer;
    next: NodePtr;
  end;

var
  head, current: NodePtr;
  F: Text;

function CreateNode(newWord: string): NodePtr;
var
  newNode: NodePtr;
begin
  New(newNode);
  newNode^.word := newWord;
  newNode^.count := 1;
  newNode^.next := nil;
  CreateNode := newNode;
end;

function MakePlace(newWord: string): NodePtr;
var
  currentNode, previousNode: NodePtr;
begin
  currentNode := head;
  previousNode := nil;

  while (currentNode <> nil) and (newWord > currentNode^.word) do
  begin
    previousNode := currentNode;
    currentNode := currentNode^.next;
  end;

  MakePlace := previousNode;
end;

procedure AddBefore(newWord: string);
var
  newNode, place: NodePtr;
begin
  newNode := CreateNode(newWord);
  place := MakePlace(newWord);

  if place = nil then
  begin
    newNode^.next := head;
    head := newNode;
  end
  else
  begin
    newNode^.next := place^.next;
    place^.next := newNode;
  end;
end;

procedure PrintList();
var
  currentNode: NodePtr;
begin
  currentNode := head;

  while currentNode <> nil do
  begin
    writeln(currentNode^.word, ' - ', currentNode^.count);
    currentNode := currentNode^.next;
  end;
end;

begin
  head := nil;

  // Открываем файл для чтения
  AssignFile(F, 'input.txt');
  Reset(F);

  // Считываем слова из файла и обрабатываем их
  while not Eof(F) do
  begin
    var word: string;
    Readln(F, word);

    current := head;
    while (current <> nil) and (current^.word <> word) do
      current := current^.next;

    if current = nil then
      AddBefore(word)
    else
      current^.count := current^.count + 1;
  end;

  // Закрываем файл
  CloseFile(F);

  // Выводим список слов и их частоту встречаемости
  PrintList();

end.

