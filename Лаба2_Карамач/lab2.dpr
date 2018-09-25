program lab2;

uses
  Vcl.Forms,
  Unit_Form in 'Unit_Form.pas' {Form1},
  Unit_Cypher in 'Unit_Cypher.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;

end.
