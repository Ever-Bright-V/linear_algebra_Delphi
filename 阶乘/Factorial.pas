unit Factorial;

interface

function Factor(Num: Integer): Integer;

implementation

function Factor(Num: Integer): Integer;
var
  N: Integer;
begin
  Result := 1;
  for N := 1 to Num do
  begin
    Result := Result * N;
  end;
end;

end.

