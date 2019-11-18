unit Permutation_全排列;

interface

uses
  Permutation_Release, Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm6 = class(TForm)
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    mmo1: TMemo;
    btn4: TButton;
    btn5: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Perm(var AArray: TArray<Integer>; FrontP: Integer; LastP: Integer);
    procedure ArrElementExchage(var AArray: TArray<Integer>; Front: Integer; Last: Integer); overload;
    procedure ArrElementExchage(var AArray: TArray<string>; Front: Integer; Last: Integer); overload;
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

{ TForm6 }

procedure TForm6.ArrElementExchage(var AArray: TArray<Integer>; Front, Last: Integer);
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

procedure TForm6.ArrElementExchage(var AArray: TArray<string>; Front, Last: Integer);
begin

end;

procedure TForm6.btn1Click(Sender: TObject);
var
  Str: string;
  A1: Integer;
  A2: Integer;
begin
  Str := '测试';
  A1 := 1;
  A2 := 2;
  A2 := Swap(A1);
  showmessage(Str[A1] + Str[A2]);
end;

procedure TForm6.btn2Click(Sender: TObject);
var
  Aarray: TArray<Integer>;
  List: TStringList;
  Num: Integer;
begin
  List := TStringList.Create;
  Aarray := [1, 2, 3, 4, 5, 6, 7];
  for Num := 0 to High(Aarray) do
  begin
    List.Add(Aarray[Num].ToString);
  end;
  ShowMessage('初始数组:' + List.CommaText);
  //--------------------------------------------------
  ArrElementExchage(Aarray, 1, 5);
  List.Clear;
  for Num := 0 to High(Aarray) do
  begin
    List.Add(Aarray[Num].ToString);
  end;
  ShowMessage('交换数组1 5:' + List.CommaText);
  //--------------------------------------------------
  ArrElementExchage(Aarray, 1, 5);
  List.Clear;
  for Num := 0 to High(Aarray) do
  begin
    List.Add(Aarray[Num].ToString);
  end;
  ShowMessage('交换数组1 5:' + List.CommaText);
  //--------------------------------------------------
  ArrElementExchage(Aarray, 1, 5);
  List.Clear;
  for Num := 0 to High(Aarray) do
  begin
    List.Add(Aarray[Num].ToString);
  end;
  ShowMessage('交换数组1 5:' + List.CommaText);
  //--------------------------------------------------
  ArrElementExchage(Aarray, 0, 5);
  List.Clear;
  for Num := 0 to High(Aarray) do
  begin
    List.Add(Aarray[Num].ToString);
  end;
  ShowMessage('交换数组0 5:' + List.CommaText);
    //--------------------------------------------------
  ArrElementExchage(Aarray, Low(Aarray), High(Aarray));
  List.Clear;
  for Num := 0 to High(Aarray) do
  begin
    List.Add(Aarray[Num].ToString);
  end;
  ShowMessage('交换数组低位 高位:' + List.CommaText);
     //--------------------------------------------------
  ArrElementExchage(Aarray, 0, 0);
  List.Clear;
  for Num := 0 to High(Aarray) do
  begin
    List.Add(Aarray[Num].ToString);
  end;
  ShowMessage('交换数组低位 高位:' + List.CommaText);
end;

procedure TForm6.btn3Click(Sender: TObject);
var
  Aarray: TArray<Integer>;
begin
  Aarray := [1, 2, 3, 4, 5];
  Self.Perm(Aarray, 0, 4);
end;

procedure TForm6.btn4Click(Sender: TObject); // Function 失败
var
  Aarray: TArray<Integer>;
  ResultArray: TArrangeResult;
begin
  Aarray := [1, 2, 3];
  SetLength(ResultArray, 6, 3);
  ResultArray := Perml(Aarray, 0, 2);
  ShowMessage(ResultArray[0, 0].ToString);
end;

procedure TForm6.btn5Click(Sender: TObject);
var
  ResultList: TStringList;
var
  Aarray: TArray<Integer>;
begin
  ResultList := Tstringlist.create;
  Aarray := [1, 2, 3];
  Perml(Aarray, 0, 2, ResultList);
  mmo1.Text := ResultList.Text;
end;

procedure TForm6.Perm(var AArray: TArray<Integer>; FrontP: Integer; LastP: Integer);
var
  Num, Num1: Integer;
  List: Tstringlist;
begin
  List := TStringList.Create;
  if FrontP = LastP then
  begin
    for Num1 := 0 to High(AArray) do
    begin
      List.Add(AArray[Num1].ToString);
    end;
    mmo1.Lines.Add(List.CommaText);
    List.Free;
  end;
  for Num := FrontP to LastP do
  begin
    ArrElementExchage(AArray, FrontP, Num);
    Perm(AArray, FrontP + 1, LastP);
    ArrElementExchage(AArray, FrontP, Num);
  end;
end;

end.

