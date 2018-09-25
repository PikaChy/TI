unit U_Util;

interface

uses
  SysUtils;

type
  set_letter = set of char;

const
  ENG_LETTERS: set_letter = ['A'..'Z'];
  RUS_LETTERS: set_letter = ['À'..'ß'];
  DIGITS: set of char = ['0'..'9'];
  ERROR_CODE = -1;

function getOrdByChar(letter: char): integer;

function getCharByOrd(Aord: integer): char;

function isCorrectKeyInt(potentialNumber: string): integer;

function isCorrectKeyWord(potentialWord: string): boolean;

implementation

function isCorrectKeyWord(potentialWord: string): boolean;
var
  i: integer;
  len: integer;
begin
  len := Length(potentialWord);
  Result := false;
  if (len >= 1) then
  begin
    Result := True;
    for i := 1 to len do
    begin
      if not ((potentialWord[i] in RUS_LETTERS) or (potentialWord[i] = '¸')) then
        Result := False;
    end;
  end
end;

function getOrdByChar(letter: char): Integer;
begin
  if letter = 'À' then
    Result := 0
  else if letter = 'Á' then
    Result := 1
  else if letter = 'Â' then
    Result := 2
  else if letter = 'Ã' then
    Result := 3
  else if letter = 'Ä' then
    Result := 4
  else if letter = 'Å' then
    Result := 5
  else if letter = '¨' then
    Result := 6
  else if letter = 'Æ' then
    Result := 7
  else if letter = 'Ç' then
    Result := 8
  else if letter = 'È' then
    Result := 9
  else if letter = 'É' then
    Result := 10
  else if letter = 'Ê' then
    Result := 11
  else if letter = 'Ë' then
    Result := 12
  else if letter = 'Ì' then
    Result := 13
  else if letter = 'Í' then
    Result := 14
  else if letter = 'Î' then
    Result := 15
  else if letter = 'Ï' then
    Result := 16
  else if letter = 'Ð' then
    Result := 17
  else if letter = 'Ñ' then
    Result := 18
  else if letter = 'Ò' then
    Result := 19
  else if letter = 'Ó' then
    Result := 20
  else if letter = 'Ô' then
    Result := 21
  else if letter = 'Õ' then
    Result := 22
  else if letter = 'Ö' then
    Result := 23
  else if letter = '÷' then
    Result := 24
  else if letter = 'Ø' then
    Result := 25
  else if letter = 'Ù' then
    Result := 26
  else if letter = 'Ú' then
    Result := 27
  else if letter = 'Û' then
    Result := 28
  else if letter = 'Ü' then
    Result := 29
  else if letter = 'Ý' then
    Result := 30
  else if letter = 'Þ' then
    Result := 31
  else if letter = 'ß' then
    Result := 32
  else
    Result := -1;
end;

function getCharByOrd(Aord: integer): char;
begin
  if Aord = 0 then
    Result := 'A'
  else if Aord = 1 then
    Result := 'Á'
  else if Aord = 2 then
    Result := 'Â'
  else if Aord = 3 then
    Result := 'Ã'
  else if Aord = 4 then
    Result := 'Ä'
  else if Aord = 5 then
    Result := 'Å'
  else if Aord = 6 then
    Result := '¨'
  else if Aord = 7 then
    Result := 'Æ'
  else if Aord = 8 then
    Result := 'Ç'
  else if Aord = 9 then
    Result := 'È'
  else if Aord = 10 then
    Result := 'É'
  else if Aord = 11 then
    Result := 'Ê'
  else if Aord = 12 then
    Result := 'Ë'
  else if Aord = 13 then
    Result := 'Ì'
  else if Aord = 14 then
    Result := 'Í'
  else if Aord = 15 then
    Result := 'Î'
  else if Aord = 16 then
    Result := 'Ï'
  else if Aord = 17 then
    Result := 'Ð'
  else if Aord = 18 then
    Result := 'Ñ'
  else if Aord = 19 then
    Result := 'Ò'
  else if Aord = 20 then
    Result := 'Ó'
  else if Aord = 21 then
    Result := 'Ô'
  else if Aord = 22 then
    Result := 'Õ'
  else if Aord = 23 then
    Result := 'Ö'
  else if Aord = 24 then
    Result := '×'
  else if Aord = 25 then
    Result := 'Ø'
  else if Aord = 26 then
    Result := 'Ù'
  else if Aord = 27 then
    Result := 'Ú'
  else if Aord = 28 then
    Result := 'Û'
  else if Aord = 29 then
    Result := 'Ü'
  else if Aord = 30 then
    Result := 'Ý'
  else if Aord = 31 then
    Result := 'Þ'
  else if Aord = 32 then
    Result := 'ß'
  else
    Result := '0';

end;

function isCorrectKeyInt(potentialNumber: string): integer;
var
  i: integer;
  flag: boolean;
begin
  if (length(potentialNumber) > 0) then
  begin
    flag := true;
    i := 1;
    while (i <= length(potentialNumber)) and flag do
    begin
      if (potentialNumber[i] in DIGITS) then
      begin
        inc(i);
      end
      else
      begin
        flag := false;
      end;
    end;
    if (flag) then
    begin
      Result := StrToInt(potentialNumber);
      if (Result <= 1) then
        Result := ERROR_CODE;
    end
    else
    begin
      Result := ERROR_CODE;
    end;

  end
  else
  begin
    Result := ERROR_CODE;
  end;

end;

end.

