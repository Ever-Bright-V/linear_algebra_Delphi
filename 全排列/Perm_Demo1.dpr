program Perm_Demo1;

uses
  Vcl.Forms,
  Permutation_ȫ���� in 'Permutation_ȫ����.pas' {Form6},
  Permutation_Release in 'Permutation_Release.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
