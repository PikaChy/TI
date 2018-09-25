object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1064#1080#1092#1088#1072#1090#1086#1088
  ClientHeight = 201
  ClientWidth = 379
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clDefault
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnEnter: TButton
    Left = 107
    Top = 56
    Width = 169
    Height = 58
    Caption = #1042#1074#1077#1089#1090#1080' 1 '#1079#1085#1072#1095#1077#1085#1080#1077
    TabOrder = 0
    OnClick = btnEnterClick
  end
  object edtValue: TEdit
    Left = 16
    Top = 17
    Width = 344
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    NumbersOnly = True
    ParentFont = False
    TabOrder = 1
    OnKeyPress = edtValueKeyPress
  end
  object btnCypher: TButton
    Left = 16
    Top = 120
    Width = 169
    Height = 57
    Caption = #1064#1080#1092#1088#1086#1074#1072#1090#1100
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnCypherClick
  end
  object btnDecypher: TButton
    Left = 191
    Top = 120
    Width = 169
    Height = 57
    Caption = #1044#1077#1096#1080#1092#1088#1086#1074#1072#1090#1100
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnDecypherClick
  end
end
