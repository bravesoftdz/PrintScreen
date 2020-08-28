program PrintScreen;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {FrmMain},
  uSplash in 'uSplash.pas' {FrmSplash};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmSplash, FrmSplash);
  Application.Run;
end.
