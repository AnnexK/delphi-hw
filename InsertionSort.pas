unit InsertionSort;

interface
  uses
    StrategyInterface;

  type
    TInsertionSort = class(TInterfacedObject, ISorter)
      procedure Sort(var A : Array of Integer);
      destructor Destroy; override;
    end;

implementation
  procedure TInsertionSort.Sort(var A: array of Integer);
  var
    i, j : Integer;
    cur : Integer;
  begin
    for i := Low(A)+1 to High(A) do begin
      cur := A[i];
      j := i - 1;
      while (j >= Low(A)) and (A[j] > cur) do begin
         A[j+1] := A[j];
         j := j-1;
      end;
      A[j+1] := cur;
    end;
  end;

  destructor TInsertionSort.Destroy;
  begin
    WriteLn('Insertion sort destr');
    inherited;
  end;
end.
