program ¶¨Òå·¨;

uses
  Vcl.Forms,
  Definition_Method in 'Definition_Method.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
