program Project1;

uses
  Forms,
  U_Form in 'U_Form.pas' {Form1},
  U_IOManager in 'U_IOManager.pas',
  U_FenceCypher in 'U_FenceCypher.pas',
  U_Util in 'U_Util.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
