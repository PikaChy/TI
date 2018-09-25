unit Unit_Form;

interface

uses
  Unit_Cypher,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtDlgs, Vcl.Menus,
  Vcl.ToolWin, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    btnEnter: TButton;
    edtValue: TEdit;
    btnCypher: TButton;
    btnDecypher: TButton;
    procedure btnEnterClick(Sender: TObject);
    procedure edtValueKeyPress(Sender: TObject; var Key: Char);
    procedure btnCypherClick(Sender: TObject);
    procedure btnDecypherClick(Sender: TObject);
    procedure BtnZeroAddClick(Sender: TObject);
  end;

const
  CInputFile = 'input.txt';
  CCypheredFile = 'Cyphered.txt';
  CDecypherFile = 'Decyphered.txt';
  CCryptFile = 'MainCrypt';
  CMaxLenVal = 45;
  CBinarySet = ['0'..'1'];

var
  Form1: TForm1;
  InputText, CypherText, DecypherText: text;
  CryptFile: file of byte;
  LFSR1, LFSR2, LFSR3: TLFSR;
  LengthInit1, LengthInit2, LengthInit3: integer;
  InitValue1, InitValue2, InitValue3: TValue;
  BitsToCalc1, BitsToCalc2, BitsToCalc3
    : TBitsToCalc;
  KeyByte: byte;
  Line: Ansistring;
  LineBits: array of byte absolute Line;

implementation

{$R *.dfm}

procedure GenKeyByte(var KeyByte: byte);
var
  i: integer;
begin
  KeyByte := 0;
  // Byte size = 8
  for i := 1 to 8 do
  begin
    KeyByte := KeyByte * 2;
    Inc(KeyByte, Calculate(LFSR1.LastDigit, LFSR2.LastDigit, LFSR3.LastDigit));
    LFSR1.Roll;
    LFSR2.Roll;
    LFSR3.Roll;
  end;
end;

procedure renewLSFR;
begin
  LFSR1.Value := Copy(InitValue1);
  LFSR1.LastDigit := InitValue1[0];
  LFSR2.Value := Copy(InitValue2);
  LFSR2.LastDigit := InitValue2[0];
  LFSR3.Value := Copy(InitValue3);
  LFSR3.LastDigit := InitValue3[0];
end;

procedure Ciph(const InputFile, OutputFile: string);
var
  InputText, OutputText: text;
  i: integer;
begin
  AssignFile(InputText, InputFile);
  AssignFile(OutputText, OutputFile);
  Reset(InputText);
  Rewrite(OutputText);
  Rewrite(CryptFile);
  while not EOF(InputText) do
  begin
    Line := '';
    Readln(InputText, Line);
    for i := 0 to High(LineBits) do
      if LineBits[i] <> 0 then
      begin
        GenKeyByte(KeyByte);
        LineBits[i] := LineBits[i] xor KeyByte;
      end;
    for i := 0 to High(LineBits) do
    begin
      write(OutputText, AnsiChar(LineBits[i]));
      write(CryptFile, LineBits[i]);
    end;
    // Add new line
    GenKeyByte(KeyByte);
    KeyByte := KeyByte xor 13;
    write(CryptFile, KeyByte);
    GenKeyByte(KeyByte);
    KeyByte := KeyByte xor 10;
    write(CryptFile, KeyByte);
    writeln(OutputText);
  end;
  Line := '';
  CloseFile(CryptFile);
  CloseFile(OutputText);
  CloseFile(InputText);
end;

procedure Deciph(const OutputFile: string);
var
  OutputText: text;
  CurrentByte: byte;
begin
  AssignFile(OutputText, OutputFile);
  Rewrite(OutputText);
  Reset(CryptFile);
  while not EOF(CryptFile) do
  begin
    read(CryptFile, CurrentByte);
    GenKeyByte(KeyByte);
    CurrentByte := CurrentByte xor KeyByte;
    write(OutputText, AnsiChar(CurrentByte));
  end;
  CloseFile(CryptFile);
  CloseFile(OutputText);
end;

procedure TForm1.btnDecypherClick(Sender: TObject);
begin
  renewLSFR;
  Deciph(CDecypherFile);
  MessageBox(handle, PChar('Дешифрованный текст: ' + CDecypherFile),
    PChar('Успешно'), (MB_OK));
end;

procedure TForm1.btnCypherClick(Sender: TObject);
begin
  renewLSFR;
  Ciph(CInputFile, CCypheredFile);
  MessageBox(handle, PChar('Зашифрованный текст: ' + CCypheredFile),
    PChar('Успешно'), (MB_OK));
end;

procedure TForm1.btnEnterClick(Sender: TObject);
var
  i: integer;
begin
  if InitValue1 = nil then
  begin
    if (length(edtValue.text) = LengthInit1) and
      (AnsiPos('1', edtValue.text) <> 0) then
    begin
      SetLength(InitValue1, LengthInit1);
      for i := 0 to LengthInit1 - 1 do
        InitValue1[i] := StrToInt(edtValue.text[i + 1]);
      edtValue.text := '';
      LFSR1 := TLFSR.Create(InitValue1, BitsToCalc1);
      btnEnter.Caption := 'Введите 2-ое значение';
    end
    else
      MessageBox(handle, PChar('Длина для первого значения должна быть равна ' +
        IntToStr(LengthInit1) + '. Значение должно быть <> 0.'),
        PChar('Некорректные данные.'), (MB_ICONWARNING + MB_OK));
  end
  else if InitValue2 = nil then
  begin
    if (length(edtValue.text) = LengthInit2) and
      (AnsiPos('1', edtValue.text) <> 0) then
    begin
      SetLength(InitValue2, LengthInit2);
      for i := 0 to LengthInit2 - 1 do
        InitValue2[i] := StrToInt(edtValue.text[i + 1]);
      edtValue.text := '';
      LFSR2 := TLFSR.Create(InitValue2, BitsToCalc2);
      btnEnter.Caption := 'Введите 3 значение';
    end
    else
      MessageBox(handle, PChar('Длина для второго значения должна быть равна ' +
        IntToStr(LengthInit2) + '. Значение должно быть <> 0.'),
        PChar('Некорректные данные.'), (MB_ICONWARNING + MB_OK));
  end
  else if InitValue3 = nil then
  begin
    if (length(edtValue.text) = LengthInit3) and
      (AnsiPos('1', edtValue.text) <> 0) then
    begin
      SetLength(InitValue3, LengthInit3);
      for i := 0 to LengthInit3 - 1 do
        InitValue3[i] := StrToInt(edtValue.text[i + 1]);
      edtValue.text := '';
      LFSR3 := TLFSR.Create(InitValue3, BitsToCalc3);
      edtValue.Enabled := False;
      btnEnter.Caption := 'Значения введены';
      btnEnter.Enabled := False;
      btnCypher.Enabled := True;
      btnDecypher.Enabled := True;
    end
    else
      MessageBox(handle, PChar('Длина для третьего значения должна быть равна ' +
        IntToStr(LengthInit3) + '. Значение должно быть <> 0.'),
        PChar('Некорректные данные.'), (MB_ICONWARNING + MB_OK));
  end
end;

procedure TForm1.BtnZeroAddClick(Sender: TObject);
var
  Key: Char;
begin
  Key := '0';
  edtValueKeyPress(Sender, Key);
end;

procedure TForm1.edtValueKeyPress(Sender: TObject; var Key: Char);
begin
  if (not(Key in CBinarySet) or (length(edtValue.text) > CMaxLenVal)) and
    (Key <> #8) then
    Key := #0;
  if InitValue1 = nil then
  begin
    if (length(edtValue.text) >= LengthInit1) and (Key <> #8) then
      Key := #0
  end
  else if InitValue2 = nil then
  begin
    if (length(edtValue.text) >= LengthInit2) and (Key <> #8) then
      Key := #0
  end
  else if InitValue3 = nil then
  begin
    if (length(edtValue.text) >= LengthInit3) and (Key <> #8) then
      Key := #0
  end
end;

initialization

begin
  LengthInit1 := 30;
  LengthInit2 := 42;
  LengthInit3 := 37;
  AssignFile(CryptFile, CCryptFile);

  SetLength(BitsToCalc1, 2);
  BitsToCalc1[0] := 10;
  BitsToCalc1[1] := 22; // (10, 22);
  SetLength(BitsToCalc2, 2);
  BitsToCalc2[0] := 14;
  BitsToCalc2[1] := 24; // (14, 24);
  SetLength(BitsToCalc3, 2);
  BitsToCalc3[0] := 7;
  BitsToCalc3[1] := 31; // (7, 31);
end;

end.
