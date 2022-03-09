program IPStackDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  IPStackDemo.UnitMain in 'IPStackDemo.UnitMain.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
