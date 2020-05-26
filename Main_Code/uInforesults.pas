unit uInforesults;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Grids, uLogread, shellapi, Buttons,
  JvExControls, JvGradientHeaderPanel, rkGlassButton;

type
  TfmInforesults = class(TForm)
    Timer1: TTimer;
    sgToCheck: TStringGrid;
    pnlgrh1: TJvGradientHeaderPanel;
    Timer2: TTimer;
    lbReadinfo: TLabel;
    bbHideMain: TrkGlassButton;
    bbMe: TrkGlassButton;
    chkTransparent: TCheckBox;

    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure sgToCheckClick(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure sgToCheckSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgToCheckDblClick(Sender: TObject);
    procedure bbHideMainClick(Sender: TObject);
    procedure pnlgrh1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbMeClick(Sender: TObject);
    procedure chkTransparentClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure sgToCheckMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sgToCheckMouseLeave(Sender: TObject);
    procedure sgToCheckMouseEnter(Sender: TObject);
  private
    { Private declarations }
    ialph  : integer;
    sgRow       : Integer;
    bHidemain   : boolean;
    bhideinfo   : Boolean;
    bDisplay    : Boolean;
    procedure sethidestatus(bhide : Boolean);
  public
    { Public declarations }
    function gethidestatus : Boolean;
  end;

var
  fmInforesults: TfmInforesults;

const
  ialpha = 255;

implementation

uses uOptmenu, uDetails;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure TfmInforesults.bbHideMainClick(Sender: TObject);
begin
  if fmoptmenu.visible then begin
     fmoptmenu.Hide;
     bbHideMain.Caption := 'Show Main';
     FormClick(nil);
     bHidemain := true;
  end else
  if not fmoptmenu.visible then begin
     fmoptmenu.show;
     bbHideMain.Caption := 'Hide Main';
     bHidemain := false;
  end;

end;
//------------------------------------------------------------------------------
procedure TfmInforesults.bbMeClick(Sender: TObject);
begin
  try
    self.Hide;
    sethidestatus(true);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'FormClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);

    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmInforesults.chkTransparentClick(Sender: TObject);
begin
  self.AlphaBlendValue := 90;
  self.AlphaBlend := chkTransparent.Checked;
end;
//------------------------------------------------------------------------------
procedure TfmInforesults.FormClick(Sender: TObject);
begin
  try
    fmInforesults.AlphaBlendValue := ialpha;
    Timer1.Enabled  := false;
    bDisplay        := true;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'FormClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);

    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmInforesults.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
  //  bbHideMainClick(nil);
    sethidestatus(false);
    fmoptmenu.show;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'FormClose'+#13+#10+e.Message, mtWarning, [mbOK], 0);

    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmInforesults.FormCreate(Sender: TObject);
begin
  try
    bhideinfo := true;
    pnlgrh1.LabelCaption := '';
    with sgToCheck do begin
      RowCount     := 12;
      Cells[0,0]   := 'Description';
      Cells[1,0]   := 'Count';
      ColWidths[0] := 100;
      ColWidths[1] := 82;
    end;
    bDisplay := false;
    fmoptmenu.show;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'FormCreate'+#13+#10+e.Message, mtWarning, [mbOK], 0);

    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmInforesults.FormShow(Sender: TObject);
var
  rcTaskbar : Trect;
begin
  try
    BringToFront;
    with sgToCheck do begin
     cells[0, 1]  := 'Notes';
     cells[0, 2]  := 'Info';
     cells[0, 3]  := 'Conversions';
     cells[0, 4]  := 'Uninit.';
     cells[0, 5]  := 'Errors';
     cells[0, 6]  := 'Division';
     cells[0, 7]  := 'Merge';
     cells[0, 8]  := 'Invalid';
     cells[0, 9]  := 'Warnings';
     cells[0, 10] := 'Other';
     cells[0, 11] := 'Custom';
//     cells[0, 12] := 'Datasets';
     cells[1, 1]  := inttostr(fmoptmenu.getcntnote);
     cells[1, 2]  := inttostr(fmoptmenu.getcntinfo);
     cells[1, 3]  := inttostr(fmoptmenu.getconvnotescnt);
     cells[1, 4]  := inttostr(fmoptmenu.getuninitcnt);
     cells[1, 5]  := inttostr(fmoptmenu.getcnterr);
     cells[1, 6]  := inttostr(fmoptmenu.getdivzero);
     cells[1, 7]  := inttostr(fmoptmenu.getcntmerge);
     cells[1, 8]  := inttostr(fmoptmenu.getcntinvalid);
     cells[1, 9]  := inttostr(fmoptmenu.getcntwarn);
     cells[1, 10] := inttostr(fmoptmenu.getalloth);
     cells[1, 11] := inttostr(fmoptmenu.getcustcnt);
    end;

    Self.Height := 300;
    Self.Show;

    case FindTaskBar(rcTaskbar) of
    ABE_RIGHT:
       begin
          fmInforesults.Left  := rcTaskbar.Left   - fmInforesults.Width;
          fmInforesults.Top   := rcTaskbar.Bottom - fmInforesults.Height;
       end;
    ABE_LEFT:
       begin
          fmInforesults.Left  := rcTaskbar.Right;
          fmInforesults.Top   := rcTaskbar.Bottom - fmInforesults.Height;
       end;
     ABE_TOP:
        begin
           fmInforesults.Left := rcTaskbar.Right - fmInforesults.Height;
           fmInforesults.Top  := rcTaskbar.Bottom;
        end;
     else //ABE_BOTTOM
        // Taskbar is on the bottom or Invisible
        fmInforesults.Left := rcTaskbar.right   - fmInforesults.Width;
        fmInforesults.Top  := rcTaskbar.Bottom - fmInforesults.Height -35;
     end;
    ialph := ialpha;

    if (not fmoptmenu.Showing) then  begin
      fmoptmenu.Hide;
      bbHideMain.Caption := 'Show Main';
    end;

    Timer1.Enabled := True;
//    fadeout;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'sgToCheckClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);

    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmInforesults.pnlgrh1Click(Sender: TObject);
begin
  FormClick(nil);
end;
//------------------------------------------------------------------------------

procedure TfmInforesults.sgToCheckClick(Sender: TObject);
begin
  try
    FormClick(nil);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'sgToCheckClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);

    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmInforesults.sgToCheckDblClick(Sender: TObject);
var
  etTypes : etLoad;
begin
 try
   with sgToCheck do begin
     if cells[0, sgRow]  = 'Notes' then etTypes := etNotes
     else if cells[0, sgRow]  = 'Info' then etTypes := etinfo
     else if cells[0, sgRow]  = 'Conversions' then etTypes := etConvert
     else if cells[0, sgRow]  = 'Uninit.' then etTypes := etUnint
     else if cells[0, sgRow]  = 'Errors' then etTypes := eterror
     else if cells[0, sgRow]  = 'Division' then etTypes := etdivs
     else if cells[0, sgRow]  = 'Merge' then etTypes := etmerge
     else if cells[0, sgRow]  = 'Invalid' then etTypes := etinvalid
     else if cells[0, sgRow]  = 'Warnings' then etTypes := etwarn
     else if cells[0, sgRow]  = 'Other' then etTypes := etalloth
     else if cells[0, sgRow]  = 'Custom' then etTypes := etCust
//     else if cells[0, sgRow]  = 'Datasets' then etTypes := etlast ;
   end;

   if not fmDetails.LoadDetails(etTypes, self.left - fmDetails.Width ,0, self.Top, 0) then
      MessageDlg('Grid containing detailed information failed to populate. ', mtError, [mbOK], 0);
 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'sgToCheckDblClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmInforesults.sgToCheckMouseEnter(Sender: TObject);
begin
  try
    ialph          := 255;
    fmInforesults.AlphaBlendValue := ialph;
    Timer1.Enabled := False;

  except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'sgToCheckDblClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmInforesults.sgToCheckMouseLeave(Sender: TObject);
begin
  try
    if not bDisplay then
      Timer1.Enabled := true;
  except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'sgToCheckDblClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmInforesults.sgToCheckMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 Timer1.Enabled := False;
end;
//------------------------------------------------------------------------------
procedure TfmInforesults.sgToCheckSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  try
    if sgToCheck.Cells[0, Arow] <> '' then begin
      sgRow := Arow;
    end;
  except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'sgToCheckDblClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TfmInforesults.Timer1Timer(Sender: TObject);
var
  i :  Integer;
begin
  try
    if not bhidemain then begin
      if fmInforesults.visible then begin
        i := 1;
        ialph := ialph - 10;
        fmInforesults.AlphaBlendValue := ialph;

        if ialph <= 25 then
          fmInforesults.hide;
      end;
    end;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'Timer1Timer'+#13+#10+e.Message, mtWarning, [mbOK], 0);

    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmInforesults.Timer2Timer(Sender: TObject);
var
  bproblem : Boolean;
begin
  try
(*  dtCurr  := LastModified(floc);

    if (dtLast <> dtCurr) or (bForce) then
      try
        if not lfRead.getbusy then begin       //[184]
          ClearCounters2Click(nil);
          DisableCntrls(false);
          //Check that the file Exists before doing the reading
          if FileExists(floc) then begin
            Timer1.Enabled := false;
            ClearCounters2Click(nil); //[114]          lfRead := TLogFileRead.Create(floc, true, pgBar);
            lfRead.ReadLogfile(false,floc,true,bReportonly,bforce);
            if not UpdateGrid then begin
              MessageDlg('Their was a problem populating the counts.', mtError, [mbOK], 0);
            end else begin
              if fmInforesults.gethidestatus then begin
                fmInforesults.FormShow(nil);
              end;
            end;
          end;
          DisableCntrls(true);
        end;
      finally
        Timer1.Enabled := true;
        bforce := false;
        dtLast     := dtCurr;
      end;  *)

  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'Timer1Timer'+#13+#10+e.Message, mtWarning, [mbOK], 0);
      Timer1.Enabled := true;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmInforesults.sethidestatus(bhide : Boolean);
begin
  try
    bhideinfo := bhide;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'sethidestatus'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
function TfmInforesults.gethidestatus : Boolean;
begin
  try
    Result := bhideinfo;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'gethidestatus'+#13+#10+e.Message, mtWarning, [mbOK], 0);
      Result := false;
    end;
  end;
end;
//------------------------------------------------------------------------------

end.
