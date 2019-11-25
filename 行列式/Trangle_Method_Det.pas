unit Trangle_Method_Det;

interface

type
  TDimIntArray = array of array of Integer;

  TTransResultRealArray = array of array of Real;

function Trangle_Method(AArray: TDimIntArray): Integer; overload;

function Trangle_Method(AArray: TDimIntArray; var ResultArray: TTransResultRealArray): Integer; overload;

implementation

function Trangle_Method(AArray: TDimIntArray): Integer;
var
  TempArr: array of array of Real;
  Num, RowNum, ColNum: Integer;
  Factor: Real;
  TempResult: Real;
begin
  TempResult := 1;
  SetLength(TempArr, Length(AArray), Length(AArray));
  for RowNum := Low(AArray) to High(AArray) do
  begin
    for ColNum := Low(AArray[0]) to High(AArray[0]) do
    begin
      TempArr[ColNum, RowNum] := AArray[ColNum, RowNum];
    end;
  end;
  for Num := Low(TempArr) to High(TempArr) - 1 do
  begin
    for RowNum := Num + 1 to High(TempArr) do
    begin
      if TempArr[Num, Num] <> 0 then
      begin
        Factor := TempArr[Num, RowNum] / TempArr[Num, Num];
        for ColNum := Num to High(TempArr[0]) do
        begin
          TempArr[ColNum, RowNum] := TempArr[ColNum, RowNum] - Factor * TempArr[ColNum, Num];
        end;
      end;
    end;
  end;
  for Num := Low(TempArr) to High(TempArr) do
  begin
    TempResult := TempResult * TempArr[Num, Num];
  end;
  Result := Round(TempResult);
end;

function Trangle_Method(AArray: TDimIntArray; var ResultArray: TTransResultRealArray): Integer; overload;
var
  TempArr: array of array of Real;
  Num, RowNum, ColNum: Integer;
  Factor: Real;
  TempResult: Real;
begin
  TempResult := 1;
  SetLength(TempArr, Length(AArray), Length(AArray));
  for RowNum := Low(AArray) to High(AArray) do
  begin
    for ColNum := Low(AArray[0]) to High(AArray[0]) do
    begin
      TempArr[ColNum, RowNum] := AArray[ColNum, RowNum];
    end;
  end;
  for Num := Low(TempArr) to High(TempArr) - 1 do
  begin
    for RowNum := Num + 1 to High(TempArr) do
    begin
      if TempArr[Num, Num] <> 0 then
      begin
        Factor := TempArr[Num, RowNum] / TempArr[Num, Num];
        for ColNum := Num to High(TempArr[0]) do
        begin
          TempArr[ColNum, RowNum] := TempArr[ColNum, RowNum] - Factor * TempArr[ColNum, Num];
        end;
      end;
    end;
  end;
  for Num := Low(TempArr) to High(TempArr) do
  begin
    TempResult := TempResult * TempArr[Num, Num];
  end;
  SetLength(ResultArray, Length(AArray), Length(AArray));
  for RowNum := Low(AArray) to High(AArray) do
  begin
    for ColNum := Low(AArray[0]) to High(AArray[0]) do
    begin
      ResultArray[ColNum, RowNum] := TempArr[ColNum, RowNum];
    end;
  end;
  for Num := Low(TempArr) to High(TempArr) - 1 do
  begin
    for RowNum := Num + 1 to High(TempArr) do
    begin
      if TempArr[Num, Num] <> 0 then
      begin
        Factor := TempArr[Num, RowNum] / TempArr[Num, Num];
        for ColNum := Num to High(TempArr[0]) do
        begin
          TempArr[ColNum, RowNum] := TempArr[ColNum, RowNum] - Factor * TempArr[ColNum, Num];
        end;
      end;
    end;
  end;
  Result := Round(TempResult);
end;

end.

