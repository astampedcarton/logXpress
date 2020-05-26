unit uLogFileRead;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, StrUtils_d7, uUserTypes_d7,
  ads_strg, uLogRead, ComCtrls, dialogs,  ads_date, Strutils, StdCtrls, inifiles;

type

  TLogFileRead = class(Tobject)
  private
    //Get and Set method are needed for all these
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
    iCust,
    imissvalue,
    irepbyval,
    imathop,
    inoobsdata,
    iindataempt,
    inobystate,
    iusrdef,
    iannotate    : Integer;
    icnt     : Integer;
    asStr    : ansiString;
    sdtstat  : ansiString;
    sreadstat: ansiString;
    tmpfloc  : ansiString;
    bbusy    : boolean;

    //internal use only
    ifcnt    : integer;
    rcFlogs  : array of Tloginfo;
    floc     : string;
    asaploc  : ansistring;
    progresb : Tprogressbar;
    lbStatus : TLabel;
    bdetail  : boolean;
    dtCurr,
    dtlast   : TDatetime;
    asTM     : Ansistring;
    bStop    : boolean;
    bReport  : boolean;
    asLstRead: AnsiString;

    arRules  : Array of Rulesets;
    rcRules  : Rulesets;
    Rules   : Tinifile;

    procedure setCntWarn(icnt : integer);
    procedure setCntInfo(icnt : integer);
    procedure setConvNotescnt(icnt : integer);
    procedure setCntErr(icnt : integer);
    procedure setCntMerge(icnt : integer);
    procedure setcntInvalid(icnt : integer);
    procedure setDivzero(icnt : integer);
    procedure setuninitcnt(icnt : integer);
    procedure setcntnote(icnt : integer);
    procedure setCustcnt(icnt : integer);
    procedure setAlloth(icnt : integer);
    procedure setmissvalue(icnt    : integer);
    procedure setrepbyval(icnt     : integer);
    procedure setmathop(icnt       : integer);
    procedure setnoobsdata(icnt    : integer);
    procedure setnobystate(icnt    : integer);
    procedure setlastdd(asval : ansistring);
    procedure setbusy(bval : boolean);
    procedure setlastreadtime(asStr : AnsiString);
    procedure setindataempt(icnt    : integer);
    procedure setiannotate(icnt    : integer);
    procedure setusrdef(icnt    : integer);

{    procedure setmissvalue(icnt : integer);
    procedure setrepbyval(icnt  : integer);
    procedure setmathop(icnt    : integer);
    procedure setnoobsdata(icnt : integer);
    procedure setnobystate(icnt : integer);  }

    procedure DecodeLine(sType : Ansistring; asLine : Ansistring; iLine: Integer;
                         iCodeLn : integer; bfolder : Boolean; fdet : Boolean = false);
    procedure setfileloc(asfloc : ansistring);
    function populatefile(bfolder : boolean; breportonly: boolean; pgbar : Tprogressbar) : boolean;
    procedure LoadRules;
  public
    constructor create(aploc : ansistring; asFileloc : ansistring; bfdet : boolean; pgrbar : Tprogressbar; lStat : Tlabel); overload;
	  destructor destroy; override;
    function ReadLogfile(bFolder : Boolean; asFileloc : ansistring; bfdet : boolean; breportonly: boolean; bforce : Boolean=false) : Boolean;
    function getcntwarn      : integer;
    function getcntinfo      : integer;
    function getconvnotescnt : integer;
    function getcnterr       : integer;
    function getcntmerge     : integer;
    function getcntinvalid   : integer;
    function getdivzero      : integer;
    function getuninitcnt    : integer;
    function getcntnote      : integer;
    function getcustcnt      : integer;
    function getalloth       : integer;
    function getlastdd       : ansistring;
    function getbusy         : boolean;
    function getfileloc      : ansistring;
    function ClearCounters   : boolean;
    function getlastreadtime : AnsiString;
    function getmissvalue    : integer;
    function getrepbyval     : integer;
    function getmathop       : integer;
    function getnoobsdata    : integer;
    function getnobystate    : integer;
    function getindataempt   : integer;
    function getiannotate    : integer;
    function getusrdef       : integer;
    function finalstatus     : integer;
    function Printchecks     : Tstringlist;
end;

var
  logfileread : TLogFileRead;
  flogs       : file of Tloginfo;

const
  ss_checks   : array[1..22] of string =
             (  'error',
                'warning',
                'info',
                'the data set',
                'table',
                'numeric values have been converted to character values',
                'character values have been converted to numeric values',
                'is uninitialized',
                'invalid',
                'note 484-185',
                'note 485-185',
                'merge statement has more than one data set with repeats of by values.',
                'division by zero detected during the compilation phase',
                'at least one w.d format was too small for the number to be printed.',
                'missing values were generated',
                'repeats of BY values',
                'mathematical operations could not',
                'no observations in data set',
                'Input data set is empty',
                'no by statement for preceding merge statement',
                'problem in observation',
                'calculated coordinate lies outside the visible area');

  ss_mod  = 1000;

implementation


//-------------------------------------------------------------------------------------------------------------------
constructor TLogFileRead.create(aploc : ansistring; asFileloc : ansistring; bfdet : boolean; pgrbar : Tprogressbar; lStat : Tlabel);
begin
  inherited Create;             // Call TObject.Create.
  asaploc  := aploc;
  floc     := asFileloc;
  bdetail  := bfdet;
  progresb := pgrbar;
  lbstatus := lstat;

  LoadRules;

end;
//-------------------------------------------------------------------------------------------------------------------
destructor TLogFileRead.destroy;
begin

  inherited Destroy;
end;
//-------------------------------------------------------------------------------------------------------------------
procedure TlogFileRead.setCntWarn(icnt : integer);
begin
  try
    iwarn      := icnt;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.setCntWarn'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      iWarn    := -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
procedure TlogFileRead.setCntInfo(icnt : integer);
begin
  try
    iinfo      := icnt;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.setCntInfo'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      iinfo    := -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
procedure TlogFileRead.setConvNotescnt(icnt : integer);
begin
  try
    iConvs    := icnt;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.setConvNotescnt'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      iconvs  := -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
procedure TlogFileRead.setCntErr(icnt : integer);
begin
  try
    ierr     := icnt;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.setCntErr'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      ierr  := -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
procedure TlogFileRead.setCntMerge(icnt : integer);
begin
  try
    imerge  := icnt;
  except on
    e : exception do begin
       MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.setCntMerge'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      imerge  := -1;
   end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
procedure TlogFileRead.setcntInvalid(icnt : integer);
begin
  try
    iInv   := icnt;
  except on
    e : exception do begin
       MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.setcntInvalid'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      iinv := -1;
   end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
procedure TlogFileRead.setDivzero(icnt : integer);
begin
  try
    iDivs := icnt;
  except on
    e : exception do begin
       MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.setDivzero'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      iDivs := -1;
   end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
procedure TlogFileRead.setuninitcnt(icnt : integer);
begin
  try
    iUnint  := icnt;
  except on
    e : exception do begin
       MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.setuninitcnt'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      iUnint := -1;
   end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
procedure TlogFileRead.setcntnote(icnt : integer);
begin
  try
    inote  := icnt;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.setcntnote'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      inote := -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
procedure TlogFileRead.setCustcnt(icnt : integer);
begin
  try
    iCust    := icnt;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.setCustcnt'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      iCust := -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
procedure TlogFileRead.setAlloth(icnt : integer);
begin
  try
    iAlloth := icnt;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.setAlloth'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      ialloth := -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
procedure TlogFileRead.setlastdd(asval : ansistring);
begin
  try
    asStr := asVal;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.setlastdd'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      asStr :=  'ERROR IN APPLICATIO';
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
procedure TlogFileRead.setbusy(bval : boolean);
begin
  try
    bbusy := bval;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.setlastdd'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      bbusy :=  false;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
procedure TlogFileRead.setfileloc(asfloc : ansistring);
begin
  try
    floc := asfloc;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.setlastdd'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      bbusy :=  false;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
procedure TlogFileRead.setmissvalue(icnt    : integer);
begin
  try
    imissvalue     := icnt;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.setmissvalue'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      ierr  := -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
procedure TlogFileRead.setrepbyval(icnt     : integer);
begin
  try
    irepbyval     := icnt;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.setrepbyval'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      ierr  := -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
procedure TlogFileRead.setmathop(icnt       : integer);
begin
  try
    imathop     := icnt;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.setmathop'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      ierr  := -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
procedure TlogFileRead.setnoobsdata(icnt    : integer);
begin
  try
    inoobsdata     := icnt;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.setnoobsdata'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      ierr  := -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
procedure TlogFileRead.setnobystate(icnt    : integer);
begin
  try
    inobystate     := icnt;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.setnobystate'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      ierr  := -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
procedure TlogFileRead.setindataempt(icnt    : integer);
begin
  try
    iindataempt     := icnt;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.setindataempt'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      ierr  := -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
procedure TlogFileRead.setiannotate(icnt    : integer);
begin
  try
    iannotate     := icnt;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.setiannotate'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      ierr  := -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
procedure TlogFileRead.setusrdef(icnt    : integer);
begin
  try
    iusrdef     := icnt;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.setusrdef'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      ierr  := -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
function TlogfileRead.getcntwarn      : integer;
begin
  try
    result := iwarn;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.getcntwarn'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      result :=  -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
function TlogfileRead.getcntinfo      : integer;
begin
  try
    result := iinfo;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.getcntinfo'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      result :=  -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
function TlogfileRead.getconvnotescnt : integer;
begin
  try
    result := iConvs;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.getconvnotescnt'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      result :=  -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
function TlogfileRead.getcnterr       : integer;
begin
  try
    result := ierr;
  except on
    e : exception do begin
       MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.getcnterr'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
        result :=  -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
function TlogfileRead.getcntmerge     : integer;
begin
  try
    result := imerge;
  except on
    e : exception do begin
       MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.getcntmerge'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
       result :=  -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
function TlogfileRead.getcntinvalid   : integer;
begin
  try
    result := iInv;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.getcntinvalid'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      result :=  -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
function TlogfileRead.getdivzero      : integer;
begin
  try
    result := iDivs;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.getdivzero'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      result :=  -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
function TlogfileRead.getuninitcnt    : integer;
begin
  try
    result := iUnint;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.getuninitcnt'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      result :=  -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
function TlogfileRead.getcntnote      : integer;
begin
  try
    result := inote;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.getcntnote'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      result :=  -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
function TlogfileRead.getcustcnt      : integer;
begin
  try
    result := icust;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.getcustcnt'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      result :=  -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
function TlogfileRead.getalloth       : integer;
begin
  try
    result := ialloth;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.getalloth'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      result :=  -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
function TlogfileRead.getlastdd       : ansistring;
begin
  try
    result := asStr;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.getlastdd'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      result := 'Exception in Program';
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
function TlogfileRead.getbusy         : boolean;
begin
  try
    result := bbusy;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.getbusy'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      result := false;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
function TlogfileRead.getfileloc         : ansistring;
begin
  try
    result := floc;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.setfileloc'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      result := '';
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
function TLogFileRead.getmissvalue    : integer;
begin
  try
    result := imissvalue;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.getmissvalue'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      result := -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
function TLogFileRead.getrepbyval     : integer;
begin
  try
    result := irepbyval;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.getrepbyval'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      result := -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
function TLogFileRead.getmathop       : integer;
begin
  try
    result := imathop;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.getmathop'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      result := -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
function TLogFileRead.getnoobsdata    : integer;
begin
  try
    result := inoobsdata;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.getnoobsdata'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      result := -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
function TLogFileRead.getnobystate    : integer;
begin
  try
    result := inobystate;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.getnobystate'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      result := -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
function TlogFileRead.getindataempt   : integer;
begin
  try
    result := iindataempt;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.getindataempt'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      result  := -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
function TlogFileRead.getiannotate   : integer;
begin
  try
    result := iannotate;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.getiannotate'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      result  := -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
function TlogFileRead.getusrdef   : integer;
begin
  try
    result := iusrdef;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.getusrdef'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      result  := -1;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
function TLogFileRead.ReadLogfile(bFolder : Boolean; asFileloc : ansistring; bfdet : boolean; breportonly: boolean; bforce : Boolean=false) : Boolean;
var
// ffile      : TextFile;
 bCont      : Boolean;
 asLine     : Ansistring;
// sDisp      : Ansistring;
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
// fsize      : integer;
// locfile    : File;
 tval       : string;
// buf        : Ansistring;
 slline     : Tstringlist;
// bCapdetail : boolean;
 dtbk       : TDatetime;
 bread      : boolean;
 stmpfile   : Ansistring;
 dtacc      : Tdatetime;
 ipos       : integer;
 dtmcnt     : Double;
begin
 try
  iLine := 0;
  icode := 0;
  iprev := -1;
//  fsize := 0;
  bRead := false;
  ifcnt := 1;

     fillchar(rcFlogs, sizeof(rcFlogs), 0);

  floc     := asFileloc;

  if isnotempty(floc) then begin
    dtbk    := dtCurr;

    if (ContainsText(lowercase(floc), '[ filedate :')) then begin  //[B 1]
      iPos := Pos('[ Filedate :', floc);
      floc := Copy(floc, 0, ipos-1);
    end;
    dtCurr  := LastModified(floc);
    sdtstat := DateTimeToStr(dtLast)+' ['+asTM+']';

//    if (dtLast <> dtCurr) or (bForce) or (bfolder) then begin
//      sDisp      := '';
      dtLast     := dtCurr;

      if not bfolder then begin
        if not ClearCounters then
          MessageDlg('Failed to clear counters.', mtError, [mbOK], 0);
      end;

      bCont := false;

      tmpFloc := floc;
      if not bCont then begin //File is not in use
        try
          fstream := TFileStream.Create(floc, fmOpenRead or fmShareDenyNone);
          setbusy(true);
          bRead   := true;
          bstop   := false;

          sreadstat  := 'Reading information....Busy';

          breport    := false;

          sreadstat  := 'Refreshing counter...';

          slline       := TStringlist.Create;
          slline.LoadFromStream(fstream);
          iline        := 1;
          dtst         := Now;
          ilinecnt     := slline.Count;
          progresb.Max := ilinecnt;

          for iline := 0 to ilinecnt-1 do begin
            if bstop then break;

//            sreadstat := 'Reading line: '+Inttostr(iLine)+' of '+Inttostr(slline.Count-1);
            asline := slline.Strings[iline];
            tval := lowercase(copy(asline, 1, 1));
            if (slline.Strings[iline] <> ' ') or ((copy(asline, 1, idx-1)) <> ' ') then begin
              if (tval = 'n' ) or (tval = 'i' )  or (tval = 'e' )  or (tval = 'w' )  then begin //[129]
                idx  := pos(' ',asLine);  //[101]
                stmp := lowercase(copy(asline, 1, idx-1));
                stmp := ReplaceStr(stmp, ':',''); //[B 29]

                //Notes will be classified further since certain notes must be sorted out
(*                if (stmp = 'note:') or (stmp = 'note::') or (stmp = 'note') or
                   (stmp = 'info:') or (stmp = 'info::') or
                   (stmp = 'error:') or (stmp = 'error::') or (stmp = 'error') or
                   (stmp = 'warning:') or (stmp = 'warning::')  or (stmp = 'warning') then begin  *)
                if (stmp = 'note') or (stmp = 'info') or (stmp = 'error') or (stmp = 'error') or (stmp = 'warning') then begin
                    //Only go in if the line contains of the "approved" logs else just ignore it
                    //there is no need to read the line any further
                    DecodeLine(sTmp, asLine, iLine, icode, bfolder, true);
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

            if iline mod ss_mod = 0 then  begin
              setCntWarn(iwarn);
              setCntInfo(iinfo);
              setConvNotescnt(iConvs);
              setCntErr(ierr);
              setCntMerge(imerge);
              setcntInvalid(iInv);
              setDivzero(iDivs);
              setuninitcnt(iUnint);
              setcntnote(inote);
              setCustcnt(icust);
              setAlloth(ialloth);
              setmissvalue(imissvalue);
              setrepbyval(irepbyval);
              setmathop(imathop);
              setnoobsdata(inoobsdata);
              setnobystate(inobystate);
              setusrdef(iusrdef);
              progresb.StepIt;
              application.ProcessMessages;
            end;
          end;//for

          inc(icnt);

           if (iwarn > 0) or (ierr > 0) or (imerge > 0) or
              (iInv > 0) or (iDivs > 0) or (iUnint > 0) or (iCust > 0) or (iAllOth > 0) then
             bReport := true
           else
             bReport := false;
        finally
          if not bRead then begin;
            dtCurr := dtbk;
          end;
        end;
      end;//if bcont

    //Update Counter;
     dten := Now;
//
      //[C1]
      setCntWarn(iwarn);
      setCntInfo(iinfo);
      setConvNotescnt(iConvs);
      setCntErr(ierr);
      setCntMerge(imerge);
      setcntInvalid(iInv);
      setDivzero(iDivs);
      setuninitcnt(iUnint);
      setcntnote(inote);
      setCustcnt(icust);
      setAlloth(ialloth);
      setmissvalue(imissvalue);
      setrepbyval(irepbyval);
      setmathop(imathop);
      setnoobsdata(inoobsdata);
      setnobystate(inobystate);
      setusrdef(iusrdef);
      progresb.StepIt;
      application.ProcessMessages;

     if bstop then begin //115
       if TimeDeltaInSeconds(dtst, dten) = 0 then begin
         asTM := IntToStr(iline) +' Lines read in ' + FLoatToStr(TimeDeltaInMSeconds(dtst, dten))+'ms' //[B 20]
       end else begin
         asTM := IntToStr(iline) +' Lines read in ' + FLoatToStr(TimeDeltaInSeconds(dtst, dten))+'s'
       end;
     end else begin
       if TimeDeltaInSeconds(dtst, dten) = 0 then begin
         asTM := IntToStr(slline.Count) +' Lines read in ' + FLoatToStr(TimeDeltaInMSeconds(dtst, dten))+'ms';//[B 20]
       end else begin
         asTM := IntToStr(slline.Count) +' Lines read in ' + FLoatToStr(TimeDeltaInSeconds(dtst, dten))+'s';//[108]
       end;
     end;

    if Assigned(lbStatus) then
      lbstatus.caption := sreadstat+ #13#10 + asTm;

    //Populate the File
    sreadstat := 'Populating File...';

      if not populatefile(bfolder, breportonly, progresb) then begin
        MessageDlg('The populating of the file failed!', mtWarning, [mbOK], 0);
      end else begin
        dten := Now;
        if TimeDeltaInSeconds(dtst, dten) = 0 then begin
          lbstatus.caption := asTM + #13#10 +' All done in : ' + FLoatToStr(TimeDeltaInMSeconds(dtst, dten))+'ms';//[B 20]
        end else begin
          lbstatus.caption := asTM + #13#10 +' All done in : ' + FLoatToStr(TimeDeltaInSeconds(dtst, dten))+'s';//[108]
        end;
      end;
//    end;//if (dtLast <> dtCurr) or (bForce) or (bfolder) then begin
  end;//if isnotempty(floc)

  setlastreadtime(DateTimeToStr(now));
  setbusy(false);
  application.ProcessMessages;
  FreeAndnil(fstream);
  FreeAndnil(slline);

 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'ReadLogfile'+#13+#10+e.Message+#13+#10+
                 floc, mtWarning, [mbOK], 0);

      setlength(rcFlogs,1);
      setbusy(false);
      FreeAndNil(slline);
      FreeAndnil(fstream);
    end;
 end;
end;

//-------------------------------------------------------------------------------------------------------------------
function TLogFileRead.Populatefile(bfolder : boolean; breportonly : Boolean; pgbar : Tprogressbar) : boolean;
var
  ic        : integer;
  stmpfile  : ansistring;
begin
  try
    try
      ic := 0;
      if high(rcFlogs) >= 0  then begin ;  //[182]
        pgBar.Max := high(rcFlogs);
      end else begin
        pgBar.Max := 0;
      end;

      pgBar.Position := 0;

//      application.ProcessMessages;

      if bfolder then begin
        AssignFile(ffollogs, asaploc+'follogs.dat') ;

        reset(ffollogs);
        seek(ffollogs, fileSize(ffollogs));
        for ic := 1 to high(rcFlogs) do begin
          if rcFlogs[ic].Types <> '' then begin
//            stmpfile := rcflogs[ic].Filename;
            write(ffollogs, rcFlogs[ic]);
          end;
          if ic mod ss_mod = 0 then  begin
            pgBar.Position := (ic);
            application.ProcessMessages;
          end;
        end;
//        pgBar.Position := (ic);
//        application.ProcessMessages;
      end else
      if (breportonly) then begin
        AssignFile(flogs,asaploc+'logs.dat') ;
        rewrite(flogs);
        for ic := 1 to high(rcFlogs) do begin
          if rcFlogs[ic].Types <> '' then begin
            write(flogs, rcFlogs[ic]);
            if rcFlogs[ic].Types = 'LAST' then begin
              asStr := rcFlogs[ic].Entry;
            end;
          end;
          if ic mod ss_mod = 0 then  begin
            pgBar.Position := (ic);
            application.ProcessMessages;
          end;
        end;
      end;
      pgBar.Position := (ic);
      application.ProcessMessages;
    finally
//      pgBar.Hide;
      if bfolder then begin
        if high(rcFlogs) > 0 then
          closefile(ffollogs);
      end else begin
       if breportonly then begin
        if high(rcFlogs) > 0 then
           closefile(flogs);
       end;
      end;
    end;

  //clear the array record;
  setlength(rcFlogs,1);
  fillchar(rcFlogs, sizeof(rcFlogs), 0);

  //Refresh the Extra Display information Screen
  { if etlastload <> etNone then begin
    if fmDetails.Visible then begin
      if not LoadDetails(etLastLoad, ilstleft, ilstright,
                     ilsttop, ilstbottom) then
         MessageDlg('Could not refresh the details information. .'+#13#10+
                    'Clicking on it again will solve the problem' , mtWarning, [mbOK], 0);
    end;
  end; }

  setlastdd(asStr);
  application.ProcessMessages;

{  if fmLogFile.Visible then begin
    fmlogfile.rcLines.Lines.LoadFromStream(fstream);
    fmlogfile.Performformat(fmLogDisplay.GetTmpfileloc);
    fmLogfile.Caption := 'Info on Log file read from '+floc;
    fmLogfile.Show;
    //[122]
    fmLogfile.rcLines.SelStart  := fmLogfile.rcLines.Perform(EM_LINEINDEX, fmLogfile.rcLines.Lines.Count, 0);
    fmLogfile.rcLines.SelLength := fmLogfile.rcLines.Lines.Count;
    fmLogfile.rcLines.SetFocus;
  end; }


  result := true;
  except on
    e : exception do begin
       result := false;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
procedure TLogFileRead.DecodeLine(sType : Ansistring; asLine : Ansistring;
                                   iLine: Integer; iCodeLn : integer;
                                   bfolder : Boolean; fdet : Boolean = false);
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
  idx2    : integer;
  icnt,jcnt    : integer;
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
    icase := 0;
    stmp := sType;

    {if (stmp = 'error') or (stmp = 'error:') or (stmp = 'warning') or (stmp = 'warning:')
       or (stmp = 'info') or (stmp = 'info:') then icase := 999 //[190]
    else if Pos('MERGE statement has more than one data set with repeats of BY values.', asLine) > 0 then icase := 1
    else if (Pos('Numeric values have been converted to character values', asLine) > 0) or
            (Pos('Character values have been converted to numeric values', asLine) > 0) then icase := 2
    else if Pos('Division by zero detected during the compilation phase', asLine) > 0 then icase := 3
    else if Pos(' is uninitialized', asLine) > 0 then icase := 4
    else if (Pos('The data set', asLine) > 0) or (Pos('Table', asLine) > 0) then icase := 5
    else if pos('At least one W.D format was too small for the number to be printed.', asline) > 0 then icase := 6
    else if (pos('Invalid', asline) > 0)  or (pos('NOTE 484-185', asLine) > 0) or (pos('NOTE 485-185', asLine) > 0) then icase := 7
    else if pos('::', asline) > 0 then icase := 8;   }

    if (stmp = 'error') or (stmp = 'error:') or (stmp = 'warning') or (stmp = 'warning:')
       or (stmp = 'info') or (stmp = 'info:') then icase := 999 //[190]
    else if (Pos('the data set', LowerCase(asLine)) > 0) or (Pos('table', LowerCase(asLine)) > 0) then icase := 5
    else if (Pos('numeric values have been converted to character values', LowerCase(asLine) ) > 0) or
            (Pos('character values have been converted to numeric values', LowerCase(asLine)) > 0) or
            (Pos('numeric variables in the input data set will be converted to character in the output data set', LowerCase(asLine)) > 0) then icase := 2
    else if Pos(' is uninitialized', LowerCase(asLine)) > 0 then icase := 4
    else if (pos('invalid', LowerCase(asLine)) > 0)  or (pos('note 484-185', LowerCase(asLine)) > 0) or (pos('note 485-185', LowerCase(asLine)) > 0) then icase := 7
    else if Pos('merge statement has more than one data set with repeats of by values.', LowerCase(asLine)) > 0 then icase := 1
    else if Pos('division by zero detected during the compilation phase', LowerCase(asLine)) > 0 then icase := 3
    else if pos('at least one w.d format was too small for the number to be printed.', LowerCase(asLine)) > 0 then icase := 6
    else if Pos('missing values were generated', LowerCase(asLine)) > 0 then icase := 9
    else if Pos('repeats of by values', LowerCase(asLine)) > 0 then icase := 10
    else if Pos('mathematical operations could not', LowerCase(asLine)) > 0 then icase := 11
    else if Pos('no observations in data set', LowerCase(asLine)) > 0 then icase := 12
    else if Pos('input data set is empty', LowerCase(asLine)) > 0 then icase := 6
    else if Pos('no by statement for preceding merge statement', LowerCase(asLine)) > 0 then icase := 14
    else if pos('::', asline) > 0 then icase := 8
    else if (pos('problem in observation', LowerCase(asline)) > 0) or
            (pos('calculated coordinate lies outside the visible area', LowerCase(asline)) > 0)
             or (pos('error detected in annotate', LowerCase(asline)) > 0) then icase := 15;  //[B 31]

    //Map ANNOTATE problems to ERRORS;
    if icase = 15 then
       stmp := 'error';

    //Run the custom checks

    if icase = 0 then begin
      for jcnt := 0 to high(arRules) do begin
       if pos(Lowercase(arRules[jcnt].Rule), Lowercase(asline)) > 0  then begin
         icase := 16;
         break;
       end;
      end;
    end;
{NOTE: Missing values were generated
No BY statement for preceding MERGE statement
Interactivity disabled with
repeats of BY values
Mathematical operations could not
No BY statement for preceding MERGE statement
No observations in data set
NOTE: Input data set is empty
NOTE: Invalid (or missing) arguments to
}

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
                idx := Pos('the data set', LowerCase(asLine));
                if idx <> 0 then begin
                  if not bfolder then begin
                    if (Pos('there were', LowerCase(asLine)) = 0) and (Pos('read from the data set', LowerCase(asline)) = 0 ) then begin
                      asnLine := copy(asLine, 19, length(asLine));
                      ip     := pos('observations', LowerCase(asNline));
                      sstr1  := copy(asnline,0,ip+12);
                      sstr1  := DelBSpace(ReplaceStr(sstr1,'observations','obs'));
                    end else
                    if (Pos('there were', LowerCase(asLine)) > 0) and (Pos('read from the data set', LowerCase(asline)) > 0 ) then begin //[B 8]
                      //NOTE: There were 146 observations read from the data set WORK.REFLIST.
                      asnLine := asline;
                      sstr1  := ReplaceStr(asnline,'observations','obs');
                      sstr1  := ReplaceStr(sstr1,'There were','');
                      sstr1  := ReplaceStr(sstr1,'the data set','');
                      sstr1  := DelBSpace(ReplaceStr(lowercase(sstr1),'note:',''));
//                      sstr1  := DelBSpace(ReplaceStr((sstr1),'NOTE:',''));
                    end;
                      AddLine(fLoc, sstr1, 'LAST', iLine, iCodeLn, bfolder);
                      inc(icnt);
                  end;//if not bfolder
                end else begin //[120]
                  idx := Pos('table', LowerCase(asline));
                  if idx <> 0 then begin
                    idx := Pos('created, with',  LowerCase(asline));
                    if idx <> 0  then begin
                      if not bfolder then begin
                        sstr3   := copy(asLine, Pos('table', LowerCase(asLine))+5, length(asline) );
                        sstr1   := copy(sstr3, 1, Pos('created, with', LowerCase(asLine))-12 );
                        idx     := Pos('rows and ',LowerCase(sstr3));
                        sstr3   := copy(sstr3, Pos('created, with', LowerCase(sstr3) )+13, length(sstr3));
                        asnline := 'Table '+ sstr1 + ' has '+copy(LowerCase(sstr3), 1, Pos('rows and ',sstr3)-1)+ 'obs';
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
//    else if Pos('missing values were generated', LowerCase(asLine)) > 0 then icase := 9
      9     : begin
                inc(imissvalue);
                if fdet then
                  AddLine(fLoc, asLine, 'missval', iLine, iCodeLn, bfolder);
              end;
//    else if Pos('repeats of BY values', LowerCase(asLine)) > 0 then icase := 10
      10     : begin
                inc(irepbyval);
                if fdet then
                  AddLine(fLoc, asLine, 'repbyval', iLine, iCodeLn, bfolder);
              end;
//    else if Pos('mathematical operations could not', LowerCase(asLine)) > 0 then icase := 11
      11     : begin
                inc(imathop);
                if fdet then
                  AddLine(fLoc, asLine, 'methop', iLine, iCodeLn, bfolder);
              end;
//    else if Pos('no observations in data set', LowerCase(asLine)) > 0 then icase := 12
      12     : begin
                inc(inoobsdata);
                if fdet then
                  AddLine(fLoc, asLine, 'nobosdata', iLine, iCodeLn, bfolder);
              end;
//    else if Pos('Input data set is empty', LowerCase(asLine)) > 0 then icase := 13
      13     : begin
//                inc(icust);
                if fdet then
                  AddLine(fLoc, asLine, 'indataempt', iLine, iCodeLn, bfolder);
              end;
//    else if Pos('no by statement for preceding merge statement', LowerCase(asLine)) > 0 then icase := 14
      14     : begin
                inc(inobystate);
                if fdet then
                  AddLine(fLoc, asLine, 'nobystate', iLine, iCodeLn, bfolder);
              end;
    {  15     : begin
                inc(iannotate);
                if fdet then
                  AddLine(fLoc, asLine, 'annotate', iLine, iCodeLn, bfolder);
              end; }
      16     : begin
                inc(iusrdef);
                if fdet then
                  AddLine(fLoc, asLine, 'usrdefine', iLine, iCodeLn, bfolder);
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
                    inc(ierr);
                    if fdet then
                      AddLine(fLoc, asLine, 'Error', iLine, iCodeLn, bfolder);
                end else begin
                  if (stmp = 'warning:') or (stmp = 'warning') then  begin
                    if (pos('the base product product with which', LowerCase(asLine)) = 0) and
                       (pos('your system is scheduled to expire on', LowerCase(asLine)) = 0) then begin //[127]
                       if (pos('unable to copy sasuser registry to', LowerCase(asLine)) > 0) then begin //[192]
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
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'NewDecodeLine'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
function TlogfileRead.ClearCounters : boolean;
begin
  try
    setCntWarn(0);
    setCntInfo(0);
    setConvNotescnt(0);
    setCntErr(0);
    setCntMerge(0);
    setcntInvalid(0);
    setDivzero(0);
    setuninitcnt(0);
    setcntnote(0);
    setCustcnt(0);
    setAlloth(0);
    setmissvalue(0);
    setrepbyval(0);
    setmathop(0);
    setnoobsdata(0);
    setnobystate(0);
    setusrdef(0);

    result :=  true;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.ClearCounters'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      result :=  false;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
function TlogfileRead.getlastreadtime : AnsiString;
begin
  try
    result :=  asLstRead;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.getlastreadtime'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      result :=  '';
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TlogfileRead.setlastreadtime(asStr : AnsiString);
begin
  try
    asLstRead :=  asStr;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.setlastreadtime'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
function TlogfileRead.finalstatus     : integer;
begin
  try

    result := ierr + imerge + iwarn + iInv + iConvs+ iUnint +
              iDivs + iAlloth + imissvalue + irepbyval + imathop + inoobsdata+ iindataempt + inobystate + iannotate;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.finalstatus'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      result := -999;
    end;
  end;
end;
//------------------------------------------------------------------------------

function TlogfileRead.Printchecks     : Tstringlist; //[B 32]
var
  sllist : Tstringlist;
  icnt   : integer;
begin
  try
//    if assigned(sllist) then
//       freeandnil(sllist);

    sllist := Tstringlist.Create;
    for icnt := 1 to high(ss_checks) do begin
      sllist.Add('   >> '+ss_checks[icnt]);
    end;
    result := sllist;

//    freeandnil(sllist); [This will create a memory leak but this is the best that could be done.

  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tlogfileread.Printchecks'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
      result := nil;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TlogfileRead.LoadRules;
var
  iNrofRules : Integer;
  icnt       : Integer;
  bproblem   : boolean;

begin
  try
    icnt             := 0;
    iNrofRules       := 0;
    Rules            := TIniFile.Create(ExtractFilePath(application.exename)+'Logrules.ini');
    iNrofRules       := Rules.ReadInteger('Rulecount','Rulecounts', iNrofRules);

    if iNrofRules = 0 then begin
//      rules.Free;
//      MessageDlg('No rules found. The Logrules.ini was moved. Loading the Predefined Rules. '+#13+#10+'Press Enter.', mtInformation, [mbOK], 0);
      setlength(arRules, 1);

      arRules[1].Classf    := 'Note';
      arRules[1].Rule      := 'numeric values have been converted to character values';
      arRules[1].Rulelabel := 'Users Call';

      arRules[2].Classf    := 'Note';
      arRules[2].Rule      := 'character values have been converted to numeric values';
      arRules[2].Rulelabel := 'Users Call';

      arRules[3].Classf    := 'Note';
      arRules[3].Rule      := ' is uninitialized';
      arRules[3].Rulelabel := 'Users Call';

      arRules[4].Classf    := 'Note';
      arRules[4].Rule      := 'invalid';
      arRules[4].Rulelabel := 'Critical';

      arRules[5].Classf    := 'Note';
      arRules[5].Rule      := 'note 484-185';
      arRules[5].Rulelabel := 'Non-Critical';

      arRules[6].Classf    := 'Note';
      arRules[6].Rule      := 'note 485-185';
      arRules[6].Rulelabel := 'Non-Critical';

      arRules[7].Classf    := 'Note';
      arRules[7].Rule      := 'merge statement has more than one data set with repeats of by values.';
      arRules[7].Rulelabel := 'Critical';

      arRules[8].Classf    := 'Note';
      arRules[8].Rule      := 'division by zero detected during the compilation phase';
      arRules[8].Rulelabel := 'Critical';

      arRules[9].Classf    := 'Note';
      arRules[9].Rule      := 'at least one w.d format was too small for the number to be printed.';
      arRules[9].Rulelabel := 'Users Call';

      arRules[10].Classf    := 'Note';
      arRules[10].Rule      := 'missing values were generated';
      arRules[10].Rulelabel := 'Users Call';

      arRules[11].Classf    := 'Note';
      arRules[11].Rule      := 'repeats of by values';
      arRules[11].Rulelabel := 'Users Call';

      arRules[12].Classf    := 'Note';
      arRules[12].Rule      := 'mathematical operations could not';
      arRules[12].Rulelabel := 'Users Call';

      arRules[13].Classf    := 'Note';
      arRules[13].Rule      := 'no observations in data set';
      arRules[13].Rulelabel := 'Users Call';

      arRules[14].Classf    := 'Note';
      arRules[14].Rule      := 'input data set is empty';
      arRules[14].Rulelabel := 'Users Call';

      arRules[15].Classf    := 'Note';
      arRules[15].Rule      := 'no by statement for preceding merge statement';
      arRules[15].Rulelabel := 'Users Call';

      arRules[16].Classf    := 'Custom';
      arRules[16].Rule      := '::';
      arRules[16].Rulelabel := 'Users Call';

      arRules[17].Classf    := 'Note';
      arRules[17].Rule      := 'problem in observation';
      arRules[17].Rulelabel := 'Critical';

      arRules[18].Classf    := 'Note';
      arRules[18].Rule      := 'calculated coordinate lies outside the visible area';
      arRules[18].Rulelabel := 'Critical';

      arRules[19].Classf    := 'Note';
      arRules[19].Rule      := 'error detected in annotate';
      arRules[19].Rulelabel := 'Critical';

      arRules[20].Classf    := 'Error';
      arRules[20].Rule      := 'All Errors';
      arRules[20].Rulelabel := 'Critical';

      arRules[21].Classf    := 'Warning';
      arRules[21].Rule      := 'All Warnings';
      arRules[21].Rulelabel := 'Users Call';

    end else begin
      setlength(arRules, icnt+1);
      if iNrofRules <= 1 then begin
        arRules[icnt].Classf    := Rules.ReadString('Rules','Classification', rcRules.Classf);
        arRules[icnt].Rule      := Rules.ReadString('Rules','Rule'          , rcRules.Rule  );
        arRules[icnt].Rulelabel := Rules.ReadString('Rules','Rulelabel'     , rcRules.Rule  );
      end else begin
       for icnt := 1 to iNrofRules do begin
        setlength(arRules, icnt+1);
        arRules[icnt].Classf    := Rules.ReadString('Rules'+inttostr(icnt),'Classification', rcRules.Classf);
        arRules[icnt].Rule      := Rules.ReadString('Rules'+inttostr(icnt),'Rule'          , rcRules.Rule  );
        arRules[icnt].Rulelabel := Rules.ReadString('Rules'+inttostr(icnt),'Rulelabel'     , rcRules.Rule  );
       end;
      end;
      rules.Free;
    end;

  except on
    e : exception do begin
    end;
  end;
end;
//------------------------------------------------------------------------------
end.

