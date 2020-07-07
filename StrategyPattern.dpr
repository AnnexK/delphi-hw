program StrategyPattern;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Generics.Collections,
  StrategyInterface in 'StrategyInterface.pas',
  MergeSort in 'MergeSort.pas',
  ArraySubroutines in 'ArraySubroutines.pas',
  SelectionSort in 'SelectionSort.pas',
  BubbleSort in 'BubbleSort.pas',
  InsertionSort in 'InsertionSort.pas',
  HeapSort in 'HeapSort.pas';

type
  Sorters = TDictionary<String, ISorter>;

const
  N = 100;

procedure SetSorters(var S : Sorters);
begin
  S.Add('mergesort', TMergeSort.Create);
  S.Add('selsort', TSelectionSort.Create);
  S.Add('bubblesort', TBubbleSort.Create);
  S.Add('inssort', TInsertionSort.Create);
  S.Add('heapsort', THeapSort.Create);
end;

procedure Invite(S : Sorters);
var
  Name : String;
begin
  WriteLn('Choose a sorter to sort an array');
  Write('Available sorters: ');
  for Name in S.Keys do begin
    Write(Name, ' ');
  end;
  WriteLn;
end;
var
  S : Sorters;
  ChosenSorter : ISorter;
  Arr : Array [1..N] of Integer;
  Choice : String;

begin
  try
    ChosenSorter := nil;
    S := Sorters.Create;
    SetSorters(S);
    GenerateArray(Arr);
    PrintArray(Arr);
    Invite(S);
    repeat
      Readln(Choice);
      if S.ContainsKey(Choice) then begin
        ChosenSorter := S[Choice];
      end
      else begin
        WriteLn('No such sorter');
      end;
    until ChosenSorter <> nil;
    ChosenSorter.Sort(Arr);
    WriteLn('Done!');
    PrintArray(Arr);
    ReadLn;
    FreeAndNil(S);
  except
    on E: Exception do begin
      Writeln(E.ClassName, ': ', E.Message);
      ReadLn;
    end;
  end;
end.
