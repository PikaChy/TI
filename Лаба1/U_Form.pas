unit U_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, U_IOManager, StdCtrls;

type
  TForm1 = class(TForm)
    dlgOpen1: TOpenDialog;
    btnOpenInputFile: TButton;
    btnOpenOutputFile: TButton;
    lblInputFilePath: TLabel;
    lblOutputFilePath: TLabel;
    btnDoSmth: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnOpenInputFileClick(Sender: TObject);
    procedure btnOpenOutputFileClick(Sender: TObject);
    procedure btnDoSmthClick(Sender: TObject);
  private
    InputOutput: IOManager;
    InputFilePath: string;
    OutputFilePath: string;
    function openFile(msg: string; var filePath: string): boolean;
    { Private declarations }
  public
    procedure println(msg: string);
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  InputOutput := IOManager.Create;
  dlgOpen1.InitialDir := GetCurrentDir;
  lblInputFilePath.Caption := 'Файл не выбран!';
  lblOutputFilePath.Caption := 'Файл не выбран!';
end;

function TForm1.openFile(msg: string; var filePath: string): boolean;
var
  answer: integer;
begin
  //println(msg);
  while (not dlgOpen1.Execute) do
  begin
      //dlgOpen1.FileName
    answer := MessageDlg('Для работы необходим входной файл!', mtError, [mbRetry, mbCancel], 0);
    if (answer = mrCancel) then
    begin
      Result := false;
      Exit;
    end;
  end;
  filePath := dlgOpen1.FileName;
  println('Файл загружен!');
  Result := true;
end;

procedure TForm1.println(msg: string);
begin
  ShowMessage(msg);
end;

procedure TForm1.btnOpenInputFileClick(Sender: TObject);
begin
  if (openFile('Выберите входной файл!', InputFilePath)) then
  begin
    lblInputFilePath.Caption := InputFilePath;
  end
  else
  begin
    println('Файл не выбран!');
  end;
end;

procedure TForm1.btnOpenOutputFileClick(Sender: TObject);
begin
  if (openFile('Выберите файл для записи!', OutputFilePath)) then
  begin
    lblOutputFilePath.Caption := OutputFilePath;
  end
  else
  begin
    println('Файл не выбран!');
  end;
end;

procedure TForm1.btnDoSmthClick(Sender: TObject);
begin
    InputOutput.writeToFile(OutputFilePath, InputOutput.readFromFile(InputFilePath));
end;

end.

