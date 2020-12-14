unit uLogfolder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, StrUtils_d7, ads_strg,
  uLogRead, Strutils,
  CheckLst, inifiles, Menus, FileCtrl, ads_date, uLogFileRead,
  Grids, System.ImageList, Vcl.ImgList, ComObj, Vcl.WinXCtrls,
  Vcl.Outline, Vcl.Imaging.pngimage, (*JvBaseDlg, JvSelectDirectory,*)
  uTxt2xlsx_xml, ovcbase, ovcrlbl, Vcl.Mask, JvDialogs (*JvExStdCtrls, JvEdit,*)
  (*, JvExControls, JvLabel*); (* , JvLabel, KControls, KGrids, JvgListBox,
  JvxCheckListBox *)

type

  TFileinfo = record
    FName: String[250];
    fShrt: String[100];
    Lstacc: TDatetime;
    FBusy: Boolean;
    bMontr: Boolean;
  end;

  TfmLogFolder = class(TForm)
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    ExpandAll1: TMenuItem;
    CollapseAll1: TMenuItem;
    ppChkedit: TPopupMenu;
    SelectAll1: TMenuItem;
    Unselectall1: TMenuItem;
    dlgOpenrdlst: TOpenDialog;
    dlgSaverdlst: TSaveDialog;
    N1: TMenuItem;
    OpenReadlist1: TMenuItem;
    SaveReadlist1: TMenuItem;
    openReadfold: TOpenDialog;
    svOutput: TSaveDialog;
    N2: TMenuItem;
    SaveOutput1: TMenuItem;
    lbFInfo: TStatusBar;
    // edSetpath: TrkSmartPath;
    il1: TImageList;
    ppmenRead: TPopupMenu;
    ReadAll1: TMenuItem;
    ReadSelectiveFiles1: TMenuItem;
    pnlBase: TPanel;
    Panel3: TPanel;
    Label6: TLabel;
    sgLocations: TStringGrid;
    Panel4: TPanel;
    grp3: TGroupBox;
    lbstats: TLabel;
    grp4: TGroupBox;
    lbNotes: TLabel;
    lbInfo: TLabel;
    grp5: TGroupBox;
    sgToCheck: TStringGrid;
    pgRead: TProgressBar;
    grp1: TGroupBox;
    pnl2: TPanel;
    pgReadFiles: TPageControl;
    tsReadall: TTabSheet;
    grpFiles: TGroupBox;
    ckfilelist: TCheckListBox;
    tsReadSelective: TTabSheet;
    grp2: TGroupBox;
    ckReadselect: TCheckListBox;
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    tsDetail: TTabSheet;
    pgcpgresults: TPageControl;
    tsDetails: TTabSheet;
    tsSummary: TTabSheet;
    tvView: TTreeView;
    splView: TSplitView;
    bbRun: TButton;
    bbStop: TButton;
    bbShowall: TButton;
    bbSave: TButton;
    ckDisplay: TCheckBox;
    ckBuilddetailafterread: TCheckBox;
    bbReset: TButton;
    bbAddrow: TButton;
    bbClearRow: TButton;
    bbAddDir: TButton;
    bbClose: TButton;
    Panel2: TPanel;
    Panel6: TPanel;
    bbRefresh: TButton;
    bbBuild: TButton;
    Panel7: TPanel;
    Panel8: TPanel;
    ppGrid: TPopupMenu;
    mnuInsert: TMenuItem;
    mnuClearRow: TMenuItem;
    mnuReset: TMenuItem;
    mnuAddDirectory: TMenuItem;
    // JvLabel1: TJvLabel;
    imgMenu: TImage;
    pnlSave: TPanel;
    bbSavetoo: TButton;
    bbFileloc: TButton;
    edSavetoo: TEdit;
    lbFilesRead: TLabel;
    lbFilesel: TLabel;
    lbFilters: TLabel;
    gpFilter: TGroupBox;
    Label3: TLabel;
    edFileMask: TEdit;
    Label4: TLabel;
    edFilDate: TMaskEdit;
    Label5: TLabel;
    cbDirection: TComboBox;
    Label7: TLabel;
    ckEnableFilter: TCheckBox;
    dlgOpendir: TFileOpenDialog;
    bbApply: TButton; // [D3]
    procedure bbRunClick(Sender: TObject);
    procedure bbStopClick(Sender: TObject);
    procedure ckfilelistClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbCloseClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure tvViewGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure tvViewCollapsed(Sender: TObject; Node: TTreeNode);
    procedure tvViewExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure tvViewMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tvViewCollapsing(Sender: TObject; Node: TTreeNode;
      var AllowCollapse: Boolean);
    procedure tvViewExpanded(Sender: TObject; Node: TTreeNode);
    procedure lberrClick(Sender: TObject);
    procedure lbInvaldClick(Sender: TObject);
    procedure lbDivsClick(Sender: TObject);
    procedure lbMergeClick(Sender: TObject);
    procedure lbUninitClick(Sender: TObject);
    procedure lbwarnClick(Sender: TObject);
    procedure lbCustClick(Sender: TObject);
    procedure lbFilesReadClick(Sender: TObject);
    procedure chkReadsubfolderClick(Sender: TObject);
    procedure CheckonClick(Sender: TObject);
    function ActiveCheckBox(asStr: Ansistring): TCheckBox;
    procedure btnBuildflistClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chklstFMonlistClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure chklstFMonlistKeyPress(Sender: TObject; var Key: Char);
    procedure chklstFMonlistKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lbAllothClick(Sender: TObject);
    procedure ExpandAll1Click(Sender: TObject);
    procedure CollapseAll1Click(Sender: TObject);
    procedure spClearClick(Sender: TObject);
    procedure spShowallClick(Sender: TObject);
    procedure lbConvClick(Sender: TObject);
    procedure pgReadFilesChange(Sender: TObject);
    procedure bbBuildClick(Sender: TObject);
    procedure SelectAll1Click(Sender: TObject);
    procedure Unselectall1Click(Sender: TObject);
    procedure OpenReadlist1Click(Sender: TObject);
    procedure SaveReadlist1Click(Sender: TObject);
    procedure dlgOpenrdlstClose(Sender: TObject);
    procedure ckReadselectMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure spbResetClick(Sender: TObject);
    procedure btnOpenfoldClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SaveOutput1Click(Sender: TObject);
    procedure edFolderExit(Sender: TObject);
    procedure ckReadselectKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ckReadselectKeyPress(Sender: TObject; var Key: Char);
    procedure bbSellocClick(Sender: TObject);
    procedure sgLocationsDblClick(Sender: TObject);
    procedure sgLocationsClick(Sender: TObject);
    procedure sgLocationsSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure btnAddClick(Sender: TObject);
    procedure btnDelRowClick(Sender: TObject);
    procedure sgLocationsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgToCheckDblClick(Sender: TObject);
    procedure sgToCheckSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgToCheckDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgToCheckKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edSetpathBtnClick(Sender: TObject);
    procedure bbSaveClick(Sender: TObject);
    procedure tvViewMouseEnter(Sender: TObject);
    procedure bbAddDirClick(Sender: TObject);
    procedure ReadAll1Click(Sender: TObject);
    procedure ReadSelectiveFiles1Click(Sender: TObject);
    // procedure rbDisplayClick(Sender: TObject);
    procedure ckDisplayClick(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure bbContinueClick(Sender: TObject);
    procedure edsponsorChange(Sender: TObject);
    procedure pnlSaveadditClick(Sender: TObject);
    procedure edaltsavelocKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edaltsavelocExit(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure ckfilelistDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure lnkpathClick(Sender: TObject);
    procedure splViewMouseEnter(Sender: TObject);
    procedure splViewMouseLeave(Sender: TObject);
    procedure splViewMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure bbRunMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure bbStopMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure bbShowallMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure bbSaveMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure ckDisplayMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure ckBuilddetailafterreadMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure bbMNUMouseEnter(Sender: TObject);
    procedure bbMNUMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure bbResetMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure bbAddrowMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure bbClearRowMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure bbAddDirMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure bbCloseMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Panel2MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Panel6MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure bbPinClick(Sender: TObject);
    procedure bbBuildMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure bbRefreshMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure sgLocationsMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mnuResetClick(Sender: TObject);
    procedure mnuInsertClick(Sender: TObject);
    procedure mnuClearRowClick(Sender: TObject);
    procedure mnuAddDirectoryClick(Sender: TObject);
    procedure bbFilelocClick(Sender: TObject);
    procedure bbSavetooClick(Sender: TObject);
    procedure spbPinClick(Sender: TObject);
    procedure ckEnableFilterClick(Sender: TObject);
    procedure bbApplyClick(Sender: TObject);
    procedure imgMenuClick(Sender: TObject);
  private
    { Private declarations }
    arFdets: array of tFdetails;
    sFold: array of Ansistring;
    bstop: Boolean;
    iLine, vlen: Integer;
    sfolder: Ansistring;
    Settings: TInifile;
    prevNode: TTreeNode;
    bIgnore: Boolean;
    iChk: Integer;
    ifcnt: Integer;
    chkFiles: array of TCheckBox;
    pnlFiles: array of TPanel;
    lbFiles: array of TLabel;
    arFInfo: array of TFileinfo;
    arFlist: array of Tfilelist;
    asSelFilePath: array of Ansistring;
    bFilter: Boolean;
    itotcnt: Integer;
    stLoc: String;
    idx: Integer;
    lfRead: TLogFileRead;
    aploc: String;
    sgRow: Integer;
    FG: array of array of TColor;
    BG: array of array of TColor;
    iSetload: Integer;
    bBuildlist: Boolean;
    sldirlist: Tstringlist; // used to check for changes in the directories read
    bPin: Boolean;

    function ReadLogFolder(asFile: Ansistring; etRead: etReadtype;
      bBuildlist: Boolean = False): Boolean;
    function ReadSelLogFolder(etRead: etReadtype;
      bBuildlist: Boolean = False): Boolean;
    function BuildFileList(asFile: Ansistring; etRead: etReadtype): Boolean;
    function BuildTree(etTyp: etLoad; bCrits: Boolean = False): Boolean;
    function BuildFilterTree(etTyp: etLoad): Boolean;
    procedure FiltFolder(etTyp: etLoad);
    function CreateCheckboxes(asStr: String): Boolean;
    function DestroyCheckboxes: Boolean;
    function Updatecheckboxes(idx: Integer): Boolean;
    function SetFileInfo(idx: Integer; asStr: Ansistring;
      bMont: Boolean): Boolean;
    function UpdFileInfo(idx: Integer; asStr: Ansistring;
      bMont: Boolean): Boolean;
    function LoadFileInfo(asFName: Ansistring): Boolean;
    function ClearResult: Boolean;
    procedure UpdateCntlabel;
    procedure Updatelabels;
    procedure Setlabelcolors;
    procedure Setuplocgrid;
    procedure Createstdgrids;
    function UpdateGrid: Boolean;
    function SaveResults: Boolean;
    function builddirlist: Boolean;
    function difdirlist: Boolean;
    function Rebuildfilechecklist(chlst: TCheckListBox;
      bFullpath: Boolean): Boolean;
    function PopulateCheckList(chklist: TCheckListBox; asFile: Ansistring;
      etRead: etReadtype; bBuildlist: Boolean = False): Boolean;
    function SaveResultsToExcel: Boolean;
  public
    { Public declarations }
    procedure Setlinecount(iLine: Integer);
    procedure CreateParams(var Params: TCreateParams);
  end;

var
  fmLogFolder: TfmLogFolder;

implementation

uses {uDisplayLog, uAbout} uLogFile, uProgress, uDetails, uOptmenu;

{$R *.dfm}

// ------------------------------------------------------------------------------
procedure TfmLogFolder.CreateParams(var Params: TCreateParams); // override;
begin
  inherited;
  Params.wndParent := 0;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.btnAddClick(Sender: TObject);
begin
  try
    sgLocations.RowCount := sgLocations.RowCount + 1;
    sgLocations.SetFocus;
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'bbAddClick' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
function TfmLogFolder.builddirlist: Boolean;
var
  icnt: Integer;
begin
  try
    icnt := 1;

    if not Assigned(sldirlist) then
    begin
      sldirlist := Tstringlist.Create();
    end;

    while icnt < sgLocations.RowCount do
    begin
      if delbspace(sgLocations.Cells[0, icnt]) = '' then
      begin
        sldirlist.Add(sgLocations.Cells[0, icnt]);
      end;
      inc(icnt);
    end;

    result := true;
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'builddirlist' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
      result := False;
    end;
  end;
end;

// ------------------------------------------------------------------------------
function TfmLogFolder.difdirlist: Boolean;
var
  icnt: Integer;
  slcmplst: Tstringlist;
  bRebuild: Boolean;
begin
  try
    bRebuild := False;
    icnt := 1;

    slcmplst := Tstringlist.Create();
    while icnt < sgLocations.RowCount do
    begin
      if delbspace(sgLocations.Cells[0, icnt]) = '' then
      begin
        slcmplst.Add(sgLocations.Cells[0, icnt]);
      end;
      inc(icnt);
    end;

    icnt := 0; // [B15]

    if (slcmplst.Count > 0) and (sldirlist.Count > 0) then
    begin
      if slcmplst.Count = sldirlist.Count then
      begin
        while (icnt < slcmplst.Count) do
        begin
          if sldirlist.ValueFromIndex[icnt] <> slcmplst.ValueFromIndex[icnt]
          then
          begin
            bRebuild := true;
            break;
            // If there is any indication that there is a missmatch break and rebuild
          end;
          inc(icnt);
        end;
      end;
    end;

    result := bRebuild;

    FreeAndnil(slcmplst);
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'difdirlist' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
      // result := false;
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.bbAddDirClick(Sender: TObject);
var
  icnt: Integer;
  idup: Integer;
  bdup: Boolean;
  sdir: Ansistring;
begin
  try
    // sgLocations.Options := [goFixedVertline, goRowSelect];
    // using the selection from the Grid set the initial directory
    // to make selecting a directory easier.
    fmLogFolder.FormStyle := fsNormal;
    fmLogFolder.SendToBack;
    if delbspace(sgLocations.Cells[0, icnt]) = '' then
    begin
//      dlgOpendir.InitialDir := sgLocations.Cells[0, idx];
      dlgOpendir.DefaultFolder  := sgLocations.Cells[0, idx];
    end;

    if dlgOpendir.Execute then
    begin
      // Find the first open Row and insert the directory there;
      icnt := 0;
      while icnt <= sgLocations.RowCount do
      begin
        if delbspace(sgLocations.Cells[0, icnt]) = '' then
        begin
          break;
        end;
        inc(icnt);
      end;

      // Prevent duplicate directories from being added - they don't make any sense.
      idup := 0;
      sdir := ExtractFileDir(dlgOpendir.FileName);

      while idup <= sgLocations.RowCount do
      begin
        if delbspace(sgLocations.Cells[0, idup]) = delbspace(sdir) then
        begin
          bdup := true;
          break;
        end;
        inc(idup);
      end;

      if not bdup then
      begin
        if icnt = sgLocations.RowCount then
        begin
          icnt := sgLocations.RowCount;
          sgLocations.RowCount := sgLocations.RowCount + 1;
        end;
        sgLocations.Cells[0, icnt] := ExtractFileDir(dlgOpendir.FileName);
        // sglocations.Cells[0, icnt] := dlgOpendir.Directory;
        sgLocations.SetFocus;

      end
      else
      begin
        lbFInfo.Panels[1].Text :=
          'You selected a duplicate Directory. It was ignored.';
      end;

      if not builddirlist then
      begin
        lbFInfo.Panels[1].Text :=
          'NON Critical Isssue. If the issue persist report it.';
      end;

    end;
    fmLogFolder.FormStyle := fsStayOnTop;
    fmLogFolder.BringToFront;
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'bbAddDirClick' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.bbAddDirMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  splViewMouseEnter(nil);
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.bbAddrowMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  splViewMouseEnter(nil);
end;

procedure TfmLogFolder.bbApplyClick(Sender: TObject);
var
  ilst : integer;
begin

  ilst := ckReadselect.Items.Count;

  //Extact the file name and the date and save it.
  //If the file name matches the Mask then keep it.
  //If the file date meets the criteria of the date keep it.
  //Discard for all other cases.


  //ckReadselect
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.bbBuildClick(Sender: TObject);
begin
  try
    (* if pgReadFiles.ActivePage = tsReadall then begin
      Messagedlg('No need to build a list. The program will do it for you', mtInformation, [mbOk],0);
      end else *)
    // if pgReadFiles.ActivePage = tsReadSelective then begin
    BuildFileList('', etReadsel);
    pgReadFiles.ActivePage := tsReadSelective;
    bbBuild.Enabled := true;

    if ckReadselect.Items.Count > 0 then
      bbRun.Enabled := true;

    // end;
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'bbBuildClick' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

procedure TfmLogFolder.bbBuildMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  splViewMouseEnter(nil);
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.bbCancelClick(Sender: TObject);
begin
  try
    (* edaltsaveloc.Text         := '';
      edsponsor.Text            := '';
      edProject.Text            := '';
      edNotes.Text              := '';
      pnlSaveaddit.Visible      := false; *)

  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'bbCancelClick' + #13 + #10 + e.Message, mtError, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.bbClearRowMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  splViewMouseEnter(nil);
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.bbCloseMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  splViewMouseEnter(nil);
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.bbContinueClick(Sender: TObject);
begin
  try // [B 19]
    // pnlSaveaddit.hide;
    // if not SaveResults then
    if not SaveResultsToExcel then
      MessageDlg('Export of results failed.', mtError, [mbOK], 0);

  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'bbContinueClick' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.bbMNUMouseEnter(Sender: TObject);
begin
  splViewMouseEnter(nil);
end;

procedure TfmLogFolder.bbMNUMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  splViewMouseEnter(nil);
end;

procedure TfmLogFolder.bbPinClick(Sender: TObject);
begin
  if splView.Opened Then
  begin
    splView.Open;
  end
  else
  begin
    splView.Close;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.btnBuildflistClick(Sender: TObject);
begin
  try
    pgReadFiles.ActivePage := tsReadSelective;
    ckReadselect.Items.Clear;
    ReadLogFolder('', etReadsel, true);
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'bbBuildflistClick' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.btnDelRowClick(Sender: TObject);
begin
  try
    if idx <> 0 then
    begin // [B 37]
      sgLocations.Cells[0, idx] := '';
      sgLocations.Cells[1, idx] := '';
    end;
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'bbDelRowClick' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.btnOpenfoldClick(Sender: TObject);
begin
  { if openReadfold.Execute then
    cbFolder.text := ExtractFilepath(openReadfold.FileName);
  }

  // if dlgOpendir.Execute then
  // cbFolder.text := dlgOpendir.Directory;

end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.bbRefreshMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  splViewMouseEnter(nil);
end;

procedure TfmLogFolder.bbResetMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  splViewMouseEnter(nil);
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.bbRunClick(Sender: TObject);
var
  icnt: Integer;
  int: Integer;
begin
  try

    bbSave.Enabled := False;

    itotcnt := 0;
    try
      AssignFile(ffollogs, aploc + 'follogs.dat');
      rewrite(ffollogs);
    finally
      closefile(ffollogs);
    end;

    if not builddirlist then
    begin
      lbFInfo.Panels[1].Text :=
        'NON Critical Isssue. If the issue persist report it.';
    end;

    (* edsponsor.Text := '';
      edProject.Text := '';
      edNotes.Text   := '';
    *)
    Timer1.Enabled := False;
    if pgReadFiles.ActivePage = tsReadall then
    begin
      lbFilesRead.Caption := 'Files Read    : ' + inttostr(0);   //[D4]
      lbFilesel.Caption := 'Files selected  : ';

      ReadLogFolder('', etReadall);
      bbShowall.Enabled := true;
      Setlabelcolors;
    end
    else if pgReadFiles.ActivePage = tsReadSelective then
    begin
      // needs some work here
      pgReadFiles.Enabled := False;
      int := 0;
      // bbBuild.Enabled := false;
      fillchar(asSelFilePath, sizeof(asSelFilePath), 0);
      for icnt := 0 to ckReadselect.Items.Count - 1 do
      begin
        if ckReadselect.State[icnt] = cbChecked then
        begin
          setlength(asSelFilePath, int + 1);
          asSelFilePath[int] := ckReadselect.Items[icnt];
          inc(int);
        end;
      end;
      if high(asSelFilePath) >= 0 then
      begin
        ReadSelLogFolder(etReadsel);
        // bbBuild.Enabled := true;
        pgReadFiles.Enabled := true;
        bbShowall.Enabled := true;
      end
      else
      begin
        MessageDlg('Nothing was selected. Select a file to read', mtWarning,
          [mbOK], 0);
        // bbBuild.Enabled := true;
        bbShowall.Enabled := False;
        pgReadFiles.Enabled := true;
      end;
      Setlabelcolors;
    end;
    bbSave.Enabled := true;

  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'bbRunClick' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
      // bbBuild.Enabled := true;
      pgReadFiles.Enabled := true;
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.bbRunMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  splViewMouseEnter(nil);
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.bbSaveClick(Sender: TObject);
begin
  try
    SaveOutput1Click(nil);
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'bbSaveClick' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.bbSaveMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  splViewMouseEnter(nil);
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.bbSavetooClick(Sender: TObject);
var
  toXML: TTxt2xlsx_xml;
  asloc: Ansistring;
begin

  fmLogFolder.SendToBack;
  if svOutput.Execute then
  begin
    edSavetoo.Text := svOutput.FileName;
    if isEmpty(edSavetoo.Text) then
    begin
      edSavetoo.Text := IncludeTrailingPathDelimiter
        (ExtractFilePath(Application.ExeName)) + 'results.xml';
      asloc := edSavetoo.Text;
      toXML := TTxt2xlsx_xml.Create('', asloc, aploc + 'follogs.dat');
      toXML.Destroy;
      pnlSave.Visible := False;
    end
    else
    begin
      asloc := edSavetoo.Text;
      toXML := TTxt2xlsx_xml.Create('', asloc, aploc + 'follogs.dat');
      toXML.Destroy;
      pnlSave.Visible := False;
    end;
  end;
  fmLogFolder.BringToFront;

end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.bbSellocClick(Sender: TObject);
begin
  try

  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'bbSellocClick' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
      // bbBuild.Enabled := true;
      pgReadFiles.Enabled := true;
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.bbShowallMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  splViewMouseEnter(nil);
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.bbStopClick(Sender: TObject);
begin

  bstop := true;
  // edFolder.enabled := true;
  // ckReadsubfolder.Visible := false;
  fmProgress.Hide;
end;

// -----------------------------------------------------------------------------
procedure TfmLogFolder.bbStopMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  splViewMouseEnter(nil);
end;

// -----------------------------------------------------------------------------
function TfmLogFolder.BuildTree(etTyp: etLoad; bCrits: Boolean = False)
  : Boolean;
var
  Node: array of TTreeNode;
  tmp: TTreeNode;
  ix: Integer;
  prev, prFol, prFile: Ansistring;
  ic: Integer;
  iChk: Integer;
  sStmp: Ansistring;
  ifst: Integer;
  iflst: Integer;
  iflstfnd: Integer;
  scprev, scFol, scFile: Ansistring;
  rc1Flogs: TLoginfo;
  asFilt: Ansistring;
begin
  try

    bbSave.Enabled := False;

    ifst := 0;
    // fmLogDisplay.vMemLogs.First;
    if tvView.Items.Count <> 0 then
    begin;
      tvView.Items.Clear;
    end;

    ic := 0;
    ix := 1;
    iChk := 1;
    iflst := 1;
    iflstfnd := 0;

    fmDetails.sgDetails.RowCount := 1;
    // fmDetails.sgDetails.FixedRows      := 1;

    // assignfile(ffollogs, fmLogDisplay.GetapLoc+'follogs.dat');
    // rewrite(ffollogs);
    // prFile := cdsFolders.FieldByName('filename').AsString;
    fmProgress.Setlabel('Building Tree. Please wait...', 1);
//    fmProgress.
    // fmProgress.SetMaxPogress(filesize(flogs),0);
    AssignFile(ffollogs, aploc + 'follogs.dat');
    reset(ffollogs);
    fmProgress.SetMaxPogress(filesize(ffollogs), 0);
    prFile := rc1Flogs.FileName;

    try
      inc(ic);
      setlength(Node, ic + 1);
      if filesize(ffollogs) >= 1 then
      begin
        read(ffollogs, rc1Flogs);
        // if high(rc1flogs) >= 1 then begin
        Node[ic] := tvView.Items.Add(nil, rc1Flogs.Folder);
        Node[ic] := tvView.Items.AddChild(Node[ic], rc1Flogs.FileName);
        tmp := Node[ic];
        Node[ic] := tvView.Items.AddChild(Node[ic],
          '[' + inttostr(rc1Flogs.LineNr) + ']   ' + rc1Flogs.Entry);
        ifst := 1; // [125]
        prFile := rc1Flogs.FileName;
        // rc1Flogs.Types;
        while not EOF(ffollogs) do
        begin
          read(ffollogs, rc1Flogs);
          if rc1Flogs.types <> '' then
          begin
            sStmp := rc1Flogs.types;
            scprev := rc1Flogs.Folder; // FieldByName('folder').AsString;
            scFile := rc1Flogs.FileName; // FieldByName('filename').AsString;

            if scFile = prFile then
              inc(iflst)
            else
            begin
              iflst := 0;
              iflstfnd := 0;
            end;

            if etTyp = etnone then
            begin
              if (rc1Flogs.types = 'Merge') or (rc1Flogs.types = 'Invalid') or
                (rc1Flogs.types = 'Uninitialized') or (rc1Flogs.types = 'Error')
                or (rc1Flogs.types = 'Division') or (rc1Flogs.types = 'Warning')
                or (rc1Flogs.types = 'Cust') then
              begin
                iChk := 1;
              end;
            end
            else
              // [134]
              if (etTyp = etError) then
              begin
                if (rc1Flogs.types = 'Error') then
                  iChk := 1
                else
                  iChk := 0;
              end
              else if (etTyp = etWarn) then
              begin
                if (rc1Flogs.types = 'Warning') then
                  iChk := 1
                else
                  iChk := 0;
              end
              else if (etTyp = etUnint) then
              begin
                if (rc1Flogs.types = 'Uninitialized') then
                  iChk := 1
                else
                  iChk := 0;
              end
              else if (etTyp = etMerge) then
              begin
                if (rc1Flogs.types = 'Merge') then
                  iChk := 1
                else
                  iChk := 0;
              end
              else if (etTyp = etInvalid) then
              begin
                if (rc1Flogs.types = 'Invalid') then
                  iChk := 1
                else
                  iChk := 0;
              end
              else if (etTyp = etDivs) then
              begin
                if (rc1Flogs.types = 'Division') then
                  iChk := 1
                else
                  iChk := 0;
              end
              else
                iChk := 0;

            if (iChk = 0) then
            begin // [134]
              if prev = rc1Flogs.Folder then
              begin
                if prFile = rc1Flogs.FileName then
                begin
                end
                else
                begin
                  Node[ic] := tvView.Items.Add(tmp, rc1Flogs.FileName);
                  iflst := 0;
                end;
              end;
            end
            else if iChk = 1 then
            begin
              if prev = rc1Flogs.Folder then
              begin
                if prFile = rc1Flogs.FileName then
                begin
                  if (iflst = 0) then
                  begin // [134]
                    Node[ic] := tvView.Items.AddChild(Node[ic],
                      '[' + inttostr(rc1Flogs.LineNr) + ']   ' +
                      rc1Flogs.Entry);
                  end
                  else if (iflst > 0) then
                  begin
                    Node[ic] := tvView.Items.Add(Node[ic],
                      '[' + inttostr(rc1Flogs.LineNr) + ']   ' +
                      rc1Flogs.Entry);
                  end;
                  // node[ic] := tvView.Items.AddChild(node[ic],'['+FieldByname('linenr').AsString +']   '+ FieldByname('Entry').AsString);
                end
                else
                begin
                  Node[ic] := tvView.Items.Add(tmp, rc1Flogs.FileName);
                  Node[ic] := tvView.Items.AddChild(Node[ic],
                    '[' + inttostr(rc1Flogs.LineNr) + ']   ' + rc1Flogs.Entry);
                end;
              end
              else
              begin
                if ifst <> 1 then
                begin // [125]
                  inc(ic);
                  setlength(Node, ic + 1);
                  Node[ic] := tvView.Items.Add(nil, rc1Flogs.Folder);
                  Node[ic] := tvView.Items.AddChild(Node[ic],
                    rc1Flogs.FileName);
                  tmp := Node[ic];
                  Node[ic] := tvView.Items.AddChild(Node[ic],
                    '[' + inttostr(rc1Flogs.LineNr) + ']   ' + rc1Flogs.Entry);
                end;
              end;
            end;
            ifst := 0;
            // iChk   := 0;
            prev := rc1Flogs.Folder;
            prFile := rc1Flogs.FileName;

            inc(ix);
            if ix mod 700 = 0 then
            begin
              fmProgress.SetPogress(ix); // [B 29]
              Application.ProcessMessages;
            end;
          end;
        end; // while
      end; // if rc1flogs <> nil then begin
    finally
      closefile(ffollogs);
    end;
    fmProgress.Close;
    // pgLoad.Visible := false;
    bbSave.Enabled := true;

    // lbstatus.Caption := '';
    result := true;
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'BuildTree' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
      // pgLoad.Visible := false;
      // lbstatus.Caption := '';
      // fmProgress.visible := false;
      result := False;
      bbSave.Enabled := true;

    end;
  end;
end;

// ******************************************************************************
procedure TfmLogFolder.edSetpathBtnClick(Sender: TObject);
var
  asPath: Ansistring;
  iRow: Integer;
begin
  try
    { asPath := edSetpath.path;

      if sgLocations.RowCount = 2 then begin
      irow := sgLocations.Row;
      btnAddClick(nil);
      end else begin
      btnAddClick(nil);
      if sglocations.Cells[0,sgLocations.Row] <> '' then
      irow := sgLocations.Row+1
      else
      irow := sgLocations.Row;
      end;

      sgLocations.Cells[0,irow] := asPath; }
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'cbFolderExit' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

procedure TfmLogFolder.edsponsorChange(Sender: TObject);
begin

end;

// ******************************************************************************
procedure TfmLogFolder.edaltsavelocExit(Sender: TObject);
begin
  try
    (* if not isEmpty(edaltsaveloc.Text) then begin
      edaltsaveloc.text := IncludeTrailingBackslash(ExcludeTrailingBackslash(edaltsaveloc.text));
      end; *)
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'edaltsavelocKeyUp' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ******************************************************************************
procedure TfmLogFolder.edaltsavelocKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  try
    if (Key = 32) then
    begin
      dlgOpendir.Execute;
      // edaltsaveloc.Text := ExtractFileDir(dlgOpendir.FileName);
    end;
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'edaltsavelocKeyUp' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ******************************************************************************
procedure TfmLogFolder.edFolderExit(Sender: TObject);
begin
  try
    { if DirectoryExists(edFolder.text) then begin //[194]
      if stLoc = '' then
      stLoc := edFolder.text
      else
      if stloc <> edFolder.text then begin
      lbFilters.Caption := 'No Filtering ';
      spbResetClick(nil);
      stLoc := edFolder.text
      end;
      end; }
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'cbFolderExit' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
function TfmLogFolder.BuildFilterTree(etTyp: etLoad): Boolean;
var
  Node: array of TTreeNode;
  tmp: TTreeNode;
  ix: Integer;
  prev, prFol, prFile: Ansistring;
  ic: Integer;
  iChk: Integer;
  sStmp: Ansistring;
  ifst: Integer;
  iflst: Integer;
  iflstfnd: Integer;
  scprev, scFol, scFile: Ansistring;
  sDescr: Ansistring;
  rc2flogs: TLoginfo;
  iloopcnt: Integer;
begin
  try
    sgToCheck.Enabled := false;
    ifst := 0;
    // fmLogDisplay.vMemLogs.First;
    if tvView.Items.Count <> 0 then
    begin;
      tvView.Items.Clear;
    end;

    ic := 0;
    ix := 1;
    iChk := 1;
    iflst := 1;
    iflstfnd := 0;
    setlength(Node, ic + 1);
    try
      AssignFile(ffollogs, aploc + 'follogs.dat');
      reset(ffollogs);
      if filesize(ffollogs) > 0 then
      begin;
        read(ffollogs, rc2flogs);
        prFile := rc2flogs.FileName;

        fmProgress.Setlabel('Building Tree. Please wait...', 1);
        fmProgress.SetMaxPogress(filesize(ffollogs), 0);
        fmProgress.FormStyle := fsStayOnTop;
        inc(ic);
        setlength(Node, ic + 1);

        if (etTyp = etError) then
        begin
          sDescr := 'Errors';
        end
        else if (etTyp = etWarn) then
        begin
          sDescr := 'Warnings';
        end
        else if (etTyp = etUnint) then
        begin
          sDescr := 'Uninitialized';
        end
        else if (etTyp = etMerge) then
        begin
          sDescr := 'Merge Notes';
        end
        else if (etTyp = etInvalid) then
        begin
          sDescr := 'Invalid Notes';
        end
        else if (etTyp = etConvert) then
        begin
          sDescr := 'Conversion Notes';
        end
        else if (etTyp = etCust) then
        begin
          sDescr := 'Custom Log Entries';
        end
        else if (etTyp = etalloth) then
        begin // [176]
          sDescr := 'All Others...';
        end
        else if (etTyp = etDivs) then
        begin
          sDescr := 'Division by 0';
        end
        else if (etTyp = etmisvals) then
        begin
          sDescr := 'Missing Value';
        end;
        if (etTyp = etrepbyval) then
        begin
          sDescr := 'Repeat by Values';
        end;
        if (etTyp = etmathop) then
        begin
          sDescr := 'Math. Operation';
        end;
        if (etTyp = etnobosdata) then
        begin
          sDescr := 'No OBS in data';
        end;
        if (etTyp = etnobystate) then
        begin
          sDescr := 'No by Statement';
        end;

        Node[ic] := tvView.Items.Add(nil, 'Filtering for ' + sDescr);
        tmp := Node[ic];
        ifst := 1;

        iloopcnt := 0;

        sStmp := rc2flogs.types;

        while (not EOF(ffollogs)) or (EOF(ffollogs)) and (iloopcnt = 0) do
        begin
          if (iloopcnt > 0) and (not EOF(ffollogs)) and (sStmp <> '') then
            read(ffollogs, rc2flogs);

          inc(iloopcnt);

          sStmp := rc2flogs.types;
          scprev := rc2flogs.Folder;
          scFile := rc2flogs.FileName;

          if scFile = prFile then
          begin
            inc(iflst);
          end
          else
          begin
            iflst := 0;
            iflstfnd := 0;
          end;
          bFilter := true;
          if etTyp = etnone then
          begin
            if (rc2flogs.types = 'Merge') or (rc2flogs.types = 'Invalid') or
              (rc2flogs.types = 'Uninitialized') or (rc2flogs.types = 'Error')
              or (rc2flogs.types = 'Division') or (rc2flogs.types = 'Warning')
              or (rc2flogs.types = 'Cust') or (rc2flogs.types = 'Conversion') or
              (rc2flogs.types = 'missval') or (rc2flogs.types = 'repbyval') or
              (rc2flogs.types = 'methop') or (rc2flogs.types = 'nobosdata') or
              (rc2flogs.types = 'nobystate') then
            begin
              iChk := 1;
            end;
          end
          else
            // [134]
            if (etTyp = etError) then
            begin
              sDescr := 'Filter : Errors';
              if (rc2flogs.types = 'Error') then
                iChk := 1
              else
                iChk := 0;
            end
            else if (etTyp = etWarn) then
            begin
              sDescr := 'Filter : Warnings';
              if (rc2flogs.types = 'Warning') then
                iChk := 1
              else
                iChk := 0;
            end
            else if (etTyp = etUnint) then
            begin
              sDescr := 'Filter : Uninitialized';
              if (rc2flogs.types = 'Uninitialized') then
                iChk := 1
              else
                iChk := 0;
            end
            else if (etTyp = etMerge) then
            begin
              sDescr := 'Filter : Merge Notes';
              if (rc2flogs.types = 'Merge') then
                iChk := 1
              else
                iChk := 0;
            end
            else if (etTyp = etInvalid) then
            begin
              sDescr := 'Filter : Invalid Notes';
              if (rc2flogs.types = 'Invalid') then
                iChk := 1
              else
                iChk := 0;
            end
            else if (etTyp = etConvert) then
            begin
              sDescr := 'Filter : Conversion Notes';
              if (rc2flogs.types = 'Conversion') then
                iChk := 1
              else
                iChk := 0;
            end
            else if (etTyp = etCust) then
            begin
              sDescr := 'Filter : Custom Log Entries';
              if (rc2flogs.types = 'Cust') then
                iChk := 1
              else
                iChk := 0;
            end
            else if (etTyp = etalloth) then
            begin // [176]
              sDescr := 'Filter : All Others...';
              if (rc2flogs.types = 'AllOth') then
                iChk := 1
              else
                iChk := 0;
            end
            else if (etTyp = etDivs) then
            begin
              sDescr := 'Filter : Division by 0';
              if (rc2flogs.types = 'Division') then
                iChk := 1
              else
                iChk := 0;
            end
            else if (etTyp = etmisvals) then
            begin
              sDescr := 'Filter : Missing Value';
              if (rc2flogs.types = 'missval') then
                iChk := 1
              else
                iChk := 0;
            end
            else if (etTyp = etrepbyval) then
            begin
              sDescr := 'Filter : Repeat by Value';
              if (rc2flogs.types = 'repbyval') then
                iChk := 1
              else
                iChk := 0;
            end
            else if (etTyp = etmathop) then
            begin
              sDescr := 'Filter : Math Opertion.';
              if (rc2flogs.types = 'methop') then
                iChk := 1
              else
                iChk := 0;
            end
            else if (etTyp = etnobosdata) then
            begin
              sDescr := 'Filter : No Obs in Data';
              if (rc2flogs.types = 'nobosdata') then
                iChk := 1
              else
                iChk := 0;
            end
            else if (etTyp = etnobystate) then
            begin
              sDescr := 'Filter : No By Statement';
              if (rc2flogs.types = 'nobystate') then
                iChk := 1
              else
                iChk := 0;
            end
            else
              iChk := 0;

          prFol := rc2flogs.FileName + '==' + rc2flogs.Entry;

          if iChk = 1 then
          begin
            if (prev = rc2flogs.Folder) or (iflstfnd = 0) then
            begin // [153]
              if (prFile = rc2flogs.FileName) or (iflstfnd = 0) then
              begin // [153]
                inc(iflstfnd);
                if (iflstfnd = 1) then
                begin // [134]
                  Node[ic] := tvView.Items.Add(tmp,
                    rc2flogs.Folder + rc2flogs.FileName);
                  Node[ic] := tvView.Items.AddChild(Node[ic],
                    '[' + inttostr(rc2flogs.LineNr) + ']   ' + rc2flogs.Entry);
                end
                else if (iflst > 1) then
                begin
                  Node[ic] := tvView.Items.Add(Node[ic],
                    '[' + inttostr(rc2flogs.LineNr) + ']   ' + rc2flogs.Entry);
                end;
              end
            end;
          end;

          ifst := 0;
          prev := rc2flogs.Folder;
          prFile := rc2flogs.FileName;

          inc(ix);

          if ix mod 700 = 0 then
          begin // [B13]
            Application.ProcessMessages;
            fmProgress.SetPogress(ix); // [B 29]
          end;
        end;
        lbFilters.Caption := sDescr; // [169]
      end;
    finally
      closefile(ffollogs);
    end;
    fmProgress.FormStyle := fsNormal;
    fmProgress.Close;
    sgToCheck.Enabled := false;

    result := true;
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'BuildFilterTree' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
      // pgLoad.Visible := false;
      fmProgress.FormStyle := fsNormal;
      fmProgress.Close;
      sgToCheck.Enabled := false;
      result := False;
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.ckBuilddetailafterreadMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  splViewMouseEnter(nil);
end;

procedure TfmLogFolder.ckDisplayClick(Sender: TObject);
var
  icnt: Integer;
  sfpath: string;
begin
  try
    if ckDisplay.Checked then
    begin
      ckDisplay.Caption := 'Show Full File path';
      Rebuildfilechecklist(ckReadselect, False);
    end
    else
    begin
      ckDisplay.Caption := 'Show File Name';
      Rebuildfilechecklist(ckReadselect, False);
    end;
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'ckDisplayClick' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

procedure TfmLogFolder.ckDisplayMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  splViewMouseEnter(nil);
end;

procedure TfmLogFolder.ckEnableFilterClick(Sender: TObject);
begin
//FixMe: End less loop
  if ckEnableFilter.Checked = true then begin;
    edFileMask.Enabled := true;
    edFilDate.Enabled := true;
    cbDirection.Enabled := true;
//    ckEnableFilter.Checked := treu;
  end else
  if ckEnableFilter.Checked = False then begin;
    edFileMask.Enabled := False;
    edFilDate.Enabled := False;
    cbDirection.Enabled := False;
//    ckEnableFilter.Checked := true;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.ckfilelistClick(Sender: TObject);
var
  asStr: Ansistring;
  asTMp: Ansistring;
  idx: Integer;
begin
  try

  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'ckfilelistClick' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.ckfilelistDrawItem(Control: TWinControl;
  Index: Integer; { [B 43] }
  Rect: TRect; State: TOwnerDrawState);
var
  Flags: Longint;
  idx: Integer;
  asStr: string;
begin
  with (Control as TCheckListBox) do
  begin
    if index > 0 then
    begin
      asStr := lowercase(ckfilelist.Items.Strings[index - 1]);
      idx := index - 1;
    end
    else
    begin
      asStr := lowercase(ckfilelist.Items.Strings[index]);
      idx := index;
    end;
    // modifying the Canvas.Brush.Color here will adjust the item color
    if (Containsstr(asStr, 'found issues') = true) then
    begin
      Canvas.Brush.Color := $00F9F9F9;
      Canvas.Font.Color := clRed;
    end
    else
    begin
      Canvas.Brush.Color := $00EFEFEF;
      Canvas.Font.Color := clGreen;
    end;
    Canvas.FillRect(Rect);
    // modifying the Canvas.Font.Color here will adjust the item font color

    Flags := DrawTextBiDiModeFlags(DT_SINGLELINE or DT_VCENTER or DT_NOPREFIX);
    if not UseRightToLeftAlignment then
      inc(Rect.Left, 2)
    else
      Dec(Rect.Right, 2);
    DrawText(Canvas.Handle, Items[idx], Length(Items[idx]), Rect, Flags);
  end;

end;

// -------------------------------------------------------------------------
procedure TfmLogFolder.ckReadselectKeyPress(Sender: TObject; var Key: Char);
begin
  try
    // if key = vk_space then
    // UpdateCntlabel;

  except
    on e: Exception do
    begin

    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.ckReadselectKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  try
    if Key = vk_space then
      UpdateCntlabel;
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'ckReadselectKeyUp' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);

    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.ckReadselectMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  m: TPoint;
begin
  try
    if Button = mbRight then
    begin
      GetCursorPos(m);
      ppChkedit.Popup(m.X, m.Y);
    end;

    UpdateCntlabel;

  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'ckReadselectMouseUp' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);

    end;
  end;
end;

// ------------------------------------------------------------------------------

procedure TfmLogFolder.chkReadsubfolderClick(Sender: TObject);
begin

end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.FormActivate(Sender: TObject);
begin
  // FormShow(nil);
  splView.Opened := False;
  ckEnableFilter.Checked := False;

  edFileMask.Enabled := False;
  edFilDate.Enabled := False;
  cbDirection.Enabled := False;

end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.FormClose(Sender: TObject; var Action: TCloseAction);
var
  bproblem: Boolean;
  asUserprofile, asVal: Ansistring;
  iRow, icnt: Integer;

begin
  try
    FreeAndnil(sldirlist);
    // pnlsaveaddit.Visible := false;
    Createstdgrids;

    { if ichk > 1 then begin
      DestroyCheckboxes;
      end;
      ichk := 1;
      ckReadselect.Items.Clear;
      spbResetclick(nil); }
    // if messagedlg('Do you want to Clear the Search Result', mtConfirmation, [mbYes, mbNo],0) = mrYes then begin
    { bfilter := false;
      Timer1.Enabled := false;
      ClearResult;//145
      close; }
    { end else begin
      close;
      end; }
    iRow := 0;
    { asUserprofile       := GetEnvironmentVariable('USERPROFILE');
      Settings            := TIniFile.Create(asUserprofile+'\saslogdisp.ini');
      irow                := sgLocations.Rowcount;

      //Save only 5 locations
      if irow > 6 then
      irow := 6;

      for icnt := 2 to irow do begin
      asVal := sgLocations.Cells[1, icnt];
      if DelMidSpaces(sgLocations.Cells[1, icnt]) <> '' then begin
      Settings.WriteString('folderloc'+inttostr(icnt), 'folderloc'+inttostr(icnt), sgLocations.Cells[0, icnt]);
      end;
      end;

      Settings.Free; }
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'FormClose' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.FormCreate(Sender: TObject);
begin
  try
    iChk := 1;
    ifcnt := 1;
    bbRun.Enabled := False;
    Timer1.Enabled := False;
    bPin := False;

    bbShowall.Enabled := False; // [186]

    aploc := ExtractFilePath(Application.ExeName);
    // PageControl1.
    // TabSheet1.TabVisible := false;
    tsSummary.TabVisible := False;
    pgReadFiles.ActivePage := tsReadall;

    (* if pgReadFiles.ActivePage = tsReadall then bbBuild.Enabled := false
      else bbBuild.Enabled := true; *)

    Setuplocgrid;
                                       (*
    lbNotes.Caption := 'Notes     : ' + inttostr(0);
    lbInfo.Caption := 'Info      : ' + inttostr(0);
    lbwarn.Caption := 'Warnings      : ' + inttostr(0);
    lbConv.Caption := 'Conversion    : ' + inttostr(0);
    lbUninit.Caption := 'Uninitialized : ' + inttostr(0);
    lbDivs.Caption := 'Division by 0 : ' + inttostr(0);
    lbMerge.Caption := 'Merge Notes   : ' + inttostr(0);
    lbInvald.Caption := 'Invalid Notes : ' + inttostr(0);
    lberr.Caption := 'Errors        : ' + inttostr(0);
    lbCust.Caption := 'Custom        : ' + inttostr(0);
    lbAlloth.Caption := 'All other     : ' + inttostr(0);   *)
    lbFilesRead.Caption := 'Files Read    : ' + inttostr(0);
    lbFilesRead.Caption := 'Files Read    : ' + inttostr(0);

    bbShowall.Visible := False;
    // bbSave.visible    := false;

    splView.Opened := False;

    sldirlist := Tstringlist.Create();
    // tsGeneral.TabVisible := false;
    // tsReadSelective.tabvisible := false;
    // bbBuild.Visible            := false;

    // edFolder.Text    := IncludeTrailingBackslash(ExcludeTrailingBackslash(folloc));

  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'FormCreate' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.FormResize(Sender: TObject);
begin
  // if windowstate = wsMaximized then begin
  // fmLogFolder.Top := 11;
  // end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.FormShow(Sender: TObject);
var
  asUserprofile, asVal: string;
  iRow, icnt: Integer;
begin
  try

    Timer1.Enabled := true;
    bbRun.Enabled := true;
    // bbBuild.Enabled := false;
    pgReadFiles.ActivePage := tsReadall;
    Createstdgrids;

    if iSetload <> 1 then
    begin
      iRow := 0;
      asUserprofile := GetEnvironmentVariable('USERPROFILE');
      Settings := TInifile.Create(asUserprofile + '\saslogdisp.ini');
      iRow := 5;

      for icnt := 1 to iRow do
      begin
        asVal := Settings.ReadString('folderloc' + inttostr(icnt),
          'folderloc' + inttostr(icnt), asVal);
        if DelMidSpaces(asVal) <> '' then
        begin
          sgLocations.RowCount := sgLocations.RowCount + 1;
          sgLocations.Cells[0, icnt] := asVal;
          asVal := '';
        end;
      end;
      iSetload := 1;
      Settings.Free;

      if not builddirlist then
      begin
        lbFInfo.Panels[1].Text :=
          'NON Critical Isssue. If the issue persist report it.';
      end;

      sldirlist := Tstringlist.Create();
    end;
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 + 'FormShow'
        + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

procedure TfmLogFolder.imgMenuClick(Sender: TObject);
begin
  if splView.Opened = true then begin
    splView.Opened := false;
  end else begin
    splView.Opened := true;
    splView.OpenedWidth := 250;
  End;

end;
// ------------------------------------------------------------------------------
procedure TfmLogFolder.Label3Click(Sender: TObject);
begin

end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.lbAllothClick(Sender: TObject);
begin
  try
    BuildFilterTree(etalloth);
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'lbAllothClick' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);

    end;
  end;
end;
// ------------------------------------------------------------------------------

procedure TfmLogFolder.lbConvClick(Sender: TObject);
begin
  try
    BuildFilterTree(etConvert);
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'lbConvClick' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.lbCustClick(Sender: TObject);
begin
  try
    BuildFilterTree(etCust);
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'lbCustClick' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.lbDivsClick(Sender: TObject);
begin
  try
    BuildFilterTree(etDivs);
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'lbDivsClick' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);

    end;
  end;
end;
// ------------------------------------------------------------------------------

procedure TfmLogFolder.lberrClick(Sender: TObject);
begin
  try
    BuildFilterTree(etError);
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'lberrClick' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);

    end;
  end;
end;

procedure TfmLogFolder.lbFilesReadClick(Sender: TObject);
begin

end;

// ------------------------------------------------------------------------------

procedure TfmLogFolder.lbInvaldClick(Sender: TObject);
begin
  try
    BuildFilterTree(etInvalid);
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'lbInvaldClick' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);

    end;
  end;
end;
// ------------------------------------------------------------------------------

procedure TfmLogFolder.lbMergeClick(Sender: TObject);
begin
  try
    BuildFilterTree(etMerge);
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'lbMergeClick' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);

    end;
  end;
end;
// ------------------------------------------------------------------------------

procedure TfmLogFolder.lbUninitClick(Sender: TObject);
begin
  try
    BuildFilterTree(etUnint);
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'lbUninitClick' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);

    end;
  end;
end;
// ------------------------------------------------------------------------------

procedure TfmLogFolder.lbwarnClick(Sender: TObject);
begin
  try
    BuildFilterTree(etWarn);
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'lbwarnClick' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);

    end;
  end;
end;

procedure TfmLogFolder.lnkpathClick(Sender: TObject);
begin
  // lnkpath.e
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.ReadAll1Click(Sender: TObject);
var
  icnt: Integer;
  int: Integer;
begin
  try

    itotcnt := 0;

    try
      AssignFile(ffollogs, aploc + 'follogs.dat');
      rewrite(ffollogs);
    finally
      closefile(ffollogs);
    end;
    Timer1.Enabled := False;
    pgReadFiles.ActivePage := tsReadall;
    ReadLogFolder('', etReadall);
    bbShowall.Enabled := true;
    Setlabelcolors;

  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'ReadAll1Click' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
      // bbBuild.Enabled := true;
      pgReadFiles.Enabled := true;
    end;
  end;
end;

// ------------------------------------------------------------------------------
function TfmLogFolder.ReadLogFolder(asFile: Ansistring; etRead: etReadtype;
  bBuildlist: Boolean = False): Boolean;
  function SearchforAddsubfolders(asdir: Ansistring): Integer;
  var
    iFol: Integer;
    iSFcnt: Integer;
    sr: TSearchRec;
    asTMp: Ansistring;
  begin
    try
      iSFcnt := 0;
      iFol := FindFirst(asdir + '*.*', faDirectory, sr);
      if iFol = 0 then
      begin
        try
          repeat
            if ((sr.Attr and faDirectory) <> 0) and (sr.Name <> '.') and
              (sr.Name <> '..') then
            begin
              iSFcnt := high(sFold) + 1;
              if iSFcnt = 0 then
                inc(iSFcnt);
              setlength(sFold, iSFcnt + 1);

              // Showmessage(IncludeTrailingBackslash(ExcludeTrailingBackslash(asdir))+sr.Name);
              sFold[iSFcnt] := IncludeTrailingBackslash
                (ExcludeTrailingBackslash(asdir)) + sr.Name;
              asTMp := sFold[iSFcnt];
              SearchforAddsubfolders(asTMp);
            end;
            iFol := FindNext(sr);
            // application.processmessages;
            lbFInfo.Panels[0].Text := 'Checking for subfolder...';
            // lbfinfo.caption  := 'Checking for subfolder...';
            Application.ProcessMessages;
          until iFol <> 0;
        finally
          FindClose(sr);
        end;
      end;
    except
      on e: Exception do
      begin
        MessageDlg('The following exception occurred in:' + #13 + #10 +
          'SearchforAddsubfolders' + #13 + #10 + e.Message, mtWarning,
          [mbOK], 0);
      end;
    end;
  end;

// ------------------------------------------------------------------------------
var
  sr: TSearchRec;
  bComplete: Boolean;
  // asFilePath : array of Ansistring;
  asFilePath: array of Ansistring;
  asVal: Ansistring;
  icnt: Integer;
  icnt1: Integer;
  ilen: Integer;
  fTmploc: Ansistring;
  tmpstr: Ansistring;
  stmp: Ansistring;
  iSFcnt, iFol, itrip: Integer;
  ip, icc: Integer;
  dtSt, dten: TDatetime;
  bdone: Boolean;
  iRow: Integer;
  itrow: Integer;
  floc: Ansistring;
begin
  try
    dtSt := now;
    bdone := False;
    // edFolder.enabled        := false;

    sgLocations.Enabled := bdone;
    iRow := 1;
    itrow := sgLocations.RowCount;

    sFold := nil;
    asFilePath := nil; //[D5]

    tvView.Items.Clear;
    ckfilelist.Items.Clear;
    // fmLogDisplay.ClearCounters;
    bComplete := False;
    icnt := 0;
    itrip := 0;
    ip := 0;
    iSFcnt := 0;

    bstop := False;
    arFdets := nil;
    setlength(arFdets, 1);
    fillchar(sFold, 1, 0);

    // lfRead := TLogFileRead.create(aploc, arFdets[1].FPath, true, pgRead, lbstats);
    lfRead := TLogFileRead.Create(aploc, arFdets[1].FPath, true, pgRead, nil);
    // [B 30]
    lfRead.ClearCounters;

    // while (irow < itrow) do begin;  //[195]
    for iRow := 1 to itrow do
    begin;
      iSFcnt := 1;
      asVal := IncludeTrailingBackslash
        (ExcludeTrailingBackslash(sgLocations.Cells[0, iRow]));
      asFilePath := nil; //[D5]
      if not bBuildlist then
      begin
        sgLocations.Cells[1, iRow] := 'Busy Reading ...';
      end;

      if (delbspace(asVal) <> '') and (asVal <> '/') and (asVal <> '\') then
      begin // [B 2]
        fmProgress.Setlabel('Reading Files. Please wait...', 1);
        iSFcnt := 1;

        for iSFcnt := 1 to iSFcnt do
        begin
          if bstop <> true then
          begin

            if not bBuildlist then
            begin
              icnt1 := 0;
            end;

            if isnotempty(asVal) then
            begin
              if FindFirst(asVal + '*.log', faAnyFile, sr) = 0 then
              begin
                if sr.Name <> '' then
                begin
                  setlength(asFilePath, icnt1 + 1);
                  asFilePath[icnt1] := asVal + ExtractFileName(sr.Name);
                  inc(icnt1);
                  bComplete := False;
                end;
              end;
              while not bComplete do
              begin
                if FindNext(sr) = 0 then
                begin
                  if sr.Name <> '' then
                  begin
                    setlength(asFilePath, icnt1 + 1);
                    asFilePath[icnt1] := asVal + ExtractFileName(sr.Name);
                    inc(icnt1);
                  end;
                end
                else
                begin
                  bComplete := true;
                end;
              end;
              FindClose(sr);
              // ftmploc  := floc;

              icc := high(asFilePath);
              if (iFol >= 0) and (icc > 0) then
              begin
                fmProgress.SetMaxPogress(icc, iFol);
                fmProgress.SetPogress(0, iSFcnt);
              end;

              if etRead = etReadsel then
              begin
                if not bBuildlist then
                begin
                  for icnt := 0 to ckReadselect.Items.Count - 1 do
                  begin
                    setlength(asFilePath, icnt + 1);
                    if ckReadselect.Checked[icnt] then
                    begin
                      asFilePath[icnt] := ckReadselect.Items.Text;
                    end;
                  end;
                end;
              end;

              for icnt := 0 to high(asFilePath) do
              begin
                if bstop then
                  break;

                if etRead = etReadall then
                begin
                  if asFilePath[icnt] <> '' then
                    // ckfilelist.Items.Add(' [ Filedate : '+DateTimeTostr(FileDate(asFilePath[icnt]))+']' + asFilePath[icnt]  )
                    // ckReadselect.Items.Add(formatDateTime('yyyymmmdd hh:mm AM/PM',FileDate(asFilePath[icnt]))+' ' + asFilePath[icnt]);
                    // JvxCheckListBox1.Items.Add(formatDateTime('yyyymmdd hh:mm AM/PM',FileDate(asFilePath[icnt])));
                    ckfilelist.Items.Add
                      (formatDateTime('yyyy/mm/dd hh:mm AM/PM',
                      FileDate(asFilePath[icnt])) + ' ' + asFilePath[icnt]);
                end
                else if etRead = etReadsel then
                begin
                  if asFilePath[icnt] <> '' then
                    // ckReadselect.Items.Add(' [ Filedate : '+DateTimeTostr(FileDate(asFilePath[icnt]))+']' + asFilePath[icnt]);
                    // ckfilelist.Items.Add(' [ Filedate : '+formatDateTime('ddmmmyyyy hh:mm AM/PM',FileDate(asFilePath[icnt]))+'] ' + asFilePath[icnt]);
                    // JvxCheckListBox1.Items.Add(formatDateTime('yyyymmdd hh:mm AM/PM',FileDate(asFilePath[icnt]))+' ' + asFilePath[icnt]);
                    ckReadselect.Items.Add
                      (formatDateTime('yyyy/mm/dd hh:mm AM/PM',
                      FileDate(asFilePath[icnt])) + ' ' + asFilePath[icnt]);
                end;

                if not bBuildlist then
                begin
                  lbFInfo.Panels[0].Text := 'Reading File ' + asFilePath[icnt];
                  floc := asFilePath[icnt];
                  ilen := high(arFdets);

                  if ilen < 0 then
                    ilen := 1
                  else
                    ilen := ilen + 1;

                  setlength(arFdets, ilen + 1);
                  arFdets[ilen].FPath := asFilePath[icnt];;
                  lfRead.ReadLogfile(true, arFdets[ilen].FPath, true, False);

                  floc := fTmploc;
                  // lbfinfo.Panels[0].Text     := '';
                  ckfilelist.ItemEnabled[ip] := False;
                  ckfilelist.Checked[ip] := true;

                  if icnt mod 14 = 0 then
                  begin // [B 29]
                    fmProgress.SetPogress(icnt);
                    Application.ProcessMessages;
                    if lfRead.finalstatus > 0 then
                    begin
                      ckfilelist.Items.Strings[ip] := '(Found Issues)' +
                        ckfilelist.Items.Strings[ip];
                    end;

                    Updatelabels;
                  end;

                  inc(ip);
                end;
              end; // ffor icnt := 0 to high(asFilePath) do begin

              lbFilesRead.Caption := 'Files Read    : ' + inttostr(ip);

            end; // if isnotempty(asval)
            // MessageDlg('Please enter a valid Directory. The Folder Name may not be empty', mtError, [mbOK], 0);
          end
          else
          begin
          end; // bstop;
        end; // for isfcnt := 0;
      end; // if asval <> ''
      if not bBuildlist then
      begin
        if sgLocations.Cells[0, iRow] <> '' then
        begin
          if not bstop then // [B 33]
            sgLocations.Cells[1, iRow] := 'Done Reading'
          else
            sgLocations.Cells[1, iRow] := 'Reading Stopped';

        end
        else
        begin
          sgLocations.Cells[1, iRow] := '';
        end;
      end;
      // inc(irow);
      Updatelabels; { [B 36] }
    end;

    if Assigned(lfRead) then
      lfRead.Destroy;

    dten := now;

    lbFInfo.Panels[0].Text := ' Files read : ' + inttostr(ip) +
    // '. Total Lines read : ' + inttostr(itotcnt) +
      '. Read in : ' + FloatToStr(TimeDeltaInSeconds(dtSt, dten)) + 's';

    if not BuildTree(etnone, False) then
      MessageDlg('The Result Tree could not be populated. ' + #13 + #10 +
        'Restart the application and try again. If the problem persist, please report it. ',
        mtError, [mbOK], 0);
    dten := now;
    if TimeDeltaInSeconds(dtSt, dten) = 0 then
    begin
      lbFInfo.Panels[0].Text := ' Files read : ' + inttostr(ip) +
        '. Read and analyzed in : ' +
        FloatToStr(TimeDeltaInMSeconds(dtSt, dten)) + 'ms';
    end
    else
    begin
      lbFInfo.Panels[0].Text := ' Files read : ' + inttostr(ip) +
        '. Read and analyzed in : ' +
        FloatToStr(TimeDeltaInSeconds(dtSt, dten)) + 's';
    end;

    lbstats.Caption := '';

    { folloc            := ExcludeTrailingBackslash(edFolder.text);
      edFolder.text     := IncludeTrailingBackslash(ExcludeTrailingBackslash(edFolder.text)); }

    // Settings        := TIniFile.Create(ExtractFilePath(application.exename)+'saslogdisp.ini');
    // Settings.WriteString('location', 'folder', folLoc);
    // Settings.Free;

    // edFolder.enabled := true;
    sgLocations.Enabled := true;

    bstop := False;
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'ReadLogFolder' + #13 + #10 + e.Message, mtError, [mbOK], 0);
      fmProgress.Hide;
      // edFolder.enabled        := true;
      sgLocations.Enabled := true;
      if Assigned(lfRead) then
        lfRead.Destroy;
    end;
  end;
end;

// ------------------------------------------------------------------------------
function TfmLogFolder.BuildFileList(asFile: Ansistring;
  etRead: etReadtype): Boolean;
var
  sr: TSearchRec;
  bComplete: Boolean;
  asVal: Ansistring;
  icnt: Integer;
  ilen: Integer;
  fTmploc: Ansistring;
  tmpstr: Ansistring;
  stmp: Ansistring;
  itrip: Integer;
  ip, icc: Integer;
  iRow, itrow: Integer;
begin
  try
    // edFolder.enabled    := false;
    sgLocations.Enabled := False;
    sFold := nil;
    tvView.Items.Clear;
    ckReadselect.Items.Clear;
    // fmLogDisplay.ClearCounters;
    bComplete := False;
    icnt := 0;
    itrip := 0;
    ip := 0;

    bstop := False;

    fillchar(arFdets, 1, 0);
    fillchar(sFold, 1, 0);
    itrow := sgLocations.RowCount;
    iRow := 1;

    fmProgress.Setlabel('Reading Files. Please wait...', 1);
    fmProgress.SetMaxPogress(0, 0);

    while (iRow < itrow) do
    begin; // [195]
      asVal := IncludeTrailingBackslash
        (ExcludeTrailingBackslash(sgLocations.Cells[0, iRow]));

      icnt := 0;
      if isnotempty(asVal) then
      begin
        if FindFirst(asVal + '*.log', faAnyFile, sr) = 0 then
        begin
          ckReadselect.Items.Add(asVal + ExtractFileName(sr.Name));
          bComplete := False;
        end;
        while not bComplete do
        begin
          if FindNext(sr) = 0 then
          begin
            ckReadselect.Items.Add(asVal + ExtractFileName(sr.Name));
          end
          else
          begin
            bComplete := true;
          end;
        end;
        FindClose(sr);
      end;
      inc(iRow);
    end;

    fmProgress.Close;
    // edFolder.enabled    := true;

  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'BuildFileList' + #13 + #10 + e.Message, mtError, [mbOK], 0);
      fmProgress.Hide;
      // edFolder.enabled    := true;
      sgLocations.Enabled := true;
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.ReadSelectiveFiles1Click(Sender: TObject);
var
  icnt: Integer;
  int: Integer;
begin
  try

    itotcnt := 0;

    try
      AssignFile(ffollogs, aploc + 'follogs.dat');
      rewrite(ffollogs);
    finally
      closefile(ffollogs);
    end;
    Timer1.Enabled := False;
    pgReadFiles.ActivePage := tsReadSelective;
    // needs some work here
    pgReadFiles.Enabled := False;
    int := 0;
    // bbBuild.Enabled := false;
    fillchar(asSelFilePath, sizeof(asSelFilePath), 0);
    for icnt := 0 to ckReadselect.Items.Count - 1 do
    begin
      if ckReadselect.State[icnt] = cbChecked then
      begin
        setlength(asSelFilePath, int + 1);
        asSelFilePath[int] := ckReadselect.Items[icnt];
        inc(int);
      end;
    end;
    if high(asSelFilePath) >= 0 then
    begin
      ReadSelLogFolder(etReadsel);
      // bbBuild.Enabled := true;
      pgReadFiles.Enabled := true;
      bbShowall.Enabled := true; // [186]
    end
    else
    begin
      MessageDlg('Nothing was selected. Select a file to read', mtWarning,
        [mbOK], 0);
      // bbBuild.Enabled := true;
      bbShowall.Enabled := False; // [186]
      pgReadFiles.Enabled := true;
    end;
    Setlabelcolors;

  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'bbRunClick' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
      // bbBuild.Enabled := true;
      pgReadFiles.Enabled := true;
    end;
  end;
end;

// ------------------------------------------------------------------------------
function TfmLogFolder.ReadSelLogFolder(etRead: etReadtype;
  bBuildlist: Boolean = False): Boolean;
var
  sr: TSearchRec;
  bComplete: Boolean;
  asVal: Ansistring;
  icnt: Integer;
  ilen: Integer;
  fTmploc: Ansistring;
  tmpstr: Ansistring;
  stmp: Ansistring;
  iSFcnt, iFol, itrip: Integer;
  ip, icc: Integer;
  floc: Ansistring;
  dtSt: TDatetime;
begin
  try
    // edfolder.enabled := false;
    // cdsFolders.EmptyDataSet;
    sFold := nil;
    tvView.Items.Clear;
    // fmLogDisplay.ClearCounters;
    bComplete := False;
    icnt := 0;
    itrip := 0;
    ip := 0;
    iSFcnt := 0;
    ilen := 0;

    bstop := False;
    dtSt := now;
    // asval     := edfolder.text;
    iSFcnt := high(asSelFilePath);
    // arFdets[ilen].FPath := asSelFilePath[icnt]
    fillchar(arFdets, sizeof(arFdets), 0); // [163]
    lbFilesel.Caption := 'Files selected : ' +
      inttostr(high(asSelFilePath) + 1);

    fmProgress.Setlabel('Reading Files. Please wait...', 1);
    fmProgress.SetMaxPogress(0); // [156]

    if high(asSelFilePath) <> -1 then
    begin
      if bstop <> true then
      begin
        // ftmploc  := floc;
        icc := high(asSelFilePath);
        if (iFol >= 0) and (icc > 0) then
        begin
          fmProgress.SetMaxPogress(icc); // [156]
          fmProgress.SetPogress(0); // [156]
        end;

        lfRead := TLogFileRead.Create(aploc, asSelFilePath[0], true,
          pgRead, nil);
        lfRead.ClearCounters;
        Updatelabels;
        for icnt := 0 to high(asSelFilePath) do
        begin
          if bstop then
            break;
          lbFInfo.Panels[0].Text := 'Reading File ' + asSelFilePath[icnt];
          floc := asSelFilePath[icnt];
          ilen := high(arFdets);

          if ilen < 0 then
            ilen := 1
          else
            ilen := ilen + 1;

          setlength(arFdets, ilen + 1);
          arFdets[ilen].FPath := asSelFilePath[icnt];
          // if not bBuildList then begin
          // lfRead.ReadLogfile(false,floc,true,bReportonly,bforce);
          lfRead.ReadLogfile(true, arFdets[ilen].FPath, true, False);
          // fmLogDisplay.ReadLogFile(true);
          if (high(asSelFilePath) > 14) and (icnt mod 14 = 0) then
          begin // [B 29]
            fmProgress.SetPogress(icnt);
            Updatelabels;
            lbFInfo.Panels[0].Text := '';
            Application.ProcessMessages;
          end;
          // floc := ftmploc;
          inc(ip);

          lbFilesRead.Caption := 'Files Read    : ' + inttostr(ip);
          // end;  //if not bBuildList then begin
        end; // ffor icnt := 0 to high(asFilePath) do begin
        // [B 34]
        Updatelabels;
        Application.ProcessMessages;

        if Assigned(lfRead) then
          lfRead.Destroy;

        if TimeDeltaInSeconds(dtSt, now) = 0 then
        begin
          lbFInfo.Panels[0].Text := ' Files read : ' + inttostr(ip) +
            '. Read and analyzed in : ' +
            FloatToStr(TimeDeltaInMSeconds(dtSt, now)) + 'ms';
        end
        else
        begin
          lbFInfo.Panels[0].Text := ' Files read : ' + inttostr(ip) +
            '. Read and analyzed in : ' +
            FloatToStr(TimeDeltaInSeconds(dtSt, now)) + 's';
        end;

        // end;//if isnotempty(asval)
        // MessageDlg('Please enter a valid Directory. The Folder Name may not be empty', mtError, [mbOK], 0);
        // end else begin
      end; // bstop;
    end;

    if not BuildTree(etnone, False) then
      MessageDlg('The Result Tree could not be populated. ' + #13 + #10 +
        'Restart the application and try again. If the problem persist, please report it. ',
        mtError, [mbOK], 0);

    // edfolder.enabled := true;
    bstop := False;
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'ReadSelLogFolder' + #13 + #10 + e.Message, mtError, [mbOK], 0);
      fmProgress.Close;
      // Ensure that the Object has been cleared.
      if Assigned(lfRead) then
        lfRead.Destroy;

      // ckReadsubfolder.Visible := false;
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.sgLocationsClick(Sender: TObject);
begin
  try

  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'sgLocationsClick' + #13 + #10 + e.Message, mtError, [mbOK], 0);
      // fmProgress.Hide;
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.sgLocationsDblClick(Sender: TObject);
begin
  try

  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'sgLocationsDblClick' + #13 + #10 + e.Message, mtError, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.sgLocationsKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  iRow: Integer;
  itrow: Integer;
begin
  try
    if Key = VK_DOWN then
    begin
      itrow := sgLocations.RowCount;
      iRow := sgLocations.Row + 1;
      if itrow = iRow then
        sgLocations.RowCount := sgLocations.RowCount + 1;
    end
    else if Key = VK_UP then
    begin
      itrow := sgLocations.RowCount;
      iRow := sgLocations.Row + 1;
      if (sgLocations.Cells[0, iRow] = '') and (sgLocations.RowCount >= 2) then
        if sgLocations.RowCount >= 2 then
        begin
          sgLocations.Cells[0, sgLocations.RowCount] := '';
          sgLocations.Cells[1, sgLocations.RowCount] := '';
          sgLocations.RowCount := sgLocations.RowCount - 1;
        end;
    end;
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'sgLocationsKeyUp' + #13 + #10 + e.Message, mtError, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.sgLocationsMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  m: TPoint;
begin
  try
    if Button = mbRight then
    begin
      GetCursorPos(m);
      ppGrid.Popup(m.X, m.Y);
    end;

  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'ckReadselectMouseUp' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);

    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.sgLocationsSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
  try
    idx := ARow;
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'sgLocationsDblClick' + #13 + #10 + e.Message, mtError, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.sgToCheckDblClick(Sender: TObject);
var
  etTypes: etLoad;
begin
  try
    sgToCheck.Enabled := False; // [B14]


    with sgToCheck do
    begin
      if Cells[0, sgRow] = 'Notes' then
        etTypes := etNotes
      else if Cells[0, sgRow] = 'Info' then
        etTypes := etinfo
      else if Cells[0, sgRow] = 'Conversions' then
        etTypes := etConvert
      else if Cells[0, sgRow] = 'Uninit.' then
        etTypes := etUnint
      else if Cells[0, sgRow] = 'Errors' then
        etTypes := etError
      else if Cells[0, sgRow] = 'Division' then
        etTypes := etDivs
      else if Cells[0, sgRow] = 'Merge' then
        etTypes := etMerge
      else if Cells[0, sgRow] = 'Invalid' then
        etTypes := etInvalid
      else if Cells[0, sgRow] = 'Warnings' then
        etTypes := etWarn
      else if Cells[0, sgRow] = 'Other' then
        etTypes := etalloth
      else if Cells[0, sgRow] = 'Custom' then
        etTypes := etCust
      else if Cells[0, sgRow] = 'Datasets' then
        etTypes := etlast
      else if Cells[0, sgRow] = 'Missing Value' then
        etTypes := etmisvals
      else if Cells[0, sgRow] = 'Repeat by Value' then
        etTypes := etrepbyval
      else if Cells[0, sgRow] = 'Math Oper.' then
        etTypes := etmathop
      else if Cells[0, sgRow] = 'No Obs in Data' then
        etTypes := etnobosdata
      else if Cells[0, sgRow] = 'No By State' then
        etTypes := etnobystate
      else if Cells[0, sgRow] = 'User Defined' then
        etTypes := etUserdefined;
      // else if cells[0, sgrow]  = 'Annotate Errors' then etTypes := etannoerr;

      if (Cells[1, sgRow] <> '') then
      begin
        if (StrToInt(Cells[1, sgRow]) > 0) then
        begin
          BuildFilterTree(etTypes);
          pgReadFiles.ActivePage := tsDetail;
          pgReadFiles.Enabled := true;
          bbShowall.Enabled := true;
        end;
      end;
    end;
    sgToCheck.Enabled := true;

  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'sgToCheckDblClick' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
      sgToCheck.Enabled := true;
      sgToCheck.Visible := true; // [B14]
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.sgToCheckDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  s: string;
begin
  try
    { With Sender as TStringGrid do begin
      if Cells[2, ARow] <> '' then begin
      if StrToInt(Cells[2,Arow]) > 0 then begin
      //for BackGround  Color
      Canvas.Brush.Color := clRed;
      Canvas.FillRect(Rect);
      //for Font.Color
      Canvas.Font.Color  := clGreen;
      Canvas.TextRect( Rect, Rect.Left+2, Rect.Top+2, Cells[acol, arow]);
      end;
      end;
      end; }
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'sgToCheckDrawCell' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.sgToCheckKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  try
    (* if (Key = VK_DOWN ) or (Key = VK_UP) then begin
      sgToCheckDblClick(nil);
      end; *)
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'sgToCheckKeyUp' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.sgToCheckSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  try
    sgRow := ARow;
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'sgToCheckSelectCell' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.spbCloseClick(Sender: TObject);
var
  tac: TCloseAction;
  bproblem: Boolean;
  asUserprofile, asVal: Ansistring;
  iRow, icnt: Integer;

begin
  try

    iRow := 0;
    asUserprofile := GetEnvironmentVariable('USERPROFILE');
    Settings := TInifile.Create(asUserprofile + '\saslogdisp.ini');
    iRow := sgLocations.RowCount;

    // Save only 5 locations
    if iRow > 6 then
      iRow := 6;

    for icnt := 1 to iRow do
    begin
      asVal := sgLocations.Cells[0, icnt];
      // if DelMidSpaces(sgLocations.Cells[0, icnt]) <> '' then begin
      Settings.WriteString('folderloc' + inttostr(icnt),
        'folderloc' + inttostr(icnt), sgLocations.Cells[0, icnt]);
      // end;
    end;
    iSetload := 0;
    Settings.Free;
    if iChk > 1 then
    begin
      DestroyCheckboxes;
    end;
    iChk := 1;

    ckReadselect.Items.Clear;
    spbResetClick(nil);
    bFilter := False;
    Timer1.Enabled := False;
    ClearResult; // 145
    Close;
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'spbCloseClick' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

procedure TfmLogFolder.spbPinClick(Sender: TObject);
begin
  if bPin = true then
  begin
    bPin := False;
    splView.DisplayMode := svmOverlay;
    splView.Opened := False;
  end
  else if bPin = False then
  begin
    bPin := true;
    splView.DisplayMode := svmDocked;
    splView.Opened := true;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.spbResetClick(Sender: TObject);
begin
  try
    // edfolder.Enabled := true;
    ckfilelist.Items.Clear;
    ckReadselect.Items.Clear;
    tvView.Items.Clear;

    lbFInfo.Panels[0].Text := '';

    try
      AssignFile(ffollogs, aploc + 'follogs.dat');
      rewrite(ffollogs);
    finally
      closefile(ffollogs);
    end;

    lbNotes.Caption := 'Notes         : ' + inttostr(0);
    (*lbwarn.Caption := 'Warnings      : ' + inttostr(0);
    lbConv.Caption := 'Conversion    : ' + inttostr(0);
    lbUninit.Caption := 'Uninitialized : ' + inttostr(0);
    lbDivs.Caption := 'Division by 0 : ' + inttostr(0);
    lbMerge.Caption := 'Merge Notes   : ' + inttostr(0);
    lbInvald.Caption := 'Invalid Notes : ' + inttostr(0);
    lberr.Caption := 'Errors        : ' + inttostr(0);
    lbCust.Caption := 'Custom        : ' + inttostr(0);
    lbAlloth.Caption := 'All other     : ' + inttostr(0);*)
    lbInfo.Caption := 'Info          : ' + inttostr(0);
    lbFilesRead.Caption := 'Files Read    : ' + inttostr(0);
    lbFilesRead.Caption := 'Files Read    : ' + inttostr(0);
    lbFilesRead.Caption := 'Files Read    : ' + inttostr(0);
    lbFilesel.Caption := 'Files selected  : ';
    lbFilesRead.Caption := 'Files Read : ';
    lbFilters.Caption := 'No Filtering';

    Setlabelcolors;
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'spbResetClick' + #13 + #10 + e.Message, mtError, [mbOK], 0);
      // fmProgress.Hide;
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.spClearClick(Sender: TObject);
begin
  try
    // cdsFolders.EmptyDataSet;
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'spClearClick' + #13 + #10 + e.Message, mtError, [mbOK], 0);

    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.splViewMouseEnter(Sender: TObject);
begin
//  splView.Opened := true;
//  splView.OpenedWidth := 250;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.splViewMouseLeave(Sender: TObject);
begin
//  splView.Opened := False;
end;

procedure TfmLogFolder.splViewMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  // splView.Opened := true;
  // splView.OpenedWidth:=200;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.spShowallClick(Sender: TObject);
begin
  try
    bbShowall.Enabled := False;
    if not BuildTree(etnone, False) then
    begin
      MessageDlg('The Result Tree could not be populated. ' + #13 + #10 +
        'Restart the application and try again. If the problem persist, please report it. ',
        mtError, [mbOK], 0);
    end
    else
    begin
      bFilter := False;
      // if pgReadFiles.ActivePage = tsReadSelective then  //[186]
      // bbBuild.Enabled := true;

      lbFilters.Caption := 'No Filtering ';
    end;
    bbShowall.Enabled := true;
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'bbShowallClick' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
      bbShowall.Enabled := False;
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.Timer1Timer(Sender: TObject);
{ var
  idx  : Integer;
  sStr : Ansistring;
  ftmploc : ansistring;
  dtlst   : TDateTime; }
begin
  try
    { if high(arFInfo) > 0 then begin
      for idx := 1 to high(arFInfo) do begin
      if arFInfo[idx].bMontr = true then begin
      sStr  := arFInfo[idx].FName;
      dtlst := File_GetLastModifiedDate(sStr);
      if (arFInfo[idx].Lstacc <> dtlst) or
      (arFInfo[idx].FBusy <> FileInUse(sstr, sstr)) then begin
      //                ftmploc := floc;
      //                floc := sstr;
      //               fmLogDisplay.ReadLogFile(true);
      arFInfo[idx].Lstacc := File_GetLastModifiedDate(sstr);
      //               floc := ftmploc
      end;
      end;
      //      end;
      end;
      end; }
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'Timer1Timer' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.tvViewCollapsed(Sender: TObject; Node: TTreeNode);
begin
  bIgnore := False;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.tvViewCollapsing(Sender: TObject; Node: TTreeNode;
  var AllowCollapse: Boolean);
begin
  bIgnore := true;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.tvViewExpanded(Sender: TObject; Node: TTreeNode);
begin
  bIgnore := False;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.tvViewExpanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
begin
  bIgnore := true;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.tvViewGetSelectedIndex(Sender: TObject; Node: TTreeNode);
begin

end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.tvViewMouseEnter(Sender: TObject);
begin
  try

  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'tvViewMouseEnter' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.tvViewMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  ttNode: TTreeNode;
  ttNode1: TTreeNode;
  ttNode2: TTreeNode;
  sStr: String;
  asFile: Ansistring;
  iLine: Integer;
  idx: Integer;
  idx2: Integer;
  stmp: String;
  m: TPoint;
  sval: Ansistring;
begin
  try
    if (tvView.Selected <> nil) then
    begin
      if ((tvView.Selected.level > 1) and (tvView.Selected.Selected)) then
      begin
        ttNode1 := tvView.Selected.Parent;
        ttNode := ttNode1.Parent; // this is the "topnode"
        if (ttNode <> nil) or (prevNode <> ttNode1) then
        begin
          prevNode := ttNode1;
          sStr := ttNode.Text;
          asFile := sStr + ttNode1.Text; // this is the file name
          sStr := tvView.Selected.Text; // this is what to search for
          idx := pos('[', sStr);
          idx2 := pos(']', sStr);

          // if copy(sstr, idx+1, ((idx2-1)-idx)) <> '' then begin
          if not Trystrtoint(copy(sStr, idx + 1, ((idx2 - 1) - idx)), iLine)
          then
          begin
            iLine := 0;
          end;
          // end else begin
          // iline := 0;
          // end;

          stmp := copy(sStr, idx2 + 1, Length(sStr));
          idx := Length(copy(sStr, idx2 + 1, Length(sStr))) - 1;

          fmLogfile.rcLines.Lines.LoadFromFile(asFile);
          fmLogfile.Caption := 'Log file ' + ExtractFileName(asFile) +
            ' Looking for: ' + stmp;
          fmLogfile.Visible := true;
          fmLogFolder.FormStyle := fsNormal;
          fmLogfile.SetFocus;
          fmLogfile.Movetoline(idx, iLine);
        end;
      end
      else if (tvView.Selected.level = 1) and (tvView.Selected.Selected) and bFilter
      then
      begin // [166]
        ttNode1 := tvView.Items.Item[0]; // Get the file path
        ttNode2 := tvView.Selected.Parent;
        // ttNode  := ttNode2.; //this is the "File name"
        if (ttNode <> nil) or (prevNode <> ttNode1) then
        begin
          // prevNode := ttNode1;
          sStr := ttNode1.Text; // This is the filename to search for
          // asfile  := sstr+ ttnode2.Text;
          asFile := ttNode2.Text; // [B 10]
          sStr := tvView.Selected.Text; // this is what to search for
          idx := pos('[', sStr);
          idx2 := pos(']', sStr);
          if not Trystrtoint(copy(sStr, idx + 1, ((idx2 - 1) - idx)), iLine)
          then
          begin
            iLine := 0;
          end;

          // iline   := TryStrToInt(copy(sstr, idx+1, ((idx2-1)-idx)));
          stmp := copy(sStr, idx2 + 1, Length(sStr));
          idx := Length(copy(sStr, idx2 + 1, Length(sStr))) - 1;
          fmLogfile.rcLines.Lines.Clear;
          fmLogfile.edLine.Text := '';

          if FileExists(asFile) then
          begin { [C2] }
            fmLogfile.rcLines.Lines.LoadFromFile(asFile);
            fmLogfile.rcLines.Lines.LoadFromFile(asFile);
            fmLogfile.Caption := 'Log file ' + ExtractFileName(asFile) +
              ' Looking for: ' + stmp;
            fmLogfile.Visible := true;
            fmLogfile.SetFocus;
            fmLogfile.Movetoline(idx, iLine);
          end;
        end;

      end;
      if tvView.Selected.Selected = true then
        tvView.Selected.Selected := False;
    end;
    if Button = mbRight then
    begin // [124]
      GetCursorPos(m);
      PopupMenu1.Popup(m.X, m.Y);
    end;

  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'tvViewMouseUp' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);

    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.FiltFolder(etTyp: etLoad);
var
  m: TPoint;
  ic: Integer;
  int, iEr, iWn, iIv, iDv, iNf, icn, iMg, iUnt, iUsr, iCus: Integer;
  asst: string;
  aspre: Ansistring;
  rc1Flogs: TLoginfo;
  icol: Integer;
  asFilt: Ansistring;
begin
  try
    fmDetails.Show;
    ic := 0;
    int := 0;
    iNf := 0;
    iEr := 0;
    iWn := 0;
    iIv := 0;
    iDv := 0;
    icn := 0;
    iMg := 0;
    iUnt := 0;
    iCus := 0;
    iUsr := 0;

    while not EOF do
    begin
      inc(ic);
      // if aspre <> FieldByName('Logdest').AsString then begin;
      iNf := 0;
      iEr := 0;
      iWn := 0;
      iIv := 0;
      iDv := 0;
      icn := 0;
      iMg := 0;
      iUnt := 0;
      iUsr := 0;
    end;

    if etTyp = etNotes then
    begin
      asFilt := 'NOTE';

    end
    else if etTyp = etCust then
    begin
      asFilt := 'Cust';
      inc(iCus);
    end
    else if etTyp = etalloth then
    begin
      asFilt := 'AllOth';
    end
    else if etTyp = etError then
    begin
      asFilt := 'Error';
      inc(iEr);
    end
    else if etTyp = etWarn then
    begin
      asFilt := 'Warning';
      inc(iWn)
    end
    else if etTyp = etinfo then
    begin
      asFilt := 'Info';
      inc(iNf);
    end
    else if etTyp = etUnint then
    begin
      asFilt := 'Uninitialized';
      inc(iUnt);
    end
    else if etTyp = etConvert then
    begin
      asFilt := 'Conversion';
      inc(icn);
    end
    else if etTyp = etMerge then
    begin
      asFilt := 'Merge';
      inc(iMg);
    end
    else if etTyp = etInvalid then
    begin
      asFilt := 'Invalid';
      inc(iIv);
    end
    else if etTyp = etDivs then
    begin
      asFilt := 'Division';
      inc(iDv);
    end
    else if etTyp = etlast then
    begin
      asFilt := 'usrdefine';
      inc(iUsr);
    end
    else if etTyp = etlast then
    begin
      asFilt := 'LAST';
    end;

    fmDetails.sgDetails.RowCount := 2;
    fmDetails.sgDetails.FixedRows := 1;

    AssignFile(flogs, aploc + 'logs.dat');
    reset(flogs);
    icol := 1;
    try
      fmDetails.pgLoad.Max := filesize(flogs);
      fmDetails.Visible := true;
      while not EOF(flogs) do
      begin
        read(flogs, rc1Flogs);
        if rc1Flogs.types <> '' then
        begin
          if (rc1Flogs.types = asFilt) then
          begin

            fmDetails.sgDetails.RowCount := icol;
            fmDetails.sgDetails.Cells[0, icol] := inttostr(rc1Flogs.LineNr);
            fmDetails.sgDetails.Cells[1, icol] := rc1Flogs.Entry;
            inc(icol);
          end;
        end;
        if icol mod 700 = 0 then
        begin
          fmDetails.pgLoad.StepBy(1);
          Application.ProcessMessages;
        end;
      end;
      // showmessage(inttostr(icol) );
    finally
      closefile(flogs);
    end;

    GetCursorPos(m);
    fmDetails.display(50, 0, 50, 0, '', 'These Files has problems', true);

  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'FiltFolder' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
// ------------------------------------------------------------------------------

function TfmLogFolder.CreateCheckboxes(asStr: String): Boolean;
begin
  try
    // SetFileInfo(ichk, asStr, true);
    { setlength(pnlFiles, ichk+1);
      pnlFiles[ichk]             := TPanel.Create(sbChecks);
      pnlFiles[ichk].Parent      := sbChecks;
      pnlFiles[ichk].ParentColor := true;
      pnlFiles[ichk].Height      := 18;
      pnlFiles[ichk].align       := alTop;
      pnlFiles[ichk].Visible     := true;
      pnlFiles[ichk].BevelInner  := bvLowered;
      pnlFiles[ichk].BevelOuter  := bvSpace;
      pnlFiles[ichk].BevelKind   := bkNone;
      pnlFiles[ichk].Caption     := asStr;
      pnlFiles[ichk].Align       := alTop;
      pnlFiles[ichk].Alignment   := taLeftJustify;
      pnlFiles[ichk].OnClick     := CheckonClick; }


    // setlength(chkFiles, ichk+1);
    // chkFiles[ichk]         := Tcheckbox.Create(pnlFiles[ichk]);
    // chkFiles[ichk].Parent  := pnlFiles[ichk];
    // chkFiles[ichk].Name    := 'chkfiles'+inttostr(ichk);
    // chkFiles[ichk].Caption := asStr;
    // chkFiles[ichk].Font.Color := clNavy;
    // chkFiles[ichk].Font.Style := [];
    // chkFiles[ichk].Align   := alClient;
    // chkFiles[ichk].Visible := true;
    // chkFiles[ichk].OnClick := CheckonClick;

    // inc(ichk);
  except
    on e: Exception do
    begin

    end;
  end;
end;

// ------------------------------------------------------------------------------
function TfmLogFolder.DestroyCheckboxes: Boolean;
// var
// I: Integer;
begin
  try
    // for i := 1 to ichk-1 do begin
    // chkfiles[i].Destroy;
    // pnlFiles[i].Destroy;
    // end;
  except
    on e: Exception do
    begin

    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.ExpandAll1Click(Sender: TObject); // [124]
var
  i: Integer;
begin
  try
    for i := 0 to tvView.Items.Count - 1 do
      tvView.Items[i].Expanded := true;

  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'ExpandAll1Click' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.CollapseAll1Click(Sender: TObject); // [124]
var
  i: Integer;
begin
  try
    for i := 0 to tvView.Items.Count - 1 do
      tvView.Items[i].Collapse(true);

  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'CollapseAll1Click' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.Unselectall1Click(Sender: TObject);
var
  icnt: Integer;
begin
  try
    for icnt := 0 to ckReadselect.Items.Count - 1 do
    begin
      ckReadselect.Checked[icnt] := False;
      lbFilesel.Caption := 'Files selected : ' + inttostr(0);
    end;

  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'Unselectall1Click' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
function TfmLogFolder.Updatecheckboxes(idx: Integer): Boolean;
begin
  try

  except
    on e: Exception do
    begin

    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.CheckonClick(Sender: TObject);
var
  rEdit: TCheckBox;
  icnt: Integer;
  pnl1: TPanel;
begin
  try
    pnl1 := Sender as TPanel;
    // LoadFileInfo(pnl1.Caption);
    // for icnt := 1 to  high(chkFiles) do begin
    // if chkfiles[icnt].Checked then begin
    // if chkFiles[icnt].Caption = arFinfo[icnt].FName then begin
    //
    /// /         SetFileInfo(idx : integer; asStr : Ansistring; bMont : boolean)
    // end;
    // end;
    //
    // end;
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'CheckonClick' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
function TfmLogFolder.ActiveCheckBox(asStr: Ansistring): TCheckBox;
var
  icnt: Integer;
begin
  try
  except
    on e: Exception do
    begin

    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.SaveOutput1Click(Sender: TObject); // [171]
begin
  try
    // svOutput.
    // if svOutput.Execute then begin;
    // end;

    if tvView.Items.Count > 1 then
    begin
      // pnlsaveaddit.Visible := true;
      // if not SaveResultsToExcel then
      // MessageDlg('Export of results failed.', mtError, [mbOK], 0);
      pnlSave.Visible := true;
      pnlSave.BringToFront;

    end
    else
    begin
      MessageDlg('There was no information found in the results to export.',
        mtInformation, [mbOK], 0);
    end;

  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'SaveOutputClick' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.SaveReadlist1Click(Sender: TObject);
var
  icnt: Integer;
  slfile: Tstringlist;
begin
  try
    fmLogFolder.FormStyle := fsNormal; { B 41] }
    fmLogFolder.SendToBack;
    dlgSaverdlst.Execute;

    if isnotempty(dlgSaverdlst.FileName) then
    begin { B 40] }
      // ckReadselect.Items.SaveToFile(dlgSaverdlst.FileName);
      slfile := Tstringlist.Create;
      try
        for icnt := 0 to ckReadselect.Items.Count - 1 do
        begin
          if ckReadselect.State[icnt] = cbChecked then
          begin
            slfile.Add('1' + ckReadselect.Items[icnt]);
          end
          else
            slfile.Add('0' + ckReadselect.Items[icnt]);
        end;
        slfile.SaveToFile(dlgSaverdlst.FileName);
      finally
        slfile.Free;
      end;
    end;
    fmLogFolder.FormStyle := fsStayOnTop; { B 41] }
    fmLogFolder.BringToFront;

    // dlgSaverdlst.
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'SaveReadlist1Click' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
      fmLogFolder.FormStyle := fsStayOnTop;
      fmLogFolder.BringToFront;
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.dlgOpenrdlstClose(Sender: TObject);
var
  icnt: Integer;
begin
  try
  except
    on e: Exception do
    begin

    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.OpenReadlist1Click(Sender: TObject);
var
  icnt: Integer;
  slfile: Tstringlist;
  sval: string;
  sfile: Ansistring;
  // ilen   : integer;
  sval1: Ansistring;
begin
  try
    fmLogFolder.FormStyle := fsNormal; { B 41] }
    fmLogFolder.SendToBack;
    dlgOpenrdlst.Execute;


    sval := '-1';
    if isnotempty(dlgOpenrdlst.FileName) then
    begin { B 40] }

      slfile := Tstringlist.Create;
      slfile.LoadFromFile(dlgOpenrdlst.FileName);
      try
        ckReadselect.Items.Clear;
        if slfile.Count > 0 then
        begin
          for icnt := 0 to slfile.Count - 1 do
          begin
            sval1 := slfile.Strings[icnt];
            // sval1 := slfile.Text;
            sval := copy(sval1, 0, 1);
            sfile := copy(sval1, 2, Length(sval1));
            if sval = '1' then
            begin
              ckReadselect.Items.Add(sfile);
              ckReadselect.Checked[icnt] := true;

            end
            else
            begin
              ckReadselect.Items.Add(sfile);
            end;
          end;
        end;
      finally
        slfile.Free;
      end;
    end;
    fmLogFolder.FormStyle := fsStayOnTop; { B 41] }
    fmLogFolder.BringToFront;
    // ckReadselect.Items.LoadFromFile(dlgOpenrdlst.FileName);
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'OpenReadlist1Click' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.Panel2MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  splViewMouseEnter(nil);
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.Panel6MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  splViewMouseEnter(nil);
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.SelectAll1Click(Sender: TObject);
var
  icnt: Integer;
begin
  try
    for icnt := 0 to ckReadselect.Items.Count - 1 do
    begin
      ckReadselect.Checked[icnt] := true;
      // if ckReadselect.State[icnt] = cbChecked then begin
      // setlength(asSelFilePath, int+1);
      // inc(int);
    end;
    lbFilesel.Caption := 'Files selected : ' + inttostr(icnt);
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'SelectAll1Click' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
function TfmLogFolder.SetFileInfo(idx: Integer; asStr: Ansistring;
  bMont: Boolean): Boolean;
begin
  try
    setlength(arFInfo, idx);
    // arFInfo[idx].FName  := asstr;
    // arFinfo[idx].fShrt  := ExtractFileName(asstr);
    // arFInfo[idx].Lstacc := File_GetLastModifiedDate(edfolder.text+asstr);
    // arFInfo[idx].FBusy  := FileInUse(edfolder.text+asstr, edfolder.text+asstr);
    // arFInfo[idx].bMontr := bMont;
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'SetFileInfo' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
function TfmLogFolder.UpdFileInfo(idx: Integer; asStr: Ansistring;
  bMont: Boolean): Boolean;
var
  i: Integer;
begin
  try
    // for I := 0 to high(arFinfo) do begin
    // if asStr = arFInfo[idx].FName then begin
    // arFInfo[idx].Lstacc := File_GetLastModifiedDate(edfolder.text+asstr);
    // arFInfo[idx].bMontr := bMont;
    // if not bMont  then begin
    //
    // end;
    // end;
    // end;
  except
    on e: Exception do
    begin

    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.chklstFMonlistClick(Sender: TObject);
var
  sStr: Ansistring;
  bfound: Boolean;
  ic: Integer;
begin
  try
    { bfound := false;
      ic     := 1;
      sStr := chkFmonList.Items[chkFmonList.ItemIndex];
      if chkFmonList.Checked[chkFmonList.ItemIndex] then begin
      setlength(arFInfo, ifcnt + 1);
      arFInfo[ifcnt].FName  := sStr;
      arFInfo[ifcnt].Lstacc := File_GetLastModifiedDate(sStr);
      arFInfo[ifcnt].FBusy  := false;
      arFInfo[ifcnt].bMontr := true;
      inc(ifcnt);
      end else begin
      while (not bfound) and (ic <= high(arFinfo) ) and (high(arFinfo) > 0) do begin
      if arFinfo[ic].FName = sstr then begin
      arFInfo[ic].Lstacc := File_GetLastModifiedDate(sStr);
      arFInfo[ic].FBusy  := false;
      arFInfo[ic].bMontr := false;
      bfound := true;
      end;

      inc(ic);
      end;
      end; }
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'chkFMonlistClick' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.chklstFMonlistKeyPress(Sender: TObject; var Key: Char);
begin
  // chkFMonlistClick(sender);
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.chklstFMonlistKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // chkFMonlistClick(sender);

end;

// ------------------------------------------------------------------------------
function TfmLogFolder.LoadFileInfo(asFName: Ansistring): Boolean;
var
  sStr: Ansistring;
begin
  try

  except
    on e: Exception do
    begin

    end;
  end;
end;
// ------------------------------------------------------------------------------

procedure TfmLogFolder.mnuAddDirectoryClick(Sender: TObject);
begin
  bbAddDirClick(nil);
end;
// ------------------------------------------------------------------------------

procedure TfmLogFolder.mnuClearRowClick(Sender: TObject);
begin
  btnDelRowClick(nil);
end;
// ------------------------------------------------------------------------------

procedure TfmLogFolder.mnuInsertClick(Sender: TObject);
begin
  btnAddClick(nil)
end;
// ------------------------------------------------------------------------------

procedure TfmLogFolder.mnuResetClick(Sender: TObject);
begin
  spbResetClick(nil);
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.pgReadFilesChange(Sender: TObject);
var
  int: Integer;
  icnt: Integer;
begin
  { if pgReadFiles.ActivePage = tsReadall then bbBuild.Enabled := false
    else bbBuild.Enabled := true;
  }
  // if pgReadFiles.ActivePage = tsReadSelective then bbrun.Enabled := false;
  try
    lbFInfo.Panels[1].Text := '';
    if pgReadFiles.ActivePage = tsDetail then
    begin
      bbShowall.Visible := true;
      bbSave.Visible := true;
    end
    else
    begin
      bbShowall.Visible := False;
      // bbSave.visible    := false;

      // Check if nothing was selected and the directories has changed reload
      // otherwise leave as is.
      int := 0;
      if ckReadselect.Count > 0 then
      begin
        for icnt := 0 to ckReadselect.Items.Count - 1 do
        begin
          if ckReadselect.State[icnt] = cbChecked then
          begin
            inc(int);
          end;
        end;
      end;

      if (int = 0) and (not difdirlist) then
      begin
        ckReadselect.Items.Clear;
        // ReadLogFolder('', etReadsel, true);
        PopulateCheckList(ckReadselect, '', etReadsel, true);

        lbFInfo.Panels[1].Text := ' ';

      end
      else
      begin
        lbFInfo.Panels[1].Text := 'Automatic File list Refresh not needed';
      end;
    end;
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'pgReadFilesChange' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

procedure TfmLogFolder.pnlSaveadditClick(Sender: TObject);
begin

end;

// ------------------------------------------------------------------------------
function TfmLogFolder.ClearResult: Boolean;
var
  sStr: Ansistring;
  ic: Integer;
begin
  try
    // cdstmpfold.EmptyDataSet;
    // cdsfolders.EmptyDataSet;
    if FileExists(aploc + 'follogs.dat') then
    begin
      try
        AssignFile(ffollogs, aploc + 'follogs.dat');
        reset(ffollogs);
      finally
        closefile(ffollogs);
      end;
    end;

    for ic := 1 to sgLocations.RowCount do
    begin;
      sgLocations.Cells[0, ic] := '';
      sgLocations.Cells[1, ic] := '';
    end;

    sgLocations.RowCount := 2;
    ckfilelist.Clear;
    tvView.Items.Clear;
    itotcnt := 0;

  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'ClearResult' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.Setlinecount(iLine: Integer);
begin
  try
    itotcnt := itotcnt + iLine;
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'Setlinecount' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.UpdateCntlabel;
var
  icnt, icnt1: Integer;
begin
  try
    // Get the selected count
    icnt1 := 0;
    for icnt := 0 to ckReadselect.Items.Count - 1 do
    begin
      if ckReadselect.State[icnt] = cbChecked then
      begin
        inc(icnt1);
      end;
    end;
    lbFilesel.Caption := 'Files selected : ' + inttostr(icnt1);
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'UpdateCntlabel' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.Updatelabels;
begin
  try
    lbNotes.Caption := 'Notes         : ' + inttostr(lfRead.getcntnote);
    lbInfo.Caption := 'Info          : ' + inttostr(lfRead.getcntinfo);
    { lbwarn.Caption      := 'Warnings      : '+inttostr(lfread.getcntwarn);
      lbConv.Caption      := 'Conversion    : '+inttostr(lfread.getconvnotescnt);
      lbUninit.Caption    := 'Uninitialized : '+inttostr(lfread.getuninitcnt);
      lbDivs.Caption      := 'Division by 0 : '+inttostr(lfread.getdivzero);
      lbMerge.Caption     := 'Merge Notes   : '+inttostr(lfread.getcntmerge);
      lbInvald.Caption    := 'Invalid Notes : '+inttostr(lfread.getcntinvalid);
      lberr.Caption       := 'Errors        : '+inttostr(lfread.getcnterr);
      lbCust.Caption      := 'Custom        : '+inttostr(lfread.getcustcnt);
      lbAlloth.Caption    := 'All Other     : '+inttostr(lfread.getalloth); }

    UpdateGrid;

    Setlabelcolors;
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'ClearResult' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.Setlabelcolors;
begin
  try
    if lbNotes.Caption <> 'Notes         : 0' then
      lbNotes.Color := $0080FF80
    else
      lbNotes.Color := clBtnFace;

    if lbInfo.Caption <> 'Info          : 0' then
      lbInfo.Color := $0080FF80
    else
      lbInfo.Color := clBtnFace;

    { if lbwarn.Caption      <> 'Warnings      : 0' then
      lbwarn.Color   := $0080FF80
      else lbwarn.Color   := clBtnFace;

      if lbConv.Caption      <> 'Conversion    : 0' then
      lbConv.Color   := $0080FF80
      else lbConv.Color   := clBtnFace;

      if lbUninit.Caption    <> 'Uninitialized : 0' then
      lbUninit.Color := $0080FF80
      else lbUninit.Color := clBtnFace;

      if lbDivs.Caption      <> 'Division by 0 : 0' then
      lbDivs.Color   := $0080FF80
      else lbDivs.Color   := clBtnFace;

      if lbMerge.Caption     <> 'Merge Notes   : 0' then
      lbMerge.Color  := $0080FF80
      else lbMerge.Color  := clBtnFace;

      if lbInvald.Caption    <> 'Invalid Notes : 0' then
      lbInvald.Color := $0080FF80
      else lbInvald.Color := clBtnFace;

      if lberr.Caption       <> 'Errors        : 0' then
      lberr.Color    := $0080FF80
      else lberr.Color    := clBtnFace;



      if lbCust.Caption      <> 'Custom        : 0' then
      lbCust.Color   := $0080FF80
      else lbCust.Color   := clBtnFace;

      if lbAlloth.Caption    <> 'All Other     : 0' then
      lbAlloth.Color := $0080FF80
      else lbAlloth.Color := clBtnFace;

      application.ProcessMessages; }
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'Setlabelcolors' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.Setuplocgrid;
begin
  try
    with sgLocations do
    begin
      ColCount := 2;
      ColWidths[0] := 700;
      ColWidths[1] := 100;
      Cells[0, 0] := 'Location';
      Cells[1, 0] := 'Status';
    end;

  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'Setuplocgrid' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TfmLogFolder.Createstdgrids;
var
  Col, Row: Integer;
begin
  try
    with sgToCheck do
    begin
      RowCount := 15;
      Cells[0, 0] := 'Description';
      Cells[1, 0] := 'Count';
      ColWidths[0] := 98; // [B 21]
      ColWidths[1] := 66;

      Cells[0, 1] := 'Conversions';
      Cells[0, 2] := 'Uninit.';
      Cells[0, 3] := 'Errors';
      Cells[0, 4] := 'Division';
      Cells[0, 5] := 'Merge';
      Cells[0, 6] := 'Invalid';
      Cells[0, 7] := 'Warnings';
      Cells[0, 8] := 'Other';
      Cells[0, 9] := 'Custom';

      Cells[0, 10] := 'Missing Value';
      Cells[0, 11] := 'Repeat by Value';
      Cells[0, 12] := 'Math Oper.';
      Cells[0, 13] := 'No Obs in Data';
      Cells[0, 14] := 'No By State';
      // cells[0, 15] := 'Annotate Errors';

      Cells[1, 1] := '0';
      Cells[1, 2] := '0';
      Cells[1, 3] := '0';
      Cells[1, 4] := '0';
      Cells[1, 5] := '0';
      Cells[1, 6] := '0';
      Cells[1, 7] := '0';
      Cells[1, 8] := '0';
      Cells[1, 9] := '0';

      Cells[1, 10] := '0';
      Cells[1, 11] := '0';
      Cells[1, 12] := '0';
      Cells[1, 13] := '0';
      Cells[1, 14] := '0';
      // cells[1, 15] := '0';
    end;

  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'Createstdgrids' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

// ------------------------------------------------------------------------------
function TfmLogFolder.UpdateGrid: Boolean;
var
  Rect: TRect;
  icnt: Integer;
begin
  try

    // for icnt := 1 to high(rcFlogs) do begin
    with sgToCheck do
    begin
      Cells[0, 1] := 'Conversions';
      Cells[0, 2] := 'Uninit.';
      Cells[0, 3] := 'Errors';
      Cells[0, 4] := 'Division';
      Cells[0, 5] := 'Merge';
      Cells[0, 6] := 'Invalid';
      Cells[0, 7] := 'Warnings';
      Cells[0, 8] := 'Other';
      Cells[0, 9] := 'Custom';

      Cells[0, 10] := 'Missing Value';
      Cells[0, 11] := 'Repeat by Value';
      Cells[0, 12] := 'Math Oper.';
      Cells[0, 13] := 'No Obs in Data';
      Cells[0, 14] := 'No By State';
      // cells[0, 15] := 'Annotate Errors';

      Cells[1, 1] := inttostr(lfRead.getconvnotescnt);
      Cells[1, 2] := inttostr(lfRead.getuninitcnt);
      Cells[1, 3] := inttostr(lfRead.getcnterr);
      Cells[1, 4] := inttostr(lfRead.getdivzero);
      Cells[1, 5] := inttostr(lfRead.getcntmerge);
      Cells[1, 6] := inttostr(lfRead.getcntinvalid);
      Cells[1, 7] := inttostr(lfRead.getcntwarn);
      Cells[1, 8] := inttostr(lfRead.getalloth);
      Cells[1, 9] := inttostr(lfRead.getcustcnt);
      Cells[1, 10] := inttostr(lfRead.getmissvalue);
      Cells[1, 11] := inttostr(lfRead.getrepbyval);
      Cells[1, 12] := inttostr(lfRead.getmathop);
      Cells[1, 13] := inttostr(lfRead.getnoobsdata);
      Cells[1, 14] := inttostr(lfRead.getnobystate);
      // cells[1, 15] := inttostr(lfRead.getiannotate);
    end;

    result := true;

  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'UpdateGrid' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
      result := False;
    end;
  end;
end;

// ------------------------------------------------------------------------------
function TfmLogFolder.SaveResults: Boolean;
var
  rc1Flogs: TLoginfo;
  ashtmlfn: Ansistring;
  sllist: Tstringlist;
  sfile, sfolder: Ansistring;
  sfilefol: Ansistring;
  assaveloc: Ansistring;
begin
  try
    // assaveloc := edaltsaveloc.Text;
    if isEmpty(assaveloc) then
    begin
      assaveloc := IncludeTrailingBackslash
        (ExtractFilePath(Application.ExeName));
    end;

    AssignFile(ffollogs, aploc + 'follogs.dat');
    reset(ffollogs);
    if filesize(ffollogs) > 0 then
    begin
      ashtmlfn := 'LogCheck_result_' + GetEnvironmentVariable('USERNAME') + '_'
        + DateTimeToStr(now) + '.txt';
      ashtmlfn := ReplaceStr(ashtmlfn, '/', '_');
      ashtmlfn := ReplaceStr(ashtmlfn, ':', '_');
      ashtmlfn := ReplaceStr(ashtmlfn, ' ', '_');
      try
        sllist := Tstringlist.Create();
        read(ffollogs, rc1Flogs);
        (* sllist.Add('Client Name : '+edsponsor.Text);
          sllist.Add('Project     : '+edProject.Text);
          sllist.Add('Notes       : '+edNotes.text); *)
        sllist.Add('Report Ran by : ' + GetEnvironmentVariable('USERNAME') +
          ' on ' + DateTimeToStr(now));
        sllist.Add
          ('---------------------------------------------------------------------------------------->');
        sllist.Add('Scanned the log for the following :');
        sllist.Add('---------------------------------->');
        sllist.Add('');
        lfRead := TLogFileRead.Create(aploc, '', true, pgRead, nil);
        sllist.AddStrings(lfRead.Printchecks);
        lfRead.Destroy;
        sllist.Add
          ('---------------------------------------------------------------------------------------->');

        read(ffollogs, rc1Flogs);
        sfile := ''; // rc1flogs.Filename;
        sfolder := ''; // rc1flogs.Folder;
        while not EOF(ffollogs) do
        begin
          read(ffollogs, rc1Flogs);
          sfilefol := '';
          if sfolder <> rc1Flogs.Folder then
            sfilefol := 'Folder :' + rc1Flogs.Folder;
          if sfile <> rc1Flogs.FileName then
            sfilefol := 'Folder :' + rc1Flogs.Folder + ' - File name : ' +
              rc1Flogs.FileName;
          if sfilefol <> '' then
          begin
            sllist.Add('');
            sllist.Add('');
            sllist.Add(sfilefol);
          end;

          sllist.Add('    Type : ' + rc1Flogs.types + '[' +
            inttostr(rc1Flogs.LineNr) + ']   ' + rc1Flogs.Entry);
          sfile := rc1Flogs.FileName;
          sfolder := rc1Flogs.Folder;
        end;
        sllist.SaveToFile(assaveloc + ashtmlfn);
      finally
        closefile(ffollogs);
        FreeAndnil(sllist);
      end;

      MessageDlg('File Save to :' + #13 + #10 + assaveloc + ashtmlfn,
        mtInformation, [mbOK], 0);
      // lblocation.caption := 'File Save to : '+assaveloc+ashtmlfn;
    end;
    result := true;
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'SaveResults' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
      result := False;
    end;
  end;
end;

// ------------------------------------------------------------------------------
function TfmLogFolder.Rebuildfilechecklist(chlst: TCheckListBox;
  bFullpath: Boolean): Boolean;
var
  icnt: Integer;
  sfpath: string;
  sfdtm: string;
  FName: string;
begin
  try
    setlength(arFlist, 1);
    for icnt := 0 to chlst.Items.Count - 1 do
    begin
      sfpath := String_Reverse(chlst.Items.Strings[icnt]);
      sfpath := String_Reverse(copy(sfpath, pos('[', sfpath) + 1));
      sfdtm := copy(sfpath, 1, pos('[', sfpath) + 1);
      FName := ExtractFileName(sfpath);
      arFlist[icnt].FName := FName;
      arFlist[icnt].FPath := ExtractFilePath(sfpath);
      arFlist[icnt].bselect := chlst.Checked[icnt];
      arFlist[icnt].fdtm := sfdtm;
      if bFullpath then
      begin
        chlst.Items.Add(arFlist[icnt].FPath + arFlist[icnt].FName);
      end;
      setlength(arFlist, icnt + 1);
    end;

  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'Rebuildfilechecklist' + #13 + #10 + e.Message, mtWarning, [mbOK], 0);
      result := False;
    end;
  end;
end;

procedure TfmLogFolder.bbFilelocClick(Sender: TObject);
begin
  if svOutput.Execute then
  begin
    fmLogFolder.SendToBack;
    edSavetoo.Text := svOutput.FileName;
    if isEmpty(edSavetoo.Text) then
    begin
      edSavetoo.Text := IncludeTrailingPathDelimiter
        (ExtractFilePath(Application.ExeName)) + 'results.xml';
    end;
    fmLogFolder.BringToFront;
  end;
end;

// ------------------------------------------------------------------------------
function TfmLogFolder.PopulateCheckList(chklist: TCheckListBox;
  asFile: Ansistring; etRead: etReadtype; bBuildlist: Boolean = False): Boolean;
  function SearchforAddsubfolders(asdir: Ansistring): Integer;
  var
    iFol: Integer;
    iSFcnt: Integer;
    sr: TSearchRec;
    asTMp: Ansistring;
  begin
    try
      iSFcnt := 0;
      iFol := FindFirst(asdir + '*.*', faDirectory, sr);
      if iFol = 0 then
      begin
        try
          repeat
            if ((sr.Attr and faDirectory) <> 0) and (sr.Name <> '.') and
              (sr.Name <> '..') then
            begin
              iSFcnt := high(sFold) + 1;
              if iSFcnt = 0 then
                inc(iSFcnt);
              setlength(sFold, iSFcnt + 1);

              sFold[iSFcnt] := IncludeTrailingBackslash
                (ExcludeTrailingBackslash(asdir)) + sr.Name;
              asTMp := sFold[iSFcnt];
              SearchforAddsubfolders(asTMp);
            end;
            iFol := FindNext(sr);
            // application.processmessages;
            lbFInfo.Panels[0].Text := 'Checking for subfolder...';
            Application.ProcessMessages;
          until iFol <> 0;
        finally
          FindClose(sr);
        end;
      end;
    except
      on e: Exception do
      begin
        MessageDlg('The following exception occurred in:' + #13 + #10 +
          'SearchforAddsubfolders' + #13 + #10 + e.Message, mtWarning,
          [mbOK], 0);
      end;
    end;
  end;

// ------------------------------------------------------------------------------
var
  sr: TSearchRec;
  bComplete: Boolean;
  asFilePath: array of Ansistring;
  asVal: Ansistring;
  icnt: Integer;
  icnt1: Integer;
  ilen: Integer;
  fTmploc: Ansistring;
  tmpstr: Ansistring;
  stmp: Ansistring;
  iSFcnt, iFol, itrip: Integer;
  ip, icc: Integer;
  dtSt, dten: TDatetime;
  bdone: Boolean;
  iRow: Integer;
  itrow: Integer;
  floc: Ansistring;
begin
  try
    dtSt := now;
    bdone := False;
    // edFolder.enabled        := false;

    sgLocations.Enabled := bdone;
    iRow := 1;
    itrow := sgLocations.RowCount;

    sFold := nil;

    tvView.Items.Clear;
    ckfilelist.Items.Clear;
    bComplete := False;
    icnt := 0;
    itrip := 0;
    ip := 0;
    iSFcnt := 0;

    bstop := False;
    arFdets := nil;
    setlength(arFdets, 1);
    fillchar(sFold, 1, 0);

    while (iRow < itrow) do
    begin;
      iSFcnt := 1;
      asVal := IncludeTrailingBackslash
        (ExcludeTrailingBackslash(sgLocations.Cells[0, iRow]));

      if (delbspace(asVal) <> '') and (asVal <> '/') and (asVal <> '\') then
      begin // [B 2]
        // fmProgress.Setlabel('Reading Files. Please wait...', 1);
        iSFcnt := 1;

        for iSFcnt := 1 to iSFcnt do
        begin
          if bstop <> true then
          begin

            if not bBuildlist then
            begin
              icnt1 := 0;
            end;

            if isnotempty(asVal) then
            begin
              if FindFirst(asVal + '*.log', faAnyFile, sr) = 0 then
              begin
                if sr.Name <> '' then
                begin
                  setlength(asFilePath, icnt1 + 1);
                  asFilePath[icnt1] := asVal + ExtractFileName(sr.Name);
                  inc(icnt1);
                  bComplete := False;
                end;
              end;
              while not bComplete do
              begin
                if FindNext(sr) = 0 then
                begin
                  if sr.Name <> '' then
                  begin
                    setlength(asFilePath, icnt1 + 1);
                    asFilePath[icnt1] := asVal + ExtractFileName(sr.Name);
                    inc(icnt1);
                  end;
                end
                else
                begin
                  bComplete := true;
                end;
              end;
              FindClose(sr);

              icc := high(asFilePath);
              (* if (ifol >= 0) and (icc  > 0 ) then begin
                fmProgress.SetMaxPogress(icc,ifol);
                fmProgress.SetPogress(0,isfcnt);
                end; *)

              if etRead = etReadsel then
              begin
                for icnt := 0 to chklist.Items.Count - 1 do
                begin
                  setlength(asFilePath, icnt + 1);
                  if chklist.Checked[icnt] then
                  begin
                    asFilePath[icnt] := chklist.Items.Text;
                  end;
                end;
              end;

              fillchar(arFlist, sizeof(arFlist), 0);

              for icnt := 0 to high(asFilePath) do
              begin
                if bstop then
                  break;

                if asFilePath[icnt] <> '' then
                begin
                  chklist.Items.Add(asFilePath[icnt] + ' [ Filedate : ' +
                    DateTimeToStr(FileDate(asFilePath[icnt])) + ']');
                  (* arFlist[icnt].fname   := extractfilename(asFilePath[icnt]);
                    arFlist[icnt].fpath   := ExtractFilepath(asFilePath[icnt]);
                    arFlist[icnt].bselect := chklist.Checked[icnt];
                    arFlist[icnt].fdtm    := ' [ Filedate : '+DateTimeTostr(FileDate(asFilePath[icnt]))+']'; *)
                end;
              end; // ffor icnt := 0 to high(asFilePath) do begin

            end; // if isnotempty(asval)
          end
          else
          begin
          end; // bstop;
        end; // for isfcnt := 0;
      end; // if asval <> ''
      inc(iRow);
    end;

    sgLocations.Enabled := true;

    bstop := False;
  except
    on e: Exception do
    begin
      MessageDlg('The following exception occurred in:' + #13 + #10 +
        'PopulateCheckList' + #13 + #10 + e.Message, mtError, [mbOK], 0);
      // fmProgress.Hide;
      sgLocations.Enabled := true;

    end;
  end;
end;

// ------------------------------------------------------------------------------
function TfmLogFolder.SaveResultsToExcel: Boolean;
var
  ExcelApp: OleVariant;
  ColumnRange: OleVariant;
  arVar: Variant;
  ashtmlfn, assaveloc, sfile, sfolder, sfilefol: Ansistring;
  rc1Flogs: TLoginfo;
  icnt, iindex: Integer;
  tcol: TColor;
begin
  iindex := 0;
  arVar := VarArrayof([$008080FF, $000080FF, $0080FF80, $0080FF80, $0097FFFF]);

  // If no instance of Excel is running, try to Create a new Excel Object
  ExcelApp := CreateOleObject('Excel.Application');
  try
    // assaveloc := IncludeTrailingBackslash(edaltsaveloc.Text);
    if isEmpty(assaveloc) then
    begin
      assaveloc := IncludeTrailingBackslash
        (ExtractFilePath(Application.ExeName));
    end;
    ashtmlfn := 'LogCheck_result_' + GetEnvironmentVariable('USERNAME') + '_' +
      DateTimeToStr(now) + '.xlsx';
    ashtmlfn := ReplaceStr(ashtmlfn, '/', '_');
    ashtmlfn := ReplaceStr(ashtmlfn, ':', '_');
    ashtmlfn := ReplaceStr(ashtmlfn, ' ', '_');

    // ExcelApp.Visible := True;
    // Add a new Workbook, Neue Arbeitsmappe öffnen
    ExcelApp.Application.Workbooks.Add;
    // Open a Workbook
    // ExcelApp.Application.Workbooks.Open(asFname);
    // Rename the active Sheet
    ExcelApp.Application.ActiveSheet.Name := 'Results';
    // Rename

    (* ExcelApp.Application.Cells[1, 1].Value := 'Client Name : '+edsponsor.Text;
      ExcelApp.Application.Cells[2, 1].Value := 'Project     : '+edProject.Text;
      ExcelApp.Application.Cells[3, 1].Value := 'Notes       : '+edNotes.text; *)

    AssignFile(ffollogs, aploc + 'follogs.dat');
    reset(ffollogs);
    if filesize(ffollogs) > 0 then
    begin
      try
        read(ffollogs, rc1Flogs);
        sfile := ''; // rc1flogs.Filename;
        sfolder := ''; // rc1flogs.Folder;
        icnt := 2;
        ExcelApp.Application.Workbooks[1].WorkSheets.Add;
        ExcelApp.Application.Workbooks[1].WorkSheets[2].Name :=
          'Header information';
        ExcelApp.Application.Workbooks[1].WorkSheets[1].Name := 'Results';

        ExcelApp.Application.Cells[1, 1].Value := 'File location';
        ExcelApp.Application.Cells[1, 2].Value := 'Line Nr';
        ExcelApp.Application.Cells[1, 3].Value := 'Entry Details';

        // Change the Column Width.
        ColumnRange := ExcelApp.Workbooks[1].WorkSheets[1].Columns;

        fmProgress.Setlabel('Export to Excel.. Please wait...', 1);
        fmProgress.SetMaxPogress(filesize(ffollogs), 0);

        while not EOF(ffollogs) do
        begin
          read(ffollogs, rc1Flogs);

          if sfolder <> rc1Flogs.Folder then
            sfilefol := 'Folder :' + rc1Flogs.Folder;
          if sfile <> rc1Flogs.FileName then
            sfilefol := 'Folder :' + rc1Flogs.Folder + ' - File name : ' +
              rc1Flogs.FileName;

          (* if lower(rc1flogs.types) <> 'last' then begin
            ExcelApp.Application.Cells[icnt, 1].Value := sfilefol;
            //            ExcelApp.Application.Cells[icnt, 2].Value := rc1flogs.types;
            ExcelApp.Application.Cells[icnt, 2].Value := inttostr(rc1flogs.linenr);
            ExcelApp.Application.Cells[icnt, 3].Value := rc1flogs.entry;

            if (lower(rc1flogs.types) =  'error') or (lower(rc1flogs.types) = 'division') or (lower(rc1flogs.types) = 'invalid') then begin
            ExcelApp.Application.Sheet.Range[icnt,1].interior.color := $008080FF;
            ExcelApp.Application.Sheet.Range[icnt,2].interior.color := $008080FF;
            ExcelApp.Application.Sheet.Range[icnt,3].interior.color := $008080FF;
            end else
            if (lower(rc1flogs.types) =  'warning') or (lower(rc1flogs.types) = 'merge') or (lower(rc1flogs.types) = 'uninitialized') then begin
            ExcelApp.Application.Sheet.Range[icnt,1].interior.color := $000080FF;
            ExcelApp.Application.Sheet.Range[icnt,2].interior.color := $000080FF;
            ExcelApp.Application.Sheet.Range[icnt,3].interior.color := $000080FF;
            end else
            if (lower(rc1flogs.types) =  'info') or (lower(rc1flogs.types) = 'conversion') or (lower(rc1flogs.types) ='note') then begin
            ExcelApp.Application.Sheet.Range[icnt,1].interior.color := $0080FF80;
            ExcelApp.Application.Sheet.Range[icnt,2].interior.color := $0080FF80;
            ExcelApp.Application.Sheet.Range[icnt,3].interior.color := $0080FF80;
            end else
            if (lower(rc1flogs.types) =  'missval') or (lower(rc1flogs.types) = 'repbyval') or
            (lower(rc1flogs.types) =  'methop') or (lower(rc1flogs.types) = 'nobosdata') or
            (lower(rc1flogs.types) =  'nobystate')   then begin
            ExcelApp.Application.Sheet.Range[icnt,1].interior.color := $0080FF80;
            ExcelApp.Application.Sheet.Range[icnt,2].interior.color := $0080FF80;
            ExcelApp.Application.Sheet.Range[icnt,3].interior.color := $0080FF80;
            end else
            if lower(rc1flogs.types) =  'AllOth'  then begin
            ExcelApp.Application.Sheet.Range[icnt,1].interior.color := $0097FFFF;
            ExcelApp.Application.Sheet.Range[icnt,2].interior.color := $0097FFFF;
            ExcelApp.Application.Sheet.Range[icnt,3].interior.color := $0097FFFF;
            end; *)
          if lower(rc1Flogs.types) <> 'last' then
          begin
            (* ExcelApp.Application.Cells[icnt, 1].Value := sfilefol;
              ExcelApp.Application.Cells[icnt, 2].Value := inttostr(rc1flogs.linenr);
              ExcelApp.Application.Cells[icnt, 3].Value := rc1flogs.entry;
            *)
            if (lower(rc1Flogs.types) = 'error') or
              (lower(rc1Flogs.types) = 'division') or
              (lower(rc1Flogs.types) = 'invalid') then
            begin
              iindex := 0;
            end
            else if (lower(rc1Flogs.types) = 'warning') or
              (lower(rc1Flogs.types) = 'merge') or
              (lower(rc1Flogs.types) = 'uninitialized') then
            begin
              iindex := 1;
            end
            else if (lower(rc1Flogs.types) = 'info') or
              (lower(rc1Flogs.types) = 'conversion') or
              (lower(rc1Flogs.types) = 'note') then
            begin
              iindex := 2;
            end
            else if (lower(rc1Flogs.types) = 'missval') or
              (lower(rc1Flogs.types) = 'repbyval') or
              (lower(rc1Flogs.types) = 'methop') or
              (lower(rc1Flogs.types) = 'nobosdata') or
              (lower(rc1Flogs.types) = 'nobystate') then
            begin
              iindex := 3;
            end
            else if lower(rc1Flogs.types) = 'alloth' then
            begin
              iindex := 4;
            end;
            tcol := arVar[iindex];
            (* ExcelApp.Application.cells[icnt,1].interior.color := tcol;
              ExcelApp.Application.cells[icnt,2].interior.color := tcol;
              ExcelApp.Application.cells[icnt,3].interior.color := tcol; *)

            (* if (lower(rc1flogs.types) =  'error') or (lower(rc1flogs.types) = 'division') or (lower(rc1flogs.types) = 'invalid') then begin
              ExcelApp.Application.cells[icnt,1].interior.color := $008080FF;
              ExcelApp.Application.cells[icnt,2].interior.color := $008080FF;
              ExcelApp.Application.cells[icnt,3].interior.color := $008080FF;
              end else
              if (lower(rc1flogs.types) =  'warning') or (lower(rc1flogs.types) = 'merge') or (lower(rc1flogs.types) = 'uninitialized') then begin
              ExcelApp.Application.Cells[icnt,1].interior.color := $000080FF;
              ExcelApp.Application.Cells[icnt,2].interior.color := $000080FF;
              ExcelApp.Application.Cells[icnt,3].interior.color := $000080FF;
              end else
              if (lower(rc1flogs.types) =  'info') or (lower(rc1flogs.types) = 'conversion') or (lower(rc1flogs.types) ='note') then begin
              ExcelApp.Application.cells[icnt,1].interior.color := $0080FF80;
              ExcelApp.Application.cells[icnt,2].interior.color := $0080FF80;
              ExcelApp.Application.cells[icnt,3].interior.color := $0080FF80;
              end else
              if (lower(rc1flogs.types) =  'missval') or (lower(rc1flogs.types) = 'repbyval') or
              (lower(rc1flogs.types) =  'methop') or (lower(rc1flogs.types) = 'nobosdata') or
              (lower(rc1flogs.types) =  'nobystate')   then begin
              ExcelApp.Application.cells[icnt,2].interior.color := $0080FF80;
              ExcelApp.Application.cells[icnt,1].interior.color := $0080FF80;
              ExcelApp.Application.cells[icnt,3].interior.color := $0080FF80;
              end else
              if lower(rc1flogs.types) =  'AllOth'  then begin
              ExcelApp.Application.cells[icnt,1].interior.color := $0097FFFF;
              ExcelApp.Application.cells[icnt,2].interior.color := $0097FFFF;
              ExcelApp.Application.cells[icnt,3].interior.color := $0097FFFF;
              end; *)
          end;

          inc(icnt);
          // sfile   := rc1flogs.Filename;
          // sfolder := rc1flogs.Folder;

          if icnt mod 1000 = 0 then
          begin
            fmProgress.SetPogress(icnt);
            Application.ProcessMessages;
          end;
        end;

      finally
        closefile(ffollogs);
        fmProgress.Close;
      end;
    end;
    ExcelApp.Range['A2:D10000'].Font.Size := 10;
    ColumnRange.Columns[1].ColumnWidth := 40;
    ColumnRange.Columns[3].ColumnWidth := 60;
    // Save the Workbook
    // ShowMessage('Done: '+assaveloc+ashtmlfn);
    ExcelApp.Application.Workbooks[1].SaveAs(assaveloc + ashtmlfn);
    // Save the active Workbook:
    ExcelApp.Quit;
    result := true;
  except
    // ShowMessage('Cannot start Excel/Excel not installed ?');
    // Exit;
    result := False;
  end;
  // end;
  // http://www.swissdelphicenter.ch/torry/showcode.php?id=156
end;

// ------------------------------------------------------------------------------
end.
