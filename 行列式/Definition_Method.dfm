object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 382
  ClientWidth = 808
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
    Left = 448
    Top = 288
    Width = 193
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
    Left = 448
    Top = 232
    Width = 193
    Height = 25
    Caption = 'btn2'
    TabOrder = 2
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 472
    Top = 160
    Width = 75
    Height = 25
    Caption = 'btn3'
    TabOrder = 3
    OnClick = btn3Click
  end
  object btn4: TButton
    Left = 624
    Top = 120
    Width = 75
    Height = 25
    Caption = 'btn4'
    TabOrder = 4
  end
  object btn5: TButton
    Left = 448
    Top = 56
    Width = 169
    Height = 25
    Caption = 'btn5'
    TabOrder = 5
    OnClick = btn5Click
  end
end
