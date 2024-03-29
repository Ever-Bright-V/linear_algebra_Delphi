unit main;

interface

uses
  Perm, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls;

type
  TForm7 = class(TForm)
    btn1: TButton;
    mmo1: TMemo;
    btn2: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

procedure TForm7.btn1Click(Sender: TObject);
var
  //AArray: TArray<Integer>;
  AArray: TStrArray;   // 'array of' will be wrong
  ResultList: Tstringlist;
begin
  ResultList := Tstringlist.create;
  AArray := ['��', '��', '��'];
  // AArray := [1, 2, 3];
  //Permint(AArray, 0, 2, ResultList);
  PermStr(AArray, 0, 2, ResultList);
  mmo1.Text := ResultList.Text;
end;

procedure TForm7.btn2Click(Sender: TObject);
var
  AArray: TIntArray;
  ResultList: Tstringlist;
  ResultArray: PermResultIntArray;
  X, Y: Integer;
begin
  ResultList := Tstringlist.create;
  AArray := [1, 2, 3];
  Permint(AArray, 0, 2, ResultList);
  mmo1.Text := ResultList.Text;
  PermListToArray(ResultList, ResultArray);
  for X := Low(ResultArray) to High(ResultArray) do
  begin
    for Y := Low(ResultArray[X]) to High(ResultArray[X]) do
    begin
      mmo1.Lines.Add(Format('Array(%d,%d):%d', [X, Y, ResultArray[X, Y]]));
    end;
  end;
end;

end.

