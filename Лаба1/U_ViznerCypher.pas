unit U_ViznerCypher;

interface

uses
  U_Util;

function ViznerCypher(text: string; keyWord: string): string;

function ViznerDeCypher(text: string; keyWord: string): string;

implementation

function shiftKeyWord(keyword: string): string;
var
  i: integer;
begin
  for i := 1 to length(keyword) do
  begin
    keyword[i] := getCharByOrd((getOrdByChar(keyword[i]) + 1) mod 33);
  end;
  Result := keyword;
end;

function ViznerDeCypher(text: string; keyWord: string): string;
var
  lengthKeyWord, i, posInText: integer;
  finalText: string;
begin
  i := 1;
  while (i <= Length(text)) do
  begin
    if (getOrdByChar(text[i]) = -1) then
      Delete(text, i, 1)
    else
      inc(i);
  end;
  lengthKeyWord := Length(keyWord);
  finalText := '';
  posInText := 1;
  for i := 1 to length(text) do
  begin
    finalText := finalText + getCharByOrd((getOrdByChar(text[i]) - getOrdByChar(keyWord[posInText]) + 33) mod 33);
    if (posInText = lengthKeyWord) then
    begin
      posInText := 1;
      keyWord := shiftKeyWord(keyWord);
    end
    else
    begin
      inc(posInText);
    end;
  end;
  Result := finalText;
end;

function ViznerCypher(text: string; keyWord: string): string;
var
  lengthKeyWord, i, posInText: integer;
  finalText: string;
begin
  i := 1;
  while (i <= Length(text)) do
  begin
    if (getOrdByChar(text[i]) = -1) then
      Delete(text, i, 1)
    else
      inc(i);
  end;
  lengthKeyWord := Length(keyWord);
  finalText := '';
  posInText := 1;
  for i := 1 to length(text) do
  begin
    finalText := finalText + getCharByOrd((getOrdByChar(text[i]) + getOrdByChar(keyWord[posInText])) mod 33);
    if (posInText = lengthKeyWord) then
    begin
      posInText := 1;
      keyWord := shiftKeyWord(keyWord);
    end
    else
    begin
      inc(posInText);
    end;
  end;
  Result := finalText;
end;

end.

