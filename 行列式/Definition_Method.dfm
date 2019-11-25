object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 382
  ClientWidth = 752
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btn1: TButton
    Left = 320
    Top = 304
    Width = 105
    Height = 25
    Caption = 'btn1'
    TabOrder = 0
    OnClick = btn1Click
  end
  object strngrd1: TStringGrid
    Left = 0
    Top = 0
    Width = 297
    Height = 382
    Align = alLeft
    DefaultRowHeight = 64
    DefaultDrawing = False
    FixedColor = clAppWorkSpace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goTabs, goThumbTracking, goFixedHotTrack]
    ParentFont = False
    TabOrder = 1
    OnDblClick = strngrd1DblClick
    OnDrawCell = strngrd1DrawCell
    OnSelectCell = strngrd1SelectCell
    OnSetEditText = strngrd1SetEditText
  end
  object btn2: TButton
    Left = 320
    Top = 208
    Width = 97
    Height = 25
    Caption = 'btn2'
    TabOrder = 2
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 344
    Top = 167
    Width = 75
    Height = 25
    Caption = 'btn3'
    TabOrder = 3
    OnClick = btn3Click
  end
  object btn4: TButton
    Left = 344
    Top = 136
    Width = 75
    Height = 25
    Caption = 'btn4'
    TabOrder = 4
  end
  object btn6: TButton
    Left = 333
    Top = 87
    Width = 75
    Height = 25
    Caption = 'btn6'
    TabOrder = 6
    OnClick = btn6Click
  end
  object btn7: TButton
    Left = 333
    Top = 256
    Width = 75
    Height = 25
    Caption = 'btn7'
    TabOrder = 7
    OnClick = btn7Click
  end
  object mmo1: TMemo
    Left = 328
    Top = 8
    Width = 68
    Height = 66
    Lines.Strings = (
      ''
      '')
    TabOrder = 8
    Visible = False
  end
  object pnl1: TPanel
    Left = 297
    Top = 0
    Width = 455
    Height = 382
    Align = alClient
    TabOrder = 9
    ExplicitLeft = 257
    ExplicitTop = -221
    object StringGrid1: TStringGrid
      Left = 144
      Top = 1
      Width = 310
      Height = 380
      Align = alRight
      DefaultRowHeight = 64
      TabOrder = 3
    end
    object Button1: TButton
      Left = 31
      Top = 118
      Width = 89
      Height = 25
      Caption = #23553#35013#27979#35797
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 31
      Top = 167
      Width = 89
      Height = 25
      Caption = #19979#19977#35282#27979#35797
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 31
      Top = 208
      Width = 89
      Height = 25
      Caption = #19979#19977#35282#27979#35797'2'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object btn5: TButton
    Left = 328
    Top = 80
    Width = 93
    Height = 25
    Caption = #35745#31639
    TabOrder = 5
    OnClick = btn5Click
  end
end
