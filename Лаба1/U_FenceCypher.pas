unit U_FenceCypher;

interface

uses
  U_Util;

function FenceCypher(text: string; fenceHeight: integer): string;

function FenceDeCypher(text: string; fenceHeight: integer): string;

implementation

uses
  SysUtils;

function FenceDeCypher(text: string; fenceHeight: integer): string;
var
  matrix: array of array of char;
  i, j, vector, posInText, currentLine: integer;
  finalText: string;
begin
  SetLength(matrix, fenceHeight, length(text));
  text := AnsiUpperCase(text);
  finalText := '';
  posInText := 1;
  j := 1;
  while (j <= length(text)) do
  begin
    if not (text[j] in ENG_LETTERS) then
    begin
      delete(text, j, 1);
    end
    else
    begin
      inc(j);
    end;
  end;

  posInText := 1;
  for currentLine := 0 to fenceHeight - 1 do
  begin
    i := 0;
    vector := 1;
    for j := 0 to length(text) - 1 do
    begin
      if (i = currentLine) then
      begin
        matrix[i][j] := text[posInText];
        inc(posInText);
      end;
      i := i + (1 * vector);
      if (i = 0) or (i = fenceHeight - 1) then
      begin
        vector := vector * (-1);
      end;
    end;
  end;
  i := 0;
  vector := 1;
  for j := 0 to length(text) - 1 do
  begin
    finalText := finalText + matrix[i][j];
    i := i + (1 * vector);
    if (i = 0) or (i = fenceHeight - 1) then
    begin
      vector := vector * (-1);
    end;
  end;
  Result := finalText;
end;

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
    while not (text[posInText] in ENG_LETTERS) and (posInText <= length(text)) do
    begin
      inc(posInText);
    end;
    matrix[i][j] := text[posInText];
    i := i + (1 * vector);
    if (i = 0) or (i = fenceHeight - 1) then
    begin
      vector := vector * (-1);
    end;
    inc(posInText);

  end;
  for i := 0 to fenceHeight - 1 do
  begin
    for j := 0 to length(text) - 1 do
    begin
      if (matrix[i][j] in ENG_LETTERS) then
        finalText := finalText + matrix[i][j];
    end;
  end;
  Result := finalText;
end;

end.

