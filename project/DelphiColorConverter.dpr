program DelphiColorConverter;

uses
  Forms,
  MainFrm in 'gui\forms\MainFrm.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Delphi Color Converter';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
