unit U_FenceCypher;

interface

uses
  U_Util;

function FenceCypher(text: string; fenceHeight: integer): string;

implementation

uses
  SysUtils;

function FenceCypher(text: string; fenceHeight: integer): string;
var
  matrix: array of array of char;
  i, j, vector, posInText: integer;
  finalText: string;
begin
  SetLength(matrix, fenceHeight, length(text));
  text := AnsiUpperCase(text);
  finalText := '';
  i := 0;
  posInText := 1;
  vector := 1;
  for j := 0 to length(text) - 1 do
  begin
    if (text[posInText] in RUS_LETTERS)then
    begin
      matrix[i][j] := text[posInText];
      i := i + (1 * vector);
      if (i = 0) or (i = fenceHeight - 1) then
      begin
        vector := vector * (-1);
      end;
    end;
    inc(posInText);
  end;
  for i := 0 to fenceHeight - 1 do
  begin
    for j := 0 to length(text) - 1 do
    begin
      if (matrix[i][j] in RUS_LETTERS) then
        finalText := finalText + matrix[i][j];
    end;
  end;

end;

end.

