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

function isCorrectKeyInt(potentialNumber: string): integer;

implementation

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

