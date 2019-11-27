unit GetMinor_Det;

interface

type
  TCalIntArray = array of array of Integer;

  TResultIntArray = array of array of Integer;

procedure GetMinor(CaiArray: TCalIntArray; RowNum: Integer; ColNum: Integer; var MinorArray: TResultIntArray);

implementation

procedure GetMinor(CaiArray: TCalIntArray; RowNum: Integer; ColNum: Integer; var MinorArray: TResultIntArray);
var
  CalArrLen: Integer;
  Col, Row: Integer;
  ColFlag, RowFlag: Integer;
begin
  RowFlag := RowNum;
  CalArrLen := Length(CaiArray);
  SetLength(MinorArray, CalArrLen - 1, CalArrLen - 1);
  for Row := Low(MinorArray) to High(MinorArray) do
  begin
    ColFlag := ColNum;
    if Row <> RowFlag then
    begin
      for Col := Low(MinorArray[0]) to High(MinorArray[0]) do
      begin
        if (Col <> ColFlag) then
        begin
          MinorArray[Row, Col] := CaiArray[Row, Col];
        end;
        if (Col = ColFlag) then
        begin
          MinorArray[Row, Col] := CaiArray[Row, Col + 1];
          ColFlag := ColFlag + 1;
        end;
      end;
    end
    else
    begin
      for Col := Low(MinorArray[0]) to High(MinorArray[0]) do
      begin
        if (Col <> ColFlag) then
        begin
          MinorArray[Row, Col] := CaiArray[Row + 1, Col];
        end;
        if (Col = ColFlag) then
        begin
          MinorArray[Row, Col] := CaiArray[Row + 1, Col + 1];
          ColFlag := ColFlag + 1;
        end;
      end;
      RowFlag := RowFlag + 1;
    end;
  end;
end;

end.

