program Project1;

uses
  Vcl.Forms,
  mian_Test in 'mian_Test.pas' {Form3},
  Factorial in 'Factorial.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
