unit TransPose_Det;

interface

type
  TOpArray = array of array of Integer;

procedure TransPose(var OpArray: TOpArray; var ResultArray: TOpArray);

implementation

procedure TransPose(var OpArray: TOpArray; var ResultArray: TOpArray);
var
  X, Y: Integer;
  TempInt: integer;
begin
  SetLength(ResultArray, Length(OpArray), Length(OpArray));
  for X := Low(OpArray[0]) to High(OpArray[0]) do
  begin
    for Y := Low(OpArray) to High(OpArray) do
    begin
      TempInt := OpArray[Y, X];
      ResultArray[X, Y] := TempInt;
    end;
  end;
end;

end.

