unit U_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, U_IOManager, StdCtrls, U_FenceCypher, U_Util, U_GridCypher,
  U_ViznerCypher;

type
  TForm1 = class(TForm)
    dlgOpen1: TOpenDialog;
    btnOpenInputFile: TButton;
    btnOpenOutputFile: TButton;
    lblInputFilePath: TLabel;
    lblOutputFilePath: TLabel;
    rbCypher: TRadioButton;
    rbCypherRectangle: TRadioButton;
    rbCypherViznera: TRadioButton;
    btnDoCypher: TButton;
    edtKeyHeight: TEdit;
    edtKeyWord: TEdit;
    lblInText: TLabel;
    lblOutText: TLabel;
    btnChangeFiles: TButton;
    btnDeCypher: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnOpenInputFileClick(Sender: TObject);
    procedure btnOpenOutputFileClick(Sender: TObject);
    procedure btnDoSmthClick(Sender: TObject);
    procedure btnDoCypherClick(Sender: TObject);
    procedure rbCypherClick(Sender: TObject);
    procedure rbCypherVizneraClick(Sender: TObject);
    procedure rbCypherRectangleClick(Sender: TObject);
    procedure btnChangeFilesClick(Sender: TObject);
    procedure btnDeCypherClick(Sender: TObject);
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
  edtKeyHeight.Visible := false;
  edtKeyWord.Visible := false;
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
  //println('Файл загружен!');
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

procedure TForm1.btnDoCypherClick(Sender: TObject);
var
  keyHeight: integer;
  keyWord: string;
  currentInput: string;
  currentOutput: string;
begin
  if (InputFilePath = '') or (OutputFilePath = '') then
    println('Введите существующие файлы!')
  else if (rbCypher.Checked) then
  begin
    //Шифр изгородь
    keyHeight := isCorrectKeyInt(edtKeyHeight.Text);
    if (keyHeight <> ERROR_CODE) then
    begin
      currentInput := InputOutput.readFromFile(InputFilePath);
      currentOutput := FenceCypher(currentInput, keyHeight);
      InputOutput.writeToFile(OutputFilePath, currentOutput);
      lblInText.Caption := 'На входе:' + #10 + #13 + currentInput;
      lblOutText.Caption := 'На выходе:' + #10 + #13 + currentOutput;
      println('Шифрование по алгоритму "изгородь" произведено');
    end
    else
    begin
      println('Высота некорректна');
    end;
  end
  else if (rbCypherRectangle.Checked) then
  begin
    //Шифр решетка
    currentInput := InputOutput.readFromFile(InputFilePath);
    currentOutput := GridCypher(currentInput);
    InputOutput.writeToFile(OutputFilePath, currentOutput);
    lblInText.Caption := 'На входе:' + #10 + #13 + currentInput;
    lblOutText.Caption := 'На выходе:' + #10 + #13 + currentOutput;
    println('Шифрование по алгоритму "решетки" произведено');
  end
  else if (rbCypherViznera.Checked) then
  begin
    //Шифр Вижнера
    keyWord := edtKeyWord.Text;
    keyWord := AnsiUpperCase(keyWord);
    if (isCorrectKeyWord(keyWord)) then
    begin
      currentInput := InputOutput.readFromFile(InputFilePath);
      currentOutput := ViznerCypher(currentInput, keyWord);
      InputOutput.writeToFile(OutputFilePath, currentOutput);
      lblInText.Caption := 'На входе:' + #10 + #13 + currentInput;
      lblOutText.Caption := 'На выходе:' + #10 + #13 + currentOutput;
      println('Шифрование по алгоритму "Виженера" произведено');
    end
    else
    begin
      println('Некорректное ключевое слово!');
    end;
  end;
end;

procedure TForm1.rbCypherClick(Sender: TObject);
begin
  edtKeyWord.Visible := false;
  edtKeyHeight.Visible := true;
end;

procedure TForm1.rbCypherVizneraClick(Sender: TObject);
begin
  edtKeyWord.Visible := true;
  edtKeyHeight.Visible := false;
end;

procedure TForm1.rbCypherRectangleClick(Sender: TObject);
begin
  edtKeyHeight.Visible := false;
  edtKeyWord.Visible := false;
end;

procedure TForm1.btnChangeFilesClick(Sender: TObject);
var
  tempText: string;
begin
  tempText := InputFilePath;
  InputFilePath := OutputFilePath;
  OutputFilePath := tempText;
  lblOutputFilePath.Caption := OutputFilePath;
  lblInputFilePath.Caption := InputFilePath;
end;

procedure TForm1.btnDeCypherClick(Sender: TObject);
var
  keyHeight: integer;
  currentInput: string;
  currentOutput: string;
  keyWord: string;
begin
  if (InputFilePath = '') or (OutputFilePath = '') then
    println('Введите существующие файлы!')
  else if (rbCypher.Checked) then
  begin
    //Шифр изгородь
    keyHeight := isCorrectKeyInt(edtKeyHeight.Text);
    if (keyHeight <> ERROR_CODE) then
    begin
      currentInput := InputOutput.readFromFile(InputFilePath);
      currentOutput := FenceDeCypher(currentInput, keyHeight);
      InputOutput.writeToFile(OutputFilePath, currentOutput);
      lblInText.Caption := 'На входе:' + #10 + #13 + currentInput;
      lblOutText.Caption := 'На выходе:' + #10 + #13 + currentOutput;
      println('Дешифрование по алгоритму "изгородь" произведено');
    end
    else
    begin
      println('Высота некорректна');
    end;
  end
  else if (rbCypherRectangle.Checked) then
  begin
    //Шифр решетка
    currentInput := InputOutput.readFromFile(InputFilePath);
    currentOutput := GridDeCypher(currentInput);
    InputOutput.writeToFile(OutputFilePath, currentOutput);
    lblInText.Caption := 'На входе:' + #10 + #13 + currentInput;
    lblOutText.Caption := 'На выходе:' + #10 + #13 + currentOutput;
    println('Дешифрование по алгоритму "решетки" произведено');
  end
  else if (rbCypherViznera.Checked) then
  begin
    //Шифр Вижнера
    keyWord := edtKeyWord.Text;
    keyWord := AnsiUpperCase(keyWord);
    if (isCorrectKeyWord(keyWord)) then
    begin
      currentInput := InputOutput.readFromFile(InputFilePath);
      currentOutput := ViznerDeCypher(currentInput, keyWord);
      InputOutput.writeToFile(OutputFilePath, currentOutput);
      lblInText.Caption := 'На входе:' + #10 + #13 + currentInput;
      lblOutText.Caption := 'На выходе:' + #10 + #13 + currentOutput;
      println('Шифрование по алгоритму "Виженера" произведено');
    end
    else
    begin
      println('Некорректное ключевое слово!');
    end;
  end;
end;

end.

