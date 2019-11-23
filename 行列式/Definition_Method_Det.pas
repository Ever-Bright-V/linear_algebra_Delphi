unit Definition_Method_Det;

interface

uses
  System.Classes, Perm, Reverse_Order;

type
  TTDimIntArray = array of array of Integer;

function Define_Method(CalArray: TTDimIntArray): Integer;

implementation

function Define_Method(CalArray: TTDimIntArray): Integer;
var
  Dimension: Integer;
  RowArray: TArray<Integer>;
  Num: Integer;
  NumNextlevel: Integer;
  PermResult: TStringList;
  PermResArray: PermResultIntArray;
  Sing1eTerm: Integer;
  SingleReverOrder: Integer;
  SingleTermMUtiL: Integer;
  Temp: Integer;
  ToTal: Integer;
begin
  Temp := 0;
  Sing1eTerm := 0;
  SingleReverOrder := 0;
  SingleTermMUtiL := 1;
  ToTal := 0;
  Dimension := Length(CalArray);
  setlength(RowArray, Dimension);
  for Num := Low(RowArray) to High(RowArray) do
  begin
    RowArray[Num] := Num + 1;
  end;
  PermResult := TStringList.Create;
  PermInt(RowArray, 0, High(RowArray), PermResult);
  PermListToArray(PermResult, PermResArray);
  for Num := low(PermResArray) to High(PermResArray) do
  begin
    for NumNextlevel := Low(PermResArray[Num]) to High(PermResArray[Num]) do
    begin
      Temp := PermResArray[Num, NumNextlevel];
      SingleTermMUtiL := SingleTermMUtiL * CalArray[NumNextlevel, Temp - 1];
    end;
    SingleReverOrder := ReverOrder(PermResArray[Num]);
    if SingleReverOrder mod 2 = 0 then
    begin
      Sing1eTerm := SingleTermMUtiL;
    end
    else
    begin
      Sing1eTerm := SingleTermMUtiL * (-1);
    end;
    ToTal := ToTal + Sing1eTerm;
    SingleTermMUtiL := 1;
  end;
  Result := ToTal;
end;

end.

