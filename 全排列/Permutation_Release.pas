unit Permutation_Release;

interface

uses
  System.Classes, System.Types;

type
  TArrangeResult = array of TArray<Integer>;

function JieChen(Num: Integer): Integer;

function Perml(var AArray: TArray<Integer>; FrontP: Integer; LastP: Integer): TArrangeResult; overload;

procedure Perml(var AArray: TArray<Integer>; FrontP: Integer; LastP: Integer; var Result: TStringlist); overload;

procedure ArrElementExchage(var AArray: TArray<Integer>; Front: Integer; Last: Integer); overload;

procedure ArrElementExchage(var AArray: TArray<string>; Front: Integer; Last: Integer); overload;

implementation

uses
  Vcl.Dialogs, System.sysutils;

function Perml(var AArray: TArray<Integer>; FrontP: Integer; LastP: Integer): TArrangeResult;
var
  Num, Num1, Num2: Integer;
 // List: Tstringlist;
  TempArrangeResult: TArrangeResult;
begin
  //SetLength(Result, JieChen(Length(AArray)), Length(AArray));
  SetLength(TempArrangeResult, JieChen(Length(AArray)), Length(AArray));
  //List := TStringList.Create;
  if FrontP = LastP then
  begin
    //showmessage(inttostr(AArray[0]));
    for Num1 := 0 to JieChen(Length(AArray)) - 1 do
    begin
      for Num2 := 0 to High(AArray) do  // 取结果
      begin
        TempArrangeResult[Num1, Num2] := AArray[Num2];
        //showmessage(inttostr(TempArrangeResult[0, 0]));

      end;
    end;
    Result := TempArrangeResult;
  end;
  for Num := FrontP to LastP do
  begin
    ArrElementExchage(AArray, FrontP, Num);
    Perml(AArray, FrontP + 1, LastP);
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
  //存在一个bug；
  //ShowMessage(AArray[Last].ToString);   // 是不是  var 所致
  TempArray[Front] := TempInt;
  AArray := TempArray;
  {if Front <> 0 then
  begin
    for Num := Low(AArray) to Front - 1 do
    begin
      TempArray[Num] := AArray[Num];
    end;
  end;
  for Num := Front + 1 to Last - 1 do
  begin
    TempArray[Num] := AArray[Num];
  end;
  if Last <> Length(AArray) - 1 then
  begin
    for Num := Last + 1 to Length(AArray) - 1 do
    begin
      TempArray[Num] := AArray[Num];
    end;
  end;
  AArray := TempArray}
end;

procedure ArrElementExchage(var AArray: TArray<string>; Front, Last: Integer);
begin
    //没写
end;

function JieChen(Num: Integer): Integer;
var
  N: Integer;
begin
  Result := 1;
  for N := 1 to Num do
  begin
    Result := Result * N;
  end;
end;

procedure Perml(var AArray: TArray<Integer>; FrontP: Integer; LastP: Integer; var Result: TStringlist);
var
  Num, Num1: Integer;
  Templist: Tstringlist;
begin
  if FrontP = LastP then
  begin
    Templist := TStringList.Create;
    for Num1 := Low(AArray) to High(AArray) do  // 取结果
    begin
      Templist.Add(AArray[Num1].ToString);
    end;
    ShowMessage('测试');
    //Result.Add(Templist.CommaText);
    //Result.Add('scasadasasd');
    Templist.Destroy;
  end;
  for Num := FrontP to LastP do
  begin
    ArrElementExchage(AArray, FrontP, Num);
    Perml(AArray, FrontP + 1, LastP, Result);
    ArrElementExchage(AArray, FrontP, Num);
  end;

end;

end.

