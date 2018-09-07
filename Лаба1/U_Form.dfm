object Form1: TForm1
  Left = 730
  Top = 244
  Width = 1305
  Height = 675
  Caption = #1050#1088#1080#1087#1086#1090#1075#1088#1072#1092
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblInputFilePath: TLabel
    Left = 568
    Top = 48
    Width = 72
    Height = 13
    Caption = 'lblInputFilePath'
  end
  object lblOutputFilePath: TLabel
    Left = 568
    Top = 120
    Width = 72
    Height = 13
    Caption = 'lblInputFilePath'
  end
  object btnOpenInputFile: TButton
    Left = 360
    Top = 24
    Width = 201
    Height = 57
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1093#1086#1076#1085#1086#1081' '#1092#1072#1081#1083
    TabOrder = 0
    OnClick = btnOpenInputFileClick
  end
  object btnOpenOutputFile: TButton
    Left = 360
    Top = 96
    Width = 201
    Height = 57
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1092#1072#1081#1083' '#1076#1083#1103' '#1079#1072#1087#1080#1089#1080
    TabOrder = 1
    OnClick = btnOpenOutputFileClick
  end
  object btnDoSmth: TButton
    Left = 360
    Top = 176
    Width = 201
    Height = 57
    Caption = 'Do'
    TabOrder = 2
    OnClick = btnDoSmthClick
  end
  object rbCypher: TRadioButton
    Left = 72
    Top = 24
    Width = 121
    Height = 17
    Caption = #1040#1083#1075#1086#1088#1080#1090#1084' '#1080#1079#1075#1086#1088#1086#1076#1080
    TabOrder = 3
  end
  object rbCypherRectangle: TRadioButton
    Left = 72
    Top = 40
    Width = 121
    Height = 17
    Caption = #1040#1083#1075#1086#1088#1080#1090#1084' '#1088#1077#1096#1077#1090#1082#1080
    TabOrder = 4
  end
  object rbCypherViznera: TRadioButton
    Left = 72
    Top = 56
    Width = 121
    Height = 17
    Caption = #1040#1083#1075#1086#1088#1080#1090#1084' '#1042#1080#1078#1085#1077#1088#1072
    TabOrder = 5
  end
  object btnDoCypher: TButton
    Left = 32
    Top = 96
    Width = 201
    Height = 57
    Caption = #1047#1072#1096#1080#1092#1088#1086#1074#1072#1090#1100
    TabOrder = 6
    OnClick = btnDoCypherClick
  end
  object dlgOpen1: TOpenDialog
    Left = 568
  end
end
