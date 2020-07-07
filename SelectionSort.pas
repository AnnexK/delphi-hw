unit SelectionSort;

interface
  uses
    StrategyInterface,
    ArraySubroutines;

  type
    TSelectionsort = class(TInterfacedObject, ISorter)
      procedure Sort(var A: Array of Integer);
      destructor Destroy; override;
    end;

implementation
  procedure TSelectionsort.Sort(var A : array of Integer);
  var
    CurIndex, Minimum, ToSwap, i: Integer;
  begin
  for CurIndex := Low(A) to High(A) do
    begin
      Minimum := A[CurIndex];
      ToSwap := CurIndex;
      for i := CurIndex + 1 to High(A) do
      begin
        if A[i] < Minimum then
        begin
          Minimum := A[i];
          ToSwap := i;
        end;
      end;
      Swap(A[CurIndex], A[ToSwap]);
    end;
  end;

  destructor TSelectionSort.Destroy;
  begin
    WriteLn('Selection sort destr');
    inherited;
  end;
end.
