unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.Menus;

type
  TFrmMain = class(TForm)
    pnlPrint: TPanel;
    pnlMenu: TPanel;
    imgMenu: TImage;
    PopupMenu: TPopupMenu;
    imgPrint: TImage;
    procedure FormShow(Sender: TObject);
    procedure imgMenuClick(Sender: TObject);
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

procedure TFrmMain.imgMenuClick(Sender: TObject);
begin
  with TButton(Sender).ClientToScreen(point(TButton(Sender).Width, TButton(Sender).Height)) do
  begin
    PopupMenu.Popup(x - pnlMenu.Width, y);
  end;
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
