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
    procedure btn1Click(Sender: TObject);
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
  AArray: TArray<string>;   // 'array of' will be wrong
  ResultList: Tstringlist;
begin
  ResultList := Tstringlist.create;
  AArray := ['ÎÒ', '°®', 'Äã'];
  // AArray := [1, 2, 3];
  //Permint(AArray, 0, 2, ResultList);
  PermStr(AArray, 0, 2, ResultList);
  mmo1.Text := ResultList.Text;
end;

end.

