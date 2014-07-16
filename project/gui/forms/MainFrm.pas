unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnMan, ActnColorMaps, StdCtrls, Mask, Buttons, ExtCtrls;

type
  TMainForm = class(TForm)
    meHTMLColor: TMaskEdit;
    Label1: TLabel;
    edtDelphiColor: TEdit;
    Label2: TLabel;
    btnConvertToDelphi: TSpeedButton;
    btnConvertToHTML: TSpeedButton;
    shpColor: TShape;
    procedure btnConvertToDelphiClick(Sender: TObject);
    procedure btnConvertToHTMLClick(Sender: TObject);
  private
    { Private declarations }
    procedure ColorShape(Color: TColor);
    function DelphiColorToHTMLColor(DelphiColor: TColor): string;
    function HTMLColorToDelphiColor(HTMLColor: string): TColor;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  StrUtils;

{$R *.dfm}

procedure TMainForm.ColorShape(Color: TColor);
begin
  shpColor.Brush.Color := Color;
  shpColor.Invalidate;
end;

function TMainForm.DelphiColorToHTMLColor(DelphiColor: TColor): string;
var
  rgb: TColorRef;
begin
  ColorShape(DelphiColor);
  rgb := ColorToRGB(DelphiColor);
  Result := Format('%.2x%.2x%.2x', [GetRValue(rgb), GetGValue(rgb), GetBValue(rgb)]);
end;

function TMainForm.HTMLColorToDelphiColor(HTMLColor: string): TColor;
var
  color: TColor;
  colorStr: string;
begin
  colorStr := '$' + Copy(HTMLColor, 5, 2) + Copy(HTMLColor, 3, 2) + Copy(HTMLColor, 1, 2);
  color := StringToColor(colorStr);
  ColorShape(color);
  Result := color;
end;

procedure TMainForm.btnConvertToDelphiClick(Sender: TObject);
begin
  edtDelphiColor.Text := IntToStr(HTMLColorToDelphiColor(meHTMLColor.Text));
end;

procedure TMainForm.btnConvertToHTMLClick(Sender: TObject);
begin
  meHTMLColor.Text := DelphiColorToHTMLColor(StrToInt(edtDelphiColor.Text));
end;

end.
