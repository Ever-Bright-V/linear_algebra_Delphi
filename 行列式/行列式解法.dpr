program 行列式解法;

uses
  Vcl.Forms,
  Det_Test in 'Det_Test.pas' {Form3},
  Perm in 'Perm.pas',
  Reverse_Order in 'Reverse_Order.pas',
  Definition_Method_Det in 'Definition_Method_Det.pas',
  Trangle_Method_Det in 'Trangle_Method_Det.pas',
  GetMinor_Det in 'GetMinor_Det.pas',
  TransPose_Det in 'TransPose_Det.pas',
  Expansion_Method_Det in 'Expansion_Method_Det.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
