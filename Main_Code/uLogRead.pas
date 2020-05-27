unit uLogRead;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, shellapi, uUsertypes_d7, uDatetime, StrUtils,
  Dialogs, StrUtils_d7, ads_strg, forms, RichEdit,Graphics, ComCtrls, controls;

type
   etCompstat = (etCompare, etNotCompare);
   etLoad = (etError, etWarn, etInfo, etUnint, etConvert,
             etMerge, etInvalid, etDivs, etLast, etNotes, etCust, etalloth, etnone,
             etmisvals,etrepbyval, etmathop, etnobosdata, etindataempty,etnobystate,
             etannoerr,etUserdefined);
  etReadtype = (etReadall, etReadSel);
  etdisptype = (etdispnone, etclassic, etExtended);
  etcolattrib = (etFilter);
  etCallerType = (etNomatter, etProduction, etQC);

   Tloginfo = packed record
     Logdest  : String[255];
     Entry    : String[255];
     Folder   : String[255];
     Filename : String[50];
     Types    : String[50];
     LineNr   : Integer;
   end;

   Tcomprec = packed record
     filename  : string;
     lib1      : string;
     fname1    : string;
     lib2      : string;
     fname2    : string;
     fn1vcnt   : integer;
     fn1obcnt  : integer;
     fn2vcnt   : integer;
     fn2obcnt  : integer;
     fn1crdt   : Tdatetime;
     fn2crdt   : Tdatetime;
     fn1moddt  : Tdatetime;
     fn2moddt  : Tdatetime;
     fn1obsred : integer;
     fn2obsred : integer;
     obsdiff   : integer;
     obscomp   : integer;
     finstats  : string;
     dupNotes  : string;
   end;

   TComprecarray = array of Tcomprec ;

   TTimingrec = packed record
     linenr   : integer;
     ddsource : string[50];
     procdata : string[100];
     realtime : string[100];
     cputime  : string[100];
   end;

   TDetailsrec = packed record
     linenr   : integer;
     ddsource : string[100];
     newdd    : string[100];
     info     : string[100];
     obsread  : string[100];
   end;

   TMacsymrec = packed record
    types     : String[25];
    linenr   : integer;
    PRINTLOG : String[25 ];
    full     : String[25 ];
    macname  : String[100];
    macsym   : String[150];
    value    : String[200];
   end;

   TMaccallsrec = packed record
    macname : String[100];
    types    : String[25 ];
    full    : String[25 ];
    value   : String[200];
    system  : String[25 ];
   end;

   //Record the match/missmatch details
   Tcompmatrec = packed record
     fname    : string[100];
     filename : string[100];
     compcnt  : integer;
     crdiff   : string[200];
     moddiff  : string[200];
     vardiff  : string[200];
     obsdiff  : string[200];
     obsrddiff: string[200];
     unequal  : string[200];
     equal    : string[200];
     dupNotes : string[255];
     compstat : etCompstat;
   end;

   TXLSXxml = packed record
     collabel  : string[100];
     colattrib : etcolattrib;
     colvalue  : string;
     colwidth  : integer;
   end;

   TFileinfo = packed record
     Caller   : etCallertype;
     Fullpath : ansistring;
     Filename : ansistring;
     Fileloc  : ansistring;
     Filesize : integer;
     Filedate : TDatetime;
   end;

  TFdetails = record
    FPath  : String[255];
    Entry  : String[255];
  end;

  Tfilelist = record
    fname  : string[250];
    fpath  : string[250];
    fdtm   : string[100];
    bselect: boolean;
  end;

const
  TASKBAR_ON_TOP = 1;
  TASKBAR_ON_LEFT = 2;
  TASKBAR_ON_RIGHT = 3;
  TASKBAR_ON_BOTTOM = 4;

  TASKBAR_X_TOLERANCE = 40;
  TASKBAR_Y_TOLERANCE = 40;


     function FileInUse(floc, fpath : Ansistring) : boolean;
     function MakeCopyofFile(floc : Ansistring) : Ansistring;
     function LastModified(FName : Ansistring) : TdateTime;
     function File_GetLastModifiedDate(FileName : String): TDateTime;
     function File_GetLastaccessDate(FileName : String): TDateTime;
     Function FileDate(FileString: String): TDateTime;
     procedure RE_SetSelBgColor(RichEdit: TRichEdit; AColor: TColor);
     procedure SetWordBackGroundColor(RichEdit : TRichEdit; aWord : String;AColor: TColor);
     function  recordsearch(asloc : ansistring; asext : ansistring; var arFpaths : array of ansistring ) : boolean;
     function FindTaskBar(var ARect: TRect): Integer;
     function  GetFileSize(const FileName: String): Int64;

     procedure PerformReadCompareFile(var rcComps: TComprecarray; asPath : ansistring; var ifilecnt : integer);

     procedure GetFilelist(etCaller : etCallerType; asLoc : Ansistring; asFiletype : Ansistring;  var asfpath : array of Tfileinfo);


var
    ffollogs : file of Tloginfo;


implementation

//var
//   dtLast   : Tdatetime;
//   dtCurr   : TDatetime;
//   sFold    : array of Ansistring;
//   ffollogs : file of Tloginfo;
//   flogs    : file of Tloginfo;

function FindTaskBar(var ARect: TRect): Integer;
var
	AppData: TAppBarData;
begin
  // 'Shell_TrayWnd' is the name of the task bar's window
  AppData.Hwnd := FindWindow('Shell_TrayWnd', nil);
  if AppData.Hwnd = 0 then
    RaiseLastWin32Error;
  AppData.cbSize := SizeOf(TAppBarData);
  // SHAppBarMessage will return False (0) when an error
  // happens.
  if SHAppBarMessage(ABM_GETTASKBARPOS, AppData) = 0 then
    raise Exception.Create('SHAppBarMessage returned false when trying ' +
      'to find the Task Bar''s position');
  // Otherwise, we had success, so fill in the results.
  Result := AppData.uEdge;
  ARect := AppData.rc;
end;

//------------------------------------------------------------------------------
Function File_GetLastModifiedDate(FileName : String): TDateTime;
var
  SearchRec : TSearchRec;
  DT        : TFileTime;
  ST        : TSystemTime;
begin
  Result := 0;
  If Not FileExists(FileName) Then Exit;
  Try
    SysUtils.FindFirst(FileName, faAnyFile, SearchRec);
    Try
      FileTimeToLocalFileTime(SearchRec.FindData.ftLastWriteTime,DT);
      FileTimeToSystemTime(DT, ST);
      Result := SystemTimeToDateTime(ST);
    Finally
      SysUtils.FindClose(SearchRec);
    End;
  Except
    Result := 0;
  End;
end;
//------------------------------------------------------------------------------

Function File_GetLastaccessDate(FileName : String): TDateTime;
var
  SearchRec : TSearchRec;
  DT        : TFileTime;
  ST        : TSystemTime;
begin
  Result := 0;
  If Not FileExists(FileName) Then Exit;
  Try
    SysUtils.FindFirst(FileName, faAnyFile, SearchRec);
    Try
      FileTimeToLocalFileTime(SearchRec.FindData.ftLastAccessTime,DT);
      FileTimeToSystemTime(DT, ST);
      Result := SystemTimeToDateTime(ST);
    Finally
      SysUtils.FindClose(SearchRec);
    End;
  Except
    Result := 0;
  End;
end;
//------------------------------------------------------------------------------
Function FileDate(FileString: String): TDateTime;
Begin
  Result := 0;
  Try
    If Not FileExists(FileString) Then Exit;
    Result := FileDateToDateTime(FileAge(FileString));
  Except
    Result := 0;
  End;
End;
//------------------------------------------------------------------------------
function GetFileSize(const FileName: String): Int64;
var SRec : TSearchRec;
begin
  if FindFirst(FileName, faAnyFile, SRec) <> 0 then
    Result := -1 else
    begin
      {$IFDEF MSWINDOWS}
      {$WARNINGS OFF}
      Int64Rec(Result).Lo := SRec.FindData.nFileSizeLow;
      Int64Rec(Result).Hi := SRec.FindData.nFileSizeHigh;
      {$IFDEF DEBUG}{$WARNINGS ON}{$ENDIF}
      {$ELSE}
      Result := SRec.Size;
      {$ENDIF}
      FindClose(SRec);
    end;
end;
//------------------------------------------------------------------------------
function  LastModified(FName : Ansistring) : TdateTime;
begin
  result := File_GetLastModifiedDate(Fname);
end;
//------------------------------------------------------------------------------
function  LastAccess(FName : Ansistring) : TdateTime;
begin
  result := File_GetLastaccessDate(Fname);
end;
//------------------------------------------------------------------------------
function MakeCopyofFile(floc : Ansistring) : Ansistring;
var
 bproblem : boolean;
begin
 try
//   bproblem := CopyFile(pChar(floc), pchar(ExtractFilePath(floc)+'_tmp.log'), false);
   bproblem := not CopyFile(pChar(floc), pchar(ExtractFilePath(Application.exename)+'_tmp.log'), false);
   if not bproblem then
    result := ExtractFilePath(Application.exename)+'_tmp.log';
 except on
    e : Exception do begin
    MessageDlg('The following exception occurred in:'+#13+#10+'MakeCopyofFile'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    result := '';
    end;
 end;
end;
//------------------------------------------------------------------------------
function FileInUse(floc, fPath : Ansistring) : boolean;
var
  HFileRes: HFILE;
begin
  Result := false;
  if not FileExists(fPath) then
    exit;
  HFileRes := CreateFile(pchar(floc), GENERIC_READ or GENERIC_WRITE, 0 , nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  Result := (HFileRes = INVALID_HANDLE_VALUE);
  if not Result then
    CloseHandle(HFileRes);
end;
//------------------------------------------------------------------------------
procedure RE_SetSelBgColor(RichEdit: TRichEdit; AColor: TColor);
var
  Format: CHARFORMAT2;
begin
  try
    FillChar(Format, SizeOf(Format), 0);
    with Format do begin
      cbSize := SizeOf(Format);
      dwMask := CFM_BACKCOLOR;
      dwEffects := CFM_BOLD;
//      crBackColor := AColor;
      Richedit.Perform(EM_SETCHARFORMAT, SCF_SELECTION, Longint(@Format));
//      Richedit.Perform(EM_SETCHARFORMAT, SCF_WORD, Longint(@Format));
    end;
 except on
  e : Exception do begin
    MessageDlg('The following exception occurred in:'+#13+#10+'Movetoline'+#13+#10+e.Message, mtWarning, [mbOK], 0);
  end;
 end;
end;
//------------------------------------------------------------------------------
procedure SetWordBackGroundColor(RichEdit : TRichEdit; aWord : String;AColor: TColor);
var
  Format: CHARFORMAT2;
  Index : Integer;
  Len   : Integer;
begin
          FillChar(Format, SizeOf(Format), 0);
          Format.cbSize := SizeOf(Format);
          Format.dwMask := CFM_BACKCOLOR;
          Format.crBackColor := AColor;

          Index := 0;
          Len := Length(RichEdit.Lines.Text) ;
          Index := RichEdit.FindText(aWord, Index, Len, []);

          while Index <> -1 do
          begin
                RichEdit.SelStart  := Index;
                RichEdit.SelLength := Length(aWord) ;
                RichEdit.Perform(EM_SETCHARFORMAT, SCF_SELECTION, Longint(@Format));
                Index := RichEdit.FindText(aWord,Index + Length(aWord),Len, []) ;
          end;
end;
//------------------------------------------------------------------------------
function  recordsearch(asloc : ansistring; asext : ansistring; var arFpaths : array of ansistring ) : boolean;
(*var
  bcomplete : boolean;
  sr        : TsearchRec;
  icnt      : integer;
  arpath    : array of ansistring;  *)
begin
  try
    {icnt    := 0;
    if FindFirst(asloc+asext, faAnyFile, sr) = 0 then begin
     setlength(arpath, icnt+1);
     arpath[icnt] := asloc+ExtractFileName(sr.Name);
     inc(icnt);
     bComplete := false;
    end;

    while not bComplete do begin
      if FindNext(sr) = 0 then begin
        setlength(arpath, icnt+1);
        arpath[icnt] := asloc+ExtractFileName(sr.Name);
        inc(icnt);
      end else begin
        bComplete  := true;
      end;
    end;
    arfpaths := arpath;
    FindClose(sr);    }
 except on
   e : Exception do begin
     MessageDlg('The following exception occurred in:'+#13+#10+'recordsearch'+#13+#10+e.Message, mtWarning, [mbOK], 0);
     result := false;
   end;
 end;
end;
//------------------------------------------------------------------------------

procedure PerformReadCompareFile(var rcComps: TComprecarray; asPath : ansistring; var ifilecnt : integer);
var
  slCompfl     : Tstringlist;
  fstream      : TFilestream;
  icnt,idx     : integer;
  asline       : ansistring;
  fname1,
  fname2       : string;
  stmp, stmp1  : string;
  tmLine       : string;
  idsetsum     : integer;
  prefiles     : ansistring; //To make provision for cases where a file does not compare
  iCompare     : integer;
  iskip        : integer;
  sfname       : string;
  ascrdt       : ansistring;
  ascrtm       : ansistring;
  asmddt       : ansistring;
  asmdtm       : ansistring;
  dtTst        : Tdatetime;
begin
  try
   //Load the file into a stream to avoid sharing voilations
   slCompfl := tstringlist.Create();
   fstream := TFileStream.Create(aspath, fmOpenRead or fmShareDenyNone);
   slcompfl.LoadFromStream(fstream);

   ifilecnt := 1;
   idsetsum := 0;
   iskip    := 0;
   setlength(rcComps, ifilecnt+1);

   for icnt := 0 to slcompfl.Count - 1 do begin;
     asline := DelRSpace(slcompfl.Strings[icnt]);
     if Pos('the compare procedure', lowercase(asline)) > 0 then
       asline := '';

     if (asline <> '') then begin
        //Determine the start of the procedure the information from this point onwards
        //will be seen as a one record;
       if (pos('comparison of', lowercase(asline) ) > 0) {and (prefiles <> lowercase(asline))} then begin
          //Copy the dataset names that's been compare.
          prefiles := lowercase(asline);
          stmp   := lowercase(copy(asline, 15, length(asline)));

          idx    := pos('with', lowercase(stmp));
          if (pos(LowerCase(rcComps[ifilecnt].fname1), LowerCase(asline)) = 0) and
             (pos(LowerCase(rcComps[ifilecnt].fname2), LowerCase(asline)) = 0) then begin
            inc(ifilecnt);
            setlength(rcComps, ifilecnt+1);
            rcComps[ifilecnt].fname1 := UpperCase(delrspace(copy(asline, 15, idx-1)));
            rcComps[ifilecnt].fname2 := UpperCase(copy(stmp, idx+5));
            if Pos('.', rcComps[ifilecnt].fname1) > 0 then begin
              rcComps[ifilecnt].lib1   := Copy(rcComps[ifilecnt].fname1, 1, Pos('.', rcComps[ifilecnt].fname1)-1);
            end;
            if Pos('.', rcComps[ifilecnt].fname2) > 0 then begin
              rcComps[ifilecnt].lib2   := Copy(rcComps[ifilecnt].fname2, 1, Pos('.', rcComps[ifilecnt].fname2)-1);
            end;

          end;
       end else begin
         //Determine when your at the section containing when a dd was create, modified and nr of obs
         if pos(LowerCase(rcComps[ifilecnt].fname1), LowerCase(asline)) > 0 then begin;
		       if ((ContainsText('total number of observations read', lowercase(asline)) = true) and
               (ContainsText('number of variables in ', lowercase(asline)) = true) and
               (ContainsText('but not in', LowerCase(asline)) = true ) and
               (ContainsText('listing of variables in ', LowerCase(asline))= true) and
               (ContainsText('number of variables in common: ', LowerCase(asline))= true) and
               (ContainsText('number of observations in common:', LowerCase(asline))= true)) and
              ((containstext('observation' , lowercase(asline)) = false) and
               (containstext('in', lowercase(asline)) = false) and
               (containstext('not found in' , lowercase(asline)) = false) ) then begin
             stmp             := delrspace(copy(asline, pos(' ', asline)));
             stmp1            := copy(stmp, 1, pos(' ', stmp));
             if stmp1 <> '' then
               rcComps[ifilecnt].fn1crdt  := StrToDateTime(stmp1);

             stmp             := delrspace(copy(stmp, pos(' ', stmp)));
             stmp1            := copy(stmp, 1, pos(' ', stmp));

             if stmp1 <> '' then
               rcComps[ifilecnt].fn1moddt :=  StrToDateTime(stmp1);

             stmp             := delrspace(copy(stmp, pos(' ', stmp)));
             stmp1            := delrspace(copy(stmp, 1, pos(' ', stmp)));
             if stmp1 <> '' then
               rcComps[ifilecnt].fn1vcnt  := StrToInt(stmp1);

             stmp             := delrspace(copy(stmp, pos(' ', stmp)));
             stmp1            := delrspace(copy(stmp, 1, pos(' ', stmp)));
             if stmp1 <> '' then
               rcComps[ifilecnt].fn1obcnt := strtoint(stmp1)
             else
             if stmp <> '' then
               rcComps[ifilecnt].fn1obcnt := strtoint(stmp)

           end else
           if ContainsText('total number of observations read', lowercase(asline)) = true then begin
             stmp             := delrspace(copy(asline, pos(':', asline)+1));

             if delrspace(copy(stmp, 1, Length(stmp)-1)) <> '' then
               rcComps[ifilecnt].fn1obsred:= strtoint(delrspace(copy(stmp, 1, Length(stmp)-1)));
           end;
         end else
         if pos(LowerCase(rcComps[ifilecnt].fname2), LowerCase(asline)) > 0 then begin
		       if ((ContainsText('total number of observations read', lowercase(asline)) = true) and
               (ContainsText('number of variables in ', lowercase(asline)) = true) and
               (ContainsText('but not in', LowerCase(asline)) = true ) and
               (ContainsText('listing of variables in ', LowerCase(asline))= true) and
               (ContainsText('number of variables in common: ', LowerCase(asline))= true) and
               (ContainsText('number of observations in common:', LowerCase(asline))= true)) and
              ((containstext('observation' , lowercase(asline)) = false) and
               (containstext('in', lowercase(asline)) = false) and
               (containstext('not found in' , lowercase(asline)) = false) ) then begin
             stmp             := delrspace(copy(asline, pos(' ', asline)));
             stmp1            := copy(stmp, 1, pos(' ', stmp));
             if stmp1 <> '' then
               rcComps[ifilecnt].fn2crdt  := StrToDateTime(stmp1);

             stmp             := delrspace(copy(stmp, pos(' ', stmp)));
             stmp1            := copy(stmp, 1, pos(' ', stmp));
             if stmp1 <> '' then
              rcComps[ifilecnt].fn2moddt :=  StrToDateTime(stmp1);

             stmp             := delrspace(copy(stmp, pos(' ', stmp)));
             stmp1            := delrspace(copy(stmp, 1, pos(' ', stmp)));
             if stmp1 <> '' then
               rcComps[ifilecnt].fn2vcnt  := strtoint(stmp1);

             stmp             := delrspace(copy(stmp, pos(' ', stmp)));
             stmp1            := delrspace(copy(stmp, 1, pos(' ', stmp)));

             if stmp1 <> '' then
               rcComps[ifilecnt].fn2obcnt := strtoint(stmp1)
             else
             if stmp <> '' then
              rcComps[ifilecnt].fn2obcnt := strtoint(stmp)

           end else
           if pos('total number of observations read', lowercase(asline)) > 0 then begin
             stmp             := delrspace(copy(asline, pos(':', asline)+1));

             if delrspace(copy(stmp, 1, Length(stmp)-1)) <> '' then
               rcComps[ifilecnt].fn2obsred:= strtoint(delrspace(copy(stmp, 1, Length(stmp)-1)));
           end;
         end;
       end;

       if pos('number of observations with some compared variables unequal:', lowercase(asline)) > 0 then begin
          stmp := (delrspace(copy(asline, pos(':', asline)+1, length(delrspace(asline))-1)));
          rcComps[ifilecnt].obsdiff := strtoint(Copy(stmp, 1, Length(stmp)-1));
       end;

       if pos('number of observations with all compared variables equal:', lowercase(asline)) > 0 then begin
          stmp := (delrspace(copy(asline, pos(':', asline)+1, length(delrspace(asline))-1)));
          rcComps[ifilecnt].obscomp := strtoint(Copy(stmp, 1, Length(stmp)-1));
       end;

       if lowercase(asline) = 'note: no unequal values were found. all values compared are exactly equal.' then begin
         rcComps[ifilecnt].finstats := 'No unequal values were found. All values compared are exactly equal.';
       end;

       if pos('number of duplicate observations found in.', lowercase(asline)) > 0 then begin
         rcComps[ifilecnt].dupNotes := asline;
       end;

       if (pos('total number of observations read from:', lowercase(asline)) > 0) or
          (pos('number of observations in common', lowercase(asline)) > 0) then begin
         idsetsum := 0;
       end;

       if (Pos('dataset',LowerCase(asline)) > 0) and (Pos('modified',LowerCase(asline)) > 0) and (Pos('nvar',LowerCase(asline)) > 0)  and
          (Pos('created', LowerCase(asline)) > 0) and (Pos('nobs',LowerCase(asline)) > 0) then begin
         idsetsum := 1;
       end;

       if idsetsum >= 1 then begin
          stmp  := delbspace(copy(delbspace(asline), 1, pos(' ', delbspace(asline))+1)); //Get the name
          stmp  := DelESpace(copy(delbspace(stmp), 1, pos(' ', delbspace(stmp))+1));
          if  stmp = rcComps[ifilecnt].fname1 then begin
            tmline                      := delbspace(copy(delbspace(asline), pos(' ', delbspace(asline))+1));    //Get the next section
            GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, formatSettings);

            ascrdt := DelESpace(copy(delbspace(tmline), 1, pos(' ', delbspace(tmline))+1));
            ascrtm := DelESpace(copy(delbspace(ascrdt), pos(':', delbspace(ascrdt))+1));
            ascrdt := Copy(ascrdt, 1, pos(':', ascrdt)-1);
            //*TODO: This needs relooking     rcComps[ifilecnt].fn1crdt   := sasdttm2dt(ascrdt);//, ascrtm);
            rcComps[ifilecnt].fn1crdt   := sasdttm2dt(ascrdt);//, ascrtm); //Get the Created date
            tmline                      := copy(delbspace(tmline), pos(' ', delbspace(tmline))+1, Length(tmLine) ); //Get the Created date

            ascrdt := DelESpace(copy(delbspace(tmline), 1, pos(' ', delbspace(tmline))+1));
            ascrtm := DelESpace(copy(delbspace(ascrdt), pos(':', delbspace(ascrdt))+1));
            ascrdt := Copy(ascrdt, 1, pos(':', ascrdt)-1);
            rcComps[ifilecnt].fn1moddt  := sasdttm2dt(copy(delbspace(tmline), 1, pos(' ', delbspace(tmline))+1));    //Get the next section
            tmline                      := copy(delbspace(tmline), pos(' ', delbspace(tmline))+1, Length(tmLine) ); //Get the modified date
            rcComps[ifilecnt].fn1vcnt   := StrToInt(DelRSpace(copy(delbspace(tmline), 1, pos(' ', delbspace(tmline))+1)));    //Get the next section
            tmline                      := delbspace(copy(delbspace(tmline), pos(' ', delbspace(tmline))+1, Length(tmLine) )); //Get the nvar date

            if pos(' ', delbspace(tmline)) > 0 then begin; //B 12
              rcComps[ifilecnt].fn1obsred := StrToInt(DelRSpace(copy(delbspace(tmline), 1, pos(' ', delbspace(tmline))+1)));    //Get the OBS Read
            end else begin
              rcComps[ifilecnt].fn1obsred := StrToInt(DelRSpace(copy(delbspace(tmline), 1)));    //Get the OBS Read
            end;
          end else
          if  stmp = rcComps[ifilecnt].fname2 then begin
            tmline                      := copy(delbspace(asline), pos(' ', delbspace(asline))+1);    //Get the next section
            ascrdt := DelESpace(copy(delbspace(tmline), 1, pos(' ', delbspace(tmline))+1));
            ascrtm := DelESpace(copy(delbspace(ascrdt), pos(':', delbspace(ascrdt))+1));
            ascrdt := Copy(ascrdt, 1, pos(':', ascrdt)-1);
            //TODO: Needs fixing rcComps[ifilecnt].fn2crdt   := sasdttm2dt(ascrdt, ascrtm);
            rcComps[ifilecnt].fn2crdt   := sasdttm2dt(ascrdt);//, ascrtm); //Get the Created date
            tmline                      := copy(delbspace(tmline), pos(' ', delbspace(tmline))+1, Length(tmLine) ); //Get the Created date
            ascrdt := DelESpace(copy(delbspace(tmline), 1, pos(' ', delbspace(tmline))+1));
            ascrtm := DelESpace(copy(delbspace(ascrdt), pos(':', delbspace(ascrdt))+1));
            ascrdt := Copy(ascrdt, 1, pos(':', ascrdt)-1);
            //TODO: This needs fixing rcComps[ifilecnt].fn2moddt  := sasdttm2dt(ascrdt, ascrtm);
            rcComps[ifilecnt].fn2moddt  := sasdttm2dt(ascrdt);//, ascrtm);    //Get the next section
            tmline                      := copy(delbspace(tmline), pos(' ', delbspace(tmline))+1, Length(tmLine) ); //Get the modified date
            rcComps[ifilecnt].fn2vcnt   := StrToInt(DelRSpace(copy(delbspace(tmline), 1, pos(' ', delbspace(tmline))+1)));    //Get the next section
            tmline                      := delbspace(copy(delbspace(tmline), pos(' ', delbspace(tmline))+1, Length(tmLine) )); //Get the nvar date
            if pos(' ', delbspace(tmline)) > 0 then begin;  //B 12
              rcComps[ifilecnt].fn2obsred := StrToInt(DelRSpace(copy(delbspace(tmline), 1, pos(' ', delbspace(tmline))+1)));    //Get the OBS Read
            end else begin
              rcComps[ifilecnt].fn2obsred := StrToInt(DelRSpace(copy(delbspace(tmline), 1)));    //Get the OBS Read
            end;

            idsetsum := 0;
          end;
        end;
     end;

   end; //for icnt := 0 to slcompfl.Count - 1 do begin;
   freeandnil(fstream);
   freeandnil(slcompfl);

  except on
    E : exception do begin
       MessageDlg('The following exception occurred in:'+#13+#10+
                  'ReadComparesFunction. icnt: '+inttostr(icnt)+' - - '+rcComps[ifilecnt].fname2+#13+#10+e.Message, mtError, [mbOK], 0);
       MessageDlg(inttostr(icnt)+' - - '+rcComps[ifilecnt].fname1, mtError, [mbOK], 0);

       MessageDlg(asline, mtError, [mbOK], 0);
       freeandnil(slcompfl);
       freeandnil(fstream);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure GetFilelist(etCaller : etCallerType; asLoc : Ansistring; asFiletype : Ansistring;  var asfpath : array of Tfileinfo);
var
  icnt1      : integer;
  bcomplete  : boolean;
  asfilepath : array of TFileinfo;
  sr         : TSearchRec;
begin
  bcomplete := false;
  icnt1     := 0;

 if isnotempty(asLoc) then begin
   if FindFirst(asLoc+'*.'+ asFiletype, faAnyFile, sr) = 0 then begin
      if sr.Name <> '' then begin
        setlength(asFilePath, icnt1+1);
        asFilepath[icnt1].Fullpath := asloc+ExtractFileName(sr.Name);
        asFilePath[icnt1].Fileloc  := asLoc;
        asFilePath[icnt1].Filename := ExtractFileName(sr.Name);
        asFilePath[icnt1].Caller   := etCaller;
        asFilePath[icnt1].Filesize := GetFileSize(asFilepath[icnt1].Fullpath);
        asFilePath[icnt1].Filedate := File_GetLastModifiedDate(asFilepath[icnt1].Fullpath);

        bComplete := false;
      end;
   end;

   while not bComplete do begin
    if FindNext(sr) = 0 then begin
      if sr.Name <> '' then begin
        setlength(asFilePath, icnt1+1);
        asFilepath[icnt1].Fullpath := asloc+ExtractFileName(sr.Name);
        asFilePath[icnt1].Fileloc  := asLoc;
        asFilePath[icnt1].Filename := ExtractFileName(sr.Name);
        asFilePath[icnt1].Caller   := etCaller;
        asFilePath[icnt1].Filesize := GetFileSize(asFilepath[icnt1].Fullpath);
        asFilePath[icnt1].Filedate := File_GetLastModifiedDate(asFilepath[icnt1].Fullpath);
        inc(icnt1);
      end;
     end else begin
       bComplete  := true;
    end;
   end;
   FindClose(sr);
  end;
end;
//------------------------------------------------------------------------------

end.
