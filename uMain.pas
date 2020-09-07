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
    procedure newCapture;
    function captureScreen: TBitmap;
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses uSplash;

function TFrmMain.captureScreen: TBitmap;
var
  dc: hdc;
  canvas: TCanvas;
  aX: integer;
  aY: integer;
begin
  try
    result := TBitmap.Create;
    result.Width := pnlPrint.Width;
    result.Height := pnlPrint.Height;

    dc := GetDc(0);
    canvas := TCanvas.Create;
    canvas.Handle := DC;

    with imgPrint.ClientToScreen(point(imgPrint.Width, imgPrint.Height)) do
    begin
      aX := x;
      aY := y;
    end;

    result.Canvas.CopyRect(
      Rect(0, 0, imgPrint.Width, imgPrint.Height), canvas,
      Rect(aX - imgPrint.Width, aY - imgPrint.Height, aX, aY));
  finally
    canvas.Free;
    ReleaseDC(0, DC);
  end;
end;

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

procedure TFrmMain.newCapture;
begin
  pnlMenu.Visible := False;
  imgPrint.Picture.Assign(captureScreen);
  pnlMenu.Visible := True;
  FrmMain.TransparentColor := False;
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
