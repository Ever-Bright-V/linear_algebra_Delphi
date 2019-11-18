unit Perm;

interface

uses
  System.sysutils, System.Classes, System.Types;

procedure PermInt(var AArray: TArray<Integer>; FrontP: Integer; LastP: Integer;  Result: TStringlist);

procedure PermStr(var AArray: TArray<string>; FrontP: Integer; LastP: Integer; Result: TStringlist);

procedure ArrElementExchage(var AArray: TArray<Integer>; Front: Integer; Last: Integer); overload;

procedure ArrElementExchage(var AArray: TArray<string>; Front: Integer; Last: Integer); overload;

implementation

procedure PermInt(var AArray: TArray<Integer>; FrontP: Integer; LastP: Integer;  Result: TStringlist);
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

procedure ArrElementExchage(var AArray: TArray<Integer>; Front, Last: Integer);
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

procedure ArrElementExchage(var AArray: TArray<string>; Front, Last: Integer);
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

procedure PermStr(var AArray: TArray<string>; FrontP: Integer; LastP: Integer; Result: TStringlist);
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

end.

