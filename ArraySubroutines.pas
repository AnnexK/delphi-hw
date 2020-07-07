unit ArraySubroutines;

interface
  procedure GenerateArray(var A : Array of Integer);
  procedure PrintArray(A : Array of Integer);
  procedure Swap(var a, b : Integer);

implementation
  procedure GenerateArray(var A : Array of Integer);
  var
    i, size : Integer;
  begin
    Randomize;
    size := Length(A);
    for i := Low(A) to High(A) do begin
      A[i] := Random(MaxInt) mod (3 * size);
    end;
  end;

  procedure PrintArray(A : Array of Integer);
  var
    i : Integer;
  begin
    for i := Low(A) to High(A) do begin
      Write(A[i], ' ');
    end;
    WriteLn;
  end;

  procedure Swap(var a : Integer; var b: Integer);
  var
    tmp: Integer;
  begin
    tmp := A;
    A := b;
    b := tmp;
  end;
end.
