unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmMain = class(TForm)
    pnlHeader: TPanel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure showSplash;
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses uSplash;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  showSplash;
end;

procedure TFrmMain.showSplash;
var
  FrmSplash: TFrmSplash;
begin
  FrmSplash := TFrmSplash.Create(Self);
  FrmSplash.Show;
  FrmSplash.Refresh;
  Sleep(3000);

  if Assigned(FrmSplash) then
  begin
    FrmSplash.Free;
  end;
end;

end.
