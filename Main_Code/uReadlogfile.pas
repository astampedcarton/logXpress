unit uReadlogfile;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes;

type
  TReadlog = class(Tobject)
    private

    public
      constructor Create(bFolder : Boolean; asfileloc : Ansistring; bforce : Boolean=false);
      function  ReadLogfile(bFolder : Boolean; bfileloc : Ansistring; bforce : Boolean=false) : Boolean;
      procedure DecodeLine(sType : Ansistring; asLine : Ansistring; iLine: Integer; iCodeLn : integer; bfolder : Boolean; fdet : Boolean = false);
  end;


implementation

function ReadLogfile(bFolder : Boolean; asfileloc : Ansistring;
                     bforce : Boolean=false) : Boolean;
var
 bCont  : Boolean;
 asLine : Ansistring;
 sDisp  : Ansistring;
 ic     : integer;
 icode  : integer;
 iLine,
 ilinecnt  : Integer;
 iprev  : Integer;
 Ftmp   : Ansistring;
 asStr  : Ansistring;
 idx    : integer;
 sStr, sTmp, stmp1   : Ansistring;
 dtSt, dten    : Tdatetime;
 fstream : TFilestream;
 fsize   : integer;
 htfile  : THandle;
 locfile : File;
 tval    : string;
 buf     : Ansistring;
 slline  : Tstringlist;
 bCapdetail : boolean;
begin
 try
  iLine := 0;
  icode := 0;
  iprev := -1;
  fsize := 0;

  if isnotempty(floc) then begin
   dtCurr := LastModified(floc);
   lbstats.Caption := DateTimeToStr(dtLast)+' ['+asTM+']'; //[108]

   if fmoptmenu <> nil then
     fmoptmenu.lbstats.Caption := DateTimeToStr(dtLast)+' ['+asTM+']'; //[108]

   if (dtLast <> dtCurr) or (bForce) or (bfolder) then begin //[163]
     vMemLogs.EmptyDataSet;
      bChangeLog := true;

      sDisp  := '';
      dtLast := dtCurr;

      bCont := false;
      bCont := FileInUse(floc,floc);
      fTmp  := MakeCopyofFile(floc); //changed
      tmpFloc := fTmp;
      bcont := false;               //changed
      if not bCont then begin //File is not in use
        try
          fstream := TFileStream.Create(floc, fmShareDenyNone);
          bBusy := true;
          SetLogStatus(true);
          Timer.Enabled := false;
          spbMenu.Enabled := false;
          ClearCounters1Click(nil); //[114]
          bstop := false; //115

          breport             := false;
          iTimer              := 0;

          if fmoptmenu <> nil then
            fmoptmenu.lbstats.Caption := 'Refreshing counter...';

          slline := TStringlist.Create;  //[158]
          slline.LoadFromStream(fstream);//[158]
          iline := 0;   //[test]
            dtst := Now;
            ilinecnt := slline.Count;
            for iline := 0 to ilinecnt-1 do begin //144
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

              if iline mod 300 = 0 then  begin
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
          inc(icnt);
          lbstats.left    := 968;
          lbstats.Caption := 'Reading information';
          if fmoptmenu <> nil then
            fmoptmenu.lbstats.Caption := 'Reading information';

          if fmoptmenu.Visible then
            fmoptmenu.FormStyle := fsStayOnTop;

          Application.ProcessMessages;
           if (iwarn > 0) or (ierr > 0) or (imerge > 0) or
              (iInv > 0) or (iDivs > 0) or (iUnint > 0) or (iCust > 0) or (iAllOth > 0) then
             bReport := true
           else
             bReport := false;
     finally
          if not bfolder then begin
            with vMemlogs do begin
              if vMemlogs.StatusFilter = [usInserted] then begin
                Post;
              end;
            end;
          end else begin
            with fmLogFolder.cdsfolders do begin
              if StatusFilter = [usInserted] then begin
                Post;
              end;
            end;
          end;
          Timer.Enabled := true;
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

     //Display the last DD set;
     with vMemlogs do begin
       last;
       while not bof do begin
         if fieldbyname('Type').AsString = 'LAST' then begin
           asStr := FieldByName('Entry').AsString;
         end;
         Prior;
       end;
     end; //wiht vMemlogs

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
  fstream.free;
  FreeAndNil(slline);

//  lbstats.Caption := 'Done reading information';
 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'ReadLogfile'+#13+#10+e.Message, mtWarning, [mbOK], 0);
      //If there is an exception, the timer must be reset
      FreeAndNil(slline);

    end;
 end;
end;
//------------------------------------------------------------------------------


end.
