program Project1;

uses
  Vcl.Forms,
  GetMinor in 'GetMinor.pas' {Form3},
  GetMinor_Det in 'GetMinor_Det.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
