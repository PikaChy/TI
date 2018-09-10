unit U_GridCypher;

interface

uses
  SysUtils, U_Util;

function GridCypher(text: string): string;

function GridDeCypher(text: string): string;

implementation

const
  key_matrix: array[1..4] of array[1..4] of Integer = ((1, 13, 9, 5), (6, 10, 14, 2), (11, 7, 3, 15), (16, 4, 8, 12));

function FillAndReadMatrix(currentText: string): string;
var
  i, j: integer;
begin
  Result := '';
  for i := 1 to 4 do
  begin
    for j := 1 to 4 do
    begin
      Result := Result + currentText[key_matrix[i][j]];
    end;
  end;
end;

function GridCypher(text: string): string;
var
  GroupAmount, i: integer;
  finalText, currentText: string;
begin
  text := AnsiUpperCase(text);
  i := 1;
  while (i <= length(text)) do
  begin
    if not (text[i] in ENG_LETTERS) then
    begin
      Delete(text, i, 1);
    end
    else
    begin
      inc(i);
    end;
  end;
  finalText := '';
  while (Length(text) mod 16 <> 0) do
  begin
    text := text + '*';
  end;
  GroupAmount := length(text) div 16;

  for i := 1 to GroupAmount do
  begin
    currentText := Copy(text, ((i - 1) * 16) + 1, 16);
    finalText := finalText + FillAndReadMatrix(currentText);
  end;
  Result := finalText;
end;

function DeCypherMatrix(currentText: string): string;
begin
  Result := currentText[1] + currentText[8] + currentText[11] + currentText[14] + currentText[4] + currentText[5] + currentText[10] + currentText[15] + currentText[3] + currentText[6] + currentText[9] + currentText[16] + currentText[2] + currentText[7] + currentText[12] + currentText[13];
end;

function GridDeCypher(text: string): string;
var
  GroupAmount, i: integer;
  finalText, currentText: string;
begin
  i := 1;
  while (i <= length(text)) do
  begin
    if not ((text[i] in ENG_LETTERS) or (text[i] = '*')) then
    begin
      Delete(text, i, 1);
    end
    else
    begin
      inc(i);
    end;
  end;
  text := AnsiUpperCase(text);
  finalText := '';
  while (Length(text) mod 16 <> 0) do
  begin
    text := text + '*';
  end;
  GroupAmount := length(text) div 16;

  for i := 1 to GroupAmount do
  begin
    currentText := Copy(text, ((i - 1) * 16) + 1, 16);
    finalText := finalText + DeCypherMatrix(currentText);
  end;
  Result := finalText;
end;

end.

