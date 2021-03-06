unit uDetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Forms,
  Dialogs, Buttons, ExtCtrls, Menus, uLogRead, Controls, ComCtrls,
  StdCtrls, KControls, KGrids, rkGlassButton;

//Type etLoad = (etError, etWarn, etInfo, etUnint, etConvert,
//               etMerge, etInvalid, etDivs);

type
  TfmDetails = class(TForm)
    pnlCap: TPanel;
    pgLoad: TProgressBar;
    ckQuickView: TCheckBox;
    spbPin: TSpeedButton;
    spbClose: TSpeedButton;
    lbCap: TLabel;
    sgDetails: TKGrid; 
    procedure spbCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgDetailsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pnlCapMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sgDetails1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgDetails1DblClick(Sender: TObject);
    procedure sgDetails1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure spbPinClick(Sender: TObject);
    procedure sgDetails1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bbSavetooClick(Sender: TObject);

  private
    { Private declarations }
    iLine : integer;
    vlen  : integer; //this is the length of the entry
    bPin  : boolean;
    etLastLoad    : etLoad;
    ilstleft      : integer;
    ilstright     : integer;
    ilsttop       : integer;
    ilstbottom    : integer;
    aploc         : ansistring;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure WMNCHitTest(var Msg: TWMNcHitTest); message WM_NCHITTEST;

    { Public declarations }
  public
    procedure FilterbyType(etType : etLoad);
    procedure display(ileft, iright, itop, ibottom : integer;
                       asString : Ansistring; asCap : AnsiString; bHideline : boolean=false);
    function  LoadDetails(etType : etLoad;
                        ileft, iright, itop, ibottom : integer) : boolean;
  end;

var
  fmDetails: TfmDetails;

implementation

uses {uDisplayLog,}
     uLogFile, uLogFileRead, uProgress, (*ufileExtract,*) uOptmenu;

{$R *.dfm}
//------------------------------------------------------------------------------

procedure TfmDetails.bbSavetooClick(Sender: TObject);
begin

end;
//------------------------------------------------------------------------------
procedure TfmDetails.CreateParams(var Params: TCreateParams); //[102]
begin
  try
    inherited CreateParams(Params);
    with Params do begin
      Style := Style + WS_POPUP - WS_DLGFRAME ;
//      Style:=(Style or WS_POPUP) and (not WS_DLGFRAME);
      ExStyle := ExStyle ;//or WS_EX_TOPMOST;   //[185
      WndParent := GetDesktopwindow;
    end;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'TfmDetails.CreateParams'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmDetails.WMNCHitTest(var msg: TWMNCHitTest);  //[102]
begin
  try
    inherited;
    if (msg.Result = htClient) then
     msg.Result := htCaption;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'TfmDetails.WMNCHitTest'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;

end;
//------------------------------------------------------------------------------
procedure TfmDetails.dbgDetailsDblClick(Sender: TObject);
begin
  try

  sgDetails.Enabled  := false;
    if not fmLogfile.Visible then begin
      fmLogfile.Caption := 'Info on Log file read from ';
      fmLogfile.Show;
      application.ProcessMessages;
    end;
    sgDetails.Enabled  := true;

    fmLogfile.Movetoline(vlen, iline);

  except on
    e :exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'dbgDetailsDblClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);

    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmDetails.dbgDetailsKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  try
    if key = vk_return  then
       dbgDetailsDblClick(nil);

  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'dbgDetailsKeyUp'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmDetails.display(ileft, iright, itop, ibottom : integer;
                             asString : Ansistring; asCap : AnsiString; bHideline : boolean=false);
begin
  try

    lbCap.Caption := '  More details on '+asCap;
    fmDetails.FormStyle := fsNormal;

    fmDetails.Left := ileft;
    if iTop <= 10 then iTop := 11
    else if iTop = 11 then iTop := 11
    else iTop := iTop;

    fmDetails.Top       := iTop;
    fmDetails.FormStyle := fsNormal;
    if asCap = 'Data Sets Found' then begin
      fmDetails.Width     := 740;
      fmDetails.Height    := 240;
    end else begin
      fmDetails.Width     := 740;
      fmDetails.Height    := 240;
    end;

    if bHideLine then begin
      lbCap.Caption    := asCap;
    end;

    fmDetails.Show;
    fmDetails.FormStyle := fsNormal;

  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'display'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmDetails.sgDetails1DblClick(Sender: TObject);
var
  icnt : integer;
begin
  try
//  dbgDetails.Enabled := false;
    icnt := 1;
    if iline >= 0 then begin

      sgDetails.Enabled  := false;
      if not fmLogfile.Visible then begin
        fmLogfile.Caption := 'Info on Log file read from... Busy loading please wait. ';
        fmLogfile.Show;
        fmLogfile.Caption := 'Info on Log file read from... Busy loading please wait. ';
        fmLogfile.rcLines.Lines.LoadFromFile(fmoptmenu.GetFileloc);
        fmLogfile.Caption := 'Info on Log file read from. '+fmoptmenu.GetFileloc;

      end;
      sgDetails.Enabled  := true;

      fmLogfile.Movetoline(vlen, iline);
      fmDetails.Visible := true;
    end;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'sgDetailsDblClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmDetails.sgDetails1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  try
    if (key = vk_return)  then begin
       if iline = -1 then begin
          if (sgDetails.Cells[0, 1] <> 'Line #') and (sgDetails.RowCount > 1) then begin
            iline := StrToInt(sgDetails.Cells[0, 1]);
          end else iline := 1;
       end;
       sgDetails1DblClick(nil);
       iline := -1;
    end;

    if key = vk_escape then begin   //[B 43]
      spbCloseClick(nil);
    end;

  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'sgDetailsKeyUp'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
{procedure TfmDetails.sgDetails1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  acol, arow : integer;
  iline      : integer;
  icnt       : integer;
  otline     : integer;
  itot       : integer;
  slfile     : Tstringlist;
begin
  try
    //[196]
    if ckQuickView.Checked then begin
      slfile := Tstringlist.Create;
      otline   := 16;
      //Get the coordinates from the mouse and determine the row. Col is not that important
      sgDetails.MouseToCell(x,y, acol, arow);
      if sgDetails.Cells[0, Arow] <> '' then begin
        if sgDetails.Cells[0, Arow] <> 'Line #' then begin
          iline := StrToInt(sgDetails.Cells[0, Arow]);
        end;

        if iline > 0 then begin
          //Load the file and then load the 16 lines before the entry;

          slfile.LoadFromFile(fmLogDisplay.GetTmpfileloc);
          itot   := slfile.Count;

          if itot > iline then begin
            otline := abs(iline - otline);
            if otline < 0 then otline := 1;
          end else begin
            otline := 1;
            iline  := itot;
          end;

          fmExtract.rcExtract.Lines.Clear;
          fmExtract.pgLoad.Min := 1;
          fmExtract.pgLoad.Max := 16;

          while (otline < iline) do begin
            fmExtract.rcExtract.Lines.Add(slfile.Strings[otline]);
            fmExtract.pgLoad.StepBy(1);
            Application.ProcessMessages;
            inc(otline);
          end;

          fmExtract.Left   := fmDetails.Width + fmDetails.left;
          fmExtract.top    := fmDetails.top;
          fmExtract.Show;
        end;
      end;

      FreeandNil(slfile);
    end;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'sgDetailsMouseMove'+#13+#10+e.Message, mtWarning, [mbOK], 0);
      FreeandNil(slfile);
    end;
  end;
end;    }
//------------------------------------------------------------------------------
procedure TfmDetails.sgDetails1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  acol, arow : integer;
  iline      : integer;
  icnt       : integer;
  otline     : integer;
  itot       : integer;
  slfile     : Tstringlist;
begin
  try
    //[196]
    if ckQuickView.Checked then begin
      slfile := Tstringlist.Create;
      otline   := 16;
      if sgDetails.Cells[0, Arow] <> '' then begin
      //Get the coordinates from the mouse and determine the row. Col is not that important
        sgDetails.MouseToCell(x,y, acol, arow);
        if sgDetails.Cells[0, Arow] <> 'Line #' then begin
          iline := StrToInt(sgDetails.Cells[0, Arow]);
        end;

        if iline > 0 then begin
          //Load the file and then load the 16 lines before the entry;

          slfile.LoadFromFile(fmoptmenu.GetFileloc);
          itot   := slfile.Count;

          if itot > iline then begin
            otline := (iline - otline);
            if otline < 0 then otline := 1;
          end else begin
            otline := 1;
            iline  := itot;
          end;

        end;
      end;

      FreeandNil(slfile);
    end;
    fmDetails.FormStyle := fsNormal;

  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'sgDetailsMouseUp'+#13+#10+e.Message, mtWarning, [mbOK], 0);
      FreeandNil(slfile);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmDetails.sgDetails1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  try
    if sgDetails.Cells[0, Arow] <> '' then begin
      if sgDetails.Cells[0, Arow] <> 'Line #' then begin
        iline := StrToInt(sgDetails.Cells[0, Arow]);
        vlen  := length(sgDetails.Cells[1, arow]);
      end;
    end;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'sgDetailsSelectCell'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmDetails.spbCloseClick(Sender: TObject);
begin
  try
    lbCap.Caption    := '';
    fmDetails.Hide;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'spbCloseClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmDetails.spbPinClick(Sender: TObject);
begin    //[185
  try
    if bpin then begin
      bpin := false;
      fmDetails.FormStyle := fsNormal;
      spbPin.Flat := false;
      spbPin.hint := 'Click to Pin';
    end else begin
      bpin := true;
      spbPin.Flat := true;
      fmDetails.FormStyle := fsStayontop;
      spbPin.hint := 'Click to Un-Pin';
    end;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'FormShow'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmDetails.FormClick(Sender: TObject);
begin
  try
    fmDetails.FormStyle := fsStayOnTop;
    fmLogfile.FormStyle := fsNormal;
    Close;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'FormClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmDetails.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    fmDetails.Hide;
    Close;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'FormClose'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmDetails.FormCreate(Sender: TObject);
begin
  try
    aploc := ExtractFilePath(Application.ExeName);
    sgDetails.Cells[0,0]   := 'Line #';
    sgDetails.ColWidths[1] := 25;
    sgDetails.Cells[1,0]   := 'Line Details';
    sgDetails.ColWidths[1] := 650;
    sgDetails.RowCount     := 1;
    iline                  := -1;

    fmDetails.Hide;
    fmDetails.Visible := false;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'FormCreate'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
procedure TfmDetails.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then begin
    spbCloseClick(nil);
  end;
end;

//------------------------------------------------------------------------------
procedure TfmDetails.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  try
    fmDetails.FormStyle := fsStayonTop;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'FormMouseDown'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmDetails.FormShow(Sender: TObject);
begin
  try
  iline := -1;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'FormShow'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmDetails.pnlCapMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
  SC_DRAGMOVE = $F012;
begin
  try
    if Button = mbLeft then begin
      ReleaseCapture;
      SendMessage( fmDetails.Handle, WM_SYSCOMMAND, SC_DRAGMOVE, 0 );
    end;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'pnlCapMouseDown'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmDetails.FilterbyType(etType : etLoad);
var
  rc1flogs : Tloginfo;
  icol     : integer;
  icnt     : integer;
  asFilt   : AnsiString;
  imod     : integer;
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
    else if etType = etLast    then asFilt := 'LAST'
    else if etType = etmisvals   then asFilt := 'missval'
    else if etType = etrepbyval  then asFilt := 'repbyval'
    else if etType = etmathop    then asFilt := 'methop'
    else if etType = etnobosdata then asFilt := 'nobosdata'
    else if etType = etnobystate then asFilt := 'nobystate'
    else if etType = etUserdefined then asFilt := 'usrdefine';

    sgDetails.RowCount       := 1;
    imod := 350;

    assignfile(flogs, aploc+'logs.dat');
    reset(flogs);
    icol := 1;
    icnt := 1;
    pgLoad.Position := 0;
    try
      pgLoad.Max := filesize(flogs);

      if pgload.Max > 5000 then imod := 1500;

      Visible    := true;
      while not EOF(flogs) do begin
        read(flogs, rc1Flogs);
        if rc1flogs.types <> '' then begin
          if (rc1flogs.Types = asFilt) then begin

            sgDetails.RowCount       := sgDetails.RowCount + 1;
            sgDetails.Cells[0, icol] := Inttostr(rc1Flogs.LineNr);
            sgDetails.Cells[1, icol] := rc1Flogs.entry;

            inc(icol);
          end;
        end;
        inc(icnt);

        if icol mod imod = 0 then  begin  //[B 15]
          pgLoad.Position := icnt;
          application.ProcessMessages;
        end;
      end;

      pgLoad.Position := icnt;
      application.ProcessMessages;

    finally
      if icol > 1 then
        sgDetails.FixedRows    := 1;

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
function  TfmDetails.LoadDetails(etType : etLoad;
                        ileft, iright, itop, ibottom : integer) : boolean;
var
  asStr : Ansistring;
begin
  try
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
    end else
    if etType = etmisvals then begin                                                           //[B 17]
      fmDetails.display(ileft, iright ,itop+1, ibottom, asStr, 'Missing values were generated');
    end else
    if etType = etrepbyval then begin
      fmDetails.display(ileft, iright ,itop+1, ibottom, asStr, 'Repeats of BY values');
    end else
    if etType = etmathop then begin
      fmDetails.display(ileft, iright ,itop+1, ibottom, asStr, 'Mathematical operations ');
    end else
    if etType = etnobosdata then begin
      fmDetails.display(ileft, iright ,itop+1, ibottom, asStr, 'No observations in data set');
    end else
    if etType = etnobystate then begin
      fmDetails.display(ileft, iright ,itop+1, ibottom, asStr, 'No by statement for Merge');
    end else
    if etType = etUserdefined then begin
      fmDetails.display(ileft, iright ,itop+1, ibottom, asStr, 'User define Messages');
    end;

    FilterbyType(etType);
    application.ProcessMessages; //[B 15]

    etLastLoad    := etType;
    ilstleft      := ileft;
    ilstright     := iright;
    ilsttop       := itop;
    ilstbottom    := ibottom;

    result := true;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'LoadDetails'+#13+#10+e.Message, mtWarning, [mbOK], 0);
      result := false;
    end;
  end;
end;


//------------------------------------------------------------------------------
end.
