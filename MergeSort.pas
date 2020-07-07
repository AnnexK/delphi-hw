unit MergeSort;

interface
  uses
    StrategyInterface;
  type
    TMergeSort = class(TInterfacedObject, ISorter)
      procedure Sort(var A : Array of Integer);
      destructor Destroy; override;
    private
      tmp : Array of Integer;
      procedure Merge(var A : Array of Integer; l, m, r : Integer);
    end;

implementation
  uses
    System.Math;

  procedure TMergeSort.Sort(var A : Array of Integer);
  var
    low, mid, high, size, len : Integer;
  begin
    len := Length(A);
    SetLength(tmp, len);
    size := 1;

    while size < len do begin
      low := 0;
      while low < len do begin
        mid := low + size - 1;
        high := Min(low + 2*size - 1, len-1);
        Merge(A, low, mid, high);
        low := low + 2*size;
      end;
      size := size * 2;
    end;
  end;

  procedure TMergeSort.Merge(var A : Array of Integer; l, m, r : Integer);
  var
    p, q, k : Integer;
  begin
    p := l;
    q := m+1;
    k := 0;
    while (p <= m) and (q <= r) do begin
      if A[p] < A[q] then begin
        tmp[k] := A[p];
        Inc(p);
      end
      else begin
        tmp[k] := A[q];
        Inc(q);
      end;
      Inc(k);
    end;
    while p <= m do begin
      tmp[k] := A[p];
      Inc(k);
      Inc(p);
    end;
    while q <= r do begin
      tmp[k] := A[q];
      Inc(k);
      Inc(q);
    end;
    for p := 0 to r-l do begin
      A[l+p] := tmp[p];
    end;
  end;

  destructor TMergeSort.Destroy;
  begin
    WriteLn('Mergesort destr');
    inherited;
  end;
end.
