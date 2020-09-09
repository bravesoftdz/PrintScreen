unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.Menus, System.Actions, Vcl.ActnList;

type
  TFrmMain = class(TForm)
    pnlPrint: TPanel;
    pnlMenu: TPanel;
    imgMenu: TImage;
    PopupMenu: TPopupMenu;
    imgPrint: TImage;
    NewPrintScreen: TMenuItem;
    SavePrintScreen: TMenuItem;
    DeletePrintScreen: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure imgMenuClick(Sender: TObject);
    procedure NewPrintScreenClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SavePrintScreenClick(Sender: TObject);
    procedure DeletePrintScreenClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure showSplash;
    procedure newCapture(img: TBitmap);
    procedure saveCapture(img: TImage);
    procedure deleteCapture(img: TImage);
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
  pnlMenu.Visible := False;

  try
    result := TBitmap.Create;
    result.Width := imgPrint.Width;
    result.Height := imgPrint.Height;

    dc := GetDc(0);
    canvas := TCanvas.Create;
    canvas.Handle := DC;

    with imgPrint.ClientToScreen(point(imgPrint.Width, imgPrint.Height)) do
    begin
      aX := x;
      aY := y;
    end;

    result.Canvas.CopyRect(Rect(0, 0, imgPrint.Width, imgPrint.Height), canvas, Rect(aX - imgPrint.Width, aY - imgPrint.Height, aX, aY));
  finally
    canvas.Free;
    ReleaseDC(0, DC);
  end;

  pnlMenu.Visible := True;
end;

procedure TFrmMain.deleteCapture(img: TImage);
begin
  if not img.Picture.Bitmap.Empty then
  begin
    img.Picture.Assign(nil);
    frmMain.TransparentColor := True;
  end;
end;

procedure TFrmMain.DeletePrintScreenClick(Sender: TObject);
begin
  deleteCapture(imgPrint);
end;

procedure TFrmMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (chr(Key) in ['N','n']) then
  begin
    newCapture(captureScreen);
  end
  else if (ssCtrl in Shift) and (chr(Key) in ['S','s']) then
  begin
    saveCapture(imgPrint);
  end
  else if (ssCtrl in Shift) and (chr(Key) in ['D','d']) then
  begin
    deleteCapture(imgPrint);
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

procedure TFrmMain.newCapture(img: TBitmap);
begin
  imgPrint.Picture.Assign(img);
  FrmMain.TransparentColor := False;
end;

procedure TFrmMain.NewPrintScreenClick(Sender: TObject);
begin
  newCapture(captureScreen);
end;

procedure TFrmMain.saveCapture(img: TImage);
var
  saveDialog: TSaveDialog;
  caminho : string;
begin
  if not img.Picture.Bitmap.Empty then
  begin
    try
      saveDialog := TSaveDialog.Create(nil);

      with saveDialog do
      begin
        Filter := 'Bitmap Image (.bmp)|*.bmp|JPEG Image (.jpeg)|*.jpeg |Png Image (.png)|*.png';
        FilterIndex := 1;
        FileName := 'image';
        DefaultExt := 'bmp';
      end;

      if saveDialog.Execute then
      begin
        caminho := saveDialog.FileName;
        img.Picture.SaveToFile(Caminho);
        deleteCapture(img);
      end;

    finally
      FreeAndNil(saveDialog);
    end;
  end;
end;

procedure TFrmMain.SavePrintScreenClick(Sender: TObject);
begin
  saveCapture(imgPrint);
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
