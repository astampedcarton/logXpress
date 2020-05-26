unit uAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Buttons, StdCtrls, ExtCtrls, ComCtrls, Dialogs,
  rkGlassButton;

type
  TfmAbout = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    rc1: TRichEdit;
    bbOk: TrkGlassButton;
    procedure bbOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAbout: TfmAbout;

implementation

{$R *.dfm}

procedure TfmAbout.bbOkClick(Sender: TObject);
begin
  close;
end;

end.
