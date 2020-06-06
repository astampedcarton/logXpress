program LogExpress;


(*uses
  Forms,
  Windows,
  inifiles,
  sysutils,
  uFLoc in 'uFLoc.pas' {frmFLoc},
  uDetails in 'uDetails.pas' {fmDetails},
  uAbout in 'uAbout.pas' {fmAbout},
  uLogFile in 'uLogFile.pas' {fmLogfile},
  uLogfolder in 'uLogfolder.pas' {fmLogFolder},
  uLogRead in 'uLogRead.pas',
  uRelease in 'uRelease.pas' {fmRelease},
  uOptmenu in 'uOptmenu.pas' {fmoptmenu},
  uProgress in 'uProgress.pas' {fmProgress},
  uOptions in 'uOptions.pas' {fmOptions},
  ufileExtract in 'ufileExtract.pas' {fmExtract},
  uReadCompares in 'uReadCompares.pas' {fmChkCompares},
  uLogFileRead in 'uLogFileRead.pas'  {fmInforesults},
  Vcl.Styles,
  Vcl.Themes; *)



uses
  Forms,
  Windows,
  inifiles,
  sysutils,
  uOptmenu in 'uOptmenu.pas' {fmoptmenu},
  uFLoc in 'uFLoc.pas' {frmFLoc},
  uDetails in 'uDetails.pas' {fmDetails},
  uAbout in 'uAbout.pas' {fmAbout},
  uLogFile in 'uLogFile.pas' {fmLogfile},
  uLogfolder in 'uLogfolder.pas' {fmLogFolder},
  uLogRead in 'uLogRead.pas',
  uRelease in 'uRelease.pas' {fmRelease},
  uProgress in 'uProgress.pas' {fmProgress},
  uLogFileRead in 'uLogFileRead.pas' {fmInforesults},
  Vcl.Themes,
  Vcl.Styles {/  uSelectCompInfo in 'uSelectCompInfo.pas' {fmSelectCompInfo},
  uTxt2xlsx_xml in 'uTxt2xlsx_xml.pas',
  uUserrules in 'uUserrules.pas' {fmUsereefrule},
  uReadUIUpdate in 'uReadUIUpdate.pas';

{$R *.RES}


var
  ExtendedStyle: Integer;
  ssParam      : Ansistring;
  ssParval     : Ansistring;
//  settings     : Tinifile;
//  itype        : integer;
//  etDisplaytype : etDisptype;
//  PreviousHandle, wnd : THandle;

begin
   // Don't start twice ... if already running bring this instance to front
  { PreviousHandle := CreateSemaphore(nil, 0, 1, 'SELA.EXE');
   if ((PreviousHandle <> 0) and // application is already running
       (GetLastError = ERROR_ALREADY_EXISTS)) then begin
     PreviousHandle := GetWindowLong(Wnd, GWL_HWNDPARENT);
     ShowWindow(PreviousHandle, SW_RESTORE);

     CloseHandle(PreviousHandle);
     Halt;
   end; }

  Application.MainFormOnTaskbar := true;
  Application.Initialize;
  ExtendedStyle := GetWindowLong(Application.Handle, GWL_EXSTYLE);
  SetWindowLong(Application.Handle, GWL_EXSTYLE, ExtendedStyle or WS_EX_TOOLWINDOW
    and not WS_EX_APPWINDOW);

    ssParam   := Paramstr(1);
    ssParVal  := Paramstr(2);
//    ssParam := '-batch';
  TStyleManager.TrySetStyle('Onyx Blue');
  Application.Title := 'Log Express - BETA Testing';

    if lowercase(ssParam) = '-batch' then begin
      Application.CreateForm(Tfmoptmenu, fmoptmenu);
  Application.CreateForm(TfmUsereefrule, fmUsereefrule);
  Application.CreateForm(TfrmFLoc, frmFLoc);
  Application.CreateForm(TfmLogfile, fmLogfile);
  frmFLoc.setbatchfilename(ssParVal);
      frmFLoc.ShowModal;
    end else begin
    //  Application.Title := '';
    //  Application.CreateForm(TfmViewselect, fmViewselect);
    //  Application.CreateForm(TfmLogDisplay, fmLogDisplay);
      Application.CreateForm(Tfmoptmenu, fmoptmenu);
      Application.CreateForm(TfmUsereefrule, fmUsereefrule);
//      Application.CreateForm(TfmUsereefrule, fmUsereefrule);
      Application.CreateForm(TfrmFLoc, frmFLoc);
      Application.CreateForm(TfmAbout, fmAbout);
      Application.CreateForm(TfmDetails, fmDetails);
      Application.CreateForm(TfmLogfile, fmLogfile);
      Application.CreateForm(TfmLogFolder, fmLogFolder);
      Application.CreateForm(TfmRelease, fmRelease);
      Application.CreateForm(TfmProgress, fmProgress);
    //  Application.CreateForm(TfmOptions, fmOptions);
    //  Application.CreateForm(TfmExtract, fmExtract);
    //  Application.CreateForm(TfmChkCompares, fmChkCompares);
    //  Application.CreateForm(TfmInforesults, fmInforesults);
    //  Application.CreateForm(TfmMacrodebug, fmMacrodebug);
    //  Application.CreateForm(TfmUsereefrule, fmUsereefrule);
      Application.Run;
    end;
end.
