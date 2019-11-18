unit Main;

interface

uses
  Reverse_Order, Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm3 = class(TForm)
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.btn1Click(Sender: TObject);
var
  TestArray: array of Integer;
begin
  TestArray := [3, 6, 7, 1, 5, 2, 8, 4];
  //TestArray := [3, 2,1];
  ShowMessage(ReverOrder(TestArray).ToString);
end;

end.

