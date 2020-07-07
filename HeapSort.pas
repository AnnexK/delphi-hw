unit HeapSort;

interface
  uses
    StrategyInterface,
    ArraySubroutines;

  type
    THeapSort = class(TInterfacedObject, ISorter)
      procedure Sort(var A : Array of Integer);
      destructor Destroy; override;
    private
      procedure BuildHeap(var A : Array of Integer);
      procedure Heapify(var A : Array of Integer; i, size : Integer);
    end;

implementation
  procedure THeapSort.Sort(var A: array of Integer);
  var
    len, cur : Integer;
  begin
    BuildHeap(A);
    len := Length(A);
    cur := len-1;
    while cur > 0 do begin
      Swap(A[0], A[cur]);
      Dec(cur);
      Heapify(A, 0, cur);
    end;
  end;

  procedure THeapSort.BuildHeap(var A: array of Integer);
  var
    i, len : Integer;
  begin
    len := Length(A);
    for i := len div 2 downto 0 do Heapify(A, i, len);
  end;

  procedure THeapSort.Heapify(var A: array of Integer; i, size: Integer);
  var
    left, right, largest : Integer;
  begin
    left := 2*i + 1;
    right := 2*i + 2;

    if (left < size) and (A[left] > A[i]) then begin
      largest := left;
    end
    else begin
      largest := i;
    end;
    if (right < size) and (A[largest] < A[right]) then
      largest := right;

    if largest <> i then begin
      Swap(A[largest], A[i]);
      Heapify(A, largest, size);
    end;
  end;

  destructor THeapSort.Destroy;
  begin
    WriteLn('Heap sort destr');
    inherited;
  end;
end.
