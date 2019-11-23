unit Perm;

interface

uses
  System.sysutils, System.Classes, System.Types;

type
  PermResultIntArray = array of array of Integer;

  TIntArray = array of Integer;

  TStrArray = array of string;

procedure PermListToArray(Result: TStringlist; var AArray: PermResultIntArray);

procedure PermInt(var AArray: TArray<Integer>; FrontP: Integer; LastP: Integer; Result: TStringlist); overload;

procedure PermInt(var AArray: TIntArray; FrontP: Integer; LastP: Integer; Result: TStringlist); overload;

procedure PermStr(var AArray: TArray<string>; FrontP: Integer; LastP: Integer; Result: TStringlist); overload;

procedure PermStr(var AArray: TStrArray; FrontP: Integer; LastP: Integer; Result: TStringlist); overload;

procedure ArrElementExchage(var AArray: TArray<Integer>; Front: Integer; Last: Integer); overload;

procedure ArrElementExchage(var AArray: TIntArray; Front: Integer; Last: Integer); overload;

procedure ArrElementExchage(var AArray: TArray<string>; Front: Integer; Last: Integer); overload;

procedure ArrElementExchage(var AArray: TStrArray; Front: Integer; Last: Integer); overload;

implementation

procedure PermInt(var AArray: TArray<Integer>; FrontP: Integer; LastP: Integer; Result: TStringlist); overload;
var
  Num, Num1: Integer;
  Templist: Tstringlist;
begin
  if FrontP = LastP then
  begin
    Templist := TStringList.Create;
    for Num1 := Low(AArray) to High(AArray) do
    begin
      Templist.Add(IntToStr(AArray[Num1]));
    end;
    Result.Add(Templist.CommaText);
    Templist.Destroy;
  end;
  for Num := FrontP to LastP do
  begin
    ArrElementExchage(AArray, FrontP, Num);
    PermInt(AArray, FrontP + 1, LastP, Result);
    ArrElementExchage(AArray, FrontP, Num);
  end;
end;

procedure ArrElementExchage(var AArray: TArray<Integer>; Front, Last: Integer); overload;
var
  TempArray: TArray<Integer>;
  Num: Integer;
  TempInt: Integer;
begin
  SetLength(TempArray, length(AArray));
  TempInt := AArray[Last];
  TempArray := AArray;
  TempArray[Last] := AArray[Front];
  TempArray[Front] := TempInt;
  AArray := TempArray;
  {@Permutation_Release}
end;

procedure ArrElementExchage(var AArray: TIntArray; Front: Integer; Last: Integer); overload;
var
  TempArray: TIntArray;
  Num: Integer;
  TempInt: Integer;
begin
  SetLength(TempArray, length(AArray));
  TempInt := AArray[Last];
  TempArray := AArray;
  TempArray[Last] := AArray[Front];
  TempArray[Front] := TempInt;
  AArray := TempArray;
end;

procedure ArrElementExchage(var AArray: TArray<string>; Front, Last: Integer); overload;
var
  TempArray: TArray<string>;
  Num: Integer;
  TempStr: string;
begin
  SetLength(TempArray, length(AArray));
  TempStr := AArray[Last];
  TempArray := AArray;
  TempArray[Last] := AArray[Front];
  TempArray[Front] := TempStr;
  AArray := TempArray;
end;

procedure ArrElementExchage(var AArray: TStrArray; Front: Integer; Last: Integer); overload;
var
  TempArray: TStrArray;
  Num: Integer;
  TempStr: string;
begin
  SetLength(TempArray, length(AArray));
  TempStr := AArray[Last];
  TempArray := AArray;
  TempArray[Last] := AArray[Front];
  TempArray[Front] := TempStr;
  AArray := TempArray;
end;

procedure PermStr(var AArray: TArray<string>; FrontP: Integer; LastP: Integer; Result: TStringlist); overload;
var
  Num, Num1: Integer;
  Templist: Tstringlist;
begin
  if FrontP = LastP then
  begin
    Templist := TStringList.Create;
    for Num1 := Low(AArray) to High(AArray) do
    begin
      Templist.Add((AArray[Num1]));
    end;
    Result.Add(Templist.CommaText);
    Templist.Destroy;
  end;
  for Num := FrontP to LastP do
  begin
    ArrElementExchage(AArray, FrontP, Num);
    PermStr(AArray, FrontP + 1, LastP, Result);
    ArrElementExchage(AArray, FrontP, Num);
  end;
end;

procedure PermStr(var AArray: TStrArray; FrontP: Integer; LastP: Integer; Result: TStringlist); overload;
var
  Num, Num1: Integer;
  Templist: Tstringlist;
begin
  if FrontP = LastP then
  begin
    Templist := TStringList.Create;
    for Num1 := Low(AArray) to High(AArray) do
    begin
      Templist.Add((AArray[Num1]));
    end;
    Result.Add(Templist.CommaText);
    Templist.Destroy;
  end;
  for Num := FrontP to LastP do
  begin
    ArrElementExchage(AArray, FrontP, Num);
    PermStr(AArray, FrontP + 1, LastP, Result);
    ArrElementExchage(AArray, FrontP, Num);
  end;
end;

procedure PermListToArray(Result: TStringlist; var AArray: PermResultIntArray);
var
  OperateList: TStringList;
  OrderNum: Integer;
  Dimension: Integer;
  Num1, Num2: Integer;
begin
  OperateList := TStringList.Create;
  OrderNum := Result.Count;
  OperateList.CommaText := Result[0];
  Dimension := OperateList.Count;
  SetLength(AArray, OrderNum, Dimension);
  for Num1 := Low(AArray) to High(AArray) do
  begin
    OperateList.Clear;
    OperateList.CommaText := Result[Num1];   //  获取 每一个 排列
    for Num2 := Low(AArray[Num1]) to High(AArray[Num1]) do
    begin
      AArray[Num1, Num2] := StrToInt(OperateList[Num2]);
    end;
  end;
  OperateList.Free;
end;

procedure PermInt(var AArray: TIntArray; FrontP: Integer; LastP: Integer; Result: TStringlist); overload;
var
  Num, Num1: Integer;
  Templist: Tstringlist;
begin
  if FrontP = LastP then
  begin
    Templist := TStringList.Create;
    for Num1 := Low(AArray) to High(AArray) do
    begin
      Templist.Add(IntToStr(AArray[Num1]));
    end;
    Result.Add(Templist.CommaText);
    Templist.Destroy;
  end;
  for Num := FrontP to LastP do
  begin
    ArrElementExchage(AArray, FrontP, Num);
    PermInt(AArray, FrontP + 1, LastP, Result);
    ArrElementExchage(AArray, FrontP, Num);
  end;
end;

end.

