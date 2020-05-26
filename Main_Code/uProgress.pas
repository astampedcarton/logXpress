unit uProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TfmProgress = class(TForm)
    pgbar: TProgressBar;
    lbStatus: TLabel;
    pgBar2: TProgressBar;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Setlabel(asstr : Ansistring; iModal : Integer=0);
    procedure SetPogress(itick : Integer; itick2 : integer=0);
    procedure SetMaxPogress(iMax : Integer; iMax2 : integer=0);
  end;

var
  fmProgress: TfmProgress;

implementation

{$R *.dfm}

//------------------------------------------------------------------------------
procedure TfmProgress.Setlabel(asstr : Ansistring; iModal : Integer=0);
begin
  if iModal = 0 then begin
    show;
    fmProgress.FormStyle := fsStayOnTop;
  end else begin
    show;
    fmProgress.FormStyle := fsStayOnTop;
  end;
  lbStatus.caption := asStr;
  application.ProcessMessages;
end;
//------------------------------------------------------------------------------
procedure TfmProgress.SetPogress(itick : Integer; itick2 : integer=0);
begin
  try
    pgBar.Position := itick;
    if itick2 > 0  then begin
      pgbar2.Visible := true;
      pgbar2.Position := itick2;
    end else begin
      pgbar2.Visible := false;
      pgbar2.Position := itick2;
    end;
    fmProgress.FormStyle := fsStayOnTop;
    fmProgress.Show;
  except
    fmProgress.Hide;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmProgress.SetMaxPogress(iMax : Integer; iMax2 : integer=0);
begin
  try
    pgbar.Max := iMax;
    if iMax2 > 0  then begin
      pgbar2.Visible := true;
      pgbar2.Max := iMax2;
    end else begin
      pgbar2.Visible := false;
      pgbar2.Max := iMax2;
    end;
     fmProgress.FormStyle := fsStayOnTop;
  except
    fmProgress.Hide;
  end;
end;
//------------------------------------------------------------------------------

end.
