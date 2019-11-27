object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 424
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
    Height = 424
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
    Height = 424
    Align = alClient
    TabOrder = 9
    object StringGrid1: TStringGrid
      Left = 144
      Top = 1
      Width = 310
      Height = 422
      Align = alRight
      DefaultRowHeight = 64
      TabOrder = 3
    end
    object Button1: TButton
      Left = 31
      Top = 80
      Width = 89
      Height = 25
      Caption = #23450#20041#27861#27979#35797
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 31
      Top = 118
      Width = 89
      Height = 25
      Caption = #19979#19977#35282#27979#35797
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 28
      Top = 149
      Width = 89
      Height = 25
      Caption = #19979#19977#35282#27979#35797'2'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object btn5: TButton
    Left = 328
    Top = 35
    Width = 93
    Height = 25
    Caption = #35745#31639
    TabOrder = 5
    OnClick = btn5Click
  end
  object Button4: TButton
    Left = 325
    Top = 207
    Width = 96
    Height = 25
    Caption = #36882#24402#20989#25968#20351#29992
    TabOrder = 10
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 328
    Top = 242
    Width = 89
    Height = 25
    Caption = #23637#24320#27861
    TabOrder = 11
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 328
    Top = 273
    Width = 92
    Height = 25
    Caption = #20313#23376#24335
    TabOrder = 12
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 328
    Top = 304
    Width = 89
    Height = 25
    Caption = #20313#23376#24335'2'
    TabOrder = 13
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 325
    Top = 335
    Width = 92
    Height = 25
    Caption = #27979#35797' '#19979#19977#35282#25968#32452
    TabOrder = 14
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 325
    Top = 366
    Width = 92
    Height = 25
    Caption = #23637#24320#27861'2'
    TabOrder = 15
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 328
    Top = 176
    Width = 89
    Height = 25
    Caption = #19979#19977#35282#27979#35797'3'
    TabOrder = 16
    OnClick = Button10Click
  end
end
