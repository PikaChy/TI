object Form1: TForm1
  Left = 292
  Top = 94
  Width = 784
  Height = 629
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
    Left = 576
    Top = 48
    Width = 72
    Height = 13
    Caption = 'lblInputFilePath'
  end
  object lblOutputFilePath: TLabel
    Left = 576
    Top = 120
    Width = 72
    Height = 13
    Caption = 'lblInputFilePath'
  end
  object lblInText: TLabel
    Left = 32
    Top = 296
    Width = 49
    Height = 13
    Caption = #1053#1072' '#1074#1093#1086#1076#1077':'
  end
  object lblOutText: TLabel
    Left = 32
    Top = 464
    Width = 57
    Height = 13
    Caption = #1053#1072' '#1074#1099#1093#1086#1076#1077':'
  end
  object btnOpenInputFile: TButton
    Left = 368
    Top = 24
    Width = 201
    Height = 57
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1093#1086#1076#1085#1086#1081' '#1092#1072#1081#1083
    TabOrder = 0
    OnClick = btnOpenInputFileClick
  end
  object btnOpenOutputFile: TButton
    Left = 368
    Top = 96
    Width = 201
    Height = 57
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1092#1072#1081#1083' '#1076#1083#1103' '#1079#1072#1087#1080#1089#1080
    TabOrder = 1
    OnClick = btnOpenOutputFileClick
  end
  object rbCypher: TRadioButton
    Left = 72
    Top = 24
    Width = 121
    Height = 17
    Caption = #1040#1083#1075#1086#1088#1080#1090#1084' '#1080#1079#1075#1086#1088#1086#1076#1080
    TabOrder = 2
    OnClick = rbCypherClick
  end
  object rbCypherRectangle: TRadioButton
    Left = 72
    Top = 40
    Width = 121
    Height = 17
    Caption = #1040#1083#1075#1086#1088#1080#1090#1084' '#1088#1077#1096#1077#1090#1082#1080
    TabOrder = 3
    OnClick = rbCypherRectangleClick
  end
  object rbCypherViznera: TRadioButton
    Left = 72
    Top = 56
    Width = 121
    Height = 17
    Caption = #1040#1083#1075#1086#1088#1080#1090#1084' '#1042#1080#1078#1085#1077#1088#1072
    TabOrder = 4
    OnClick = rbCypherVizneraClick
  end
  object btnDoCypher: TButton
    Left = 32
    Top = 136
    Width = 201
    Height = 57
    Caption = #1047#1072#1096#1080#1092#1088#1086#1074#1072#1090#1100
    TabOrder = 5
    OnClick = btnDoCypherClick
  end
  object edtKeyHeight: TEdit
    Left = 32
    Top = 96
    Width = 201
    Height = 21
    TabOrder = 6
    Text = #1042#1074#1077#1076#1080#1090#1077' '#1074#1099#1089#1086#1090#1091' '#1080#1079#1075#1086#1088#1086#1076#1080
  end
  object edtKeyWord: TEdit
    Left = 32
    Top = 96
    Width = 201
    Height = 21
    TabOrder = 7
    Text = #1042#1074#1077#1076#1080#1090#1077' '#1082#1083#1102#1095#1077#1074#1086#1077' '#1089#1083#1086#1074#1086
  end
  object btnChangeFiles: TButton
    Left = 248
    Top = 72
    Width = 113
    Height = 33
    Caption = #1055#1086#1084#1077#1085#1103#1090#1100' '#1084#1077#1089#1090#1072#1084#1080
    TabOrder = 8
    OnClick = btnChangeFilesClick
  end
  object btnDeCypher: TButton
    Left = 32
    Top = 216
    Width = 201
    Height = 57
    Caption = #1044#1077#1096#1080#1074#1088#1086#1074#1072#1090#1100
    TabOrder = 9
    OnClick = btnDeCypherClick
  end
  object dlgOpen1: TOpenDialog
    Left = 576
  end
end
