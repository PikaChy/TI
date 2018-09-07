unit U_IOManager;

interface

type
  IOManager = class(TObject)
  private
  public
    function readFromFile(filePath: string): string;
    function writeToFile(filePath: string; outText: string): boolean;
  end;

implementation

uses
  SysUtils;

{ IOManager }

{ IOManager }

function IOManager.readFromFile(filePath: string): string;
var
  input: TextFile;
  text: string;
begin
  AssignFile(input, filePath);
  reset(input);
  Result := '';
  while not Eof(input) do
  begin
    ReadLn(input, text);
    Result := Result + ' ' + text;
  end;
  CloseFile(input);
end;

function IOManager.writeToFile(filePath: string; outText: string): boolean;
var
  output: TextFile;
begin
  try
    AssignFile(output, filePath);
    rewrite(output);
    writeln(output, outText);
    CloseFile(output);
    Result := true;
  except
    Result := false;
  end;
end;

end.

