program Project1;

uses
  Vcl.Forms,
  Main in 'Main.pas' {Form3},
  Reverse_Order in 'Reverse_Order.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
