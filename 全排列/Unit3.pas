unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls;

type
  TForm3 = class(TForm)
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Arrange(AArray: array of Integer);
    procedure TestArrange(Totallist: TStringList; FrontList: TStringList; LastList: TStringList);
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

{ TForm3 }

procedure TForm3.Arrange(AArray: array of Integer);
begin
  ShowMessage('');
end;

procedure TForm3.btn1Click(Sender: TObject);
var
  TestArr: array of Integer;
begin
  ShowMessage('Length:' + Length(TestArr).ToString);
  ShowMessage('Size:' + Sizeof(TestArr).ToString);
  TestArr := [1, 2, 3, 4];
  ShowMessage('Length:' + Length(TestArr).ToString);
  ShowMessage('Size:' + Sizeof(TestArr).ToString);
  //TestArr := Delete(TestArr, 2, 1);   // 不可以用 delete函数
  ShowMessage('Length后:' + Length(TestArr).ToString);
  ShowMessage('Size:' + Sizeof(TestArr).ToString);
end;

procedure TForm3.btn2Click(Sender: TObject);
var
  List: TStringList;
begin
  List := TStringList.Create;
  List.CommaText := '1,2,3';
  ShowMessage(List.Count.ToString);
  List.Delete(1);
  ShowMessage(List.Count.ToString);
  ShowMessage(List[1]);
  List.Insert(1, '2');
  ShowMessage(List[1]);
end;

procedure TForm3.btn3Click(Sender: TObject);
var
  CList, Blist, Alist: TStringList;
begin
  Alist := TStringList.Create;
  Blist := TStringList.Create;
  CList := TStringList.Create;
  Alist.CommaText := '1,2,3,4';
  TestArrange(Alist, Blist, CList);

end;

procedure TForm3.btn4Click(Sender: TObject);
var
  TDArray: array of TArray<Integer>;
begin
  SetLength(TDArray,2,3);
  TDArray[2,2]:=20; // 最外侧 为 ，在 最前面
  ShowMessage(TDarray[1,2].ToString);
end;

procedure TForm3.TestArrange(Totallist: TStringList; FrontList: TStringList; LastList: TStringList);
var
  Str: string;
  TempList: TStringList;
  All, Num: Integer;
begin
  TempList := TStringList.Create;
  TempList := Totallist;
 //ShowMessage('Test');
  if LastList.Count = 2 then
  begin
    ShowMessage(FrontList.CommaText + LastList.CommaText);
    // 注意 交换 ，还未完成
  end;
  //for Str in Totallist do //
  if LastList.Count = 0 then
  begin
    All := Totallist.Count - 1;
  end
  else
  begin
    All := LastList.Count - 1;
  end;
  for Num := 0 to All do  // 注意使用 Num
  begin
    if LastList.Count = 2 then
    begin
      Exit
    end
    else
    begin
      FrontList.Add(TempList[Num]);
      TempList.Delete(0);
      LastList := TempList;
      ShowMessage('FrontList:' + FrontList.CommaText);
      ShowMessage('LastList:' + LastList.CommaText);
      ShowMessage(Totallist.Count.ToString);
      Self.TestArrange(LastList, FrontList, LastList);
    end;
  end;

end;

end.

