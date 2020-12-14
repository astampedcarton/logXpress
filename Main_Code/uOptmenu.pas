{
  03JAN2012 - [B 1]  Fixed a bug where the buildlist which included the file date did not
                     exclude the date when reading a file.
              [B UI] Added Last DD read to the side bar
              [B 2]  Fixed an irritating bug where a missing row was read.
              [B 3]  Fixed the Bug where the Secondary menus were not on top.
  04JAN2012 - [B 4]  Added new Compare and Not Compare sections to make it easier to spot
                     what compared and what did not compare.
                     Also added Colors Green when a file compares and Red when it does not compare.
              [B 5]  Added new reporting for the compares and not compares. All files are now
                     exported as RTF Files.
              [B 6]  Added new feature to allow you to open the file location directly from the program.
  05JAN2012 - [B 7]  Implemented the click events to show and hide the Details screen from one place
              [B 8]  Fixed a bug where There were 146 observations read from the data set WORK.REFLIST. was only
                     displayed as 46 obs.
  29JAN2012 - [B 9]  Implemented new code to allow the draging of Borderless forms.
  31JAN2012 - [B 10] Fixed a bug where when multiple files are read and you filter an Error is generated.
  01MAR2012 -        Enhanced the workings of the Grid in the Read Folders.
                     Changed the UI a bit to make it easier to use and maximize space.
  24MAR2012 -        Made some minor bug fixed centering around the UI and User experience.
                     Log Folder (Read Selective Files) has been changed so that it automatically refreshes when you enter the tab
                     - When clicking on the Result Grid nothing happened you had to navigate to the Details.
                     - The Locations Grid has been enhanced so that Duplicate folders are excluded.
                     - You can select a Grid entry and that will be used as the initial location
  04APR2012 - [B 11] Added new functionality to enable the displaying of the Top bar like SELA you to have
                     This is done through form manipulation. The new side bar is still there.
                     Fixed the problems that exisited when using the display information. When you clicked on it once.
                     it was there. to view another section you had to click and click again.
  20JUL2012 - [B 12] Fixed a problem with the Read Compares where it gave false readings showing
                     a file does not compare when in fact it does compare
                     Made minor adjustments to the Read Compares UI to better fit in with the
                     overall look of the program.
  09AUG2012 - [B 13] Made small changes to the Build Tree section that took a rather long time to build
              [B 14] Fixed a bug where the StringGrid allowed multiple clicks and caused errors.
              [B 15] Read Folders: Fixed a error where an AV occurred when the Page change fire.
              [B 16] Improved the details loading section. Loading cause AV's under certain circumstances
              [B 17] Fixed the new entries Details Screen location - Was not implemented.
  05SEP2012 - [B 18] Fixed the problem where the initial loading of Read select took a very long time to load.
  08SEP2012 - [B 19] Added new functionality to customize the log output even more.
                     You can specify the location and add more details
              [B 20] Changed the display units from sec to msec when the sec count is = 0.
              [B 21] Fixed the display width of the descr that was too small.
              [B 22] Implemented the Close code for the log file
              [B 23] Fixed the closed event to ensure the form is returned to the correct reset state.
              [B 24] Made improvements to the compare output.
              [B 25] Send the application to the task bar and tray.
              [B 26] Fixed a bug in the uDatetime to make sure that different date formats are handle correctly.
              [B 27] Added Stop function to the Read Compares.
              [B 28] Added work around code for the MainTaskbar=True that caused the
                     secondary forms to be hidden.
  20SEP2012 - [B 29] Made small adjustments to the ReadLog function to increase speed by a few ms per read
                     Made code adjustments to the ReadLogfolder to increase the speed when reading a folder
              [B 30] Removed the lbstatus label on the log folder. The increase in speed made this irrelevant
                     plus the removing of this also increased the speed even further.
                     Moved the Progress update inside the mod code and it resulted in an increase in overall speed as well.
                 All changed resulted in 929 files being read in 14s, prev it was 28s
              [B 31] Added Annotation Notes to the ERROR section
              [B 32] Added Printchecks to print a list of what the program has scanned for
              [B 33] Updated the logic for the LogFolder Grid. when a stop was requested instead of it saying that
                     it was done reading it will now say reading stopped to be more accurate with what as happened.
  26SEP2012 - [B 34] Fixed bug where the Read Select Section did not refresh its counter.
  05DEC2012 - [B 35] Fixed a bug where you are allowed to select another filter while the other operation was on going
  03JAN2013 - [B 36] Fixed a nasty bug where the lables during Folder reading did not update correctly.
                     It only effected the Folder reading.
              [B 37] Fixed a problem with the Clear Row.
  05SEP2014 - [B 38] Added functionality to view a selected files information only.
              [B 39] Fixed a bug where the combined record did not get populated
                     for the compare readings.
                     The compare Read received some minor updates in general and should be more stable

  19SEP2014 - [B 40] Fixed a bug where Exceptions was generated when simply closing the save dialog
              [B 41] Fixed a bug where the dialog was hidding behind the LogFolder form
              [B 42] Added Coloring to the Checklist for the Readlog Folders. If a log file is clean the
                     Color will be Green. If there are issue is till be Red.
              Updated the fonts to enhance readability.
  31MAR2015 - [B 43] Implemented the key navigation to allow for better working
                     via the keyboard, which will make the working better.
  30SEP2015 - [C] Major updates and porting code to XE10.
                  Split log reading and Read compares. Read compares will form part
                  of a larger project.
                  Removed all old redundant code.
                  Redesigned the Read Log Folder functionality.
                  Added the batch parameter to allow a person to run it from the command prompt.
                  Added User Rules that will enable a user to add his own rules. STD rules are still in place.
                  Added GridSort capabilities to The Details Windows. Implemented TKGrid to accomplish this.
                  You can now save select results for a single file. This is done on the main menu
                  Added export of the Log results is now done to an XML file that is readable with Excel 2007 and up.
                  The note Numeric variables in the input data set will be converted to character in the output data set was
                  not reported it is added and falls under conversion.
                        NOTE: Numeric variables in the input data set will be converted to character in the output data set.
                  The previous Read from folder has been significantly enhanced and now houses the compact view.
                  Compact view is a significant trim down version combining the Read single file and read folder functionality.
                  As it's a trimmed down version there are certain things that is not avaliable.
                  Redesigned the Release Form. Nothing major.
               [C1] Move the refreshing code for the counters as a default after the operation is completed to ensure that
                    no information is left out.
  13NOV2016 -  Ported the Code to newer Delphi version.
               Removed the Jedi Components
  25MAR2017 - [D1] Fixed a memory leak.
              [D2] Added Monitor Files.
  22MAy2020 - Started conversion to Delphi XE 10.3
              Replaced the Speedbuttons on the main menu with normal buttons.
              Added a new Style
              On LogFolder Fixed a bug that was sending the form in to an endless loop
              Fixed the irritating bug on the LogFolder where certain labels stayed hidden.
              [D3] Replaced the TopenDialog with the newer TfileOpendialog.
  14DEC2020 - [D4] Fixed a bug where when you select files to read but opt to move to reading all files
                   it shows that you have selected files during the reading process.
              [D5] Fixed the problem where when reading multiple folders and one does not contain any logs
                   logx read the last values.
              [D6] uLogFolder: Removed the hidden labels that was causing access violation when the grid was
                   dblclicked twice.
Data.Win;Datasnap.Win;Web.Win;Soap.Win;Xml.Win;Bde;Vcl;Vcl.Imaging;Vcl.Touch;Vcl.Samples;Vcl.Shell;System;Xml;Data;Datasnap;Web;Soap;Winapi;System.Win
                    }
unit uOptmenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, Buttons, StdCtrls, uLogRead,
  inifiles,  ComCtrls, uLogFileRead, Grids, rkGlassButton,(*JvExControls,*) (*JvLabel,*)
  StrUtils_d7, uTxt2xlsx_xml, ovcbase, ovcrlbl;

  //,JvGradientHeaderPanel, JvComponentBase, JvLabel, JvComCtrls, JvExControls;

type
  Tfmoptmenu = class(TForm)
    ppMenu: TPopupMenu;
    mnuAlwaysonTop1: TMenuItem;
    StopReading1: TMenuItem;
    Minimize1: TMenuItem;
    Restore1: TMenuItem;
    mnuColorsOff: TMenuItem;
    ApplyFormattoLogFile: TMenuItem;
    N2: TMenuItem;
    ReadFileFromLocation1: TMenuItem;
    CreateRules2: TMenuItem;
    N6: TMenuItem;
    mnuForceReadofLogFile: TMenuItem;
    mnuActive: TMenuItem;
    DeactivateforReading: TMenuItem;
    ClearCounters1: TMenuItem;
    N1: TMenuItem;
    About1: TMenuItem;
    Release1: TMenuItem;
    N7: TMenuItem;
    Close1: TMenuItem;
    ppMainMenu: TPopupMenu;
    ReadFileFromLocation2: TMenuItem;
    ForceReadofLogFile1: TMenuItem;
    ClearCounters2: TMenuItem;
    N4: TMenuItem;
    Logfile1: TMenuItem;
    mnuReadLogFolder: TMenuItem;
    defaultmenu: TMenuItem;
    N3: TMenuItem;
    About2: TMenuItem;
    ReleaseNotes1: TMenuItem;
    N8: TMenuItem;
    mnuClose: TMenuItem;
    N5: TMenuItem;
    mnuchangedefault: TMenuItem;
    ReportOnly1: TMenuItem;
    mnuUserRules: TMenuItem;
    Timer1: TTimer;
    pnlMenu: TPanel;
    pnlInfo: TPanel;
    spbPin: TSpeedButton;
    chkTransparent: TCheckBox;
    sgToCheck: TStringGrid;
    pgBarread: TProgressBar;
    pnlResults: TPanel;
    lbstats: TLabel;
    pnl6: TPanel;
    img1: TImage;
    mnuSaveSummary: TMenuItem;
    savSummary: TSaveDialog;
    ppSaves: TPopupMenu;
    SaveCountsOnly1: TMenuItem;
    SaveDetails1: TMenuItem;
    mnuCompactView: TMenuItem;
    lbError: TOvcRotatedLabel;
    lbOther: TOvcRotatedLabel;
    lbCustom: TOvcRotatedLabel;
    lbUninit: TOvcRotatedLabel;
    lbConversion: TOvcRotatedLabel;
    lbMerge: TOvcRotatedLabel;
    lbDivision: TOvcRotatedLabel;
    lbInvalid: TOvcRotatedLabel;
    lbWarning: TOvcRotatedLabel;
    lbmathop: TOvcRotatedLabel;
    lbrepbyval: TOvcRotatedLabel;
    lbMissval: TOvcRotatedLabel;
    lbnobystate: TOvcRotatedLabel;
    lbnoobsdata: TOvcRotatedLabel;
    bbMenu: TButton;
    lbInfo: TOvcRotatedLabel;
    bbReadfromlocation: TButton;
    bbClearCounters: TButton;
    bbForceread: TButton;
    bbReadfolder: TButton;
    bbSaveSummary: TButton;
    bbExpand: TButton;
    bbhideall: TButton;
    bbTopbar: TButton;
    bbClose: TButton;
    bbFullmenu: TButton;
    procedure bbCloseClick(Sender: TObject);
    procedure bbMenuClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ClearCounters2Click(Sender: TObject);
    procedure Logfile1Click(Sender: TObject);
    procedure mnuReadLogFolderClick(Sender: TObject);
    procedure About2Click(Sender: TObject);
    procedure ReleaseNotes1Click(Sender: TObject);
    procedure ForceReadofLogFile1Click(Sender: TObject);
    procedure bbForcereadClick(Sender: TObject);
    procedure bbReadfolderClick(Sender: TObject);
    procedure bbClearCountersClick(Sender: TObject);
    procedure bbReadfromlocationClick(Sender: TObject);
    procedure spbPinClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure bbLogFileClick(Sender: TObject);
    procedure bbOptionsClick(Sender: TObject);
//    procedure bbChkcomparesClick(Sender: TObject);
    procedure bbExpandClick(Sender: TObject);
    procedure bbHideClick(Sender: TObject);
    procedure pnlIndicatorClick(Sender: TObject);
    procedure chkTransparentClick(Sender: TObject);
    procedure sgToCheckSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgToCheckDblClick(Sender: TObject);
    procedure JvChangeNotify1Notifications0Change(Sender: TObject);
    procedure tray1DblClick(Sender: TObject);
    procedure bbhideallClick(Sender: TObject);
    procedure pnlInfoDblClick(Sender: TObject);
    procedure Panel6DblClick(Sender: TObject);
    procedure pnlMenuDblClick(Sender: TObject);
    procedure lbResultsDblClick(Sender: TObject);
    procedure pnlResultsDblClick(Sender: TObject);
    procedure lbErrorClick(Sender: TObject);
    procedure lbInvalidClick(Sender: TObject);
    procedure lbDivisionClick(Sender: TObject);
    procedure lbWarningClick(Sender: TObject);
    procedure lbMergeClick(Sender: TObject);
    procedure lbUninitClick(Sender: TObject);
    procedure lbConversionClick(Sender: TObject);
    procedure lbNotesClick(Sender: TObject);
    procedure lbInfoClick(Sender: TObject);
    procedure lbOtherClick(Sender: TObject);
    procedure lbCustomClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Release1Click(Sender: TObject);
    procedure lbLastOBSClick(Sender: TObject);
    procedure lbErrorMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure pnlMenuMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure bbTopbarClick(Sender: TObject);
    procedure bbFullmenuClick(Sender: TObject);
    procedure lbnobystateClick(Sender: TObject);
    procedure lbnoobsdataClick(Sender: TObject);
    procedure lbmathopClick(Sender: TObject);
    procedure lbrepbyvalClick(Sender: TObject);
    procedure lbmissvalClick(Sender: TObject);
    procedure sgToCheckEnter(Sender: TObject);
    procedure sgToCheckKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbReadComparesClick(Sender: TObject);
    procedure btnDeliverstudyClick(Sender: TObject);
    procedure mnuSaveSummaryClick(Sender: TObject);
    procedure mnuUserRulesClick(Sender: TObject);
    procedure bbSaveSummaryPopup(Sender: TObject);
    procedure SaveCountsOnly1Click(Sender: TObject);
    procedure SaveDetails1Click(Sender: TObject);
    procedure mnuCompactViewClick(Sender: TObject);
    procedure bbSaveSummaryClick(Sender: TObject);
  private
    { Private declarations }
    brdstat        : boolean;
    Settings       : TInifile;
    etDisplaytype  : etDisptype;
    itype          : integer;
    bPin           : boolean;
    lfRead         : TLogFileRead;
    bforce         : boolean;
    bReportOnly    : Boolean;
    bCompact       : Boolean;
    bExpanded      : Boolean;
    bHide          : Boolean;
    sgRow          : Integer;
    etLastLoad     : etLoad;
    ilstright      : integer;
    ilstleft       : integer;
    ilsttop        : integer;
    ilstbottom     : integer;
    ifcnt          : integer;
    asfloc         : AnsiString;
    dtCurr, dtLast : TDateTime;

    igetconvnotescnt,
    igetuninitcnt,
    igetcnterr,
    igetdivzero,
    igetcntmerge,
    igetcntinvalid,
    igetcntwarn,
    igetalloth,
    igetcustcnt,
    igetcntnote,
    igetcntinfo,
    igetmissvalue,
    igetrepbyval,
    igetmathop,
    igetnoobsdata,
    igetnobystate	 : integer;
    aploc, floc,
    folLoc         : AnsiString;
//    rcTaskbar      : TRect;
    asUserprofile  : AnsiString;
    asUser         : AnsiString;
    bMini          : Boolean;
    bTop           : Boolean;
    bDetails       : Boolean;

//    procedure Setdisplayoptions;
    procedure Setcolor;
    function  DisableCntrls(bEnable : boolean) : boolean;
//    procedure Setlabelcolors;
    procedure Createstdgrids;
    function  UpdateGrid(sgGridName : Tstringgrid) : Boolean;
//    procedure FilterbyType(etType : etLoad);
    function  LoadDetails(etType : etLoad; ileft, iright, itop, ibottom : integer) : boolean;
    procedure setconvnotescnt;
    procedure setuninitcnt;
    procedure setcnterr;
    procedure setdivzero;
    procedure setcntmerge;
    procedure setcntinvalid;
    procedure setcntwarn;
    procedure setalloth;
    procedure setcustcnt;
    procedure setcntnote;

    procedure setcntinfo;
    function  ActivateForm : boolean;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure WMNCHitTest(var Msg: TWMNcHitTest); message WM_NCHITTEST;
    procedure DisplayDetails(control : TOvcRotatedLabel; etType : etLoad);
  public
    { Public declarations }
    procedure SetFloc(asFloc : AnsiString);
(*    function  Getconvnotescnt : integer;
    function  getuninitcnt  : integer;
    function  getcnterr  : integer;
    function  getdivzero  : integer;
    function  getcntmerge  : integer;
    function  getcntinvalid  : integer;
    function  getcntwarn  : integer;
    function  getalloth  : integer;
    function  getcustcnt  : integer;
    function  getcntnote : integer;
    function  getcntinfo : integer; *)
    function  GetFileloc : ansistring;
    procedure Savesummary(asFile : Ansistring);
    procedure BatchforceRead(Sender: TObject);
    procedure Setfullmode;
  end;

var
  fmoptmenu: Tfmoptmenu;

//-batch "C:\TEMP\log_Test\test\f14.2_3.1b.log"
//-batch "C:\TEMP\log_Test\BIG_f14.2_1.2.log"
//-batch "C:\TEMP\log_Test\BIG_f14.2_1.2.log"
const
 ileft = 200; //175
 ilstdd = 270;//260;

implementation


uses uDetails, {uDisplayLog, uViewselect,} uLogfolder, uFLoc, (*uOptions,*) uLogFile,
  {uReadCompares,} uAbout, uRelease, uUserrules;//, uReadCompares, uPerformDelivery;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure Tfmoptmenu.CreateParams(var Params: TCreateParams); //[102]
begin
  try
    inherited CreateParams(Params);
    with Params do begin
//      Style := Style + WS_DLGFRAME ;
//      Style:=(Style or WS_POPUP) and (not WS_DLGFRAME);
//      ExStyle := WS_EX_TOOLWINDOW;   //[185
//      WndParent := GetDesktopwindow;
       wndParent := 0;
    end;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'TfmDetails.CreateParams'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.WMNCHitTest(var msg: TWMNCHitTest);  //[102]
begin
  try
    inherited;
    //if (msg.Result = htClient) then
    // msg.Result := htCaption;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'TfmDetails.WMNCHitTest'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;

end;
//------------------------------------------------------------------------------//------------------------------------------------------------------------------
procedure Tfmoptmenu.About1Click(Sender: TObject);
begin
  fmAbout.showmodal;
end;
//------------------------------------------------------------------------------

procedure Tfmoptmenu.About2Click(Sender: TObject);
begin
   fmAbout.showmodal;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.bbhideallClick(Sender: TObject);
begin
  try
    if bExpanded then begin
      bbExpandClick(nil);
    end;
    self.Width                := 11;
    self.Constraints.MaxWidth := 11;
    bMini                     := true;
    pnlResults.Visible        := true;
    ActivateForm;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'Tfmoptmenu.bbhideallClick'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.bbClearCountersClick(Sender: TObject);
begin
  ClearCounters2Click(nil);
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.bbForcereadClick(Sender: TObject);
begin
  ForceReadofLogFile1Click(nil);
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.bbFullmenuClick(Sender: TObject);  //[B 11]
begin
  try
    fmoptmenu.Align   := alnone;
    self.Constraints.Maxwidth := 345;
    self.Constraints.MaxHeight := 750;
    self.width        := 345;
    self.Height       := 750;

    pnlResults.Height := 750;

    pnlMenu.width     := 144;
    pnlInfo.Visible   := true;

    pnlResults.Align  := alleft;
    pnlResults.Width  := 11;

    lbError.align      := alnone;
    lbWarning.align    := alnone;
    lbInvalid.align    := alnone;
    lbDivision.align   := alnone;
    lbMerge.align      := alnone;
    lbConversion.align := alnone;
    lbUninit.align     := alnone;
    lbCustom.align     := alnone;
    lbOther.align      := alnone;
    lbInfo.align       := alnone;
//    lbNotes.align      := alnone;
//    lbLastOBS.Align    := alnone;

    lbMissval.align    := alnone;
    lbrepbyval.align   := alnone;
    lbmathop.align     := alnone;
    lbnoobsdata.align  := alnone;
    lbnobystate.align  := alnone;

    lbError.Fontangle  := 90;
    lbWarning.Fontangle    := 90;
    lbInvalid.Fontangle    := 90;
    lbDivision.Fontangle   := 90;
    lbMerge.Fontangle      := 90;
    lbConversion.Fontangle := 90;
    lbUninit.Fontangle     := 90;
    lbCustom.Fontangle     := 90;
    lbOther.Fontangle      := 90;
    lbInfo.Fontangle       := 90;
    //lbNotes.Fontangle      := 90;
    //lbLastOBS.Fontangle    := 90;

    lbMissval.Fontangle    := 90;
    lbrepbyval.Fontangle   := 90;
    lbmathop.Fontangle     := 90;
    lbnoobsdata.Fontangle  := 90;
    lbnobystate.Fontangle  := 90;

    lbError.height      := lbError.width;
    lbWarning.height    := lbWarning.width;
    lbInvalid.height    := lbInvalid.width;
    lbDivision.height   := lbDivision.width;
    lbMerge.height      := lbMerge.width;
    lbConversion.height := lbConversion.width;
    lbUninit.height     := lbUninit.width;
    lbCustom.height     := lbCustom.width;
    lbOther.height      := lbOther.width;
    lbInfo.height       := lbInfo.width;
 //   lbNotes.height      := lbNotes.width;
 //   lbLastOBS.height    := lbLastOBS.width;

    lbMissval.height   := lbMissval.width;
    lbrepbyval.height  := lbrepbyval.width;
    lbmathop.height    := lbmathop.width;
    lbnoobsdata.height := lbnoobsdata.width;
    lbnobystate.height := lbnobystate.width;

    //lbLastOBS.Align    := altop;
    lbCustom.align     := altop;
    lbOther.align      := altop;
    lbInfo.align       := altop;
    lbConversion.align := altop;
    //lbNotes.align      := altop;
    lbUninit.align     := altop;
    lbMerge.align      := altop;
    lbWarning.align    := altop;
    lbInvalid.align    := altop;
    lbDivision.align   := altop;
    lbError.align      := altop;

    lbMissval.align   := altop;
    lbrepbyval.align  := altop;
    lbmathop.align    := altop;
    lbnoobsdata.align := altop;
    lbnobystate.align := altop;

    lbError.width      := 11;
    lbWarning.width    := 11;
    lbInvalid.width    := 11;
    lbDivision.width   := 11;
    lbMerge.width      := 11;
    lbConversion.width := 11;
    lbUninit.width     := 11;
    lbCustom.width     := 11;
    lbOther.width      := 11;
    lbInfo.width       := 11;
   // lbNotes.width      := 11;
   // lbLastOBS.width    := 11;

    lbMissval.align   := altop;
    lbrepbyval.align  := altop;
    lbmathop.align    := altop;
    lbnoobsdata.align := altop;
    lbnobystate.align := altop;


    bbFullmenu.Visible  := false;
//    bbFullmenu.Height   := 11;
//    bbFullmenu.Width    := 30;
//    bbFullmenu.Top      := 0;
//    bbFullMenu.Left     := 750;
//    bbFullMenu.Align    := alright;

//    if bExpanded then begin
//      bbExpandClick(nil);
//    end;

    bTop                      := false;
    bMini                     := false;
    pnlResults.Visible        := false;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'Tfmoptmenu.bbTopbarClick'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure Tfmoptmenu.bbHideClick(Sender: TObject);
begin

end;

//------------------------------------------------------------------------------
procedure Tfmoptmenu.bbLogFileClick(Sender: TObject);
begin
//  fmLogfile.Left := fmoptmenu.Left + fmoptmenu.Width;
//  fmLogfile.top  := GroupBox1.height;
  Logfile1Click(nil);
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.bbOptionsClick(Sender: TObject);
begin
//  mnuOptionsClick(nil);
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.bbReadComparesClick(Sender: TObject);
begin
  try
(*    Timer1.Enabled   := false;
    fmChkCompares.Left := pnlInfo.Left;
    fmChkCompares.top  := 1;
    fmoptmenu.FormStyle := fsNormal;    //[B 3]
    fmChkCompares.Show;
    Timer1.Enabled   := true; *)
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'Tfmoptmenu.bbReadComparesClick'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.bbReadfolderClick(Sender: TObject);
begin

  mnuReadLogFolderClick(nil);

end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.bbReadfromlocationClick(Sender: TObject);
begin
  if not mnuCompactView.Checked then begin
    frmFLoc.setbatchfilename('normal');
    frmFloc.Left := fmoptmenu.Left + fmoptmenu.Width;
  end;

// jvChNotify.Active := false;
//  frmFloc.top  := GroupBox1.height;
//  if bCompact = False then begin
  if not frmFloc.Visible then begin
    frmFloc.ShowModal;
  end;
//    frmFloc.ShowModal;
//  end;

 end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.bbSaveSummaryPopup(Sender: TObject);
begin
end;

//------------------------------------------------------------------------------

procedure Tfmoptmenu.bbTopbarClick(Sender: TObject); //[B 11]
begin
  try
    fmoptmenu.Align   := altop;
    self.Constraints.Maxwidth := 830;
    self.width        := 830;
    self.Height       := pnlResults.Width;
    self.Constraints.MaxHeight := 12;
    pnlResults.Width  := 830;
    pnlResults.Height := 12;
    pnlMenu.width     := 830;
    pnlInfo.Visible   := false;

    pnlResults.Align  := alClient;

    lbError.align      := alnone;
    lbWarning.align    := alnone;
    lbInvalid.align    := alnone;
    lbDivision.align   := alnone;
    lbMerge.align      := alnone;
    lbConversion.align := alnone;
    lbUninit.align     := alnone;
    lbCustom.align     := alnone;
    lbOther.align      := alnone;
    lbInfo.align       := alnone;
    //lbNotes.align      := alnone;
    //lbLastOBS.Align    := alnone;

    lbMissval.align    := alnone;
    lbrepbyval.align   := alnone;
    lbmathop.align     := alnone;
    lbnoobsdata.align  := alnone;
    lbnobystate.align  := alnone;

    lbError.Fontangle      := 0;
    lbWarning.Fontangle    := 0;
    lbInvalid.Fontangle    := 0;
    lbDivision.Fontangle   := 0;
    lbMerge.Fontangle      := 0;
    lbConversion.Fontangle := 0;
    lbUninit.Fontangle     := 0;
    lbCustom.Fontangle     := 0;
    lbOther.Fontangle      := 0;
    lbInfo.Fontangle       := 0;
    //lbNotes.Fontangle      := 0;
    //lbLastOBS.Fontangle    := 0;

    lbMissval.Fontangle    := 0;
    lbrepbyval.Fontangle   := 0;
    lbmathop.Fontangle     := 0;
    lbnoobsdata.Fontangle  := 0;
    lbnobystate.Fontangle  := 0;

    lbError.width      := lbError.height;
    lbWarning.width    := lbWarning.height;
    lbInvalid.width    := lbInvalid.height;
    lbDivision.width   := lbDivision.height;
    lbMerge.width      := lbMerge.height;
    lbConversion.width := lbConversion.height;
    lbUninit.width     := lbUninit.height;
    lbCustom.width     := lbCustom.height;
    lbOther.width      := lbOther.height;
    lbInfo.width       := lbInfo.height;
    //lbNotes.width      := lbNotes.height;
    //lbLastOBS.Width    := lbLastOBS.Height;

    lbMissval.width    := lbMissval.height;
    lbrepbyval.width   := lbrepbyval.height;
    lbmathop.width     := lbmathop.height;
    lbnoobsdata.width  := lbnoobsdata.height;
    lbnobystate.width  := lbnobystate.height;

    lbError.height      := 12;
    lbWarning.height    := 12;
    lbInvalid.height    := 12;
    lbDivision.height   := 12;
    lbMerge.height      := 12;
    lbConversion.height := 12;
    lbUninit.height     := 12;
    lbCustom.height     := 12;
    lbOther.height      := 12;
    lbInfo.height       := 12;
    //lbNotes.height      := 12;
    //lbLastOBS.Height    := 12;

    lbMissval.height    := 12;
    lbrepbyval.height   := 12;
    lbmathop.height     := 12;
    lbnoobsdata.height  := 12;
    lbnobystate.height  := 12;

    lbError.top        := 0;
    lbWarning.top      := 0;
    lbInvalid.top      := 0;
    lbDivision.top     := 0;
    lbMerge.top        := 0;
    lbConversion.top   := 0;
    lbUninit.top       := 0;
    lbCustom.top       := 0;
    lbOther.top        := 0;
    lbInfo.top         := 0;
    //lbNotes.top        := 0;
//    /lbLastOBS.top      := 0;

    lbMissval.top      := 0;
    lbrepbyval.top     := 0;
    lbmathop.top       := 0;
    lbnoobsdata.top    := 0;
    //lbnobystate.top    := 0;

    //lbLastOBS.Align    := alleft;
    lbCustom.align     := alleft;
    lbOther.align      := alleft;
    lbInfo.align       := alleft;
    lbConversion.align := alleft;
    //lbNotes.align      := alleft;
    lbUninit.align     := alleft;
    lbMerge.align      := alleft;
    lbWarning.align    := alleft;
    lbInvalid.align    := alleft;
    lbDivision.align   := alleft;
    lbError.align      := alleft;

    lbMissval.align    := alleft;
    lbrepbyval.align   := alleft;
    lbmathop.align     := alleft;
    lbnoobsdata.align  := alleft;
    lbnobystate.align  := alleft;

    bbFullmenu.Visible := true;
    bbFullmenu.Height  := 40;
    bbFullmenu.Width   := 40;
    bbFullmenu.Top     := 0;
    bbFullMenu.Left    := 780;
    bbFullMenu.Align   := alright;

    if bExpanded then begin
      bbExpandClick(nil);
    end;

    bMini                     := true;
    btop                      := true;
    pnlResults.Visible        := true;
    ActivateForm;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'Tfmoptmenu.bbTopbarClick'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;

procedure Tfmoptmenu.btnDeliverstudyClick(Sender: TObject);
begin
  try
(*    Timer1.Enabled   := false;
    fmPerformdelivery.Left := pnlInfo.Left;
    fmPerformdelivery.top  := 1;
    fmoptmenu.FormStyle := fsNormal;
    fmPerformdelivery.Show;
    Timer1.Enabled   := true;  *)
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'Tfmoptmenu.btnDeliverstudyClick'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;end;

procedure Tfmoptmenu.bbSaveSummaryClick(Sender: TObject);
begin
  SaveCountsOnly1Click(sender);
end;

//------------------------------------------------------------------------------
procedure Tfmoptmenu.bbExpandClick(Sender: TObject);
begin
  try
    if bExpanded then begin
      fmoptmenu.Width := 342;
      fmoptmenu.Constraints.MaxWidth := 342;
      fmoptmenu.Constraints.minWidth := 342;
      bExpanded := False;
      bbExpand.Caption := '  <<';
      bbExpand.Hint    := 'Hide Menu Options';
      pnlMenu.Visible   := true;
    end else
    if not bExpanded then begin
      fmoptmenu.Width := 201;
      bbExpand.Visible := true;
      bExpanded := true;
      fmoptmenu.Constraints.MaxWidth := 201;
      fmoptmenu.Constraints.minWidth := 201;
      bbExpand.Caption := '  >>';
      bbExpand.Hint    := 'Display Menu Options';
      pnlMenu.Visible  := False;
    end;
    if fmDetails.Visible then begin
      fmDetails.Left := Self.Width;
    end;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'Tfmoptmenu.bbExpandClick'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure Tfmoptmenu.chkTransparentClick(Sender: TObject);
begin
  fmoptmenu.AlphaBlend := chkTransparent.Checked;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.ClearCounters2Click(Sender: TObject);
begin
  try
    with sgToCheck do begin
     cells[0, 1]  := 'Notes';
     cells[0, 2]  := 'Info';
     cells[0, 3]  := 'Conversions';
     cells[0, 4]  := 'Uninitialized.';
     cells[0, 5]  := 'Errors';
     cells[0, 6]  := 'Division';
     cells[0, 7]  := 'Merge';
     cells[0, 8]  := 'Invalid';
     cells[0, 9]  := 'Warnings';
     cells[0, 10] := 'Other';
     cells[0, 11] := 'Custom';
//     cells[0, 12] := 'Datasets';
     cells[0, 12] := 'Missing Value';
     cells[0, 13] := 'Repeat by Value';
     cells[0, 14] := 'Math Opertion.';
     cells[0, 15] := 'No Obs in Data';
     cells[0, 16] := 'No By Statement';
//     cells[0, 18] := 'Annotate Errors';
     cells[0, 17] := 'User Defined';

	   cells[1, 1]  := '0';
     cells[1, 2]  := '0';
     cells[1, 3]  := '0';
     cells[1, 4]  := '0';
     cells[1, 5]  := '0';
     cells[1, 6]  := '0';
     cells[1, 7]  := '0';
     cells[1, 8]  := '0';
     cells[1, 9]  := '0';
     cells[1, 10] := '0';
     cells[1, 11] := '0';
     cells[1, 12] := '';
     cells[1, 13] := '0';
     cells[1, 14] := '0';
     cells[1, 15] := '0';
     cells[1, 16] := '0';
     cells[1, 17] := '0';
//     cells[1, 18] := '0';
//     cells[1, 19] := '0';

    end;

  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'Tfmoptmenu.ClearCounters2Click'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;
//--------------------------------------------------------------------------
procedure Tfmoptmenu.ForceReadofLogFile1Click(Sender: TObject);
begin
  try
    bforce := true;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'Tfmoptmenu.ForceReadofLogFile1Click'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.FormCreate(Sender: TObject);
var
  bColor : Boolean;
begin
  try
    aploc               := ExtractFilePath(Application.ExeName);
    asUserprofile       := GetEnvironmentVariable('USERPROFILE');
    asUser              := GetEnvironmentVariable('USERNAME');

    Settings            := TIniFile.Create(asUserprofile+'\saslogdisp.ini');
    FLoc                := Settings.ReadString('location', 'location', FLoc);
    folLoc              := Settings.ReadString('location', 'Folder', folLoc);
    {bColors             := Settings.ReadBool('Appr', 'Colors', bColors);
    bFmtlog             := Settings.ReadBool('Appr', 'LogFmt', bFmtlog);}
    bReportonly         := Settings.ReadBool('Appr', 'ReportOnly', bReportonly);
    bCompact            := Settings.ReadBool('ViewType','ViewType',bCompact);

    mnuCompactView.Checked := bCompact;

    fmoptmenu.Visible   := false;
    bpin                := false;
    spbPinClick(nil);

    bExpanded           := false;

  //  bbstop.Enabled := false;
    bReportonly         := false;
    ClearCounters2Click(nil);

    fmoptmenu.Top       := 1;
    fmoptmenu.Left      := 1;

    bMini               := false;
//    pnlResults.LabelCaption := '';

  //  Setdisplayoptions;
    Createstdgrids;

    lfRead := TLogFileRead.create(aploc, floc, true, pgBarread, lbstats);

    Setcolor;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'Tfmoptmenu.FormCreate'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.FormShow(Sender: TObject);
begin
  try
    ShowWindow(Application.Handle, SW_HIDE);

    //!!! The error occurs from here.
    if bCompact then begin
      frmFLoc.setbatchfilename('compact');
      bbReadfromlocationClick(nil);
    end else begin
      self.Visible := true;
      if self.Visible then begin
        if not bExpanded then begin
          fmoptmenu.Width := 342;
          fmoptmenu.Constraints.MaxWidth := 342;
    //      fmoptmenu.Constraints.minWidth := 342;
          bbExpand.Caption := '  <<';
          bbExpand.Hint    := 'Hide Menu Options';
          pnlMenu.Visible   := true;
        end else
        if bExpanded then begin
          fmoptmenu.Width := 210;
          fmoptmenu.Constraints.MaxWidth := 210;
    //      fmoptmenu.Constraints.minWidth := 210;
          bbExpand.Caption := '  >>';
          bbExpand.Hint    := 'Display Menu Options';
          pnlMenu.Visible   := False;
        end;
      end;
    end;

//    if mnuCompactView.Checked then begin
//      mnucompactView.Checked := false;
//    end;
;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'Tfmoptmenu.FormShow'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.JvChangeNotify1Notifications0Change(Sender: TObject);
begin
  try
    dtCurr  := LastModified(floc);

    if (dtLast <> dtCurr) or (bForce) then
      lfRead := TLogFileRead.create(aploc, floc, true, pgBarread, lbstats);
      try
        if not lfRead.getbusy then begin       //[184]
          ClearCounters2Click(nil);
          DisableCntrls(false);
          //Check that the file Exists before doing the reading
          if FileExists(floc) then begin
//            Timer1.Enabled := false;
//            jvChNotify.Active := false;
            ClearCounters2Click(nil); //[114]          lfRead := TLogFileRead.Create(floc, true, pgBar);
            lfRead.ReadLogfile(false,floc,true,bReportonly,bforce);
            if not UpdateGrid(sgToCheck) then begin
               MessageDlg('Their was a problem populating the counts.', mtError, [mbOK], 0);
            end;
//            jvChNotify.Active := True;
            bforce := false;
          end;
          DisableCntrls(true);
        end;
      finally
        lfRead.Destroy;
        dtLast     := dtCurr;
      end;

  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.JvChangeNotify1Notifications0Change'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.lbConversionClick(Sender: TObject);
var
  iwdth : integer;
begin
  try
   DisplayDetails(lbConversion, etConvert);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'lbConversionClick'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.lbCustomClick(Sender: TObject);
//var
//  iwdth : integer;
begin
  try

   DisplayDetails(lbCustom, etCust);

  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'lbCustomClick'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.DisplayDetails(control : TOvcRotatedLabel; etType : etLoad);
var
  iwdth : integer;
begin
    if bmini then begin
      iwdth := control.left;
    end else begin
      iwdth := fmoptmenu.Width;
    end;

   if not bDetails then begin
     if not LoadDetails(etType, iwdth ,0, control.Top, 0) then begin
       MessageDlg('Grid containing detailed information failed to populate. ', mtError, [mbOK], 0);
     end;
     bDetails := true;
   end else begin
     if not fmdetails.Visible then begin
        bDetails := false;
        fmDetails.Visible := False;
     end else begin
       if not LoadDetails(etType, iwdth ,0, control.Top, 0) then begin
         MessageDlg('Grid containing detailed information failed to populate. ', mtError, [mbOK], 0);
       end;
     end;
   end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.lbDivisionClick(Sender: TObject);
var
  iwdth : integer;
begin
  try
(*    if bmini then begin
      iwdth := lbDivision.left;
    end else begin
      iwdth := fmoptmenu.Width;
    end;

   if not bDetails then begin
     if not LoadDetails(etdivs, iwdth ,0, lbDivision.Top, 0) then
       MessageDlg('Grid containing detailed information failed to populate. ', mtError, [mbOK], 0);

     bDetails := true;
   end else begin
     if not fmdetails.Visible then begin
       bDetails := false;
       fmDetails.Visible := False;
     end else begin
       if not LoadDetails(etdivs, iwdth ,0, lbDivision.Top, 0) then
         MessageDlg('Grid containing detailed information failed to populate. ', mtError, [mbOK], 0);

     end;
   end;
*)
   DisplayDetails(lbDivision, etdivs);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'lbDivisionClick'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.lbErrorClick(Sender: TObject);
var
  iwdth : integer;
begin
  try
   DisplayDetails(lbError, eterror);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'lbErrorClick'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.lbErrorMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin

end;

//------------------------------------------------------------------------------
procedure Tfmoptmenu.lbInfoClick(Sender: TObject);
var
  iwdth : integer;
begin
  try

   DisplayDetails(lbInfo, etinfo);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'lbInfoClick'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.lbInvalidClick(Sender: TObject);
var
  iwdth : integer;
begin
  try

   DisplayDetails(lbInvalid, etinvalid);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'lbInvalidClick'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.lbLastOBSClick(Sender: TObject);
var
  iwdth : integer;
begin
  try

//   DisplayDetails(lbLastOBS, etLast);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'lbLastOBSClick'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.lbmathopClick(Sender: TObject);
var
  iwdth : integer;
begin
  try
   DisplayDetails(lbmathop, etmathop);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'lbLastOBSClick'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.lbMergeClick(Sender: TObject);
var
  iwdth : integer;
begin
  try
   DisplayDetails(lbMerge, etmerge);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'lbMergeClick'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.lbmissvalClick(Sender: TObject);
var
  iwdth : integer;
begin
  try

   DisplayDetails(lbmissval, etmisvals);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'lbnobystateClick'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.lbnobystateClick(Sender: TObject);
var
  iwdth : integer;
begin
  try

   DisplayDetails(lbnobystate, etnobystate);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'lbnobystateClick'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.lbnoobsdataClick(Sender: TObject);
var
  iwdth : integer;
begin
  try
   DisplayDetails(lbnoobsdata, etnobosdata);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'lbnoobsdataClick'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
procedure Tfmoptmenu.lbNotesClick(Sender: TObject);
var
  iwdth : integer;
begin
  try
//   DisplayDetails(lbNotes, etNotes);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'lbNotesClick'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.lbOtherClick(Sender: TObject);
var
  iwdth : integer;
begin
  try
   DisplayDetails(lbOther, etalloth);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'lbOtherClick'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.lbrepbyvalClick(Sender: TObject);
var
  iwdth : integer;
begin
  try

   DisplayDetails(lbrepbyval, etrepbyval);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'lbrepbyvalClick'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.lbUninitClick(Sender: TObject);
var
  iwdth : integer;
begin
  try
   DisplayDetails(lbUninit, etUnint);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'lbUninitClick'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.lbWarningClick(Sender: TObject);
var
  iwdth : integer;
begin
  try

   DisplayDetails(lbWarning, etwarn);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'lbWarningClick'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.lbResultsDblClick(Sender: TObject);
begin
//  pnlInfoDblClick(nil);
end;

//------------------------------------------------------------------------------
procedure Tfmoptmenu.Logfile1Click(Sender: TObject);
begin
  fmLogfile.Left := fmoptmenu.Left + fmoptmenu.Width;

end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.mnuUserRulesClick(Sender: TObject);
begin
  fmUsereefrule.ShowModal;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.mnuCompactViewClick(Sender: TObject);
begin
  if mnuCompactView.Checked then begin
    mnucompactView.Checked := false;
    fmoptmenu.Show;
  end else begin
    mnucompactView.Checked := true;
    fmOptmenu.hide;
  end;
  Settings        := TIniFile.Create(asUserprofile+'/saslogdisp.ini');
  Settings.WriteBool('ViewType', 'ViewType',mnuCompactView.Checked);
  Settings.Free;

  frmFLoc.setbatchfilename('compact');
  bbReadfromlocationClick(nil);
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.mnuReadLogFolderClick(Sender: TObject);
begin
  try
    Timer1.Enabled   := false;
//    fmInforesults.Timer1.Enabled := False;
    fmLogFolder.Left := pnlInfo.Left;// + fmoptmenu.Width;
    fmLogFolder.top  := 1;
    fmoptmenu.FormStyle := fsNormal;    //[B 3]
    fmLogFolder.Show;
    Timer1.Enabled   := true;
//    fmoptmenu.FormStyle := fsStayOnTop;  //[B 3]
//    fmInforesults.Timer1.Enabled := true;
//  fmLogDisplay.mnuReadLogFolderClick(Sender);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'Tfmoptmenu.mnuReadLogFolderClick'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
 end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.mnuSaveSummaryClick(Sender: TObject);
var
  x, y : integer;
  pt   : Tpoint;
begin
  GetCursorPos(pt);
  ppSaves.Popup(pt.x,pt.y);
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.Panel6DblClick(Sender: TObject);
begin
  pnlInfoDblClick(nil);
end;

//------------------------------------------------------------------------------
procedure Tfmoptmenu.pnlIndicatorClick(Sender: TObject);
begin
  bbHideClick(nil);
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.pnlInfoDblClick(Sender: TObject);
begin
  try
    if not bTop then begin
      self.Width                := 193;
      self.Constraints.MaxWidth := 342;
      self.Constraints.MinWidth := 342;
      bMini                     := false;

      pnlResults.Visible        := false;

      if fmDetails.Visible then begin
        fmDetails.Left := Self.Width;
      end;

      if (bExpanded) and not (fmDetails.Visible) then begin
        bbExpandClick(nil);
      end;
    end;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'Tfmoptmenu.pnlInfoDblClick'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.pnlMenuDblClick(Sender: TObject);
begin
  try
    pnlInfoDblClick(nil);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'Tfmoptmenu.pnlMenuDblClick'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.pnlMenuMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
Const
SC_DRAGMOVE = $F012;
begin        //[B 9]

  try
    ReleaseCapture;
    SendMessage(fmoptmenu.Handle, WM_SYSCOMMAND, SC_DRAGMOVE, 0 );
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'Tfmoptmenu.pnlMenuMouseDown'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;

end;

//------------------------------------------------------------------------------
procedure Tfmoptmenu.pnlResultsDblClick(Sender: TObject);
begin
  try
    pnlInfoDblClick(nil);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'Tfmoptmenu.pnlResultsDblClick'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.Release1Click(Sender: TObject);
begin
  fmRelease.ShowModal;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.ReleaseNotes1Click(Sender: TObject);
begin
  fmRelease.ShowModal;
end;

//------------------------------------------------------------------------------
procedure Tfmoptmenu.sgToCheckDblClick(Sender: TObject);
var
  etTypes : etLoad;
begin
 try
//   sgToCheck.Enabled := false;
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
//     else if cells[0, sgRow]  = 'Datasets' then etTypes := etlast
     else if cells[0, sgrow]  = 'Missing Value' then etTypes := etmisvals
     else if cells[0, sgrow]  = 'Repeat by Value' then etTypes := etrepbyval
     else if cells[0, sgrow]  = 'Math Opertion.' then etTypes := etmathop
     else if cells[0, sgrow]  = 'No Obs in Data' then etTypes := etnobosdata
     else if cells[0, sgrow]  = 'No By Statement' then etTypes := etnobystate
     else if cells[0, sgrow]  = 'User Defined' then etTypes := etUserdefined ;
//     else if cells[0, sgrow]  = 'Annotate Errors' then etTypes := etannoerr;
   end;

   if not LoadDetails(etTypes, fmoptmenu.Width ,0, sgToCheck.Top, 0) then
      MessageDlg('Grid containing detailed information failed to populate. ', mtError, [mbOK], 0);

   sgToCheck.Enabled := true; //[B 15]
 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'sgToCheckDblClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
     sgToCheck.Enabled := true;
   end;
 end;
end;

//------------------------------------------------------------------------------
procedure Tfmoptmenu.sgToCheckEnter(Sender: TObject);
begin
//  sgToCheck.
end;
procedure Tfmoptmenu.sgToCheckKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then begin //[B 43]
    sgToCheckDblClick(nil);
  end;
end;

//------------------------------------------------------------------------------
procedure Tfmoptmenu.sgToCheckSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
 try
//   sgToCheck.Enabled := false;
   sgRow := Arow;
   sgToCheck.Enabled := true;
 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'sgToCheckSelectCell'+#13+#10+e.Message, mtWarning, [mbOK], 0);
      sgToCheck.Enabled := true;
    end;
 end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.bbCloseClick(Sender: TObject);
begin
 try
  lfRead.Destroy;
  close;
 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'spbCloseClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
 end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.bbMenuClick(Sender: TObject);
var
  x, y : integer;
  pt   : Tpoint;
begin

 try
  GetCursorPos(pt);
  ppMainMenu.Popup(pt.x, pt.y);
 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'spbMenuClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
 end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.spbPinClick(Sender: TObject);
begin
  if bPin then begin //[167]
    bPin                := false;
    fmoptmenu.FormStyle := fsNormal;
    fmOptmenu.Caption   := 'Log Xpress';
    spbPin.Flat         := false;
    spbPin.hint         := 'Click to Pin';
  end else begin
    fmoptmenu.FormStyle := fsStayOnTop;
    fmOptmenu.Caption   := 'Log Xpress - Stay On Top';
    bPin                := true;
    spbPin.Flat         := true;
    spbPin.hint         := 'Click to Un-Pin';
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.Timer1Timer(Sender: TObject);
var
  bproblem : Boolean;
begin
  try
    dtCurr  := LastModified(floc);
//    ShowMessage(floc);

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
            if not UpdateGrid(sgToCheck) then begin
              MessageDlg('Their was a problem populating the counts.', mtError, [mbOK], 0);
            end else begin
//              if fmInforesults.gethidestatus then begin
//              end;
            end;
//            fmInforesults.FormShow(nil);
//            fmInforesults.lbReadinfo.Caption := 'Last Read: '+ lfRead.getlastreadtime;
            if (not fmoptmenu.Showing) then begin
//              fmInforesults.Show;
            end;
          end;
          DisableCntrls(true);
        end;
      finally
        Timer1.Enabled := true;
        bforce := false;
        dtLast     := dtCurr;
      end;

  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'Timer1Timer'+#13+#10+e.Message, mtWarning, [mbOK], 0);
      Timer1.Enabled := true;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.BatchforceRead(Sender: TObject);
var
  bproblem : Boolean;
begin
  try
    bforce := true;
    Timer1Timer(sender);

  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'BatchforceRead'+#13+#10+e.Message, mtWarning, [mbOK], 0);
      Timer1.Enabled := true;
    end;
  end;
end;
//------------------------------------------------------------------------------

procedure Tfmoptmenu.tray1DblClick(Sender: TObject);
var
  pot : Tpoint;
  nScreenWidth, nScreenheight : Integer;
  FTaskbarPlacement: Integer;
  DestTop, DestLeft : integer;
begin
 try


 except on
    e : Exception do begin
    MessageDlg('The following exception occurred in:'+#13+#10+'trayIconDblClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
 end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.Setcolor;
var
  bcolors : boolean;
begin
  Settings            := TIniFile.Create(asUserprofile+'saslogdisp.ini');
  bColors             := Settings.ReadBool('Appr', 'Colors', bColors);

  settings.Free; //[189]
end;
//------------------------------------------------------------------------------
function  Tfmoptmenu.DisableCntrls(bEnable : boolean) : boolean;
begin
  try
    if lfRead.getbusy then begin
      bEnable := false;
    end;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'DisableCntrls'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
//  spbMenu.Enabled        := bEnable;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.Createstdgrids;
begin
  try
    with sgToCheck do begin
      RowCount     := 19;
      Cells[0,0]   := 'Description';
      Cells[1,0]   := 'Count';
      ColWidths[0] := 100;
      ColWidths[1] := 82;
    end;

  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'Createstdgrids'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
function  Tfmoptmenu.UpdateGrid(sgGridName : Tstringgrid) : Boolean;
var
  rect: TRect;
  icnt : integer;
begin
  try

//  for icnt := 1 to high(rcFlogs) do begin
    with sgGridName do begin
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
     cells[0, 12] := 'Missing Value';
     cells[0, 13] := 'Repeat by Value';
     cells[0, 14] := 'Math Oper.';
     cells[0, 15] := 'No Obs in Data';
     cells[0, 16] := 'No By State';
//     cells[0, 18] := 'Annotate Errors';
     cells[0, 17] := 'User Defined';

     cells[1, 1]  := inttostr(lfRead.getcntnote);
     cells[1, 2]  := inttostr(lfRead.getCntWarn);
     cells[1, 3]  := inttostr(lfRead.getconvnotescnt);
     cells[1, 4]  := inttostr(lfRead.getuninitcnt);
     cells[1, 5]  := inttostr(lfRead.getcnterr);
     cells[1, 6]  := inttostr(lfRead.getdivzero);
     cells[1, 7]  := inttostr(lfRead.getcntmerge);
     cells[1, 8]  := inttostr(lfRead.getcntinvalid);
     cells[1, 9]  := inttostr(lfRead.getcntwarn);
     cells[1, 10] := inttostr(lfRead.getalloth);
     cells[1, 11] := inttostr(lfRead.getcustcnt);
//     cells[1, 12] := lfRead.getlastdd;
     cells[1, 12] := inttostr(lfRead.getmissvalue);
     cells[1, 13] := inttostr(lfRead.getrepbyval);
     cells[1, 14] := inttostr(lfRead.getmathop);
     cells[1, 15] := inttostr(lfRead.getnoobsdata);
     cells[1, 16] := inttostr(lfRead.getnobystate);
//     cells[1, 18] := inttostr(lfRead.getiannotate);
     cells[1, 17] := inttostr(lfRead.getusrdef);
    end;

    (*setconvnotescnt;
    setuninitcnt;
    setcnterr;
    setdivzero;
    setcntmerge;
    setcntinvalid;
    setcntwarn;
    setalloth;
    setcustcnt;
    setcntinfo;  *)

    ActivateForm;

  result := true;

  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'UpdateGrid'+#13+#10+e.Message, mtWarning, [mbOK], 0);
      result := false;
    end;
  end;
end;
//------------------------------------------------------------------------------
function  Tfmoptmenu.LoadDetails(etType : etLoad;
                        ileft, iright, itop, ibottom : integer) : boolean;
var
  asStr : Ansistring;
begin
  try
    Timer1.Enabled    := false;
    pnlResults.Enabled := false; //[B 35]
    fmDetails.LoadDetails(etType, ileft, iright, itop, ibottom);

    pnlResults.Enabled:= true;
    Timer1.Enabled    := true;
    result := true;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'LoadDetails'+#13+#10+e.Message, mtWarning, [mbOK], 0);
      result := false;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.SetFloc(asFloc : AnsiString);
begin
  try
    dtLast := LastModified(asfLoc);
    Floc := asfLoc;
    Settings        := TIniFile.Create(asUserprofile+'/saslogdisp.ini');
    Settings.WriteString('location', 'location', Floc);
    Settings.Free;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'SetFloc'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
function  Tfmoptmenu.GetFileloc : ansistring;
begin
  result := lfRead.getfileloc;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.setconvnotescnt;
begin
  igetconvnotescnt := lfRead.getconvnotescnt;
end;
//------------------------------------------------------------------------------

procedure Tfmoptmenu.setuninitcnt;
begin
  igetuninitcnt := lfRead.getuninitcnt;
end;
//------------------------------------------------------------------------------

procedure Tfmoptmenu.setcnterr;
begin
  igetcnterr := lfRead.getcnterr;
end;
//------------------------------------------------------------------------------

procedure Tfmoptmenu.setdivzero;
begin
  igetdivzero := lfRead.getdivzero;
end;
//------------------------------------------------------------------------------

procedure Tfmoptmenu.setcntmerge;
begin
  igetcntmerge := lfRead.getcntmerge;
end;
//------------------------------------------------------------------------------

procedure Tfmoptmenu.setcntinvalid;
begin
  igetcntinvalid := lfRead.getcntinvalid;
end;
//------------------------------------------------------------------------------

procedure Tfmoptmenu.setcntwarn;
begin
  igetcntwarn := lfRead.getcntwarn;
end;
//------------------------------------------------------------------------------

procedure Tfmoptmenu.setalloth;
begin
  igetalloth := lfRead.getalloth;
end;
//------------------------------------------------------------------------------

procedure Tfmoptmenu.setcustcnt;
begin
  igetcustcnt := lfRead.getcustcnt;
end;
//------------------------------------------------------------------------------

procedure Tfmoptmenu.setcntnote;
begin
  igetcntnote := lfRead.getcntnote;
end;
//------------------------------------------------------------------------------

procedure Tfmoptmenu.setcntinfo;
begin
  igetcntinfo := lfRead.getcntinfo;
end;
//------------------------------------------------------------------------------
function  Tfmoptmenu.ActivateForm : boolean;
var
 icrit,
 iMed,
 iLow    : integer;
begin
  try
    icrit := 0;
    imed  := 0;

    if bMini then begin
        if ((lfRead.getconvnotescnt) > 0) then begin
          lbConversion.visible := true;
        end else begin
          lbConversion.visible := false;
        end;
        if ((lfRead.getuninitcnt) > 0) then begin
          lbUninit.visible := true;
        end else begin
          lbUninit.visible := false;
        end;
        if ((lfRead.getcnterr) > 0) then begin
          lbError.visible := true;
        end else begin
          lbError.visible := false;
        end;
        if ((lfRead.getdivzero) > 0) then begin
          lbDivision.visible := true;
        end else begin
          lbDivision.visible := false;
        end;
        if ((lfRead.getcntmerge) > 0) then begin
          lbMerge.visible := true;
        end else begin
          lbMerge.visible := false;
        end;
        if ((lfRead.getcntinvalid) > 0) then begin
          lbInvalid.visible := true;
        end else begin
          lbInvalid.visible := false;
        end;
        if ((lfRead.getcntwarn) > 0) then begin
          lbWarning.visible := true;
        end else begin
          lbWarning.visible := false;
        end;

        if ((lfRead.getcntinfo) > 0)  then begin
          lbInfo.visible := true;
        end else begin
          lbInfo.visible := false;
        end;
        if ((lfRead.getcntnote) > 0)  then begin
          //lbNotes.visible := true;
        end else begin
          //lbNotes.visible := false;
        end;
        if ((lfRead.getalloth) > 0)  then begin
          lbOther.visible := true;
        end else begin
          lbOther.visible := false;
        end;
        if ((lfRead.getcustcnt) > 0)  then begin
          lbCustom.visible := true;
        end else begin
          lbCustom.visible := false;
        end;

        if ((lfRead.getlastdd) <> '')  then begin
          //lbLastOBS.visible := true;
          //lbLastOBS.Caption := lfRead.getlastdd;
        end else begin
          //lbLastOBS.visible := false;
        end;

        if ((lfRead.getmissvalue) > 0)  then begin
          lbmissval.visible := true;
        end else begin
          lbmissval.visible := false;
        end;

        if ((lfRead.getrepbyval) > 0)  then begin
          lbrepbyval.visible := true;
        end else begin
          lbrepbyval.visible := false;
        end;

        if ((lfRead.getmathop) > 0)  then begin
          lbmathop.visible := true;
        end else begin
          lbmathop.visible := false;
        end;

        if ((lfRead.getnoobsdata) > 0)  then begin
          lbnoobsdata.visible := true;
        end else begin
          lbnoobsdata.visible := false;
        end;

        if ((lfRead.getnobystate) > 0)  then begin
          lbnobystate.visible := true;
        end else begin
          lbnobystate.visible := false;
        end;
        self.Show;

    end;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'ActivateForm'+#13+#10+e.Message, mtWarning, [mbOK], 0);
      result := false;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.SaveCountsOnly1Click(Sender: TObject);
begin
  if savSummary.Execute then begin
    Savesummary(savSummary.FileName);
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.SaveDetails1Click(Sender: TObject);
var
  toXML : TTxt2xlsx_xml;
  asloc : Ansistring;
begin

  if savSummary.Execute then begin
      asloc := savSummary.FileName;
      toXML := TTxt2xlsx_xml.create('', asloc, aploc+'logs.dat');
      toXML.Destroy;
  end;
end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.Savesummary(asfile : ansistring);
var
  slSave : Tstringlist;
begin
  slSave := Tstringlist.Create;

  with slSave do begin
    add('Summary of Reading');
    add('Normal Notes     :  '+inttostr(lfRead.getcntnote));
    add('Info             :  '+inttostr(lfRead.getcntinfo));
    add('Conversion Notes :  '+inttostr(lfRead.getconvnotescnt));
    add('Uninitialized    :  '+inttostr(lfRead.getuninitcnt));
    add('Errors           :  '+inttostr(lfRead.getcnterr));
    add('Division by Zero :  '+inttostr(lfRead.getdivzero));
    add('Merge by notes   :  '+inttostr(lfRead.getcntmerge));
    add('Invalid Notes    :  '+inttostr(lfRead.getcntinvalid));
    add('Warnings         :  '+inttostr(lfRead.getcntwarn));
    add('Other Notes      :  '+inttostr(lfRead.getalloth));
    add('Custom Notes     :  '+inttostr(lfRead.getcustcnt));
    add('Missing value    :  '+inttostr(lfRead.getmissvalue));
    add('Repeat by Values :  '+inttostr(lfRead.getrepbyval));
    add('Math. Operations :  '+inttostr(lfRead.getmathop));
    add('No OBS count     :  '+inttostr(lfRead.getnoobsdata));
    add('No by Stated     :  '+inttostr(lfRead.getnobystate));
    add('User Defined     :  '+inttostr(lfRead.getusrdef));
    SaveToFile(asfile);
  end;

  FreeAndNil(slSave);

end;
//------------------------------------------------------------------------------
procedure Tfmoptmenu.Setfullmode;
begin
  if mnuCompactView.Checked then begin
    mnucompactView.Checked := false;
  end else begin
    mnucompactView.Checked := true;
  end;

  Settings        := TIniFile.Create(asUserprofile+'/saslogdisp.ini');
  Settings.WriteBool('ViewType', 'ViewType',mnuCompactView.Checked);
  Settings.Free;

//  frmFLoc.close;
//  fmoptmenu.show;
end;
//------------------------------------------------------------------------------
end.
