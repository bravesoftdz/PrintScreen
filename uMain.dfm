object FrmMain: TFrmMain
  Left = 0
  Top = 0
  BiDiMode = bdLeftToRight
  Caption = 'Print Screen'
  ClientHeight = 359
  ClientWidth = 584
  Color = clWhite
  TransparentColor = True
  TransparentColorValue = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrint: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 359
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    object imgPrint: TImage
      Left = 1
      Top = 1
      Width = 582
      Height = 357
      Align = alClient
      ExplicitLeft = 280
      ExplicitTop = 128
      ExplicitWidth = 105
      ExplicitHeight = 105
    end
    object imgMenu: TImage
      Left = 3
      Top = 3
      Width = 40
      Height = 38
      Cursor = crHandPoint
      Hint = 'Abrir menu'
      Align = alCustom
      Center = True
      ParentShowHint = False
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
        0017080600000011218F2D000000097048597300000B1300000B1301009A9C18
        000000464944415478DA63949595FDCF4043C008B2E01D6F114D0C17FADC375C
        2CA089E950C0F8FF3F4DCDA7830F8647248FA622BC168CA6A2C161014D4C8782
        D15484178CA622A20000AE0B47C7D25965AB0000000049454E44AE426082}
      Proportional = True
      ShowHint = True
      Stretch = True
      OnClick = imgMenuClick
    end
  end
  object PopupMenu: TPopupMenu
    OnChange = PopupMenuChange
    Left = 424
    Top = 56
    object NewPrintScreen: TMenuItem
      Caption = 'New Print Screen'
      ShortCut = 16462
      OnClick = NewPrintScreenClick
    end
    object SavePrintScreen: TMenuItem
      Caption = 'Save Print Screen'
      ShortCut = 16467
      OnClick = SavePrintScreenClick
    end
    object DeletePrintScreen: TMenuItem
      Caption = 'Delete Print Screen'
      ShortCut = 16452
      OnClick = DeletePrintScreenClick
    end
  end
end
