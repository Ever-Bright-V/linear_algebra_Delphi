program Perm_Demo1;

uses
  Vcl.Forms,
  Permutation_全排列 in 'Permutation_全排列.pas' {Form6},
  Permutation_Release in 'Permutation_Release.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
