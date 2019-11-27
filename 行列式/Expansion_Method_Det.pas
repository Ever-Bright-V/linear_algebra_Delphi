unit Expansion_Method_Det;

interface

uses
  GetMinor_Det;

function Expansion_Method(CalArray: TCalIntArray): Integer;

implementation

function Expansion_Method(CalArray: TCalIntArray): Integer;
var
  RowNum, ColNum: Integer;
  ResultInt: Integer;
  NextArr: TResultIntArray;
begin
  ResultInt := 0;
  if Length(CalArray) = 1 then
  begin
    ResultInt := CalArray[0, 0];
  end
  else
  begin
    for ColNum := Low(CalArray[0]) to High(CalArray[0]) do
    begin
      GetMinor(TCalIntArray(CalArray), 0, ColNum, NextArr);
      if ColNum mod 2 <> 0 then
      begin
        ResultInt := ResultInt - CalArray[0, ColNum] * Expansion_Method(TCalIntArray(NextArr));
      end
      else
      begin
        ResultInt := ResultInt + CalArray[0, ColNum] * Expansion_Method(TCalIntArray(NextArr));
      end;

    end;
  end;
  Result := ResultInt;
end;

end.
