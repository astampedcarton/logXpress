unit uViewselect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,  inifiles, uLogRead, ExtCtrls;

type
  TfmViewselect = class(TForm)
    GroupBox1: TGroupBox;
    bbClassic: TBitBtn;
    bbExtended: TBitBtn;
    Timer1: TTimer;
    BalloonHint1: TBalloonHint;
    procedure bbClassicClick(Sender: TObject);
    procedure bbExtendedClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Settings : TInifile;
    etDisplaytype : etDisptype;
    itype : integer;

    function updatedisplayoptions(etDisp :  etdisptype) : boolean;
  public
    { Public declarations }
  end;

var
  fmViewselect: TfmViewselect;

implementation

uses uDisplayLog, uOptmenu;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure TfmViewselect.bbClassicClick(Sender: TObject);
begin
  fmLogDisplay.Show;
  fmViewselect.Hide;
  fmoptmenu.Hide;
//  if messagedlg('Use as the default view?', mtConfirmation, [mbYes, mbNo],0) = mrYes then begin
    updatedisplayoptions(etclassic);
//  end;

end;
//------------------------------------------------------------------------------
procedure TfmViewselect.bbExtendedClick(Sender: TObject);
begin
  fmoptmenu.Show;
  fmViewselect.Hide;
  fmLogDisplay.hide;
//  if messagedlg('Use as the default view?', mtConfirmation, [mbYes, mbNo],0) = mrYes then begin
  updatedisplayoptions(etExtended);
//  end;
end;
//------------------------------------------------------------------------------
procedure TfmViewselect.FormCreate(Sender: TObject);
var
  fname : ansistring;
begin
  //Check that the Midas.dll exists in the root dir
//  fname := ExtractFilePath(application.ExeName)+'midas.dll';
{  if not FileExists(fname) then begin
    MessageDlg('The Midas.dll was not found in the directory:'+#13+#10+
               'This file is critical for the program to work and without it'+#13+#10+
               'the application cannot work.', mterror, [mbOK], 0);
    close;
//    exit;
  end;}
end;
//------------------------------------------------------------------------------

procedure TfmViewselect.FormShow(Sender: TObject);
begin
//  try
//    Settings  := TIniFile.Create(ExtractFilePath(application.exename)+'saslogdisp.ini');
//    itype     := Settings.ReadInteger('displayoption', 'display', integer(etDisplaytype) );
//    Settings.Free;
//
//    if itype = 1 then begin
//      fmoptmenu.Show;
////      fmViewselect.Hide;
//    end else
//    if itype = 0 then begin
//      fmLogDisplay.Show;
////      fmViewselect.Hide;
//    end;
//  except on
//    e : exception do begin
//      MessageDlg('The following exception occurred in:'+#13+#10+'TfmViewselect.FormShow'+#13+#10+e.Message, mtWarning, [mbOK], 0);
//    end;
//  end;
end;
procedure TfmViewselect.GroupBox1Click(Sender: TObject);
begin

end;

//------------------------------------------------------------------------------
procedure TfmViewselect.Timer1Timer(Sender: TObject);
begin

  Settings  := TIniFile.Create(ExtractFilePath(application.exename)+'saslogdisp.ini');
  itype     := Settings.ReadInteger('displayoption', 'display', integer(etDisplaytype) );
  Settings.Free;

  if itype = 2 then begin
    fmoptmenu.Show;
    fmoptmenu.formStyle := fsNormal;
    fmViewselect.visible := false;
    fmLogDisplay.hide;

  end else
  if itype = 1 then begin
    fmoptmenu.hide;
    fmlogDisplay.FormStyle := fsStayonTop;
    fmlogDisplay.Show;
    fmViewselect.visible := false;
  end else     fmViewselect.visible := true;

  Timer1.Enabled := false;
end;
//------------------------------------------------------------------------------
function TfmViewselect.updatedisplayoptions(etDisp :  etdisptype) : boolean;
begin

  Settings                     := TIniFile.Create(ExtractFilePath(application.exename)+'saslogdisp.ini');
  Settings.WriteInteger('displayoption', 'display', Integer(etDisp));
  Settings.Free;

  result := true;
end;
//------------------------------------------------------------------------------

end.
