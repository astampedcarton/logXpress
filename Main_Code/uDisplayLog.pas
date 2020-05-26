(*
  V1 - Created
  V1.1  - Added Display for the log file
          Added the Log Details as an option
          Added Timing Details as an option

  V1.2  - Added Options to read all the log Files in a folder
          Removed the active display of the Notes
          Added an option to act as a menu selection

  V1.3  - Changed the rule implementation so as to make it more flexible
          Removed the different labels used for display and replaced it with scrolling
          one to accomodate the new flexibility

  v2.0    - Converted to Delphi 2006 Personal edition
            Removed al 3rd Party Add ons and replaced with Delphi originals
            Added Quick note to the application.
            Fixed the problem that existed with colors not showing.
            Changed layout a bit to use the maximum part of the screen.
            Added code to delete/clear the xml file used by the read log folder.
            The replacing of memory data with CDS data provided a drop in memory usage.
            Application also seems a bit faster.

  v2.2    - Added "pop out" windows containing information on the specific selected label
            Added a detailed about box.
            Fixed a problem that occurred when viewing the pop out windows. It didn't always
            have details.
            Fixed the aligment so that the Windows always display directly undeneath the
            selected label.
            Added Line Nr's to the pop out to prepare for the click and go to the log file
            Replaced the buttons with speed buttons to improve the feel of the application.
            Removed some of the old code.
            Removed the details screens' showmodal. To make navigation a bit easier.
            Implemented the Go to Log file functionality. That would make finding your problems easier

  v2.3    - Fixed a bug where the xml file never got cleared.
            Changed the colors a bit to look more up to date.
            Fixed the Hide buttons that didn't work
            Made sure that empty lines never got read since it wasted a lot of time.
            Implemented the filecopy to ensure that each time a new file is available it gets copied
            and a leaving the other file open for "business"
            Removed the analyse log file function from the normal Readlogfile since it made it very slow

  v2.4 rc1 - Fixed Small bug, where the form didn't stay on top always.
             Implemented the tray icon.
             Hide the window from the taskbar.
             Enhanced the editor so that you can click on either the
             description or count to get the information.

  v2.4 rc1 - Migrated the Log file functionality on to it's own form.
             Implemented selective color coding on NOTES and errors.
             Replaced the type arrays with XML files to keep track of the details.
             Changed the location of the XML files to always be in the same location
             as the application.
             Implemented some find functionality for the log file.
             Added a Total line count. A running Line count is a way of still.
             Removed a lot of old and redundant code. Still not done
             Made some minor adjustments to the GUI.
             Fixed the always on top of the display window so as to be hidden when the log is open
             Replaced the rcEdit of the DISPLAY with a Dataset for more scaleability
             Fixed a bug where the DISPLAY Line selection did not work
             Fixed a bug where the Hide button was not anchored to the Right.
             Removed the Log Files ShowModal to be more floating and accessable.
             Implemented code to show the current line in the Log File.
             Made additional Changes to the STAYONTOP problem. Added Stayontop, when ever a new
               form is displayed to ensure that the main form is still Staying on Top.

  v2.5 rc1 - Added additional code to solve the problem of the STAYONTOP
             Made minor changes to the UI so as to attrack attention that it's busy
             reading the log file.

             Added additonal code so as to display the last DD that was created.
             Added The drop down for Data Sets.
             Made changes to the GUI.
             Shrank everything to size 11.

  v2.6 rc1 - Added Log Folder Reading.
             Moved certain code to universal unit.
             Implemented a Progress form.
             Implemented code to prevent the Display from being clicked multiple times
             when the log file is big causing the application to read the log file over
             and over. Progress bar aid in this.
             Moved the copied file so that it's in the applications location.
             Made changes to the UI

             20090510
             Implemented Major changes to the Readfolder that will allow you to
             go from the list of errors directly to the log file.This is done from the tree.
             Made minor changes to the stayon top. Whenever setting the stay on top,
             first remove it and then up it back.
             Removed the GRAYED from the Check box.
             Enlarged the Checkbox for the files read.

             20090516
             The StayonTop issues seems to have been resolved - At last. (FormPaint)
             Made changes to the Log Folder. Set all Dynamic Arrays = nil. It caused
             problems when it runned the 2nd time around.
             You can now click on certain lables that might have an effect on the results
             in the logread to see what files contains this specfic entry.
             Changed the applications name to SELA and changed the icon as well.
             this is in preparation of the official released version.
             Changed the Colors on/off to retain the setting after application
             shutdown.

             20090519
             Fixed the Progress Bar that didn't work
             Removed the checkbox - Read Subfolders.

             20090606
             [100] Added Checks for Format Failures. Made it part of the invalid section
             [101] Made a few changes to increase the reading process. There seems to be
                   at least a 50% increase in speed. (Orginal: 546 lines in 10s, Current: 546 lines 1s)
             [102] uDetails - Added Code to make the "popup" forms appear a bit better and to
                   allow for better interaction.
             [103] Added and indicator to show if and when there are "stuff" that requires
                   a users attention.
             [104] Made changes to the FormPaint code to try and prevent the Flickering
                   when another form moves over it.
             [105] Removed the Stay On Top Menu option.
             [106] Made changes to the Resize code. Set the Constraint.MaxHeight
                   Application didn't resizes correctly when minimizing it and then
                   restoring it.
             [107] Made changes when a log file is formatted, when loading. Loading time decreased
                   significantly.
             [108] Changed the label of the stats to show how many lines was read and how much time
                   it took to read.
             [109] The flash indicator will now only flicker for 20sec.

             20090715
             [110] Added Custom Reading.

             20090727
             [111] Made changes to the read procedure to increase speed further
             [112] Fixed a problem where not all controls were disables during reading
             [113] Removed the lightshandle as it cause a increase in time reading.
             [114] Ensured that when the Reading takes place, no old values are kept.

             20090804
             [115] Implemented a stop procedure usefull when reading big files.
             [116] Fixed a bug where merge notes was read but not counted.

             20090806
             [117] Removed the line formatting as it caused a long time delay.
                   This is a temp work around while a more effective method is being
                   looked at.
             [118] Fixed a problem where the wrong line was set relative to what was choosen.
             [119] Fixed a problem where the popup menu wasn't activated when clicking on the NOTES.
             [120] Added Table notes from SQL to the DD OBS

             20090909
             [121] Fixed a problem in Logfolder where the Tree wasn't populated correctly at certain times
             [122] Changed the way the Log file is displayed when a new log is read. Previously it always displayed
                   the beginning but it made more sense to display the last.
             20091128
             [123] Added the W.D Notes. Added a section for all other notes since there are no space left.
             [124] Added Expand all and Collapse all for the Tree view
             [125] Fixed the problem with the Tree population, that populated incorrectly
             [126] Added an additional LogView Form. Using one caused problems. This is just a work around

             V 2.7.5.0 Ready
             20091202
             [127] The Warning for SAS that expires has been supressed.

             20091207
             [128] the process message will only be activated evey 250 lines. This helped to save some time
             [129] changed the algorithm to be as fast as possible replace alot of the if's with case
                   added more conditions to the exclusion list, when a line is to be skipped. The increase in performance
                   should be seen when processing large files containing a lot of macro code. the line is now only processed
                   if it starts with a [n i e w] and is not missing.
              20091211
             [130] Fixed a problem where unneeded information was displayed when using the Log Folder
             [131] Updated the Release Notes screen. There are 2 section. The previous version and the active version.

             20100222
             [132] Changed the layout of te Floc. Added a Read Now so that you can read the log file from a specific
                   location and read that log file now.
             [133] Fixed a bug where the other label did revert back to a white color as the default when no color was selected.

             20100223
             [134] Changed the filtering so that you can only click on the label and the filter will get applied to te Tree
                   It is still the same as the previous selections.
             [135] Fixed a bug where the display log generated errors when wanting to view the entry in the log file.

             20100228
             [136] Implemented a Find Dialog for the log file.
             [137] When the Read now button was pressed very fast, the files information got buffered and the counts doubled.
             [138] Removed the OnChange event for the Tabsheets, since it caused big delayes on big log files having to reanalyse.
                   Changed it to on demand so as to avoid wasting time
             [139] Implemented Filter of the Log folder
             [140] Added a option to Apply formatting to the Log file or not.
             [141] Made minor changes to the Readlogfile function to make it simpler
             [142] Made minor changes to the Interface of Read Log folder

             20100302
             [143] Fixed a bug where by the top node could be selected and it generated an exception.
             [144] Replaced the While loop with For. Increased performance by about 50%
             [145] An option has been added to enable you to clear the selection for the Folder Read

             20100304
             [146] Fixed a nasty bug where the icase variable wasn't cleared  initialized. this caused incorrect allocation.

             20100310
             [147] Fixed a bug where the unintiliazided was displaying in the Drop downs
             [148] Added new functionality where by you can now select a range of files to read
                   you don't have to read a whole folder anymore you can select specific files to read.
             [149] Added the ability to save and reopen a readlist
             [150] Added Select all and Unselect all to the Checklist
             [151] Put a Fixed top position for the FolderRead to ensure that the top bar is always
                   visible.
             [152] Change the select label to a speedbutton, to make seeing it easier. Change the caption to Menu

             20100327
             [153] Fixed a bug where the Filter didn't work correctly. The first OBS was ignored
                   thus only displaying a half truth.
                   Also fixed a small bug in the tree populattion, that gave the first file by default
                   and then gave the same file again with the information
             [154] Disabled the page control and build file list button while reading is in progress
                   There was an out of memory error that might have happened as a result of this.
             [155] Fixed a problem where the log file's display was a bit screwed up.
             [156] Fixed the Progress display that display both bars, when only one was needed
             [157] Replaced the RichEdit with a memo component this fixed a strange problem, where the
                   goto line for some reason didn't always work correctly.
             [158] Made some additional Updates to the Reading process. The test file size had to be increased
                   from 6400 lines to 25000 lines. 25000 are now read on average in 1 sec.
             [159] Implemented Import and Export functions for Timing and Analyze functions.
             [160] Made some changes so that the functionality goes faster
             [161] Fixed a bug where there was an access violation when clicking a blank line

             16APR2010
             [162] Completed the implementation of the Alternative View to give a wider
                   option of use.
             [163] Fixed a bug with the Read Selective where when you select a single file
                   it did not always read the file. It just skipped it.
             [164] Added an additional option to the Alternative View, where you can read only and not have the
                   the detail recorded. NOTE: This option is not stored.

             23MAY2010
             [165] Fixed an AV that popup when reading a log folder, initailly and is ok once you read it again.
             [166] Fixed a bug where by the in filter selection, a selected text didn't load the log file.
                   Algorithm didn't take into account the filterings layout
             [167] Implemented new Stay on top Routines for the Extended as well as the classice view

             05JUN2010
             [168] Added additional code that will hopefully solve the problem with the StayonTop of the
                   Classic View
             [169] Added a label to display the Filtering that's been applied in the ReadLogFolder
             [170] Added new functionality that aims to make the information displayed as current as possible.
                   if you have the display window open. Previously the information remained static. The information
                   is refreshed as it comes in.
             [171] You can now save the output of the Readlog Folders to and External file
             6SEP2010
             [172] Added additional checking for the Read Module. There were cases if the file was
                   being created or updated the file date would be set, if the operation failed it didn't
                   reset the date. This has been updated.
             [173] Made changes to the Filestream to try and enable the application to read from the log file
                   as it's been created. Initial tests shows it was successfull
             [174] Split some of the Sections (notes, Custom, All others) into there own files these tend to be
                   types that have a lot of info and also seems to be causing speed degredation as the files
                   start to fill up. The test file has 68000 lines and reading was done in 2 sec.
                   (Test PC Specs is 2.4 512MB) Should be faster on newer machines  
             [175] Fixed a bug where when you select a different file to read, it doesn't activate. the timer was
                   switched of and never switched back on again.
             [176] The AllOther was not filtering on the LogFolders.
             [177] Added a progress bar to the loading of the details. It didn't look good if you click on a section
                   and you wait and wait and nothing happens. It gave the idea that the application was hanging.
                   This was especially true in cases where the log file was extremely big (31MB).
             26SEP2010
             Busy reworking the whole read procedure. All clientdatasets are being dropped in favor of
             dat files. The clientdataset files with EXTREMELY Large files 600000+ lines caused memory
             issues. the memory was not being freed after a new smaller file was read. Memory became a
             very big concern and it was visible that as the numder of lines came to about 250000+ the
             reading processes started to slow down. Files was split but this solved the speed degradation
             a bit, but it did not solve memory issues. It had all the hallmarks of a memory leak but
             this was not the case. CDS are kept in memory to speed up processing for retrieval, but
             with EXTREMELY large files this was a problem and since data is only used for retrieval
             the CDS became useless.
             Switching to DAT files will reduce the file size and eliminate the need for the MIDAS.dll
             since also eliminating the potential dll registration errors.

             16OCT2010
             Completed the reworking of the whole file handeling, reading and storing process

             26NOV2010
             [178] Added a progress bar for the populating of the file.
             [179] The Progress bar for the details did not reset to 0.

             8DEC2010
             [180] Made changes to the loading of the log file. It use to display directly
                   from the file it was reading, but when the file is still in use it caused
                   problems. LoadFromStream failed to display any info. Implemented a work
                   around in the mean time.
             12DEC2010
             [181] Added an option where by you can switch of the Display log
             20JAN2011
             [182] Fixed the bug where when an empty file is read an Error came up.
             [183] Suspect that there's a timing issue causing certain reading opertions
                   to fail. Added a 20msec pause to try and circumvent this problem
             [184] Fixed a bug caused by the DAT File reading implementation. The application.processmessage
                   did not take into account if the process is still busy.

             6FEB2011
             [185] Added a Pin option to the Details Window so that you can at least have
                   an option to have the form on top always or not.
                   Removed the Always on top from the Log file
             [186] Fixed a bug with the RESET button on the Read Log Folder. When opening it up
                   and pressing reset it populates the previous read file. The previous file also
                   does have a purpose. Fixed the code so that this does not happen.
                   Also the RESET did not work properly, it enabled the Build List on the Read All TAB
             [187] An array that was to contain only 1 entry was initialzed, to prevent any memory leaks.
             [188] Added the Options Form so as to have a central place to keep settings.

             24FEB2011
             [189] Fixed a small memory leak when reading the ini file
             [190] A lot of bug fixes and implementation of better handling of errors
                   Fixed the problems with the options form.
                   Made adjustments to the View Switcher. An error was generated from time to time
                   The circumstances differed greatly, and could not always be reproduced.
                   Invalid Erros was incorrectly "filed" under Invalid notes. This has been fixed.
             11APR2011
             [191] Added an additional check for the ReadLog. It will only execute if the FileExists
             [192] Moved the "WARNING: Unable to copy SASUSER registry to" to All Others. The reason
                   for this is that this WARNING is expected when there's batching of multiple files
                   taking place.
             8JUL2011
             [193] Fixed a bug where when a file contains only 1 entry the filtering was sklipped due to the
                   eof being reached. The counting was correct, it just didn't read an EOF = BOF file

             7AUG2011
             [193] GENERAL. Converted code to new IDE version (Delphi XE).
                   Replaced Log File Rich Edit with better component that makes tracing easier
                   Made minor changes to the GUI
             [194] Added a check for that the folder exist.
             [195] Added new functionality. You can now enter multiple locations to read in one go.
             [196] Added new functionality. You can now hover over a section in the details menu and
                   the preceding 16 lines and following 3 lines will be loaded for easier viewing.


TODO. The Timer must be replaced by a FileChange API call,
      Also it can be extented to filter the display, that would trigger the log file to only show the errors,
      notes, warning etc in the display log. The preceding say 5 lines before the note can also be displayed
      as long as it's not either a note, error or warning.

      Check on the impact of adding a custom message indicator as well. - Done
      Implement FileStreams to see what the impact will be on filesharing
      with regards to File in Use errors between SAS and the app - Done
*)
unit uDisplayLog;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  StdCtrls,
  ExtCtrls,
  Menus,
  strutils_d7,
  ads_strg,
  inifiles,
  ads_date,
  Buttons,
  uUsertypes_d7,
  ComCtrls,
  Dialogs,
  variants,
  uLogRead,
  ComObj,
  XPMan, JvComponentBase, JvBalloonHint, ShellAPI, Math
//  MidasLib
  (*,
  SAS_TLB,
  SASObjectManager_TLB,
  SASWorkspaceManager_TLB,
  SASIOMCommon_TLB*);

//  arrow $00894F30
//  border clNavy

type

  TfmLogDisplay = class(TForm)
    ppMenu: TPopupMenu;
    ReadFileFromLocation1: TMenuItem;
    N1: TMenuItem;
    Close1: TMenuItem;
    Timer: TTimer;
    mnuActive: TMenuItem;
    DeactivateforReading: TMenuItem;
    ClearCounters1: TMenuItem;
    N2: TMenuItem;
    mnuAlwaysonTop1: TMenuItem;
    mnuForceReadofLogFile: TMenuItem;
    Minimize1: TMenuItem;
    ppMainMenu: TPopupMenu;
    Logfile1: TMenuItem;
    mnuLogDetails: TMenuItem;
    mnuTimingDetails: TMenuItem;
    mnuReadLogFolder: TMenuItem;
    N3: TMenuItem;
    mnuClose: TMenuItem;
    mnuHideDetails: TMenuItem;
    ReadFileFromLocation2: TMenuItem;
    ClearCounters2: TMenuItem;
    N4: TMenuItem;
    ForceReadofLogFile1: TMenuItem;
    mnuColorsOff: TMenuItem;
    lbstats: TLabel;
    N5: TMenuItem;
    CreateRules1: TMenuItem;
    N6: TMenuItem;
    CreateRules2: TMenuItem;
    lbWarn: TLabel;
    lbCntWarn: TLabel;
    lbInfo: TLabel;
    lbCntInfo: TLabel;
    lbConvNotes: TLabel;
    lbCntConvNotes: TLabel;
    lbError: TLabel;
    lbCntErr: TLabel;
    lbMerge: TLabel;
    lbCntMerge: TLabel;
    lbInvalid: TLabel;
    lbcntInvalid: TLabel;
    lbDivs: TLabel;
    lbDivzero: TLabel;
    lbuninit: TLabel;
    lbuninitcnt: TLabel;
    DeleteLogFolderHistory1: TMenuItem;
    mnuQuickNote: TMenuItem;
    lbNotes: TLabel;
    lbcntnote: TLabel;
    N7: TMenuItem;
    About1: TMenuItem;
    N8: TMenuItem;
    About2: TMenuItem;
    trayIcon: TTrayIcon;
    Restore1: TMenuItem;
    pnloff: TPanel;
    pnlOn: TPanel;
    Timer2: TTimer;
    pnlIndicate: TPanel;
    ReleaseNotes1: TMenuItem;
    Release1: TMenuItem;
    lbCustom: TLabel;
    lbCustcnt: TLabel;
    StopReading1: TMenuItem;
    lbOtherlb: TLabel;
    lbAlloth: TLabel;
    ApplyFormattoLogFile: TMenuItem;
    spbMenu: TSpeedButton;
    AlternativeMenu1: TMenuItem;
    N9: TMenuItem;
    XPManifest1: TXPManifest;
    lblastdd: TLabel;
    mnuCountOnly: TMenuItem;
    ChangeDefaultView1: TMenuItem;
    pgBar: TProgressBar;
    mnuReportOnly1: TMenuItem;
    mnuOptions: TMenuItem;
    procedure ReadFileFromLocation1Click(Sender: TObject);
    procedure memEditorMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Close1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure mnuActiveClick(Sender: TObject);
    procedure DeactivateforReadingClick(Sender: TObject);
    procedure memLinesMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
//    procedure fnDialgFind(Sender: TObject);
    procedure ClearCounters1Click(Sender: TObject);
    procedure mnuAlwaysonTop1Click(Sender: TObject);
    procedure mnuForceReadofLogFileClick(Sender: TObject);
    procedure bbRunClick(Sender: TObject);
    procedure cbFolderKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Minimize1Click(Sender: TObject);
    procedure Logfile1Click(Sender: TObject);
    procedure mnuReadLogFolderClick(Sender: TObject);
    procedure mnuHideDetailsClick(Sender: TObject);
    procedure lbstatsMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure mnuColorsOffClick(Sender: TObject);
    procedure lbTextMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnMenuClick(Sender: TObject);
    procedure mnuQuickNoteClick(Sender: TObject);
    procedure tvViewMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lbErrorClick(Sender: TObject);
    procedure lbWarnClick(Sender: TObject);
    procedure lbConvNotesClick(Sender: TObject);
    procedure lbMergeClick(Sender: TObject);
    procedure lbInvalidClick(Sender: TObject);
    procedure lbDivsClick(Sender: TObject);
    procedure lbuninitClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure About2Click(Sender: TObject);
    procedure Restore1Click(Sender: TObject);
    procedure lbInfoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure lblastddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lbNotesClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer2Timer(Sender: TObject);
    procedure ReleaseNotes1Click(Sender: TObject);
    procedure lbCustomClick(Sender: TObject);
    procedure StopReading1Click(Sender: TObject);
    procedure lbAllothClick(Sender: TObject);
    procedure lbOtherlbClick(Sender: TObject);
    procedure ApplyFormattoLogFileClick(Sender: TObject);
    procedure AlternativeMenu1Click(Sender: TObject);
    procedure mnuCountOnlyClick(Sender: TObject);
    procedure ChangeDefaultView1Click(Sender: TObject); //115
    procedure mnuReportOnly1Click(Sender: TObject);
    procedure DeleteLogFolderHistory1Click(Sender: TObject);
    procedure mnuOptionsClick(Sender: TObject);
    procedure trayIconClick(Sender: TObject);
    procedure trayIconDblClick(Sender: TObject);
    procedure trayIconMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
 private
    { Private declarations }
    inote,
    iinfo,
    ierr,
    imerge,
    iwarn,
    iInv,
    iConvs,
    iUnint,
    iDivs,
    iAlloth,
    iCust    : Integer;
    icnt     : Integer;
    dtLast   : Tdatetime;
    dtCurr   : TDatetime;
    iColp    : Integer;
//    mruList  : array[1..10] of Ansistring;
    Settings : TInifile;
//    Rules    : Tinifile;
//    locs     : Ansistring;
    bStop    : Boolean;
    arRuleSets : array of Rulesets;
//    arDetails  : array of Rulesets;
    sDisplay   : Ansistring;
    iState     : Integer;
    bChangeLog : boolean;
    bColors    : boolean;
    bFmtlog    : boolean;
    iCycle     : integer;
    iTimer     : integer;
    bReport    : boolean;
    asTM       : Ansistring; //[108]
    bBusy      : boolean; //111
    tmpFloc    : Ansistring; //117
    ilstline   : integer;
    brdstat    : boolean;
    etDisplaytype : etDisptype;
    etLastLoad    : etLoad;
    ilstright     : integer;
    ilstleft      : integer;
    ilsttop       : integer;
    ilstbottom    : integer;
    ifcnt         : integer;
    rcFlogs       : array of Tloginfo;
    bReportonly
//    bReadonStartup,
//    bClearFileHist,
//    bClearFolHistory
: boolean;
    lstpt     : TPoint; //Last known co-ordinates
    lstptx    : integer;
    lstpty    : integer;
//    rcTaskbar : TRect;

    function  Builddisplaylist(str : Ansistring) : Ansistring;
    function  HooktoSAS : boolean;
    procedure Setcountstatus(bStatus : Boolean); //[164]
    procedure Setdisplayoptions;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Setlabelcolors;
  public
    { Public declarations }
    procedure Init;
    function  ReadLogfile(bFolder : Boolean; bforce : Boolean=false) : Boolean;
    procedure ReWNewDecodeLine(sType : Ansistring; asLine : Ansistring; iLine: Integer; iCodeLn : integer; bfolder : Boolean; fdet : Boolean = false);
    procedure SetFileLoc(asloc : Ansistring);
    function  GetFileLoc : Ansistring;
    function  GetTmpfileloc : Ansistring;
    procedure ShowLogFile;
    function  GetLogstatus : Boolean;
    procedure lightshandle(bRead : boolean);
    procedure SetLogStatus(bChange : Boolean);
    procedure ClearCounters;
    function  GetNotes : integer;
    function  GetWarns : integer;
    function  GetConv  : integer;
    function  GetUninit: integer;
    function  GetDivs  : integer;
    function  GetMerge : integer;
    function  GetInvald : integer;
    function  GetError : integer;
    function  GetInfo : integer;
    function  GetCust : integer;
    function  Getalloth : integer; //[123]
    function  GetLogfmt : boolean;
    function  CreateMemdata : boolean;
    function  LoadDetails(etType : etLoad; ileft, iright, itop, ibottom : integer) : boolean;
//    procedure oldFilterbyType(etType : etLoad);
    procedure FilterbyType(etType : etLoad);
    function  DisableCntrls(bEnable : boolean) : boolean;
    function  Getcountstatus : Boolean;
    function  Getaploc : ansistring;

//    function StringToCaseSelect(Selector : string;
//    procedure SetFileLoc(sloc : Ansistring);

  end;
var
  fmLogDisplay     : TfmLogDisplay;
  FLoc             : Ansistring;
  folLoc           : Ansistring;
  aploc            : Ansistring;
  logchg           : boolean;
  SAS              : Variant; //[test]
  flogs            : file of Tloginfo;


//original color;
//$00C0754B
Function  GetFileSize (FileName : String) : Longint;


implementation

uses uFLoc, uDetails, uAbout, uLogFile, uLogfolder, uProgress,
  uRelease, uOptmenu, uViewselect, uOptions, uInforesults;//, uUserrules;

{$R *.DFM}
//------------------------------------------------------------------------------
Function GetFileSize (FileName : String) : Longint;

Var F : File of Byte;
    X : LongInt;

Begin
  AssignFile(F, FileName);
  Reset(F);
  X := FileSize(F);
  CloseFile(F);
  GetFileSize := X;
End;
//------------------------------------------------------------------------------
function NearlyEqual(a, b, epsilon: Integer): Boolean;
begin
  Result := Abs(a-b) < (epsilon / 2);
end;
//------------------------------------------------------------------------------
{procedure TfmLogDisplay.CreateParams(var Params: TCreateParams); //[102]
begin
 inherited CreateParams(Params);
 with Params do begin
  Style := Style + WS_POPUP - WS_DLGFRAME ;
 end;
end;}
//------------------------------------------------------------------------------
{procedure TfmLogDisplay.WMNCHitTest(var msg: TWMNCHitTest);  //[102]
begin
  inherited;
  if (msg.Result = htClient) then
   msg.Result := htCaption;
end;}

//------------------------------------------------------------------------------
procedure TfmLogDisplay.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do begin
    ExStyle := ExStyle or WS_EX_TOPMOST;
    WndParent := GetDesktopwindow;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.Setdisplayoptions;
var
 itype : integer;
begin
  Settings  := TIniFile.Create(ExtractFilePath(application.exename)+'saslogdisp.ini');
  itype     := Settings.ReadInteger('displayoption', 'display', integer(etDisplaytype) );
  Settings.Free;

  if itype = 1 then begin
    fmLogDisplay.Show;
    fmViewselect.Hide;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.FormActivate(Sender: TObject);
begin
{*   fmLogDisplay.FormStyle := fsNormal;
   fmLogDisplay.FormStyle := fsStayOnTop;*}
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    close;
  except on
   e : exception do begin

   end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.FormCreate(Sender: TObject);
begin
  SetWindowLong(Handle, GWL_EXSTYLE,
                GetWindowLong(Handle, GWL_EXSTYLE) or WS_EX_TOPMOST);
  Init;
{  if fmoptmenu.Visible then
   fmoptmenu.Hide;

  fmoptmenu.Visible := false;}

{   SAS := CreateOleObject('SAS.Application');//[test]
   SAS.Wait    := True;//[test]
   SAS.Visible := True;//[test]}
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.FormPaint(Sender: TObject);
begin

end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.FormResize(Sender: TObject);
begin
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.FormShow(Sender: TObject);
begin
   fmlogdisplay.Constraints.MaxHeight := 11;
//   fmLogDisplay.FormStyle := fsNormal;
   fmLogDisplay.FormStyle := fsStayOnTop;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.Init;
var
  bproblem : boolean;
begin
 try
  //Load the log read destination
  Settings            := TIniFile.Create(ExtractFilePath(application.exename)+'saslogdisp.ini');
  aploc               := ExtractFilePath(application.exename);
  FLoc                := Settings.ReadString('location', 'location', FLoc);
  folLoc              := Settings.ReadString('location', 'Folder', folLoc);
  bColors             := Settings.ReadBool('Appr', 'Colors', bColors);
  bFmtlog             := Settings.ReadBool('Appr', 'LogFmt', bFmtlog);//[140]
  bReportonly         := Settings.ReadBool('Appr', 'ReportOnly', bReportonly);

  mnuColorsOff.Checked         := bColors;

  ApplyFormattoLogFile.Checked := bFmtlog;
  mnuColorsOffClick(nil);

  etlastload := etNone; //170
//  bReportonly := false; //[181]

  iColp    := 0;
  ilstline := 0;
  ifcnt    := 0;
  lbstats.Caption := 'SAS Log Display - Resting';
  if fmoptmenu <> nil then
    fmoptmenu.lbstats.Caption := 'SAS Log Display - Resting';

  fmlogdisplay.Constraints.MaxHeight := 11;
  with fmlogdisplay do begin
    lbCntInfo.Caption := '';
    lbCntMerge.Caption:= '';
    lbCntErr.Caption  := '';
    lbCntWarn.Caption := '';
    lbcntnote.Caption := '';
  end;

  {if fmoptmenu <> nil then begin
    with fmoptmenu do begin
      lbCntInfo.Caption := '';
      lbCntMerge.Caption:= '';
      lbCntErr.Caption  := '';
      lbCntWarn.Caption := '';
      lbcntnote.Caption := '';
    end;
  end;}
  Timer.Enabled     := false;
  mnuActive.Enabled := false;
//  memLines.lines.Clear;

  if fmLogDisplay.FormStyle = fsStayOnTop then mnuAlwaysonTop1.Checked := true;

//  mnuReportOnly1Click(nil);
  ClearCounters1Click(nil);
//  sgdetails.Cells[4, 0] := 'OBS to';      //arFile[icnt].obsto;
  ClearCounters;

  bStop := false;

  pnloff.Visible := false;
  pnlon.Visible  := false;
  bproblem := not CreateMemdata;
  if bproblem  then begin
      MessageDlg('Memory data not created.', mtWarning, [mbOK], 0);
  end;

  iCycle  := 0;
  bReport := false;
  iTimer  := 0;
  fmLogDisplay.Top := 0;
  brdstat := true;

  if isnotempty(fLoc) then
    mnuActiveClick(nil);
//  LoadRuleSettings;
  Settings.Free;
 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'Init'+#13+#10+e.Message, mtWarning, [mbOK], 0);
      fmProgress.Visible := false;
    end;
 end;
end;
//------------------------------------------------------------------------------
function  TfmLogDisplay.HooktoSAS : boolean;
begin
 try
//  wsm  := CoWorkspaceManager.Create as WorkspaceManager;
//  ws   := wsm.Workspaces.CreateWorkspaceByServer('',VisibilityProcess, nil, '', '', xl);
//  ws.LanguageService.LineSeparator := #13+#10;

  result := true;
 except on
   e : Exception do begin
     MessageDlg('The following exception occurred in:'+#13+#10+'HooktoSAS'+#13+#10+e.Message, mtWarning, [mbOK], 0);
     result := false;
   end;
 end;
end;
//------------------------------------------------------------------------------
function  TfmLogDisplay.CreateMemdata : boolean;
begin
 try

  result := true;
 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'CreateMemdata'+#13+#10+e.Message, mtWarning, [mbOK], 0);
      result := false;
    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.ChangeDefaultView1Click(Sender: TObject);
begin
  try
    timer.Enabled := false;
    Timer2.Enabled := false;
    fmViewselect.showModal;
  finally
    timer.Enabled := true;
    Timer2.Enabled := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.ClearCounters;
begin
 try
  inote  := 0;
  iinfo  := 0;
  ierr   := 0;
  iwarn  := 0;
  imerge := 0;
  iConvs := 0;
  iInv   := 0;
  iDivs  := 0;
  iUnint := 0;
  iCust  := 0;
  iAllOth := 0;
//  memEditor.Lines.Clear;
 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+
               'ClearCounters'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
 end;
end;
//------------------------------------------------------------------------------
function  TfmLogDisplay.Getaploc : ansistring;
begin
  result := aploc;
end;
//------------------------------------------------------------------------------
function TfmLogDisplay.GetFileLoc : Ansistring;
begin
  result := Floc;
end;
//------------------------------------------------------------------------------
function  TfmLogDisplay.GetTmpfileloc : Ansistring;
begin
  result := tmpFloc;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.SetFileLoc(asloc : Ansistring);
begin

  dtLast := LastModified(asLoc);
  Floc := asLoc;
  Settings        := TIniFile.Create(ExtractFilePath(application.exename)+'saslogdisp.ini');
  Settings.WriteString('location', 'location', Floc);
  Settings.Free;
//  chgNotify.Notifications[0].Directory := ExtractFilePath(asLoc);
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.ReadFileFromLocation1Click(Sender: TObject);
begin
 try
  frmFLoc.ShowModal;
  Timer.Enabled := false;
  if IsnotEmpty(floc) then begin   //[175]
    mnuActive.Enabled := true;
    Timer.Enabled := true;
  end else begin
    mnuActive.Enabled := false;
  end;
 except on
    e : Exception do begin
    Timer.Enabled := true;
    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.memEditorMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  m : TPoint;
begin
 try
  if button = mbRight then begin
    GetCursorPos(m);
    ppMenu.Popup(m.X, m.Y);

  end;
//  fmLogDisplay.FormStyle := fsStayontop;

 except on
    e : Exception do begin

    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.Close1Click(Sender: TObject);
//var
// tac : TCloseAction;
begin
 try
  Settings        := TIniFile.Create(ExtractFilePath(application.exename)+'saslogdisp.ini');
  Settings.WriteBool('Appr', 'Colors', bColors);
  Settings.WriteBool('Appr', 'LogFmt', bFmtlog); //[140]
  Settings.Free;

  fmViewselect.close;

//  fmViewselect.close;
//  close;
 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'Close1Click'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
 end;
end;
//------------------------------------------------------------------------------
function TfmLogDisplay.ReadLogfile(bFolder : Boolean; bforce : Boolean=false) : Boolean;
var
 ffile      : TextFile;
 bCont      : Boolean;
 asLine     : Ansistring;
 sDisp      : Ansistring;
 ic         : integer;
 icode      : integer;
 iLine,
 ilinecnt   : Integer;
 iprev      : Integer;
 Ftmp       : Ansistring;
 asStr      : Ansistring;
 idx        : integer;
 sStr, sTmp, stmp1   : Ansistring;
 dtSt, dten : Tdatetime;
 fstream    : TFilestream;
 fsize      : integer;
 htfile     : THandle;
 locfile    : File;
 tval       : string;
 buf        : Ansistring;
 slline     : Tstringlist;
 bCapdetail : boolean;
 dtbk       : TDatetime;
 bread      : boolean;
 stmpfile   : Ansistring;
 dtacc      : Tdatetime;
begin
 try
  iLine := 0;
  icode := 0;
  iprev := -1;
  fsize := 0;
  bRead := false;
  ifcnt := 1;
  fillchar(rcFlogs, sizeof(rcFlogs), 0);

//  if bfolder  then bCapdetail := true;
  if isnotempty(floc) then begin
   dtbk   := dtCurr;  //[172]
   dtCurr := LastModified(floc);
   lbstats.Caption := DateTimeToStr(dtLast)+' ['+asTM+']'; //[108]

   if fmoptmenu <> nil then
     fmoptmenu.lbstats.Caption := DateTimeToStr(dtLast)+' ['+asTM+']'; //[108]

//   if ((dtLast <> dtCurr) or (dtLast <> dtAcc)) or (bForce) or (bfolder) then begin //[163]
   if (dtLast <> dtCurr) or (bForce) or (bfolder) then begin //[163]
      bChangeLog := true;
      sDisp      := '';
      dtLast     := dtCurr;

      bCont := false;

      tmpFloc := floc;
      //bcont := false;               //changed
      if not bCont then begin //File is not in use
        try
          sleep(20);  //[183]
          fstream := TFileStream.Create(floc, fmOpenRead or fmShareDenyNone); //[173]
          bBusy := true;
          bRead := true;
          SetLogStatus(true);
          Timer.Enabled := false;
          spbMenu.Enabled := false;
          ClearCounters1Click(nil); //[114]
          bstop := false; //115

          lbstats.Caption := 'Reading information....Busy';
         if fmoptmenu <> nil then begin
            fmoptmenu.lbstats.Caption := 'Reading information....Busy';
//            fmoptmenu.bbStop.Enabled := true;
          end;

          pnlIndicate.visible := false;
          breport             := false;
          iTimer              := 0;
          lbstats.Caption := 'Refreshing counter...';

          if fmoptmenu <> nil then
            fmoptmenu.lbstats.Caption := 'Refreshing counter...';

          slline := TStringlist.Create;  //[158]
          slline.LoadFromStream(fstream);//[158]
           iline := 1;   //[test]
            dtst := Now;
            ilinecnt := slline.Count;
            fmLogFolder.setlinecount(ilinecnt);
            for iline := 1 to ilinecnt-1 do begin //144
              if bstop then break; //115

              lbstats.Caption := 'Reading Log file, reading line: '+Inttostr(iLine)+' of '+Inttostr(slline.Count-1);
              if fmoptmenu <> nil then
                fmoptmenu.lbstats.Caption := 'Reading Log file, reading line: '+Inttostr(iLine)+' of '+Inttostr(slline.Count-1);
              asline := slline.Strings[iline];
              tval := lowercase(copy(asline, 1, 1));
             if (slline.Strings[iline] <> ' ') or ((copy(asline, 1, idx-1)) <> ' ') then begin
                if (tval = 'n' ) or (tval = 'i' )  or (tval = 'e' )  or (tval = 'w' )  then begin //[129]
                    idx  := pos(' ',asLine);  //[101]
                    stmp := lowercase(copy(asline, 1, idx-1));

                    //Notes will be classified further since certain notes must be sorted out
                    if (stmp = 'note:') or (stmp = 'note::') or (stmp = 'note') or
                       (stmp = 'info:') or (stmp = 'info::') or
                       (stmp = 'error:') or (stmp = 'error::') or (stmp = 'error') or
                       (stmp = 'warning:') or (stmp = 'warning::')  or (stmp = 'warning') then begin
                        //Only go in if the line contains of the "approved" logs else just ignore it
                        //there is no need to read the line any further
                        ReWNewDecodeLine(sTmp, asLine, iLine, icode, bfolder, true);
                    end else begin
                      if (stmp <> '') then
                        if IsStrANumber(stmp) = true then begin
                          if (StrToInt(stmp) > 0) then begin
                            if (iPrev <> StrToInt(stmp)) then begin
                              inc(icode);
                              iprev := strtoInt(stmp);
                            end;
                          end;
                        end;
                    end;
                end;//if  ( pos('niew', tval) > 0)
              end; //if asline <> ''

              if iline mod 300 = 0 then  begin
//              if iline mod 1 = 0 then  begin
                with fmLogDisplay do begin
                  lbcntnote.caption       := Inttostr(inote);
                  lbCntWarn.caption       := Inttostr(iwarn);
                  lbCntErr.caption        := Inttostr(ierr);
                  lbCntMerge.caption      := Inttostr(imerge);
                  lbCntInfo.caption       := Inttostr(iinfo);
                  lbCntConvNotes.caption  := Inttostr(iConvs);
                  lbcntInvalid.caption    := Inttostr(iInv);
                  lbDivzero.caption       := Inttostr(iDivs);
                  lbuninitcnt.caption     := Inttostr(iUnint);
                  lbcustcnt.Caption       := inttostr(icust);
                  lbAlloth.Caption        := inttostr(iAlloth);
                end;
                if fmoptmenu <> nil then begin
                  with fmoptmenu do begin
                    lbcntnote.caption       := Inttostr(inote);
                    lbCntWarn.caption       := Inttostr(iwarn);
                    lbCntErr.caption        := Inttostr(ierr);
                    lbCntMerge.caption      := Inttostr(imerge);
                    lbCntInfo.caption       := Inttostr(iinfo);
                    lbCntConvNotes.caption  := Inttostr(iConvs);
                    lbcntInvalid.caption    := Inttostr(iInv);
                    lbDivzero.caption       := Inttostr(iDivs);
                    lbuninitcnt.caption     := Inttostr(iUnint);
                    lbcustcnt.Caption       := inttostr(icust);
                    lbAlloth.Caption        := inttostr(iAlloth);
                  end;
                end;

                application.ProcessMessages; //[128]
              end;
            end;//for
//          end; //if ioresult
          inc(icnt);
//          Closefile(ffile);
          lbstats.left    := 968;
          lbstats.Caption := 'Reading information';
          if fmoptmenu <> nil then
            fmoptmenu.lbstats.Caption := 'Reading information';

          if fmoptmenu.Visible then begin //Make sure it goes visible
            fmoptmenu.Show;
//            if fmLogFolder.visible = false then
            fmoptmenu.FormStyle := fsStayontop;
            fmoptmenu.FormStyle := fsNormal;
          end;

          Application.ProcessMessages;
           if (iwarn > 0) or (ierr > 0) or (imerge > 0) or
              (iInv > 0) or (iDivs > 0) or (iUnint > 0) or (iCust > 0) or (iAllOth > 0) then
             bReport := true
           else
             bReport := false;
     finally
        if fmoptmenu <> nil then begin
//          fmoptmenu.bbStop.Enabled := false;
        end;

        if not bRead then begin; //[172]
           dtCurr := dtbk;
//           showmessage('Resetting dtcurr');
        end;
       end;
    end;//if bcont
    //Update Counter;
     pnlon.visible  := false;
     pnlOff.visible := false;
     dten := Now;
     if bstop then //115
       asTM := IntToStr(iline) +' Lines read in ' + FLoatToStr(TimeDeltaInSeconds(dtst, dten))+'s'
     else
       asTM := IntToStr(slline.Count) +' Lines read in ' + FLoatToStr(TimeDeltaInSeconds(dtst, dten))+'s';//[108]

    try
      //Populate the File
      lbstats.left    := 968;
      lbstats.Caption := 'Populating File...';
      pgBar.show;
      if fmoptmenu <> nil then
        fmoptmenu.lbstats.Caption := 'Populating File...';

//      showmessage(inttostr(high(rcFlogs)));
      if high(rcFlogs) >= 0  then begin ;  //[182]
        pgBar.Max := high(rcFlogs);
//        fmoptmenu.pgBar.Max := high(rcFlogs);
      end else begin
        pgBar.Max := 0;
//        fmoptmenu.pgBar.Max := 0;
      end;

      pgBar.Position := 0;
//      fmoptmenu.pgBar.Position := 0;
//      fmoptmenu.pgBar.Min := 0;
      application.ProcessMessages;

      if bfolder then begin
        AssignFile(ffollogs,aploc+'follogs.dat') ;

        reset(ffollogs);
        seek(ffollogs, fileSize(ffollogs));
        for ic := 1 to high(rcFlogs) do begin
          if rcFlogs[ic].Types <> '' then begin
            stmpfile := rcflogs[ic].Filename;
            write(ffollogs, rcFlogs[ic]);
//            if bfolder then begin
//              write(ffollogs, rcFlogs[ic]);
//            end;
          end;
          if ic mod 300 = 0 then  begin
            pgBar.Position := (ic);
//            fmoptmenu.pgBar.Position := (ic);
            application.ProcessMessages;
          end;
        end;
        pgBar.Position := (ic);
//        fmoptmenu.pgBar.Position := (ic);
        application.ProcessMessages;
      end else begin
        if not breportonly then begin //[181]
          AssignFile(flogs,aploc+'logs.dat') ;
          rewrite(flogs);
          for ic := 1 to high(rcFlogs) do begin
           if ic mod 150 = 0 then  begin
              pgBar.Position := (ic);
//              fmoptmenu.pgBar.Position := (ic);
              application.ProcessMessages;
            end;
            if rcFlogs[ic].Types <> '' then begin
              write(flogs, rcFlogs[ic]);
              if rcFlogs[ic].Types = 'LAST' then begin
                asStr := rcFlogs[ic].Entry;
              end;
            end;
          end;
          pgBar.Position := (ic);
//          fmoptmenu.pgBar.Position := (ic);
          application.ProcessMessages;
        end;
      end;
    finally
      pgBar.Hide;
      if bfolder then begin
        if high(rcFlogs) > 0 then
          closefile(ffollogs);
      end else begin
       if not breportonly then begin //[181]
        if high(rcFlogs) > 0 then
           closefile(flogs);
       end;
      end;
      Timer.Enabled := true; //[184]
    end;
    //clear the array record;
    setlength(rcFlogs,1);
    fillchar(rcFlogs, sizeof(rcFlogs), 0);

     //Refresh the Extra Display information Screen //[170]
     if etlastload <> etNone then begin
       if fmDetails.Visible then begin
         if not LoadDetails(etLastLoad, ilstleft, ilstright,
                        ilsttop, ilstbottom) then
            MessageDlg('Could not refresh the details information. .'+#13#10+
                       'Clicking on it again will solve the problem' , mtWarning, [mbOK], 0);
       end;
     end;

      with fmLogDisplay do begin
        lbcntnote.caption       := Inttostr(inote);
        lbCntWarn.caption       := Inttostr(iwarn);
        lbCntErr.caption        := Inttostr(ierr);
        lbCntMerge.caption      := Inttostr(imerge);
        lbCntInfo.caption       := Inttostr(iinfo);
        lbCntConvNotes.caption  := Inttostr(iConvs);
        lbcntInvalid.caption    := Inttostr(iInv);
        lbDivzero.caption       := Inttostr(iDivs);
        lbuninitcnt.caption     := Inttostr(iUnint);
        lbcustcnt.Caption       := inttostr(icust);
        lbAlloth.Caption        := inttostr(iAlloth);
        lblastdd.Caption        := asStr;
      end;
      if fmoptmenu <> nil then begin
        with fmoptmenu do begin
          lbcntnote.caption       := Inttostr(inote);
          lbCntWarn.caption       := Inttostr(iwarn);
          lbCntErr.caption        := Inttostr(ierr);
          lbCntMerge.caption      := Inttostr(imerge);
          lbCntInfo.caption       := Inttostr(iinfo);
          lbCntConvNotes.caption  := Inttostr(iConvs);
          lbcntInvalid.caption    := Inttostr(iInv);
          lbDivzero.caption       := Inttostr(iDivs);
          lbuninitcnt.caption     := Inttostr(iUnint);
          lbcustcnt.Caption       := inttostr(icust);
          lbAlloth.Caption        := inttostr(iAlloth);
          lblastdd.Caption        := asStr;
        end;
      end;
     application.ProcessMessages;


     lbstats.Caption := 'Done reading information';
     lbstats.Caption := asTm;//[108]

     if fmoptmenu <> nil then begin
       fmoptmenu.lbstats.Caption := 'Done reading information';
       fmoptmenu.lbstats.Caption := asTm;//[108]}
     end;


     if fmLogFile.Visible then begin
      fmlogfile.rcLines.Lines.LoadFromStream(fstream);
      fmlogfile.Performformat(fmLogDisplay.GetTmpfileloc);
      fmLogfile.Caption := 'Info on Log file read from '+floc;
      fmLogfile.Show;
      //[122]
      fmLogfile.rcLines.SelStart  := fmLogfile.rcLines.Perform(EM_LINEINDEX, fmLogfile.rcLines.Lines.Count, 0);
      fmLogfile.rcLines.SelLength := fmLogfile.rcLines.Lines.Count;
      fmLogfile.rcLines.SetFocus;
     end;

//     AnalyzeFile;
//    if high(arFile) > 0 then UpdateTree('Log Details');
   end;
  end else begin
    SetLogStatus(false);
  end;

//  btnMenu.Enabled := true;
  spbMenu.Enabled := true;
  bBusy := false;
//  fstream.free;
  FreeAndnil(fstream);
  FreeAndnil(slline);

//  lbstats.Caption := 'Done reading information';
 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'ReadLogfile'+#13+#10+e.Message+#13+#10+
                 floc, mtWarning, [mbOK], 0);

//      showmessage('count '+inttostr(ic) +' RCFLOG '+inttostr(high(rcflogs)));
      //If there is an exception, the timer must be reset
      Timer.Enabled := false;
      Timer.Enabled := true;
      setlength(rcFlogs,1);
      
//      btnMenu.Enabled := true;
      spbMenu.Enabled := true;
      pnlon.visible  := false;
      pnlOff.visible := false;
      bBusy := false;
      FreeAndNil(slline);
      FreeAndnil(fstream);
    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.ReleaseNotes1Click(Sender: TObject);
begin
  fmRelease.Show;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.Timer2Timer(Sender: TObject);
begin
  //[103]
  (*if bReport then begin
    inc(iTimer);
    pnlIndicate.Visible := true;
    if iCycle <= 2 then
      inc(iCycle)
    else
      iCycle := 1;

//    pnlIndicate.Color := $000000E1-(iCycle*8);
    if iCycle = 1 then pnlIndicate.Color := $00000088
    else pnlIndicate.Color := clRed;

//    pnlIndicate.Color := $000000E1-(iCycle*8);
    if iTimer >= 20 then //[109]
      breport := false;

    application.ProcessMessages;
  end else begin
    pnlIndicate.Visible := false;
    if fmLogFolder.visible = false then begin
      if fmoptmenu.Visible then begin
        if fmoptmenu.FormStyle = fsNormal then
          fmoptmenu.FormStyle := fsNormal
        else
        if fmoptmenu.FormStyle = fsStayonTop then begin
          fmoptmenu.FormStyle := fsStayonTop;
          fmoptmenu.Show;
        end;
      end;

      if fmLogDisplay.Visible then begin
//       fmLogDisplay.FormStyle := fsStayontop;
//       fmLogDisplay.Show;
      end;
    end;
  end;   *)

end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.TimerTimer(Sender: TObject);
var
 asLog : Ansistring;
begin
 try
//  asLog := ws.LanguageService.Flushlog(1000000);
//  if aslog <> '' then begin
    if not bbusy then begin       //[184]
      ClearCounters;
      DisableCntrls(false);
      //Check that the file Exists before doing the reading
      //if FileExists(floc) then
      //  ReadLogfile(false);

  //  ReadLogfile(asLog, false);
      DisableCntrls(true);
    end;
//  end;
//  fmLogDisplay.FormStyle := fsNormal;
//  fmLogDisplay.FormStyle := fsStayOnTop;
//  fmLogDisplay.show;


//  Showmessage(IntTostr(vMemLogs.RecordCount))
 except on
    e : Exception do begin
    MessageDlg('The following exception occurred in:'+#13+#10+'TimerTimer'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.trayIconClick(Sender: TObject);
begin

end;

//------------------------------------------------------------------------------
procedure TfmLogDisplay.trayIconDblClick(Sender: TObject);
var
  pot : Tpoint;
  nScreenWidth, nScreenheight : Integer;
  FTaskbarPlacement: Integer;
  DestTop, DestLeft : integer;
begin
 try

//      FindTaskBar(rcTaskbar);

   {nScreenWidth  := GetSystemMetrics(SM_CXSCREEN);
   nScreenHeight := GetSystemMetrics(SM_CYSCREEN);

   DestLeft := Left;
   DestTop  := Top;

    case FindTaskBar(rcTaskbar) of
    ABE_RIGHT:
       begin
//          DestTop    := Trunc((Screen.Height - Height) / 2.0);
//          DestLeft   := rcTaskbar.Left - Width;

          fmInforesults.Left  := rcTaskbar.Left   - fmInforesults.Width;
          fmInforesults.Top   := rcTaskbar.Bottom - fmInforesults.Height;
       end;
    ABE_LEFT:
       begin
//          DestTop    := Trunc((Screen.Height - Height) / 2.0);
//          DestLeft   := rcTaskbar.Right;

          fmInforesults.Left  := rcTaskbar.Right;
          fmInforesults.Top   := rcTaskbar.Bottom - fmInforesults.Height;
       end;
     ABE_TOP:
        begin
//           DestLeft  := Trunc((Screen.Width - Width) / 2.0);
//           DestTop   := rcTaskbar.Bottom;

           fmInforesults.Left := rcTaskbar.Right - fmInforesults.Height;
           fmInforesults.Top  := rcTaskbar.Bottom;
        end;
     else //ABE_BOTTOM
        // Taskbar is on the bottom or Invisible
//        DestLeft  := Trunc((Screen.Width - Width) / 2.0);
//        DestTop   := rcTaskbar.Top - Self.Height;

//        Self.Left := DestLeft - Self.Width;
//        Self.Top  := (DestTop - Self.Height);
        fmInforesults.Left := rcTaskbar.Left   - fmInforesults.Width;
        fmInforesults.Top  := rcTaskbar.Bottom - fmInforesults.Height;
     end; }

   { case FindTaskBar(rcTaskbar) of
        ABE_BOTTOM:
        begin
          DestLeft := Trunc((Screen.Width - Width) / 2.0);
          DestTop  := rcTaskbar.Top - Self.Height;
        end;
        ABE_LEFT:
        begin
          DestTop  := Trunc((Screen.Height - Height) / 2.0);
          DestLeft := rcTaskbar.Right;
        end;
        ABE_RIGHT:
        begin
          DestTop  := Trunc((Screen.Height - Height) / 2.0);
          DestLeft := rcTaskbar.Left - Width;
        end;
        ABE_TOP:
        begin
          DestLeft := Trunc((Screen.Width - Width) / 2.0);
          DestTop  := rcTaskbar.Bottom;
        end;
      end;

      // Move us to the task bar
      while (Left <> DestLeft) or (Top <> DestTop) do
      begin
        if Left < DestLeft then
          Left := Left + 1
        else if Left <> DestLeft then
          Left := Left - 1;

        if Top < DestTop then
          Top := Top + 1
        else if Top <> DestTop then
          Top := Top - 1;

        Application.ProcessMessages;
      end;}


   {   pot := ClientToScreen(lstpt);
   fmInforesults.Left := pot.X-140;
   fmInforesults.top  := pot.Y-280;}
//   Application.ProcessMessages;
    fmInforesults.Show;

 except on
    e : Exception do begin
    MessageDlg('The following exception occurred in:'+#13+#10+'trayIconDblClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.trayIconMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 try
//   if button = mbRight then begin
     GetCursorPos(lstpt);
     lstptx := lstpt.X;
     lstpty := lstpt.Y;

//   end;
 except on
    e : Exception do begin
    MessageDlg('The following exception occurred in:'+#13+#10+'trayIconMouseUp'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
 end;
end;

//------------------------------------------------------------------------------
procedure TfmLogDisplay.tvViewMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 pt : Tpoint;
begin
 try
//   if button = mbRight then begin
     GetCursorPos(lstpt);
//     ppDetails.Popup(pt.X, pt.y);
//   end;
 except on
    e : Exception do begin
    MessageDlg('The following exception occurred in:'+#13+#10+'tvViewMouseMove'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.mnuActiveClick(Sender: TObject);
begin
  Timer.Enabled := true;
  deactivateforReading.Enabled := true;
//  pnlLight.Color  := clYellow;
  lbstats.Caption := 'SAS Log Display - Waiting';
  if fmoptmenu <> nil then
    fmoptmenu.lbstats.Caption := 'SAS Log Display - Waiting';

end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.DeactivateforReadingClick(Sender: TObject);
begin
  Timer.Enabled := false;
  mnuActive.Enabled := true;
  lbstats.Caption := 'SAS Log Display - Resting';
  if fmoptmenu <> nil then
    fmoptmenu.lbstats.Caption := 'SAS Log Display - Resting';

end;
//------------------------------------------------------------------------------

procedure TfmLogDisplay.DeleteLogFolderHistory1Click(Sender: TObject);
begin

end;

//------------------------------------------------------------------------------
//$008080FF
procedure TfmLogDisplay.About1Click(Sender: TObject);
begin
  fmAbout.ShowModal;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.About2Click(Sender: TObject);
begin
  About1Click(nil);
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.AlternativeMenu1Click(Sender: TObject);
begin
 try
   fmoptmenu.visible    := true;
   fmLogDisplay.visible := false;
   fmLogDisplay.Top     := 1;
   fmLogDisplay.Left    := 1;

 except on
   e : Exception do begin
     MessageDlg('The following exception occurred in:'+#13+#10+'AlternativeMenu1Click'+#13+#10+e.Message, mtWarning, [mbOK], 0);
   end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.ApplyFormattoLogFileClick(Sender: TObject);
begin
  if ApplyFormattoLogFile.Checked then begin
    bfmtlog := false;
    ApplyFormattoLogFile.Checked := false;
  end else begin
    bfmtlog := true;
    ApplyFormattoLogFile.Checked := true;
  end;
end;

//------------------------------------------------------------------------------
procedure TfmLogDisplay.memLinesMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  m : TPoint;
begin
 try
  if button = mbRight then begin
    GetCursorPos(m);
//    ppEdit.Popup(m.X, m.Y);
  end;
 except on
   e : Exception do begin
     MessageDlg('The following exception occurred in:'+#13+#10+'mnuFindClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
   end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.ClearCounters1Click(Sender: TObject);
var
  ic : integer;
begin
  try
    with fmlogdisplay do begin
      lbcntnote.Caption      := '0';
      lbCntWarn.Caption      := '0';
      lbCntErr.Caption       := '0';
      lbCntMerge.Caption     := '0';
      lbCntInfo.Caption      := '0';
      lbCntMerge.caption     := '0';
      lbcntnote.caption      := '0';
      lbCntConvNotes.caption := '0';
      lbCntInfo.caption      := '0';
      lbCntErr.caption       := '0';
      lbCntWarn.caption      := '0';
      lbcntInvalid.caption   := '0';
      lbDivzero.caption      := '0';
      lbuninitcnt.caption    := '0';
      lbcustcnt.caption      := '0';
      lbAlloth.caption       := '0';

      bReport := false;

      try
        AssignFile(flogs,aploc+'logs.dat') ;
        rewrite(flogs);
      finally
        Closefile(flogs);
      end;


      for ic := 0 to high(arRulesets) do begin
        arRuleSets[ic].Count := 0;
      end;
    end;
    if fmoptmenu <> nil then begin
      with fmoptmenu do begin
        lbcntnote.Caption      := '0';
        lbCntWarn.Caption      := '0';
        lbCntErr.Caption       := '0';
        lbCntMerge.Caption     := '0';
        lbCntInfo.Caption      := '0';
        lbCntMerge.caption     := '0';
        lbcntnote.caption      := '0';
        lbCntConvNotes.caption := '0';
        lbCntInfo.caption      := '0';
        lbCntErr.caption       := '0';
        lbCntWarn.caption      := '0';
        lbcntInvalid.caption   := '0';
        lbDivzero.caption      := '0';
        lbuninitcnt.caption    := '0';
        lbcustcnt.caption      := '0';
        lbAlloth.caption       := '0';

        bReport := false;
      end;
    end;
  except on
   e: exception do begin
     MessageDlg('The following exception occurred in:'+#13+#10+'ClearCounters1Click'+#13+#10+e.Message, mtWarning, [mbOK], 0);
   end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.mnuAlwaysonTop1Click(Sender: TObject);
begin
  if mnuAlwaysonTop1.Checked then begin
    mnuAlwaysonTop1.Checked := false;
//    fmLogDisplay.FormStyle := fsNormal;
  end else begin
    mnuAlwaysonTop1.Checked := true;
//    fmLogDisplay.FormStyle := fsStayOnTop;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.mnuForceReadofLogFileClick(Sender: TObject);
begin
  ReadLogfile(false, true);
end;
//------------------------------------------------------------------------------
//$00894F30
//$005F3621
procedure TfmLogDisplay.bbRunClick(Sender: TObject);
begin
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.cbFolderKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = Int(VK_RETURN) then begin
    bbRunClick(sender);
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.Minimize1Click(Sender: TObject);
begin
  fmLogDisplay.Windowstate := wsMinimized;
  iState := 1;
  Minimize1.Visible := false;
  Restore1.Visible := True;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.Restore1Click(Sender: TObject);
begin
  mnuAlwaysonTop1.Checked := false;
//  fmLogDisplay.FormStyle := fsNormal;
  fmLogDisplay.WindowState := wsNormal;

  mnuAlwaysonTop1.Checked := true;
  fmLogDisplay.FormStyle := fsStayOnTop;
  iState := 1;
  Minimize1.Visible := false;
  Restore1.Visible := True;

end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.ShowLogFile;
var
  asVal : ansistring;
  asPr  : ansistring;
begin
  try
    Timer.Enabled   := false;
    asPr := lbstats.Caption;

    lbstats.Caption := 'Loading Log file. Please wait....';
//    fmoptmenu.lbstats.Caption := 'Loading Log file. Please wait....';
    fmlogfile.Performformat(fmLogDisplay.GetTmpfileloc);
//    fmlogfile.pgMain.ActivePage := fmlogfile.tslogdisplay;
    fmLogfile.Caption := 'Info on Log file read from '+floc;
    lbstats.caption := 'Done loading Log file.';
//    fmoptmenu.lbstats.caption := 'Done loading Log file.';

    lbstats.caption := asPr;
    fmLogfile.Show;
    Timer.Enabled  := true;
  except on
   e : Exception do begin
    MessageDlg('The following exception occurred in:'+#13+#10+'ShowLogFile'+#13+#10+e.Message, mtWarning, [mbOK], 0);
   end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.StopReading1Click(Sender: TObject);
begin
  try
    if Messagedlg('Stop Reading? Yes/No',mtConfirmation, [mbYes, mbNo],0 ) = mrYes  then
      bstop := true
    else
      bstop := false;

  except on
   e : Exception do begin
    MessageDlg('The following exception occurred in:'+#13+#10+'StopReading1Click'+#13+#10+e.Message, mtWarning, [mbOK], 0);
   end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.Logfile1Click(Sender: TObject);
begin
 ShowLogFile;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.mnuQuickNoteClick(Sender: TObject);
begin
//  fmQuickNote.Show;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.mnuReadLogFolderClick(Sender: TObject);
var
  asVal : Ansistring;
begin
  try
     Timer.Enabled               := false;
     fmLogFolder.ShowModal;
     Timer.Enabled               := true;
  except on
   e : Exception do begin
    MessageDlg('The following exception occurred in:'+#13+#10+'mnuReadLogFolderClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
   end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.mnuReportOnly1Click(Sender: TObject);
begin
  try
    mnuReportOnly1.Checked := bReportonly;
//    fmoptmenu.ckCountonly.Checked := bReportonly;

  except on
   e : Exception do begin
    MessageDlg('The following exception occurred in:'+#13+#10+'mnuReportOnly1Click'+#13+#10+e.Message, mtWarning, [mbOK], 0);
   end;
  end;
end;

//------------------------------------------------------------------------------
procedure TfmLogDisplay.mnuHideDetailsClick(Sender: TObject);
begin
  try
//    btnMenu.Caption := 'Select option ..';
    fmlogdisplay.Constraints.MaxHeight := 11;
    fmlogdisplay.height                := fmlogdisplay.Constraints.MaxHeight;
    Timer.Enabled                      := true;
    mnuActiveClick(sender);
    exit;
  except on
   e : Exception do begin
    MessageDlg('The following exception occurred in:'+#13+#10+'mnuHideDetailsClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
   end;
  end;
end;

//------------------------------------------------------------------------------
procedure TfmLogDisplay.mnuOptionsClick(Sender: TObject);
var
  iType  : integer;
begin
  fmoptions.showModal;
   //[188]
  Settings            := TIniFile.Create(ExtractFilePath(application.exename)+'saslogdisp.ini');
  bColors             := Settings.ReadBool('Appr', 'Colors', bColors);
  bReportonly         := Settings.ReadBool('Appr', 'ReportOnly', bReportonly);
  itype               := Settings.ReadInteger('displayoption', 'display', integer(etDisplaytype) );
  Settings.Free ;

  mnuColorsOff.Checked         := bColors;
  mnuColorsOffClick(nil);

  if itype = 1 then begin
    fmLogDisplay.Show;
    fmViewselect.Hide;
  end else begin
    fmLogDisplay.Hide;
    fmoptmenu.Show;
  end;
end;

//------------------------------------------------------------------------------
procedure TfmLogDisplay.lbOtherlbClick(Sender: TObject);
begin
  try
  lbAllothClick(sender);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'lbOtherlbClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.lbAllothClick(Sender: TObject);
var
  bprob : boolean;
  m : TPoint;
begin
  try
    GetCursorPos(m);
    bprob := not LoadDetails(etalloth, lbOtherlb.Left, 0, m.y,0);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'lbAllothClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.lbConvNotesClick(Sender: TObject);
var
  bprob : boolean;
  m : TPoint;
begin
  try
    GetCursorPos(m);
    bprob := not LoadDetails(etConvert, lbConvNotes.Left, 0, m.y,0);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'lbConvNotesClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.lbCustomClick(Sender: TObject);
var
  bprob : boolean;
  m : TPoint;
begin
  try
    GetCursorPos(m);
    bprob := not LoadDetails(etCust, lbcustom.left, 0, m.y,0);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'lbuninitClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;

end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.lbDivsClick(Sender: TObject);
var
  bprob : boolean;
  m : TPoint;
begin
  try
    GetCursorPos(m);
    bprob := not LoadDetails(etDivs, lbDivs.left, 0, m.y,0);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'lbDivsClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.lbErrorClick(Sender: TObject);
var
  bprob : boolean;
  m : TPoint;
begin
  try
    GetCursorPos(m);
    bprob := not LoadDetails(etError, lbError.left, 0, m.y,0);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'lbErrorClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.lbInfoClick(Sender: TObject);
var
  bprob : boolean;
  m : TPoint;
begin
  try
    GetCursorPos(m);
    bprob := not LoadDetails(etInfo, lbInfo.left, 0, m.y,0);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'lbInfoClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------

procedure TfmLogDisplay.lbInvalidClick(Sender: TObject);
var
  bprob : boolean;
  m : TPoint;
begin
  try
    GetCursorPos(m);
    bprob := not LoadDetails(etInvalid, lbInvalid.left, 0, m.y,0);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'lbInvalidClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.lblastddClick(Sender: TObject);
var
  bprob : boolean;
  m : TPoint;
begin
  try
    GetCursorPos(m);
    bprob := not LoadDetails(etLast, lblastdd.Left, 0, m.y,0);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'lblastddClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.lbMergeClick(Sender: TObject);
var
  bprob : boolean;
  m : TPoint;
begin
  try
    GetCursorPos(m);
    bprob := not LoadDetails(etMerge, lbMerge.Left, 0, m.y,0);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'lbMergeClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.lbNotesClick(Sender: TObject);
var
  bprob : boolean;
  m : TPoint;
begin
  try
    GetCursorPos(m);
    bprob := not LoadDetails(etNotes, lbNotes.Left, 0, m.y,0);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'lbNotesClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.lbstatsMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  m : TPoint;
begin
 try
  GetCursorPos(m);
  lbstats.Hint := lbstats.Caption;
 except on
   e : Exception do begin
     MessageDlg('The following exception occurred in:'+#13+#10+'lbstatsMouseMove'+#13+#10+e.Message, mtWarning, [mbOK], 0);
   end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.mnuColorsOffClick(Sender: TObject);
begin
 try
  if not mnuColorsOff.Checked then begin
   bColors := false;
   mnuColorsOff.Checked := true;
   lbWarn.Color         := clWhite;
   lbCntWarn.Color      := clWhite;
   lbInfo.Color         := clWhite;
   lbCntInfo.Color      := clWhite;
   lbConvNotes.Color    := clWhite;
   lbCntConvNotes.Color := clWhite;
   lbError.Color        := clWhite;
   lbCntErr.Color       := clWhite;
   lbMerge.Color        := clWhite;
   lbCntMerge.Color     := clWhite;
   lbInvalid.Color      := clWhite;
   lbcntInvalid.Color   := clWhite;
   lbDivs.Color         := clWhite;
   lbDivzero.Color      := clWhite;
   lbuninit.Color       := clWhite;
   lbuninitcnt.Color    := clWhite;
   lbNotes.Color        := clWhite;
   lbcntnote.Color      := clWhite;
   lblastdd.Color       := clWhite;
   lbcustom.Color       := clWhite;
   lbCustcnt.Color      := clWhite;
   lbAlloth.Color       := clWhite;
   lbOtherlb.Color      := clWhite; //[133]

   lbWarn.Font.Color         := clNavy;
   lbCntWarn.Font.Color      := clNavy;
   lbInfo.Font.Color         := clNavy;
   lbCntInfo.Font.Color      := clNavy;
   lbConvNotes.Font.Color    := clNavy;
   lbCntConvNotes.Font.Color := clNavy;
   lbError.Font.Color        := clNavy;
   lbCntErr.Font.Color       := clNavy;
   lbMerge.Font.Color        := clNavy;
   lbCntMerge.Font.Color     := clNavy;
   lbInvalid.Font.Color      := clNavy;
   lbcntInvalid.Font.Color   := clNavy;
   lbDivs.Font.Color         := clNavy;
   lbDivzero.Font.Color      := clNavy;
   lbuninit.Font.Color       := clNavy;
   lbuninitcnt.Font.Color    := clNavy;
   lbNotes.Font.Color        := clNavy;
   lbcntnote.Font.Color      := clNavy;
   lblastdd.Font.Color       := clNavy;
   lbcustom.Font.Color       := clNavy;
   lbCustcnt.Font.Color      := clNavy;
   lbAlloth.Font.Color       := clNavy;
   lbOtherlb.Font.Color      := clNavy;//[133]



  end else begin
   mnuColorsOff.Checked := false;
   bColors := true;
   //$00004000
   //$00FBBB99
   //$00C080FF
   lbNotes.Color        := $00CC6600;
   lbcntnote.Color      := $00CC6600;
   lblastdd.Color       := $00CC6600;
   lbWarn.Color         := $00CC6600;
   lbCntWarn.Color      := $00CC6600;
   lbInfo.Color         := $00CC6600;
   lbCntInfo.Color      := $00CC6600;
   lbConvNotes.Color    := $00CC6600;
   lbCntConvNotes.Color := $00CC6600;
   lbError.Color        := $00B84791;
   lbCntErr.Color       := $00B84791;
   lbMerge.Color        := $00B84791;
   lbCntMerge.Color     := $00B84791;
   lbInvalid.Color      := $00B84791;
   lbcntInvalid.Color   := $00B84791;
   lbDivs.Color         := $00B84791;
   lbDivzero.Color      := $00B84791;
   lbuninit.Color       := $00B84791;
   lbuninitcnt.Color    := $00B84791;
   lbcustom.Color       := $00804000;
   lbCustcnt.Color      := $00804000;
   lbAlloth.Color       := $00804000;
   lbOtherlb.Color      := $00804000;//[133]

   lbWarn.Font.Color         := clWhite;
   lbCntWarn.Font.Color      := clWhite;
   lbInfo.Font.Color         := clWhite;
   lbCntInfo.Font.Color      := clWhite;
   lbConvNotes.Font.Color    := clWhite;
   lbCntConvNotes.Font.Color := clWhite;
   lbError.Font.Color        := clWhite;
   lbCntErr.Font.Color       := clWhite;
   lbMerge.Font.Color        := clWhite;
   lbCntMerge.Font.Color     := clWhite;
   lbInvalid.Font.Color      := clWhite;
   lbcntInvalid.Font.Color   := clWhite;
   lbDivs.Font.Color         := clWhite;
   lbDivzero.Font.Color      := clWhite;
   lbuninit.Font.Color       := clWhite;
   lbuninitcnt.Font.Color    := clWhite;
   lbNotes.Font.Color        := clWhite;
   lbcntnote.Font.Color      := clWhite;
   lblastdd.Font.Color       := clWhite;
   lbcustom.Font.Color       := clWhite;
   lbCustcnt.Font.Color      := clWhite;
   lbAlloth.Font.Color       := clWhite;
   lbOtherlb.Font.Color      := clWhite;//[133]



  end;
 except on
   e : Exception do begin
     MessageDlg('The following exception occurred in:'+#13+#10+'mnuColorsOffClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
   end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.mnuCountOnlyClick(Sender: TObject);
begin
  if mnuCountOnly.Checked then begin
    Setcountstatus(mnuCountOnly.Checked);
  end else begin
    Setcountstatus(mnuCountOnly.Checked);
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.Setcountstatus(bStatus : Boolean);
begin
  brdstat := bstatus;
end;
//------------------------------------------------------------------------------
function TfmLogDisplay.Getcountstatus : Boolean;
begin
  result := brdstat;
end;
//------------------------------------------------------------------------------
function  TfmLogDisplay.Builddisplaylist(str : Ansistring) : Ansistring;
begin
  result := str;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.lbTextMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  m : TPoint;
begin
 try
  GetCursorPos(m);
//  lbText.ShowHint := true;
//  lbText.Hint := lbText.Caption;
 except on
   e : Exception do begin
     MessageDlg('The following exception occurred in:'+#13+#10+'lbstatsMouseMove'+#13+#10+e.Message, mtWarning, [mbOK], 0);
   end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.lbuninitClick(Sender: TObject);
var
  bprob : boolean;
  m : TPoint;
begin
  try
    GetCursorPos(m);
    bprob := not LoadDetails(etUnint, lbuninit.left, 0, m.y,0);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'lbuninitClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------

procedure TfmLogDisplay.lbWarnClick(Sender: TObject);
var
  bprob : boolean;
  m : TPoint;
begin
  try
    GetCursorPos(m);
    bprob := not LoadDetails(etWarn, lbWarn.Left, 0, m.y,0);
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'lbWarnClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.btnMenuClick(Sender: TObject);
var
  x, y : integer;
  pt   : Tpoint;
begin
  GetCursorPos(pt);
//  ppMainMenu.Popup(pt.x, pt.y);
  ppMainMenu.Popup(0, 11);

end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.ReWNewDecodeLine(sType : Ansistring; asLine : Ansistring;
                                         iLine: Integer; iCodeLn : integer;
                                         bfolder : Boolean; fdet : Boolean = false);     //[129]
  procedure AddLine(sloc, sLine, asType : Ansistring; iLine, iCodeLn : Integer; bFolder: boolean);
  var
   icnt : integer;
  begin
    if asType <> '' then begin 
      inc(ifcnt);
      setlength(rcFlogs, ifcnt+1);
      rcFlogs[ifcnt].Logdest  := sloc;
      rcFlogs[ifcnt].Entry    := sline;
      rcFlogs[ifcnt].Folder   := ExtractFilePath(sloc);
      rcFlogs[ifcnt].Filename := ExtractFileName(sloc);
      rcFlogs[ifcnt].Types    := asType;
      rcFlogs[ifcnt].LineNr   := iLine+1;
    end;
  end;
var
  idx     : integer;
  icnt    : integer;
  asnLine : string;
  ip      : integer;
  sstr1   : String;
  iln     : integer;
  sStr3   : String;
  sTmp    : String;
  sStr    : String;
  icase   : integer;
begin
  try
    //Notes will be classified further since certain notes must be sorted out
        //Only go in if the line contains of the "approved" logs else just ignore it
        //there is no need to read the line any further
    icase := 0; //146
    stmp := sType;

    if (stmp = 'error') or (stmp = 'error:') or (stmp = 'warning') or (stmp = 'warning:')
       or (stmp = 'info') or (stmp = 'info:') then icase := 999 //[190]
    else if Pos('MERGE statement has more than one data set with repeats of BY values.', asLine) > 0 then icase := 1
    else if (Pos('Numeric values have been converted to character values', asLine) > 0) or
            (Pos('Character values have been converted to numeric values', asLine) > 0) then icase := 2
    else if Pos('Division by zero detected during the compilation phase', asLine) > 0 then icase := 3
    else if Pos(' is uninitialized', asLine) > 0 then icase := 4
    else if (Pos('The data set', asLine) > 0) or (Pos('Table', asLine) > 0) then icase := 5
    else if pos('At least one W.D format was too small for the number to be printed.', asline) > 0 then icase := 6
    else if (pos('Invalid', asline) > 0)  or (pos('NOTE 484-185', asLine) > 0) or (pos('NOTE 485-185', asLine) > 0) then icase := 7
    else if pos('::', asline) > 0 then icase := 8;

    case icase of
      1     : begin
                inc(imerge);
                if fdet then
                  AddLine(fLoc, asLine, 'Merge', iLine, iCodeLn, bfolder);
              end;
      2     : begin
                inc(iConvs);
                if fdet then
                  AddLine(fLoc, asLine, 'Conversion', iLine, iCodeLn, bfolder);
              end;
      3     : begin
                  inc(iDivs);
                if fdet then
                  AddLine(fLoc, asLine, 'Division', iLine, iCodeLn, bfolder);
              end;
      4     : begin
                inc(iUnint);
                if fdet then
                  AddLine(fLoc, asLine, 'Uninitialized', iLine, iCodeLn, bfolder);
              end;
      5     : begin
                idx := Pos('The data set', asLine);
                if idx <> 0 then begin
                  if not bfolder then begin
                    asnLine := copy(asLine, 19, length(asLine));
                    ip     := pos('observations', asNline);
                    sstr1  := copy(asnline,1,ip+12);
                    sstr1  := ReplaceStr(sstr1,'observations','obs');
                    AddLine(fLoc, sstr1, 'LAST', iLine, iCodeLn, bfolder);
                    inc(icnt);
                  end;//if not bfolder
                end else begin //[120]
                  idx := Pos('Table', asline);
                  if idx <> 0 then begin
                    idx := Pos('created, with', asline);
                    if idx <> 0  then begin
                      if not bfolder then begin
                        sstr3   := copy(asLine, Pos('Table', asline)+5, length(asline) );
                        sstr1   := copy(sstr3, 1, Pos('created, with', asline)-12 );
                        idx     := Pos('rows and ',sstr3);
                        sstr3   := copy(sstr3, Pos('created, with', sstr3)+13, length(sstr3));
                        asnline := 'Table '+ sstr1 + ' has '+copy(sstr3, 1, Pos('rows and ',sstr3)-1)+ 'obs';
                        AddLine(fLoc, asnLine, 'LAST', iLine, iCodeLn, bfolder);
                        inc(icnt);
                      end;
                    end;
                  end;
                end;
              end;
      6     : begin
                inc(iAlloth);
                if fdet then
                    AddLine(fLoc, asLine, 'AllOth', iLine, iCodeLn, bfolder);
              end;
      7     : begin
//                if (pos('NOTE 484-185', asLine) > 0) or (pos('NOTE 485-185', asLine) > 0) then begin
                inc(iInv);
                if fdet then
                   AddLine(fLoc, asLine, 'Invalid', iLine, iCodeLn, bfolder);
              end;
      8     : begin
                inc(icust);
                if fdet then
                  AddLine(fLoc, asLine, 'Cust', iLine, iCodeLn, bfolder);
              end;
      else    begin
                if (stmp = 'note:') then begin
                  inc(inote);
                  if fdet then
                    if not bfolder then begin
                      AddLine(fLoc, asLine, 'NOTE', iLine, iCodeLn, bfolder);
                    end;
                end else
                if (stmp = 'info:') then begin
                  inc(iinfo);
                  if fdet then
                    AddLine(fLoc, asLine, 'Info', iLine, iCodeLn, bfolder);
                end else
                if (stmp = 'error:') or (stmp = 'error') then begin
//                if pos('error', stmp) > 0 then begin
                    inc(ierr);
                    if fdet then
                      AddLine(fLoc, asLine, 'Error', iLine, iCodeLn, bfolder);
                end else begin
                  if (stmp = 'warning:') or (stmp = 'warning') then  begin
//                  if pos('warning', stmp) > 0 then
                    if (pos('The Base Product product with which', asline) = 0) and
                       (pos('Your system is scheduled to expire on', asline) = 0) then begin //[127]
                       if (pos('Unable to copy SASUSER registry to', asline) > 0) then begin //[192]
                         inc(iAlloth);
                         if fdet then
                           AddLine(fLoc, asLine, 'AllOth', iLine, iCodeLn, bfolder);
                       end else begin
                         inc(iwarn);
                         if fdet then
                          AddLine(fLoc, asLine, 'Warning', iLine, iCodeLn, bfolder);
                       end;
                    end;
                  end;
                end;
             end;
      end;//case else
//    end;//case
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'NewDecodeLine'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.FilterbyType(etType : etLoad);
var
//  rc1flogs : array of Tloginfo;
  rc1flogs : Tloginfo;
  icol     : integer;
  asFilt   : AnsiString;
begin
  try
    if etType = etNotes        then asFilt := 'NOTE'
    else if etType = etCust    then asFilt := 'Cust'
    else if etType = etalloth  then asFilt := 'AllOth'
    else if etType = etError   then asFilt := 'Error'
    else if etType = etWarn    then asFilt := 'Warning'
    else if etType = etInfo    then asFilt := 'Info'
    else if etType = etUnint   then asFilt := 'Uninitialized'
    else if etType = etConvert then asFilt := 'Conversion'
    else if etType = etMerge   then asFilt := 'Merge'
    else if etType = etInvalid then asFilt := 'Invalid'
    else if etType = etDivs    then asFilt := 'Division'
    else if etType = etLast    then asFilt := 'LAST';

    fmDetails.sgDetails.RowCount       := 1;

    assignfile(flogs, aploc+'logs.dat');
    reset(flogs);
    icol := 1;
    try
      fmDetails.pgLoad.Max := filesize(flogs);
      fmDetails.Visible    := true;
      while not EOF(flogs) do begin
//        setlength(rc1flogs, icol+1);
//        Seek(flogs, icol);
//        read(flogs, rc1Flogs[icol]);
        read(flogs, rc1Flogs);
        if rc1flogs.types <> '' then begin
          if (rc1flogs.Types = asFilt) then begin

            fmDetails.sgDetails.RowCount       := fmDetails.sgDetails.RowCount + 1;//icol;
            fmDetails.sgDetails.Cells[0, icol] := Inttostr(rc1Flogs.LineNr);
            fmDetails.sgDetails.Cells[1, icol] := rc1Flogs.entry;
  //          fmDetails.sgDetails.Cells[0, icol] := Inttostr(rc1Flogs[icol].LineNr);
  //          fmDetails.sgDetails.Cells[1, icol] := rc1Flogs[icol].entry;
            inc(icol);
          end;
        end;
        fmDetails.pgLoad.StepBy(1);
        if icol mod 150 = 0 then  begin
          application.ProcessMessages;
        end;
      end;
//      showmessage(inttostr(icol) );
    finally
      if icol > 1 then
        fmDetails.sgDetails.FixedRows    := 1;

      closefile(flogs);
      fillchar(rc1flogs, 0,0); //[187]

    end;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'FilterbyType'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
function  TfmLogDisplay.LoadDetails(etType : etLoad;
                        ileft, iright, itop, ibottom : integer) : boolean;
var
  asStr : Ansistring;
begin
  try
    Timer.Enabled := false;
//    fmDetails.rcDetails.Lines.Clear;
    FilterbyType(etType);

    etLastLoad    := etType;
    ilstleft      := ileft;
    ilstright     := iright;
    ilsttop       := itop;
    ilstbottom    := ibottom;

    if etType = etNotes then begin
      fmDetails.display(ileft, iright ,itop+1, ibottom, asStr, 'Notes found');
    end else
    if etType = etError then begin
      fmDetails.display(ileft, iright ,itop+1, ibottom, asStr, 'Errors found');
    end else
    if etType = etWarn then begin
      fmDetails.display(ileft, iright ,itop+1, ibottom, asStr, 'Warnings found');
    end else
    if etType = etInfo then begin
      fmDetails.display(ileft, iright ,itop+1, ibottom, asStr, 'Info found');
    end else
    if etType = etUnint then begin
      fmDetails.display(ileft, iright ,itop+1, ibottom, asStr, 'Uninitialized variables found');
    end else
    if etType = etConvert then begin
      fmDetails.display(ileft, iright ,itop+1, ibottom, asStr, 'Conversion found');
    end else
    if etType = etMerge then begin
      fmDetails.display(ileft, iright ,itop+1, ibottom, asStr, 'Merge Statement notes found');
    end else
    if etType = etInvalid then begin
      fmDetails.display(ileft, iright ,itop+1, ibottom, asStr, 'Invalid entries found');
    end else
    if etType = etLast then begin
      fmDetails.display(ileft, iright ,itop+1, ibottom, asStr, 'Data Sets Found');
    end else
    if etType = etDivs then begin
      fmDetails.display(ileft, iright ,itop+1, ibottom, asStr, 'Division by Zero');
    end else
    if etType = etCust then begin
      fmDetails.display(ileft, iright ,itop+1, ibottom, asStr, 'Customized  Logs');
    end else
    if etType = etalloth then begin
      fmDetails.display(ileft, iright ,itop+1, ibottom, asStr, 'All Other Notes that can cause problems');
    end;
    
    Timer.Enabled := true;
    result := true;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'LoadDetails'+#13+#10+e.Message, mtWarning, [mbOK], 0);
      result := false;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.lightshandle(bRead : boolean);
begin
  try
    if bRead then begin
      pnlon.Color := clLime;
      pnlOff.Color := $00E8E8FF;
    end else begin;
      pnlon.Color := $002E5B00;
      pnlOff.Color := clRed;
    end;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'Lightshandle'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
function  TfmLogDisplay.GetLogstatus : Boolean;
begin
  try
    result := bChangeLog;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'GetLogstatus'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.SetLogstatus(bChange : Boolean);
begin
  try
    bChangeLog := bChange;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'SetLogstatus'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
function  TfmLogDisplay.GetNotes : integer;
begin
  result := iNote;
end;
//------------------------------------------------------------------------------
function  TfmLogDisplay.GetWarns : integer;
begin
  result := iWarn;
end;
//------------------------------------------------------------------------------
function  TfmLogDisplay.GetConv  : integer;
begin
  result := iConvs

end;
//------------------------------------------------------------------------------
function  TfmLogDisplay.GetUninit: integer;
begin
  result := iUnint;
end;
//------------------------------------------------------------------------------
function  TfmLogDisplay.GetDivs  : integer;
begin
  result := iDivs;
end;
//------------------------------------------------------------------------------
function  TfmLogDisplay.GetMerge : integer;
begin
  result := imerge;
end;
//------------------------------------------------------------------------------
function  TfmLogDisplay.GetInvald : integer;
begin
  result := iInv;
end;
//------------------------------------------------------------------------------
function  TfmLogDisplay.GetError : integer;
begin
  result := ierr;
end;
//------------------------------------------------------------------------------
function  TfmLogDisplay.GetInfo : integer;
begin
  result := iinfo;
end;
//------------------------------------------------------------------------------
function  TfmLogDisplay.GetCust : integer;
begin
  result := iCust;
end;
//------------------------------------------------------------------------------
function  TfmLogDisplay.Getalloth : integer;
begin
  result := iAlloth;
end;
//------------------------------------------------------------------------------
function  TfmLogDisplay.GetLogfmt : boolean;
begin
  result := bfmtLog;
end;
//------------------------------------------------------------------------------
function  TfmLogDisplay.DisableCntrls(bEnable : boolean) : boolean;
begin
  if bBusy then begin
   bEnable := false;
  end;
  lbWarn.Enabled         := bEnable;
  lbCntWarn.Enabled      := bEnable;
  lbInfo.Enabled         := bEnable;
  lbCntInfo.Enabled      := bEnable;
  lbConvNotes.Enabled    := bEnable;
  lbCntConvNotes.Enabled := bEnable;
  lbError.Enabled        := bEnable;
  lbCntErr.Enabled       := bEnable;
  lbMerge.Enabled        := bEnable;
  lbCntMerge.Enabled     := bEnable;
  lbInvalid.Enabled      := bEnable;
  lbcntInvalid.Enabled   := bEnable;
  lbDivs.Enabled         := bEnable;
  lbDivzero.Enabled      := bEnable;
  lbuninit.Enabled       := bEnable;
  lbuninitcnt.Enabled    := bEnable;
  lbCustom.Enabled       := bEnable;
  lbCustcnt.Enabled      := bEnable;
  lblastdd.Enabled       := bEnable; //[112]
  lbAlloth.Enabled       := bEnable;
  lbOtherlb.Enabled      := bEnable;//[133]
  lbNotes.Enabled        := bEnable;
  lbcntnote.Enabled      := bEnable;
//  spbMenu.Enabled        := bEnable;
end;
//------------------------------------------------------------------------------
procedure TfmLogDisplay.Setlabelcolors;
begin
  try
    if iwarn > 0 then
      lbCntWarn.Color      := clGray;
    if iinfo > 0 then
      lbCntInfo.Color      := clGray;
    if iConvs > 0 then
      lbCntConvNotes.Color := clGray;
    if ierr > 0 then
      lbCntErr.Color       := clGray;
    if imerge > 0 then
      lbCntMerge.Color     := clGray;
    if iInv > 0 then
      lbcntInvalid.Color   := clGray;
    if inote > 0 then
      lbcntnote.Color      := clGray;
    if iDivs > 0 then
      lbDivzero.Color      := clGray;
    if iUnint > 0 then
      lbuninitcnt.Color    := clGray;
    if iAlloth > 0 then
      lbAlloth.Color       := clGray;
    if icust > 0 then
      lbCustcnt.Color      := clGray;
      
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'Setlabelcolors'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
end.

