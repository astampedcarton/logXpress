unit uReadLogs;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  strutils_d7,
  ads_strg;

type
  tanylse = record
    dset   : String[30];
    ndset  : String[30];
    where  : String[70];
    line   : integer;
    entry  : String[70];
    obsfrom: String[70];
    obsto  : String[70];
  end;

  tTimes = record
    dset  : String[100];
    types : String[100];
    real  : String[40];
    cpu   : String[40];
    obs   : String[70];
  end;

  tFdetails = record
    FPath  : String[100];
    Entry  : String[200];
  end;

  tShrdecr = record
    FPath  : String[250];
    Notes  : String[200];
  end;

  tanylsedetail = record
    dset   : String[30];
    ndset  : String[30];
    line   : integer;
    entry  : String[10];
    obsfrom: String[50];
    obsto  : String[50];
  end;

  etFType = (etNormal, etForTime);

type
  TFileRead = class(TObject)
    private
      function GetFileName : string;
      function AnalyzeFile(asStr : Ansistring) : String;
    public
//      constructor Create(asStr : Ansistring); override;
//      destructor Destroy; override;
  end;

implementation

function  TFileRead.AnalyzeFile( asStr : TStringList) : String;
var
 icnt,
 icn,
 iln,
 iln2,
 idx,
 idx1,
 ic,
 ip,               //index of the first period
 isp    : Integer; //index of the first space
 iTcnt  : Integer;
 asLine : Ansistring;
 asNLine: Ansistring;
 asTLine: Ansistring;
 dset   : string;
 stmp   : string;
 sStr1  : string;
 sStr2  : string;
 sStr3  : string;
 sStr4  : string;
 sstr5  : string;
 sstr6  : string;
 bNote  : boolean;
 bWhere : boolean;
 sNStr  : String;
 //Vars for the Timing
 real,
 cpu,
 types,
 obs    : String;
begin
 try
  idx    := 0;
  idx1   := 0;
  iln    := 0;
  iln2   := 0;
  ic     := 0;
  icnt   := 1;
  iTcnt  := 0;

//  for icn := 1 to memLines.Lines.Count do begin
  while icnt <= memLines.Lines.Count do begin
    bNote  := false;
    bWhere := false;
    idx    := 0;
    iln    := 0;
    iln2   := 0;
    sstr1  := '';
    sstr2  := '';
    sstr3  := '';
    sstr4  := '';
    sstr5  := '';
    sstr6  := '';
    asLine := memlines.Lines.Strings[icnt];
    stmp := copy(asline, 0, 16);
    if stmp = 'NOTE: There were' then begin //16
      //make a new line excluding the entries already checked
      asnLine := copy(asLine, 18, length(asLine));
      //get the # observations
      ip     := pos('observations', asNline);
      sstr1  := delrspace(copy(asnline, 1, ip-1)) + ' observations';
      iln    := icnt;
      //get the library
      idx    := pos('.', asNLine);
      sStr3  := copy(asnline, idx, length(asnline));
//      dset   := sstr3;
      //get the where clause
      asTLine:= delrspace(memlines.Lines.Strings[icnt+1]);
      inc(icnt);
      sstr5  := delrspace(copy(asTLine, 0, 6));
      if sstr5 = 'WHERE' then begin
          sstr5 := copy(asTLine, 0, length(asTLine));
          iln2  := icnt + 1;
          bWhere  := true;
      end else begin
        idx    := pos('NOTE: The data set ',asTline);
        if idx > 0 then begin
          sstr5  := copy(asTLine, idx+19, length(asTLine));
          sstr6  := substr(asTLine, idx+19, length(asTline));
          ip     := pos(' ', sStr6);
          sstr2  := DelRSpace(copy(sstr6, 0, ip));
          //get the observations
          sstr4  := copy(sstr6, ip, length(sstr6));
          isp    := pos('has', sstr4);
          sstr4  := DelRSpace(copy(sstr4, isp+3, length(sstr6)));
          idx    := pos(' ', sstr4);
          sstr4  := delrspace(copy(sstr4, 0, idx));
          iln2  := icnt + 1;
          bNote:= true;
        end;
      end;
    end;

    if bNote or bWhere then begin
      asline := memlines.Lines.Strings[icnt+2];
      inc(icnt);
      idx    := pos('NOTE: The data set ',asline);
      if idx > 0 then begin
        //get the library
        sstr6  := substr(asLine, idx+19, length(asline));
        ip     := pos(' ', sStr6);
        sstr2  := DelRSpace(copy(sstr6, 0, ip));
        dset   := sstr2;
        //get the observations
        sstr4  := copy(sstr1, ip, length(sstr6));
        isp    := pos('has', sstr4);
        sstr4  := DelRSpace(copy(sstr4, isp+3, length(sstr6)));
        idx    := pos(' ', sstr4);
        sstr4  := delrspace(copy(sstr4, 0, idx));
      end;
    end;

    if isnotempty(sStr3) then begin
      inc(ic);
      setlength(arFile, ic+1);
      arFile[ic].dset    := sstr3;
      dset               := sstr3;
      arFile[ic].ndset   := sstr2;
//      arFile[ic].where   :=
      arFile[ic].entry   := sstr5;
      arFile[ic].obsfrom := sstr1;
      arFile[ic].line    := iln2;
      arFile[ic].obsto   := sstr4;
    end else begin
      inc(icnt);
    end;

    asTLine:= delrspace(asline);
    idx  := Pos('NOTE: DATA statement used (Total process time):', asTLine);
    idx1 := Pos('NOTE: PROCEDURE', asTLine);
    if (idx > 0) or (idx1 > 0) then begin
        dset                := dset;
        types               := asTLine;
        asTLine             := delrspace(memlines.Lines.Strings[icnt]);
        idx                 := Pos('real time', asTLine);
        idx1                := Pos('cpu time', asTLine);
        if (idx > 0) or (idx1 > 0) then begin
           real := delrspace(copy(astline,10, length(astline)));
        end;
        asTLine            := delrspace(memlines.Lines.Strings[icnt+1]);
//        idx  := Pos('cpu time', asTLine);
        if (idx > 0) or (idx1 > 0) then begin
           cpu := delrspace(copy(astline,10, length(astline)));
        end;

        if (real <> '') and (cpu <> '') then begin
          setlength(arTime, itcnt+1);
          arTime[itcnt].dset  := dset;
          arTime[itcnt].types := types;
          arTime[itcnt].real  := real;
          arTime[itcnt].cpu   := cpu;
          arTime[itcnt].obs   := sstr1;
          inc(itcnt);
        end;
       inc(icnt);
    end;
    pgReadFile.Position := icnt;
  end;
  pgReadFile.Visible := false;
  icnt := high(arFile);
 except on
  e : Exception do begin
    MessageDlg('The following exception occurred in:'+#13+#10+'AnalyzeFile'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    pgReadFile.Visible := false;
  end;
 end;
end;
//------------------------------------------------------------------------------
function  TFileRead.AnalyzeTimeFile : boolean;
var
 icnt,
 icn,
 iln,
 iln2,
 idx,
 idx1,
 ic,
 ip,               //index of the first period
 isp    : Integer; //index of the first space
 iTcnt  : Integer;
 asLine : Ansistring;
 asNLine: Ansistring;
 asTLine: Ansistring;
 dset   : string;
 stmp   : string;
 sStr1  : string;
 sStr3  : string;
 sNStr  : String;
 //Vars for the Timing
 real,
 cpu,
 types,
 obs    : String;
 bdone  : boolean;
begin
 try
  idx    := 0;
  idx1   := 0;
  iln    := 0;
  iln2   := 0;
  ic     := 0;
  icnt   := 1;
  iTcnt  := 0;

//  for icn := 1 to memLines.Lines.Count do begin
  pgReadFile.Visible := true;
  pgReadFile.Max := memLines.Lines.Count;
  pgReadFile.Min := 0;
  while icnt <= memLines.Lines.Count do begin
    idx    := 0;
    iln    := 0;
    iln2   := 0;
    sstr1  := '';
    sstr3  := '';
    bdone  := false;
    asLine := memlines.Lines.Strings[icnt];
    stmp := copy(asline, 0, 18);
    if stmp = 'NOTE: The data set' then begin //16
      //make a new line excluding the entries already checked
      asnLine := copy(asLine, 19, length(asLine));
      //get the # observations
      ip     := pos('observations', asNline);
      sstr1  := delrspace(copy(asnline, 1, ip-1)) + ' observations';
      iln    := icnt;
      //get the library
      idx    := pos('.', asNLine);
      sStr3  := delrspace(copy(asnline, 1, length(asnline)));
      //get the where clause
      asTLine:= delrspace(memlines.Lines.Strings[icnt+1]);
      inc(icnt);
    end;

    if isnotempty(sStr3) then begin
      asTLine:= delrspace(asline);
      idx  := Pos('NOTE: DATA statement used', asTLine);
      idx1 := Pos('NOTE: PROCEDURE', asTLine);
      while bdone = false do begin
        asLine := memlines.Lines.Strings[icnt];
        idx  := Pos('NOTE: DATA statement used', asLine);
        idx1 := Pos('NOTE: PROCEDURE', asLine);
        if (idx > 0) or (idx1 > 0) then bdone := true
        else bdone := false;
        inc(icnt);
      end;
    end else begin
      bDone := true;
      inc(icnt);
    end;

    if bDone then begin
      asTLine:= delrspace(asline);
      idx  := Pos('NOTE: DATA statement used', asTLine);
      idx1 := Pos('NOTE: PROCEDURE', asTLine);
  //    if (Pos('NOTE: DATA statement', asTLine) > 0) or (Pos('NOTE: PROCEDURE', asTLine) > 0) then begin
      if (idx > 0) or (idx1 > 0) then begin
          dset                := sStr3;
          obs                 := sstr1;
          types               := asTLine;
          asTLine             := delrspace(memlines.Lines.Strings[icnt]);
          idx                 := Pos('real time', asTLine);
          idx1                := Pos('cpu time', asTLine);
          if (idx > 0) or (idx1 > 0) then begin
             real := delrspace(copy(astline,10, length(astline)));
          end;
          asTLine            := delrspace(memlines.Lines.Strings[icnt+1]);
          if (idx > 0) or (idx1 > 0) then begin
             cpu := delrspace(copy(astline,14, length(astline)));
          end;

          if (real <> '') and (cpu <> '') then begin
            setlength(arTime, itcnt+1);
            arTime[itcnt].dset  := dset;
            arTime[itcnt].types := types;
            arTime[itcnt].real  := real;
            arTime[itcnt].cpu   := cpu;
            arTime[itcnt].obs   := sstr1;
            inc(itcnt);
          end;
         inc(icnt);
      end;
      bDone := false;
    end;
    pgReadFile.Position := icnt;
  end;
  pgReadFile.Visible := false;
 except on
  e : Exception do begin
    MessageDlg('The following exception occurred in:'+#13+#10+'AnalyzeTimeFile'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    pgReadFile.Visible := false;
  end;
 end;
end;
//------------------------------------------------------------------------------
end.
