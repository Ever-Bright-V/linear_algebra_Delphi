program Perm_Test;

uses
  Vcl.Forms,
  main in 'main.pas' {Form7},
  Perm in 'Perm.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm7, Form7);
  Application.Run;
end.
