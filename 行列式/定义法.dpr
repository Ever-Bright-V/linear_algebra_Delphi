program ¶¨Òå·¨;

uses
  Vcl.Forms,
  Definition_Method in 'Definition_Method.pas' {Form3},
  Perm in 'Perm.pas',
  Reverse_Order in 'Reverse_Order.pas',
  Definition_Method_Det in 'Definition_Method_Det.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
