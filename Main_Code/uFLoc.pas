unit uFLoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  rkGlassButton,  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, KControls,
  KGrids, Vcl.Grids, Vcl.ExtCtrls, Vcl.WinXCtrls, uReadUIUpdate, uLogFileRead,
  Vcl.ComCtrls, Strutils_D7, uUsertypes_d7, uLogRead, ads_date,System.StrUtils,
  Vcl.CheckLst;

type
  TfrmFLoc = class(TForm)
    pnlComp: TPanel;
    sgToCheck: TStringGrid;
    pnlMain: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edFLoc: TEdit;
    bbFLoc: TButton;
    bbRead: TrkGlassButton;
    bbStop: TrkGlassButton;
    bbOk: TrkGlassButton;
    bbClose: TrkGlassButton;
    bbCancel: TrkGlassButton;
    OpenDialog: TOpenDialog;
    il1: TImageList;
    Panel1: TPanel;
    pgRead: TProgressBar;
    bbClearCounters: TrkGlassButton;
    lbProgress: TLabel;
    lbInfo: TLabel;
    ckInclsubfolder: TCheckBox;
    bbUsefull: TrkGlassButton;
    actIndTree: TActivityIndicator;
    pgFiles: TPageControl;
    tbResults: TTabSheet;
    tbFileMonitor: TTabSheet;
    sgDetails: TKGrid;
    tvView: TTreeView;
    ckMonitorFiles: TCheckBox;
    ckMonitorFile: TCheckListBox;
    Panel2: TPanel;
    bbSetFileMon: TrkGlassButton;
    tmFileMon: TTimer;
    bbGetFiles: TrkGlassButton;
    procedure bbCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbFLocClick(Sender: TObject);
    procedure bbOKClick(Sender: TObject);
    procedure edFLocKeyPress(Sender: TObject; var Key: Char);
    procedure edFLocKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbReadClick(Sender: TObject);
    procedure bbStopClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure sgToCheckDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbClearCountersClick(Sender: TObject);
    procedure sgToCheckSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgDetailsDblClick(Sender: TObject);
    procedure sgDetailsSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure tvViewMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure bbUsefullClick(Sender: TObject);
    procedure pgFilesChange(Sender: TObject);
    procedure ckMonitorFilesClick(Sender: TObject);
    procedure Timer(Sender: TObject);
    procedure tmFileMonTimer(Sender: TObject);
    procedure bbSetFilegineMonClick(Sender: TObject);
    procedure bbGetFilesClick(Sender: TObject);
  private
    { Private declarations }
     asPrev : Ansistring;
     asMode : Ansistring;
     asbatfname : ansistring;
     lfReadFloc : TLogFileRead;
     lfReadFol  : TLogFileRead;
     ReadUI     : TReadUIUpdate;
     sgRow : integer;
     iline, vlen : Integer;
     bFolder : boolean;
     arFdets : array of tFdetails;
     sFold   : array of Ansistring;
     arFileinfo : array of TFileinfo;
     asPath  : ansistring;
     bbStartMon : boolean; //Indicator if File monitor is active
//     asNew  : Ansistring;
     function  UpdateFLoc(asVal : Ansistring) : Boolean;
     procedure BatchModeRead;
     procedure setcompactread;
     procedure Createstdgrids;
     function  SetReadmode : boolean;
     function  ReadLogFolder(asFile : Ansistring; etRead: etReadtype; bBuildList : Boolean=False) : Boolean;
     function  BuildTree(etTyp : etLoad; bCrits : boolean=false) : Boolean;
     procedure compactModeRead;
     procedure MonitorFiles;
  public
    { Public declarations }
     procedure CreateParams(var Params: TCreateParams);
     procedure setbatchfilename(asfname : Ansistring);

  end;

var
  frmFLoc: TfrmFLoc;

const
  cc_hght = 140;

implementation

uses uOptmenu, uLogFile;

{uses uDisplayLog;}

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TfrmFLoc.setbatchfilename(asfname : Ansistring);
begin
  if asfname = 'compact' then begin
    asMode := 'compact';
    asbatfname := '';
  end else
  if asfname = 'normal' then begin
    asMode := 'normal';
    asbatfname := '';
  end else begin
    asMode := 'batch';
    asbatfname := asfname;
  end;
end;
//------------------------------------------------------------------------------
procedure TfrmFLoc.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do begin
    ExStyle := ExStyle ;//or WS_EX_TOPMOST; //[185]
    WndParent := GetDesktopwindow;
  end;
end;
//------------------------------------------------------------------------------
procedure TfrmFLoc.bbCancelClick(Sender: TObject);
begin
 try
   close;
 except on
    e : Exception do begin

    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfrmFLoc.bbClearCountersClick(Sender: TObject);
begin
  ReadUI.ClearCounters(sgToCheck,nil);
end;
//------------------------------------------------------------------------------
procedure TfrmFLoc.bbCloseClick(Sender: TObject);
begin
try
  UpdateFLoc(asPrev);
  if (asmode = 'batch') or (asmode = 'compact') then begin
    ReadUI.destroy;

    Application.Terminate;
    Close;
  end else begin
    close;
  end;
 except on
    e : Exception do begin

    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfrmFLoc.FormCreate(Sender: TObject);
begin
//  tbFileMonitor.TabVisible := false;
  Createstdgrids;
  bbStartMon := false;
end;
//------------------------------------------------------------------------------
procedure TfrmFLoc.FormShow(Sender: TObject);
begin
 try
  lbinfo.Caption := '';
  lbProgress.Caption := '';
//  asPrev := fmLogDisplay.GetFileLoc;
//  edFLoc.text := 'C:\tmplogs\log1\ou1.log';
  if asmode = 'batch' then begin
    //Setup the form for the compact reading
    setcompactread;
    edFLoc.text := asbatfname;
    BatchModeRead;
    frmFloc.Height := 730;
    frmFloc.WindowState :=  wsMaximized;
    SetReadmode;
    fmOptmenu.Hide;
    frmFloc.Caption := 'Batch/Compact mode';
    ReadUI := TReadUIUpdate.create(sgToCheck, ExtractFilePath(Application.ExeName),tvView);
    bbReadClick(nil);  //[C 2]
//    Application.Terminate;
  end else
  if asmode = 'compact' then begin
    setcompactread;
    edFLoc.text := asbatfname;
    CompactModeRead;
    frmFloc.Height := 730;
    frmFloc.WindowState :=  wsMaximized;
    SetReadmode;
    frmFloc.Caption := 'Compact mode';

    ReadUI := TReadUIUpdate.create(sgToCheck, ExtractFilePath(Application.ExeName),tvView);
  end else begin
    edFLoc.text := fmoptmenu.GetFileloc;
    frmFloc.WindowState :=  wsNormal;
    pnlcomp.visible := false;
    frmFloc.Height  := 150;
  end;
  bbStop.Enabled := false;

 except on
    e : Exception do begin

    end;
 end;
end;
procedure TfrmFLoc.pgFilesChange(Sender: TObject);
begin

end;

//------------------------------------------------------------------------------
procedure TfrmFLoc.bbFLocClick(Sender: TObject);
begin
  try
   bbFLoc.SendToBack;
   if OpenDialog.Execute then begin
     edFLoc.text := '';
     edFLoc.text := OpenDialog.FileName;
     bbFLoc.BringToFront;
   end;
 except on
    e : Exception do begin

    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfrmFLoc.bbGetFilesClick(Sender: TObject);     //[d2]
var
  asval : ansistring;
  sr    : TSearchRec;
  bComplete : Boolean;
begin
  bComplete := false;
  ckMonitorFile.Items.Clear;
  //Get a list of all the files in a directory that needs to be monitored.
  asval  := IncludeTrailingBackslash(ExcludeTrailingBackslash(edFloc.text));

  //icnt := 0;
  if isnotempty(asval) then begin
    if FindFirst(asval+'*.log', faAnyFile, sr) = 0 then begin
      ckMonitorFile.Items.Add(asval+ExtractFileName(sr.Name));
      bComplete := false;
   end;
   while not bComplete do begin
     if FindNext(sr) = 0 then begin
       ckMonitorFile.Items.Add(asval+ExtractFileName(sr.Name));
     end else begin
        bComplete  := true;
     end;
   end;
   FindClose(sr);
  end;

end;

//------------------------------------------------------------------------------
procedure TfrmFLoc.bbOKClick(Sender: TObject);
begin
 try
// DirectoryExists(const Name: string): Boolean;
  if fileExists(edfloc.text) then begin
    UpdateFLoc(edFLoc.text);
  end else begin
//    CreateEmptyFile(edfloc.text);
    UpdateFLoc(edFLoc.text);
  end;


 except on
    e : Exception do begin
      MessageDlg('Error: '+e.Message, mtWarning, [mbOK], 0);
    end;
 end;
end;

//------------------------------------------------------------------------------
procedure TfrmFLoc.bbReadClick(Sender: TObject);   //[132]
begin
 try

   if not IsEmpty(edFloc.text) then begin
      lbinfo.Caption := 'The information on the file read will be displayed in the top bar.';
      lbProgress.Caption := 'Busy Reading file from specified location....';
      bbStop.Enabled := true;
      bbRead.Enabled := false;
    //  fmoptmenu.SetFloc(edFLoc.text);
    //  fmLogDisplay.SetFileLoc(edFLoc.text);
    //  fmoptmenu.ForceReadofLogFile1click(nil);
    //  mnuForceReadofLogFileClick(nil);
      //This part is for when using the compact mode only
      SetReadmode;
      ReadUI.ClearCounters(sgToCheck, nil);
    //  DisableCntrls(false);
      //Check that the file Exists before doing the reading
      if bfolder = false then begin
        if FileExists(edfloc.text) then begin
          ReadUI.ClearCounters(sgTocheck, nil);
          lfReadFloc := TLogFileRead.create( ExtractFilePath(Application.ExeName), edFLoc.text, true, pgRead, lbInfo);
          lfReadFloc.ReadLogfile(false,edfloc.text,true,true,true);
      //      lfRead := TLogFileRead.create(aploc, arFdets[1].FPath, true, pgRead, nil); //[B 30]
          if not ReadUI.UpdateGrid(sgToCheck, lfReadFloc, pgRead) then begin
            MessageDlg('Their was a problem populating the counts.', mtError, [mbOK], 0);
          end;
          lfReadfloc.Destroy; {[D1]}
        end;
      end else begin
       //Clear the log data file
        try
          AssignFile(ffollogs, ExtractFilePath(Application.ExeName)+'follogs.dat') ;
          rewrite(ffollogs);
        finally
          closefile(ffollogs);
        end;

        ReadLogFolder(asPath, etReadall);
      end;
     bbRead.Enabled := true;
     edFloc.Enabled := true;
     bbOk.Enabled   := true;
   end;

   if ckMonitorFiles.Checked then begin

   end;
//  DisableCntrls(true);

//  sleep(800); //[137]
//  bbStop.Enabled := false;
//  bbRead.Enabled := true;
//  lbProgress.Caption := 'Done Reading file.';
 except on
    e : Exception do begin
     bbStop.Enabled := false;
     bbRead.Enabled := true;
    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfrmFLoc.Timer(Sender: TObject);
begin

end;
//------------------------------------------------------------------------------
procedure TfrmFLoc.bbSetFilegineMonClick(Sender: TObject);
var
  iMonidx, icnt : integer;
begin
  if bbStartMon = false then begin
    iMonidx := 1;
    icnt    := 0;
    arFileinfo := nil;

    while icnt < ckMonitorFile.Count do begin
      if ckMonitorFile.State[icnt] = cbChecked then begin
        setlength(arFileinfo, imonidx+1);
        arFileinfo[imonidx].Fullpath := ckMonitorFile.Items[icnt];
        arFileinfo[imonidx].Filedate := LastModified(arFileinfo[imonidx].Fullpath);
        inc(iMonidx);
      end;
      inc(icnt);
    end;

    bbSetFileMon.Caption := 'Stop File Monitor';
    tmFileMon.Enabled := true;
  end else begin
    bbStartMon := true;
    bbSetFileMon.Caption := 'Start File Monitor';
  end;
 end;
//------------------------------------------------------------------------------
procedure TfrmFLoc.bbStopClick(Sender: TObject);
begin
 try
//   fmLogDisplay.StopReading1Click(nil);
 except on
    e : Exception do begin

    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfrmFLoc.bbUsefullClick(Sender: TObject);
begin
  bbClearCountersClick(nil);
  fmoptmenu.Setfullmode;
  fmOptmenu.show;
//  Clear
  Close;
end;
//------------------------------------------------------------------------------
function TfrmFLoc.UpdateFLoc(asVal : Ansistring) : Boolean;
begin
 try
  if (asmode <> 'batch') and (asmode <> 'compact' )then begin
    fmoptmenu.SetFloc(edFLoc.text);
    close;
  end ;
 except on
    e : Exception do begin

    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfrmFLoc.edFLocKeyPress(Sender: TObject; var Key: Char);
begin
end;
//------------------------------------------------------------------------------
procedure TfrmFLoc.Createstdgrids;
begin
  try
    with sgToCheck do begin
      RowCount     := 19;
      Cells[0,0]   := 'Description';
      Cells[1,0]   := 'Count';
      ColWidths[0] := 100;
      ColWidths[1] := 82;
    end;
    sgDetails.Cells[0,0]   := 'Line #';
    sgDetails.ColWidths[1] := 25;
    sgDetails.Cells[1,0]   := 'Line Details';
    sgDetails.ColWidths[1] := 850;
    sgDetails.RowCount     := 1;

  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'Createstdgrids'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfrmFLoc.edFLocKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = Int(vk_return) then begin
     bbOKClick(sender);
  end;
end;
//------------------------------------------------------------------------------
procedure TfrmFLoc.BatchModeRead;
var
  asFolder, asFile : Ansistring;
begin
  lbinfo.Caption     := 'Reading VIA BATCH MODE';
//  lbProgress.Caption := 'Reading file'+asbatfname;
  bbStop.Enabled := true;
  bbRead.Enabled := True;
  edFLoc.Enabled := false;
  bbFLoc.Enabled := false;
  bbOk.Enabled   := false;
  bbCancel.Enabled := false;
  sleep(500);
  fmoptmenu.SetFloc(edFLoc.text);
  fmoptmenu.BatchforceRead(nil);
  if IsEmpty(ExtractFilename(edFloc.Text)) then begin
    asFolder := ExtractFilepath(IncludeTrailingBackslash(ExcludeTrailingBackslash(edfloc.text)));
  end else begin
    asFolder := ExtractFilepath(edfloc.text);
  end;
  asFile   := 'Log_read_summary_ '+ExtractFilename(edFloc.text);
//  Memo1.Lines.Add('Reading Log files '+asbatfname);
//  fmoptmenu.Savesummary(asfolder+asfile);

  bbStop.Enabled := false;
  bbRead.Enabled := true;
  lbProgress.Caption := 'Done Reading file.';
  lbinfo.Caption     := 'Compact Mode';
end;
//------------------------------------------------------------------------------
procedure TfrmFLoc.ckMonitorFilesClick(Sender: TObject);
begin
  pgFiles.ActivePage := tbFileMonitor;
end;
//------------------------------------------------------------------------------
procedure TfrmFLoc.CompactModeRead;
var
  asFolder, asFile : Ansistring;
begin
  lbinfo.Caption   := 'Compact Mode';
  bbStop.Enabled   := true;
  bbRead.Enabled   := True;
  edFLoc.Enabled   := true;
  bbFLoc.Enabled   := true;
  bbOk.Enabled     := true;
  bbCancel.Enabled := true;
  sleep(500);
  fmoptmenu.SetFloc(edFLoc.text);
//  fmoptmenu.BatchforceRead(nil);
  asFolder := ExtractFilepath(IncludeTrailingBackslash(ExcludeTrailingBackslash(edfloc.text)));
  asFile   := 'Log_read_summary_ '+ExtractFilename(edFloc.text);

  bbStop.Enabled := true;
  bbRead.Enabled := true;
  lbinfo.Caption     := 'Compact Mode';
end;
//------------------------------------------------------------------------------
procedure TfrmFLoc.setcompactread;
begin
  frmfloc.Height := 556;
  pnlcomp.visible := true;
end;
//------------------------------------------------------------------------------
procedure TfrmFLoc.sgDetailsDblClick(Sender: TObject);
begin
//  dbgDetails.Enabled := false;
//    icnt := 1;
    if iline >= 0 then begin

      sgDetails.Enabled  := false;
      if not fmLogfile.Visible then begin
        fmLogfile.Caption := 'Info on Log file read from... Busy loading please wait. ';
        fmLogfile.Show;
        fmLogfile.Caption := 'Info on Log file read from... Busy loading please wait. ';
        fmLogfile.rcLines.Lines.LoadFromFile(edfloc.text);
        fmLogfile.Caption := 'Info on Log file read from. '+fmoptmenu.GetFileloc;

      end;
      sgDetails.Enabled  := true;

      fmLogfile.Movetoline(vlen, iline);

    end;
end;
//------------------------------------------------------------------------------
procedure TfrmFLoc.sgDetailsSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
    if sgDetails.Cells[0, Arow] <> '' then begin
      if sgDetails.Cells[0, Arow] <> 'Line #' then begin
        iline := StrToInt(sgDetails.Cells[0, Arow]);
        vlen  := length(sgDetails.Cells[1, arow]);
      end;
    end;
end;
//------------------------------------------------------------------------------
procedure TfrmFLoc.sgToCheckDblClick(Sender: TObject);
//var
//  etTypes : etLoad;
begin
 try
   if not bfolder then begin
     ReadUI.Griddblclick(sgToCheck, sgDetails, pgRead, nil, sgrow, nil);
   end else begin
     actIndTree.Animate := true;
     application.ProcessMessages;
     ReadUI.Griddblclick(sgToCheck, sgDetails, pgRead, tvView, sgrow, nil,true);
     actIndTree.Animate := false;
     application.ProcessMessages;
   end;
(*   with sgToCheck do begin
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
     else if cells[0, sgRow]  = 'Datasets' then etTypes := etlast
     else if cells[0, sgrow]  = 'Missing Value' then etTypes := etmisvals
     else if cells[0, sgrow]  = 'Repeat by Value' then etTypes := etrepbyval
     else if cells[0, sgrow]  = 'Math Opertion.' then etTypes := etmathop
     else if cells[0, sgrow]  = 'No Obs in Data' then etTypes := etnobosdata
     else if cells[0, sgrow]  = 'No By Statement' then etTypes := etnobystate
     else if cells[0, sgrow]  = 'User Defined' then etTypes := etUserdefined ;
   end;

   if not LoadDetails(etTypes, fmoptmenu.Width ,0, sgToCheck.Top, 0) then
      MessageDlg('Grid containing detailed information failed to populate. ', mtError, [mbOK], 0);

   sgToCheck.Enabled := true; *)
 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'sgToCheckDblClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
      actIndTree.Animate := false;
   end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfrmFLoc.sgToCheckSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
   sgRow := Arow;
   sgToCheck.Enabled := true;
end;
//------------------------------------------------------------------------------
procedure TfrmFLoc.tmFileMonTimer(Sender: TObject);
begin
  MonitorFiles;
end;
//------------------------------------------------------------------------------
procedure TfrmFLoc.tvViewMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReadUI.tvViewMouseUp(Sender, Button, Shift, X, y);
end;

//------------------------------------------------------------------------------
function  TfrmFLoc.SetReadmode : boolean;
var
  asFname  : Ansistring;
  asFolder : Ansistring;
  asdelim  : Ansistring;
begin
  asFname := ExtractFileName(edFloc.text);
  //Check if there is a delimiter at the end or not
  //If there is an delimiter we are good if not then


  if isempty(asFname) then begin
    asdelim := copy(Trim(ReverseString(edFloc.Text)),1,1);
    if asdelim = '\' then begin
      asPath  := ExtractFilePath(edFloc.text);
    end else begin
      asPath := ExtractFilepath(IncludeTrailingBackslash(ExcludeTrailingBackslash(edfloc.text)));
    end;
  end else
  if not isempty(asfname) then begin
    //Check that the fname contains a . if not it means that there is
    //a missing "/" and we are expecting a folder.
    if Pos('.',asfname) = 0 then begin
      asfname := '';
      asPath := ExtractFilepath(IncludeTrailingBackslash(ExcludeTrailingBackslash(edfloc.text)));
    end;

  end;

(*  if IsEmpty(ExtractFilename(edFloc.Text)) then begin
  end else begin
    asFolder := ExtractFilepath(edfloc.text);
  end;
*)

  if IsEmpty(asFname) then begin
    bFolder := true;
    tvView.Visible := True;
    sgDetails.Visible := false;
  end else begin
    bFolder := false;
    tvView.Visible := false;
    sgDetails.Visible := true;
  end;
end;
//------------------------------------------------------------------------------
function  TfrmFLoc.ReadLogFolder(asFile : Ansistring; etRead: etReadtype; bBuildList : Boolean=False) : Boolean;
  function SearchforAddsubfolders(asdir : Ansistring) : integer;
  var
    iFol       : Integer;
    iSFcnt     : Integer;
    sr         : TSearchRec;
    asTmp      : Ansistring;
  begin
    try
     iSFcnt    := 0;
     iFol := FindFirst(asdir+'*.*', faDirectory, sr);
     if iFol = 0 then begin
      try
        repeat
          if ((sr.Attr and faDirectory) <> 0) and (sr.Name <> '.') and (sr.Name <> '..') then begin
            isfcnt        := high(sFold) + 1;
            if isfcnt = 0 then inc(isfcnt);
            setlength(sFold, isfcnt+1);

            sfold[isfcnt] := IncludeTrailingBackslash(ExcludeTrailingBackslash(asdir))+sr.Name;
            asTmp         := sfold[isfcnt];
            SearchforAddsubfolders(asTmp);
          end;
          ifol := FindNext(sr);
          application.processmessages;
        until ifol <> 0;
      finally
        FindClose(sr);
      end;
     end;
    except on
     e: exception do begin
       MessageDlg('The following exception occurred in:'+#13+#10+'SearchforAddsubfolders'+#13+#10+e.Message, mtWarning, [mbOK], 0);
     end;
    end;
  end;
  //------------------------------------------------------------------------------
var
  sr         : TSearchRec;
  bComplete  : Boolean;
  asFilePath : array of Ansistring;
  asVal      : Ansistring;
  icnt       : integer;
  icnt1      : integer;
  ilen       : integer;
  fTmploc    : Ansistring;
  tmpstr     : Ansistring;
  stmp       : Ansistring;
  iSFcnt,
  iFol,
  itrip      : integer;
  ip,
  icc        : integer;
  dtSt, dten : Tdatetime;
  bdone      : boolean;
  irow       : integer;
  itrow      : integer;
  floc       : ansistring;
begin
 try
   dtst      := now;
   bdone     := false;
   irow      := 1;
   itrow     := 1;

   sfold     := nil;

   tvView.Items.Clear;
   bComplete := false;
   icnt      := 0;
   itrip     := 0;
   ip        := 0;
   iSFcnt    := 0;

//   bStop     := false;
   arfDets := nil;
   setlength(arfDets, 1);
   fillchar(sfold, 1,0);

   lfReadfol := TLogFileRead.create(ExtractFilePath(Application.ExeName), arFdets[1].FPath, true, pgRead, nil); //[B 30]
   lfReadfol.ClearCounters;
//   for irow := 1 to itrow do begin;
//     isfcnt    := 1;
     asval    := asFile;

   if (DelBSpace(asval) <> '') and (asval <> '/')  and (asval <> '\') then begin  //[B 2]
       isfcnt := 1;

       for isfcnt := 1 to isfcnt do begin
         if isnotempty(asval) then begin
           if FindFirst(asVal+'*.log', faAnyFile, sr) = 0 then begin
              if sr.Name <> '' then begin
                setlength(asFilePath, icnt1+1);
                asFilePath[icnt1] := asVal+ExtractFileName(sr.Name);
                inc(icnt1);
                bComplete := false;
              end;
           end;
           while not bComplete do begin
            if FindNext(sr) = 0 then begin
              if sr.Name <> '' then begin
                setlength(asFilePath, icnt1+1);
                asFilePath[icnt1] := asVal+ExtractFileName(sr.Name);
                inc(icnt1);
              end;
             end else begin
               bComplete  := true;
            end;
           end;
           FindClose(sr);
         end;
       end;

       icc := high(asFilePath);
       pgRead.Max := high(asFilePath);
       pgRead.Min := 0;
       for icnt := 0 to high(asFilePath) do begin
          lbinfo.Caption  := 'Reading File '+asFilePath[icnt];
          floc := asFilePath[icnt];
          ilen := high(arFDets);

          if ilen < 0 then ilen := 1
          else ilen := ilen + 1;

          setlength(arFdets, ilen + 1);
          arFdets[ilen].FPath := asFilePath[icnt];
;
          lfReadfol.ReadLogfile(true,arFdets[ilen].FPath,true,false);

          floc := ftmploc;

          if icnt mod 14 = 0 then  begin //[B 29]
            pgRead.Position := icnt;
            application.ProcessMessages;

             if not ReadUI.UpdateGrid(sgToCheck, lfReadfol, pgRead) then begin
                MessageDlg('Their was a problem populating the counts.', mtError, [mbOK], 0);
             end;
          end;

          inc(ip);
       end;//ffor icnt := 0 to high(asFilePath) do begin
   end;

   pgRead.Max := high(asFilePath);
   if not ReadUI.UpdateGrid(sgToCheck, lfReadfol, pgRead) then begin
      MessageDlg('Their was a problem populating the counts.', mtError, [mbOK], 0);
   end;

   pgRead.Position := icnt;
   application.ProcessMessages;

//  end;
   if Assigned(lfreadfol) then
     lfReadfol.Destroy;

   dten      := now;

   lbinfo.caption  := ' Files read : ' + inttostr(ip) +
                       '. Read in : ' + FloatToStr(TimeDeltaInSeconds(dtst, dten))+'s';

    if not BuildTree(etnone, false) then
      MessageDlg('The Result Tree could not be populated. '+#13+#10+
                'Restart the application and try again. If the problem persist, please report it. ', mtError, [mbOK], 0);
    dten      := now;
    if TimeDeltaInSeconds(dtst, dten) = 0 then begin
       lbinfo.caption  := ' Files read : ' + inttostr(ip) +
                          '. Read and analyzed in : ' + FloatToStr(TimeDeltaInMSeconds(dtst, dten))+'ms';
    end else begin
       lbinfo.caption  := ' Files read : ' + inttostr(ip) +
                          '. Read and analyzed in : ' + FloatToStr(TimeDeltaInSeconds(dtst, dten))+'s';
    end;

  except on
    E : exception do begin
       MessageDlg('The following exception occurred in:'+#13+#10+
                  'ReadLogFolder'+#13+#10+e.Message, mtError, [mbOK], 0);
      if Assigned(lfreadfol) then
        lfReadfol.Destroy;
    end;
  end;
end;
//------------------------------------------------------------------------------------
function  TfrmFLoc.BuildTree(etTyp : etLoad; bCrits : boolean=false) : Boolean;
var
  node     : array of TTreeNode;
  tmp      : TTreeNode;
  ix       : integer;
  prev,
  prFol,
  prFile   : Ansistring;
  ic       : integer;
  ichk     : integer;
  sStmp    : Ansistring;
  ifst     : integer;
  iflst    : integer;
  iflstfnd : integer;
  scprev,
  scFol,
  scFile   : Ansistring;
  rc1Flogs : TLoginfo;
  asFilt   : Ansistring;
begin
 try

//   bbsave.Enabled := false;

   ifst   := 0;
//   fmLogDisplay.vMemLogs.First;
   if tvView.Items.Count <> 0 then begin;
     tvView.Items.Clear;
   end;

   ic       := 0;
   ix       := 1;
   ichk     := 1;
   iflst    := 1;
   iflstfnd := 0;

//    fmDetails.sgDetails.RowCount       := 1;

    lbinfo.caption := 'Building Tree. Please wait...';
    assignfile(ffollogs, ExtractFilePath(Application.ExeName)+'follogs.dat');
    reset(ffollogs);
    pgRead.Max := filesize(ffollogs);
    pgRead.min := 0;
    prFile := rc1flogs.Filename;

    try
      inc(ic);
      setlength(node, ic+1);
      if FileSize(ffollogs) >= 1 then begin
        read(ffollogs, rc1flogs);
        node[ic] := tvView.Items.Add(nil, rc1flogs.Folder);
        node[ic] := tvView.Items.AddChild(node[ic],rc1flogs.Filename);
        tmp      := node[ic];
        node[ic] := tvView.Items.AddChild(node[ic],'['+inttostr(rc1flogs.LineNr) +']   '+ rc1flogs.Entry);
        ifst     := 1;
        prfile   := rc1flogs.Filename;
          while not EOF(ffollogs) do begin
            read(ffollogs, rc1Flogs);
            if rc1flogs.types <> '' then begin
              sStmp  := rc1flogs.types;
              scprev := rc1flogs.Folder;
              scFile := rc1flogs.Filename;

              if scfile = prFile then inc(iflst)
              else begin
                iflst    := 0;
                iflstfnd := 0;
              end;

              if etTyp = etnone then begin
                if (rc1flogs.types = 'Merge') or
                   (rc1flogs.types = 'Invalid') or
                   (rc1flogs.types = 'Uninitialized') or
                   (rc1flogs.types = 'Error') or
                   (rc1flogs.types = 'Division') or
                   (rc1flogs.types = 'Warning') or
                   (rc1flogs.types = 'Cust')
                   then begin
                     iChk := 1;
                   end;
              end else

              if (etTyp = etError) then begin
                if (rc1flogs.types = 'Error') then iChk := 1
                else iChk := 0;
              end else
              if (etTyp = etWarn) then begin
                if (rc1flogs.types = 'Warning') then iChk := 1
                else iChk := 0;
              end else
              if (etTyp = etUnint) then begin
                if (rc1flogs.types = 'Uninitialized') then iChk := 1
                else iChk := 0;
              end else
              if (etTyp = etMerge) then begin
                if (rc1flogs.types = 'Merge') then iChk := 1
                else iChk := 0;
              end else
              if (etTyp = etInvalid) then begin
                if (rc1flogs.types = 'Invalid') then iChk := 1
                else iChk := 0;
              end else
              if (etTyp = etDivs) then begin
                if (rc1flogs.types = 'Division') then iChk := 1
                else iChk := 0;
              end else ichk := 0;

              if (ichk = 0) then begin
                if prev = rc1flogs.Folder then begin
                  if prFile = rc1flogs.Filename then begin
                  end else begin
                    node[ic] := tvView.Items.Add(tmp ,rc1flogs.Filename);
                    iflst := 0;
                  end;
                end;
              end else
              if iChk = 1 then begin
                if prev = rc1flogs.Folder then begin
                  if prFile = rc1flogs.Filename then begin
                    if (iflst = 0) then begin
                      node[ic] := tvView.Items.AddChild(node[ic],'['+inttostr(rc1flogs.linenr) +']   '+ rc1flogs.entry);
                    end else
                    if (iflst > 0) then begin
                      node[ic] := tvView.Items.Add(node[ic],'['+inttostr(rc1flogs.linenr)+']   '+ rc1flogs.entry);
                    end;
                  end else begin
                    node[ic] := tvView.Items.Add(tmp ,rc1flogs.Filename);
                    node[ic] := tvView.Items.AddChild(node[ic],'['+inttostr(rc1flogs.linenr) +']   '+ rc1flogs.entry);
                  end;
                end else begin
                if ifst <> 1 then begin
                  inc(ic);
                  setlength(node, ic+1);
                  node[ic] := tvView.Items.Add(nil, rc1flogs.Folder);
                  node[ic] := tvView.Items.AddChild(node[ic],rc1flogs.Filename);
                  tmp      := node[ic];
                  node[ic] := tvView.Items.AddChild(node[ic],'['+inttostr(rc1flogs.linenr) +']   '+ rc1flogs.entry);
                end;
              end;
            end;
            ifst   := 0;

            prev   := rc1flogs.Folder;
            prFile := rc1flogs.Filename;

            inc(ix);
            if ix mod 500 = 0 then  begin
              pgRead.position := ix;
              application.ProcessMessages;
            end;
        end;
       end;  //while
      end; //if rc1flogs <> nil then begin
    pgRead.position := ix;
    application.ProcessMessages;
   finally
     closefile(ffollogs);
   end;
   result := true;
 except on
   e : Exception do begin
     MessageDlg('The following exception occurred in:'+#13+#10+'BuildTree'+#13+#10+e.Message, mtWarning, [mbOK], 0);
     result := false;
//     bbsave.Enabled := true;
   end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfrmFLoc.MonitorFiles; //[d2]
var
  icnt : integer;
  fdat : TDatetime;
begin

  icnt := high(arFileinfo);

  //If the file changed read it again each time it changes
  for icnt := 1 to high(arFileinfo) do begin
    fdat := arFileinfo[icnt].Filedate;
    if fdat < LastModified(arFileinfo[icnt].Fullpath) then begin
      tmFileMon.Enabled := false;

      lfReadFloc := TLogFileRead.create( ExtractFilePath(Application.ExeName), arFileinfo[icnt].Fullpath, true, pgRead, lbInfo);
      lfReadFloc.ReadLogfile(false,arFileinfo[icnt].Fullpath,true,true,true);
      //update the
      if not ReadUI.UpdateGrid(sgToCheck, lfReadFloc, pgRead) then begin
        MessageDlg('Their was a problem populating the counts.', mtError, [mbOK], 0);
      end;
      lfReadfloc.Destroy;

      arFileinfo[icnt].Filedate := LastModified(arFileinfo[icnt].Fullpath);
      tmFileMon.Enabled := true;

    end;
  end;

end;
//------------------------------------------------------------------------------
end.
