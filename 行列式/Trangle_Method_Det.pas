unit Trangle_Method_Det;

interface

type
  TDimIntArray = array of array of Integer;

  TTransResultRealArray = array of array of Real;

function Trangle_Method(AArray: TDimIntArray): Integer; overload;

function Trangle_Method(AArray: TDimIntArray; var ResultArray: TTransResultRealArray): Integer; overload;

function Trangle_Method(AArray: TDimIntArray; var ResultArray: TTransResultRealArray; var Flag: Boolean): Integer; overload;

procedure Exchange_Lines(InArray: TDimIntArray; X: Integer; Y: Integer; var OutArray: TDimIntArray);

implementation

function Trangle_Method(AArray: TDimIntArray): Integer;
var
  TempArr: array of array of Real;
  Num, RowNum, ColNum: Integer;
  Factor: Real;
  TempResult: Real;
  ExchangeResult: TDimIntArray;
  Flag: Boolean;
begin
  Flag := False;
  TempResult := 1;
  SetLength(TempArr, Length(AArray), Length(AArray));
  if AArray[0, 0] = 0 then
  begin
    Flag := True;
    for Num := Low(AArray) + 1 to High(AArray) do
    begin
      if AArray[0, Num] <> 0 then
      begin
        Exchange_Lines(AArray, 0, Num, ExchangeResult);
        Break
      end;
    end;
    for RowNum := Low(AArray) to High(AArray) do
    begin
      for ColNum := Low(AArray[0]) to High(AArray[0]) do
      begin
        TempArr[ColNum, RowNum] := ExchangeResult[ColNum, RowNum];
      end;
    end;
  end
  else
  begin
    for RowNum := Low(AArray) to High(AArray) do
    begin
      for ColNum := Low(AArray[0]) to High(AArray[0]) do
      begin
        TempArr[ColNum, RowNum] := AArray[ColNum, RowNum];
      end;
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
  if Flag = True then
  begin
    Result := Round(TempResult) * (-1);
  end
  else
  begin
    Result := Round(TempResult);
  end;

end;

function Trangle_Method(AArray: TDimIntArray; var ResultArray: TTransResultRealArray): Integer; overload;
var
  TempArr: array of array of Real;
  Num, RowNum, ColNum: Integer;
  Factor: Real;
  TempResult: Real;
  ExchangeResult: TDimIntArray;
  Flag: Boolean;
begin
  Flag := False;
  TempResult := 1;
  SetLength(TempArr, Length(AArray), Length(AArray));
  if AArray[0, 0] = 0 then
  begin
    for Num := Low(AArray) + 1 to High(AArray) do
    begin
      if AArray[0, Num] <> 0 then
      begin
        Exchange_Lines(AArray, 0, Num, ExchangeResult);
        Break
      end;
    end;
    for RowNum := Low(AArray) to High(AArray) do
    begin
      for ColNum := Low(AArray[0]) to High(AArray[0]) do
      begin
        TempArr[ColNum, RowNum] := ExchangeResult[ColNum, RowNum];
      end;
    end;
    Flag := True;
  end
  else
  begin
    for RowNum := Low(AArray) to High(AArray) do
    begin
      for ColNum := Low(AArray[0]) to High(AArray[0]) do
      begin
        TempArr[ColNum, RowNum] := AArray[ColNum, RowNum];
      end;
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
  if Flag = True then
  begin
    Result := Round(TempResult) * (-1);
  end
  else
  begin
    Result := Round(TempResult);
  end;
end;

procedure Exchange_Lines(InArray: TDimIntArray; X: Integer; Y: Integer; var OutArray: TDimIntArray);
var
  XX, YY: Integer;
  Temp: Integer;
begin
  SetLength(OutArray, Length(InArray), Length(InArray));
  for XX := Low(InArray) to High(InArray) do
  begin
    for YY := Low(InArray) to High(InArray) do
    begin
      OutArray[XX, YY] := InArray[XX, YY];
    end;
  end;
  for YY := Low(InArray) to High(InArray) do
  begin
    Temp := InArray[Y, YY];
    OutArray[X, YY] := Temp;
    Temp := InArray[X, YY];
    OutArray[Y, YY] := Temp;
  end;
end;

function Trangle_Method(AArray: TDimIntArray; var ResultArray: TTransResultRealArray; var Flag: Boolean): Integer; overload;
var
  TempArr: array of array of Real;
  Num, RowNum, ColNum: Integer;
  Factor: Real;
  TempResult: Real;
  ExchangeResult: TDimIntArray;
begin
  Flag := False;
  TempResult := 1;
  SetLength(TempArr, Length(AArray), Length(AArray));
  if AArray[0, 0] = 0 then
  begin
    for Num := Low(AArray) + 1 to High(AArray) do
    begin
      if AArray[0, Num] <> 0 then
      begin
        Exchange_Lines(AArray, 0, Num, ExchangeResult);
        Break
      end;
    end;
    for RowNum := Low(AArray) to High(AArray) do
    begin
      for ColNum := Low(AArray[0]) to High(AArray[0]) do
      begin
        TempArr[ColNum, RowNum] := ExchangeResult[ColNum, RowNum];
      end;
    end;
    Flag := True;
  end
  else
  begin
    for RowNum := Low(AArray) to High(AArray) do
    begin
      for ColNum := Low(AArray[0]) to High(AArray[0]) do
      begin
        TempArr[ColNum, RowNum] := AArray[ColNum, RowNum];
      end;
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
  if Flag = True then
  begin
    Result := Round(TempResult) * (-1);
  end
  else
  begin
    Result := Round(TempResult);
  end;
end;

end.

