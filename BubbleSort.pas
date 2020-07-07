unit BubbleSort;

interface
  uses
    StrategyInterface,
    ArraySubroutines;

  type
    TBubbleSort = class(TInterfacedObject, ISorter)
      procedure Sort(var A : Array of Integer);
      destructor Destroy; override;
    end;

implementation
  procedure TBubbleSort.Sort(var A: array of Integer);
  var
    i, j : Integer;
  begin
    for i := Low(A) to High(A) do begin
      for j := Low(A) to High(A) do begin
        if A[j] > A[j+1] then
          Swap(A[j], A[j+1]);
      end;
    end;
  end;

  destructor TBubbleSort.Destroy;
  begin
    WriteLn('Bubble sort destr');
    inherited;
  end;
end.
