unit uLogFile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ComCtrls, Buttons, ExtCtrls, richedit,
  StrUtils_d7, ads_strg, uLogRead, Menus, ImgList, rkGlassButton,
  (**SynHighlighterMulti, SynEditHighlighter,
  SynHighlighterGeneral,*) Vcl.ActnList,  Vcl.ActnMan(*, SynMemo, SynEdit*),
  System.Actions, System.ImageList, SynEdit, SynMemo, SynEditHighlighter,
  SynHighlighterGeneral;

type
  TfmLogfile = class(TForm)
    FindDialog: TFindDialog;
    ppMenu: TPopupMenu;
    Find1: TMenuItem;
    pnlProgress: TPanel;
    dlgSavefile: TSaveDialog;
    dlgOpen: TOpenDialog;
    stinfo: TStatusBar;
    spbGoline: TSpeedButton;
    edLine: TEdit;
    Label1: TLabel;
    pgBar: TProgressBar;
    ckLineson: TCheckBox;
//    memSrcStyle: TAdvBasicMemoStyler;
//    FindDialog: TAdvMemoFindDialog;
    OpenDialog1: TOpenDialog;
{    rcLines: TAdvMemo;
    AdvBasicMemoStyler1: TAdvBasicMemoStyler;
    AdvMemoStylerManager1: TAdvMemoStylerManager;  }
    bbFind: TrkGlassButton;
    bbClose: TrkGlassButton;
    il1: TImageList;
    ActionList1: TActionList;
    actFind: TAction;
    acClose: TAction;
    rclines: TSynMemo;
    synHighlight: TSynGeneralSyn;
    SynGeneralSyn1: TSynGeneralSyn;
    //rcLines: TAdvMemo;
    procedure FormCreate(Sender: TObject);
    procedure spbReadagainClick(Sender: TObject);
    procedure bbTmHideClick(Sender: TObject);
    procedure spbReadanotherClick(Sender: TObject);
    procedure bbRunClick(Sender: TObject);
    procedure pgMainChange(Sender: TObject);
    procedure spbFindClick(Sender: TObject);
    procedure spbPrevClick(Sender: TObject);
    procedure spbNextClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rcLines2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rcLines2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure rcLinesChange(Sender: TObject);
    procedure gpDetailsClick(Sender: TObject);
    procedure FormDockOver(Sender: TObject; Source: TDragDockObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure Panel1DockOver(Sender: TObject; Source: TDragDockObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure Panel1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Panel1DockDrop(Sender: TObject; Source: TDragDockObject; X,
      Y: Integer);
    procedure rcLines2KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FindDialogFind(Sender: TObject);
    procedure bbReadLogtimeClick(Sender: TObject);
    procedure bbReadAnalzClick(Sender: TObject);
    procedure bbAnalTimingClick(Sender: TObject);
    procedure bbAnalyzeClick(Sender: TObject);
    procedure rcLines2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure rcLines2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure bbTimExpClick(Sender: TObject);
    procedure bbAnalExpClick(Sender: TObject);
//    procedure dsDetailsDataChange(Sender: TObject; Field: TField);
    procedure bbImpTimeClick(Sender: TObject);
    procedure bbImpAnalClick(Sender: TObject);
    procedure spbGolineClick(Sender: TObject);
    procedure edLineExit(Sender: TObject);
    procedure ckLinesonClick(Sender: TObject);
    procedure rcLinesDblClick(Sender: TObject);
    procedure edLineKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actFindExecute(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bbCloseClick(Sender: TObject);
    procedure sgDetailsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgDetailsMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sgDetailsSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgDetailsDblClick(Sender: TObject);
    procedure gpDblClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure rcLinesKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    (*procedure SynMultiSyn1CustomRange(Sender: TSynMultiSyn;
      Operation: TRangeOperation; var Range: Pointer);  *)
  private
    { Private declarations }
    pnlmini,
    bRead,
    bAnalyze,
    bTimers    : boolean;
    sWord      : String;
    sHighlight : String;
    iselln,
    iline,vlen     : integer;
    function  CreateFindcds : boolean;
    procedure Gottoline(Linenr, Startpos, endpos, iLen : Integer);
//    function  HighLight : boolean;
    procedure CreateParams(var Params: TCreateParams); override;
  public
    { Public declarations }
//    procedure Setupgridcols(asVal : Ansistring);
    procedure ShowLogFile;
    procedure Performformat(ffile : ansistring; asLn : Ansistring = '');
    function  Movetoline(len, line : integer) : boolean;
    function  PopulateStringGrid : boolean;
  end;

var
  fmLogfile: TfmLogfile;

implementation

uses {uDisplayLog,} uDetails, uProgress (*, uConjoinHost, uDockForm, uTabHost*),
  uOptmenu;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure TfmLogfile.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do begin
    ExStyle := ExStyle ;//or WS_EX_TOPMOST; //[185]
//    WndParent := GetDesktopwindow;
    params.wndParent := 0;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.bbAnalyzeClick(Sender: TObject);
begin
 try
{  cdsDetails.EmptyDataSet;
  AnalyzeFile;
  bAnalyze := true;
  fmLogDisplay.FormStyle := fsStayOnTop;
  fmLogDisplay.show;
  application.ProcessMessages;}

 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+
                 'bbAnalyzeClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.bbCloseClick(Sender: TObject);
begin
  close;
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.bbImpAnalClick(Sender: TObject);
begin
 try
{   dlgOpen.Filter     := 'Analyze File|*.anllog';
   dlgOpen.DefaultExt := 'anllog';
   if dlgOpen.Execute then begin
     cdsDetails.LoadFromFile(dlgOpen.FileName);
   end;}
 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+
                 'bbImpTimeClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.bbImpTimeClick(Sender: TObject);
begin
 try
{   dlgOpen.Filter     := 'Time File|*.timlog';
   dlgOpen.DefaultExt := 'timlog';
   if dlgOpen.Execute then begin
     cdsTiming.LoadFromFile(dlgOpen.FileName);
   end;}
 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+
                 'bbImpTimeClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.bbReadAnalzClick(Sender: TObject);
begin
 try
//   bbAnalyzeClick(sender);
 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+
                 'bbReadAnalzClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.bbReadLogtimeClick(Sender: TObject);
begin
 try
{  cdsTiming.EmptyDataSet;
  AnalyzeTimeFile;
  bTimers := true;
  fmLogDisplay.FormStyle := fsStayOnTop;
  fmLogDisplay.show;
  application.ProcessMessages;
}
 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+
                 'bbReadLogtimeClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.actFindExecute(Sender: TObject);
begin
 try
   FindDialog.Execute;
 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+
                 'actFindExecute'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.bbAnalExpClick(Sender: TObject);
begin
 try
{   dlgSavefile.DefaultExt := 'anllog';
   dlgSavefile.filter     := '*.anllog';
   if dlgSavefile.Execute then begin
     cdsDetails.SaveToFile(dlgSavefile.FileName,dfXML);
   end;
   }
 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+
                 'bbAnalExpClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.bbAnalTimingClick(Sender: TObject);
begin
 try
//   bbReadLogtimeClick(Sender);
 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+
                 'bbAnalTimingClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.bbRunClick(Sender: TObject);
begin
 try
//   fmLogDisplay.bbRunClick(nil);
 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+
                 'bbRunClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.bbTimExpClick(Sender: TObject);
begin
 try
{   dlgSavefile.DefaultExt := 'timlog';
   dlgSavefile.filter     := '*.timlog';

   if dlgSavefile.Execute then begin
     cdsTiming.SaveToFile(dlgSavefile.FileName,dfXML);
   end;}
 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+
                 'bbTimExpClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.bbTmHideClick(Sender: TObject);
begin
 try
//   fmLogDisplay.FormStyle := fsStayOnTop;
   close;
 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+
                 'bbTmHideClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.ckLinesonClick(Sender: TObject);
begin
 try
//   rclines.Lined := ckLineson.Checked;
 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+
                 'ckLinesonClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.FindDialogFind(Sender: TObject);//[134
var
 SelPos, SPos, SLen, TextLength: Integer;
 SearchString  : string;
 shft : Tshiftstate;
 Line : integer;

begin

(*
 with TReplaceDialog(Sender) do begin
  TextLength:=Length(rcLines.Lines.Text);

  SPos:=rcLines.SelStart;
  SLen:=rcLines.SelLength;

  SearchString := Copy(rcLines.Lines.Text,
                       SPos + SLen + 1,
                       TextLength - SLen + 1);

  SelPos := Pos(FindText, SearchString);
  if SelPos > 0 then begin
    rcLines.SelStart := (SelPos - 1) + (SPos + SLen);
    rcLines.SelLength := Length(FindText);
    with rcLines do begin
       Line := Perform(EM_LINEFROMCHAR,SelStart, 0) ;
    end;
    stInfo.Panels[1].Text := 'Current Line: '+InttoStr(Line);

  end else MessageDlg('Could not find "' + FindText +
      '" in the Log file.', mtError, [mbOk], 0);
  end;
  *)
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.FormActivate(Sender: TObject);
begin
    Self.FormStyle := fsStayonTop;
end;

procedure TfmLogfile.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 try
//   fmLogDisplay.FormStyle := fsStayOnTop;
  edline.Text := '';
 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+
                 'FormClose'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
//  fmLogDisplay.FormStyle := fsStayOnTop;
end;

//------------------------------------------------------------------------------
{Function RichEditWndProc (handle:HWnd;uMsg,wParam,lParam:longint): longint stdcall;
begin
      Result := CallWindowProc(fmLogfile.OldRichEditWndProc, handle, uMsg, wParam, lParam);
      if uMsg=WM_PAINT then fmLogfile.HighLight;
End;}
//------------------------------------------------------------------------------
procedure TfmLogfile.FormCreate(Sender: TObject);
begin
 try
//  Setupgridcols('Log Details');
//  Setupgridcols('Timing Details');
//  lbstatus.Caption := '';
//  pgLoad.Min := 0;
  stinfo.Panels.Add;
  stinfo.Panels[0].Width := 200;
  stinfo.Panels.Add;
  stinfo.Panels[1].Width := 200;

(*  sgDetails.Cells[0,0]   := 'Line #';
  sgDetails.ColWidths[1] := 60;
  sgDetails.Cells[1,0]   := 'Line Details';
  sgDetails.ColWidths[1] := 800;
  sgDetails.RowCount     := 1;  *)
//  ckLineson.Checked := rclines.Lined;

//  panel5.Height := 0;

//  bLogChange := false;
  bAnalyze   := false;
  bTimers    := false;
  pnlmini    := false;
  self.Visible := false;
{  if not CreateFindcds then
    MessageDlg('Could not create Find Data Setup.'+#13+#10+
               'Find function on Log file will not work.', mtWarning, [mbOK], 0);}

 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+
                 'FormCreate'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.FormDeactivate(Sender: TObject);
begin
  Self.FormStyle := fsNormal;
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.FormDockOver(Sender: TObject; Source: TDragDockObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
  ARect: TRect;
begin
  Accept := (Source.Control is TfmLogfile);

end;
//------------------------------------------------------------------------------
procedure TfmLogfile.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  try
    if (key = vk_escape)  then begin
      close;
    end;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'sgDetailsKeyUp'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.FormResize(Sender: TObject);
begin
 try
//   if fmLogFile.WindowState = wsMaximized then
//     fmLogFile.Height := fmLogFile.Height - 13;
 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+
                 'FormResize'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.FormShow(Sender: TObject);
begin
//    fmDetails.FormStyle := fsNormal;
//   fmLogDisplay.FormStyle := fsStayOnTop;
//   fmLogfile.FormStyle    := fsStayonTop;
end;
//------------------------------------------------------------------------------
function  TfmLogfile.CreateFindcds : boolean;
begin
 try
    result := true;
 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+
                 'CreateFindcds'+#13+#10+e.Message, mtWarning, [mbOK], 0);
     result := false;
    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.edLineExit(Sender: TObject);
var
  sval : string;
begin
  try
   sval := edline.Text;
   if rclines.Lines.Count > 0 then begin
//     if (strToInt(sval) in [0..9])  then begin
     if not isempty(edline.Text) then
       rclines.GotoLineAndCenter(strtoint(edline.Text));
//     end else begin
//       showmessage('Only numeric values are allowed');
//     end;
   end;
 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+
                 'edLineExit'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
 end;

end;
//------------------------------------------------------------------------------

procedure TfmLogfile.edLineKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if key = vk_return then begin
    if IsNotEmpty(edLine.Text) then
       rclines.GotoLineAndCenter(strtoint(edline.Text));
  end else begin
    if IsNotEmpty(edLine.Text) then
       rclines.GotoLineAndCenter(strtoint(edline.Text));
  end;

  if (key = vk_escape)  then begin
    close;
  end;

end;

//------------------------------------------------------------------------------
procedure TfmLogfile.Panel1DockDrop(Sender: TObject; Source: TDragDockObject; X,
  Y: Integer);
begin
//  ShowMessage('Hello');
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.Panel1DockOver(Sender: TObject; Source: TDragDockObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
  ARect: TRect;
begin
  Accept := (Source.Control is TfmDetails);
  //Draw dock preview depending on where the cursor is relative to our client area

end;
//------------------------------------------------------------------------------
procedure TfmLogfile.Panel1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := (Source is TfmDetails);
  //Draw dock preview depending on where the cursor is relative to our client area
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.Performformat(ffile : ansistring; asLn : Ansistring = '');
var
  idx : integer;
  icnt : integer;
  sTmp : String;
  sStr : String;
  asLine : Ansistring;
  cf: TCharFormat;
  ilen : Integer;
  ilinecnt : integer;
  i, j,  CharPos, CharPos2, noChars: Integer;
  utext  : array[1..4] of string;
  slline : Tstringlist;
  fstream : TStream;
begin
 try
//    if ffile <> '' then begin

      icnt := 0;

      utext[1] := 'NOTE:';
      utext[2] := 'ERROR:';
      utext[3] := 'INFO:';
      utext[4] := 'WARNING:';
      slline   := TStringlist.Create();

  //  if not GetReadStatus then begin
  //    slline.LoadFromfile(ffile);
      fstream := TfileStream.Create(ffile, fmOpenRead or fmShareDenyNone); //[173]
      slline.LoadFromStream(fstream);  //[180]
      //slline.SaveToFile(ExtractFilePath(Application.exename)+'_tmp_.log'); //[180]
(*
      try

        rcLines.Lines.Clear;
        ilinecnt := 0;
        ilinecnt  := slline.Count;
        pgBar.Max := ilinecnt;

        application.processmessages;
        rcLines.Lines.AddStrings(slline);
        stinfo.Panels.Items[0].Text := 'Total Line Count: '+ IntToStr(slline.Count);
        rcLines.Visible := true;

      finally
        pgBar.visible := false;
        freeAndNil(slline);
        freeAndNil(fstream);
      end;
      *)
   except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+
                 'Performformat'+#13+#10+e.Message, mtWarning, [mbOK], 0);
      fmProgress.Hide;
      freeAndNil(slline);
      freeAndNil(fstream);
//      rcLines.Visible := true;
    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.pgMainChange(Sender: TObject);
begin
 try
//  if pgmain.ActivePage = tsDetails then begin
//    pnlProgress.Height := 25;
//    fmLogDisplay.bbDetreadClick(nil)
//    if (fmLogDisplay.GetLogstatus) and (not bAnalyze = true) then begin
{      cdsDetails.EmptyDataSet; [138]
      AnalyzeFile;
      bAnalyze := true;}
//    end;
//  end else
//  if pgmain.ActivePage = tsTime then begin
//    pnlProgress.Height := 25;
//    fmLogDisplay.bbTmReadClick(nil)
//    if (fmLogDisplay.GetLogstatus) and (not bTimers = true) then begin
{      cdsTiming.EmptyDataSet; [138]
      AnalyzeTimeFile;
      bTimers := true;}
//    end;
//  end; //else     pnlProgress.Height := 0;

//  if pgmain.ActivePage = tsLogDisplay then

//  fmLogDisplay.FormStyle := fsStayOnTop;
//  fmLogDisplay.show;
  application.ProcessMessages;
 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+
                 'pgMainChange'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
 end;
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.rcLinesChange(Sender: TObject);
var
 asLine : Ansistring;
 sTmp   : String;
 icnt, ilen, idx   : integer;
 sStr   : String;
begin

{    ilen  := length(asLine);
    idx := pos(' ',asLine);
    sTmp := lowercase(copy(rcLines.Lines.Text, 1, idx-1));
    sStr := Copy(rcLines.Lines.Text, idx, length(rcLines.Lines.Text));
    if (stmp = 'note:') or (stmp = 'note') or (stmp = 'note::') or
       (stmp = 'info:') or (stmp = 'info::') or (stmp = 'error:') or
       (stmp = 'error') or (stmp = 'error::') or
       (stmp = 'warning:') or (stmp = 'warning::') or (stmp = 'warning') then begin
       rcLines.SelAttributes.Style := [fsBold];
       if (stmp = 'note:') or (stmp = 'note') or (stmp = 'note::')then begin
         rcLines.SelAttributes.Color := clNavy;
       end else
       if (stmp = 'info:') or (stmp = 'info::') then begin
        rcLines.SelAttributes.Color := clPurple;
       end else
       if (stmp = 'error:') or (stmp = 'error::') or (stmp = 'error') then begin
        rcLines.SelAttributes.Color := clRed;
       end else
       if (stmp = 'warning:') or (stmp = 'warning::') or (stmp = 'warning') then begin
        rcLines.SelAttributes.Color := clGreen;
       end
    end; }
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.rcLinesDblClick(Sender: TObject);
var
  ffiles : ansistring;
begin
  if OpenDialog1.Execute then begin
     ffiles := Opendialog1.FileName;
  end;
//  ffiles := ExtractFilePath(Application.exename)+'_tmp_.log';
//  rcLines.Lines.LoadFromFile(ffiles); //[180]

end;
//------------------------------------------------------------------------------
procedure TfmLogfile.rcLinesKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then begin   //[B 43]
    close;
  end;
end;

//------------------------------------------------------------------------------
procedure TfmLogfile.sgDetailsDblClick(Sender: TObject);
var
  icnt : integer;
begin
  try
    icnt := 1;
    if iline >= 0 then begin

//      sgDetails.Enabled  := false;
      Caption := 'Info on Log file read from ';
      rcLines.Lines.LoadFromFile(fmoptmenu.GetFileloc);
//      sgDetails.Enabled  := true;

      Movetoline(vlen, iline);

    end;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'sgDetailsDblClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//-----------------------------------------------------------------------------
procedure TfmLogfile.sgDetailsKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  try
    if (key = vk_return) then begin
       sgDetailsDblClick(nil);
    end;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'sgDetailsKeyUp'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.sgDetailsMouseUp(Sender: TObject; Button: TMouseButton;
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
//    if ckQuickView.Checked then begin
      (*slfile := Tstringlist.Create;
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
//      end;

      FreeandNil(slfile);
    end; *)
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'sgDetailsMouseUp'+#13+#10+e.Message, mtWarning, [mbOK], 0);
      FreeandNil(slfile);
    end;
  end;
end;

procedure TfmLogfile.sgDetailsSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  try
    (*if sgDetails.Cells[0, Arow] <> '' then begin
      if sgDetails.Cells[0, Arow] <> 'Line #' then begin
        iline := StrToInt(sgDetails.Cells[0, Arow]);
        vlen  := length(sgDetails.Cells[1, arow]);
      end;
    end;*)
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'sgDetailsSelectCell'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TfmLogfile.rcLines2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Line : integer;
begin
(*  with rcLines do begin
     Line := Perform(EM_LINEFROMCHAR,SelStart, 0) ;
//     Column := SelStart - Perform(EM_LINEINDEX, Line, 0) ;
  end;
  stInfo.Panels[1].Text := 'Current Line: '+InttoStr(Line);
*)
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.rcLines2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.rcLines2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  m   : Tpoint;
begin
  if Button = mbRight then begin
    GetCursorPos(m);
    ppMenu.Popup(m.X, m.Y);
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.rcLines2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  Line : integer;
begin
  (*
  with rcLines do begin
     Line := Perform(EM_LINEFROMCHAR,SelStart, 0) ;
//     Column := SelStart - Perform(EM_LINEINDEX, Line, 0) ;
  end;
  stInfo.Panels[1].Text := 'Line nr: '+InttoStr(Line);
  *)
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.rcLines2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  iIdx,
  iln,
  istr,
  iend, k, j  : integer;
  pt    : Tpoint;
  sVal  : string;

begin
(*  with TRichEdit(Sender) do begin
      pt   := Point(x, y);
      iIdx := Perform(Messages.EM_CHARFROMPOS,0, Integer(@pt) );
      if iIdx < 0 then exit;
      iln := Perform(EM_EXLINEFROMCHAR, 0, iIdx) ;
      iend := iIdx - Perform(EM_LINEINDEX, iln, 0) ;
      if -1 + Lines.Count < iln then Exit;
      sval := Lines[iln];
      inc(iend) ;
      k := iend;

//      while (k > 0) and (sval[k] <> ' ') and (sval[k] <> ':') and (sval[k] <> '-') do
//      while (k >0) and sval[k] in ['#','$','(','[','{','}',']','|','\','-',+'','?'] do ;
        while (k > 0) and (sval[k]<> '#') and (sval[k]<> '$') and (sval[k]<> '(') and (sval[k]<> ')') and
        (sval[k]<> '&') and (sval[k]<> '%') and (sval[k]<> '[') and (sval[k]<> '{') and
        (sval[k]<> '}') and (sval[k]<> ']') and (sval[k]<> '|') and (sval[k]<> '\') and
        (sval[k]<> '-') and (sval[k]<> '+') and (sval[k]<> '?') do inc(k);

         k:=k-1;

      inc(iend) ;
      j := iend;

//      while (j <= Length(sval)) and (sval[j] <> ' ') and (sval[j] <> ':') and (sval[j] <> '-') do inc(j) ;
      while (j <= Length(sval)) and (sval[j]<> '#') and (sval[j]<> '$') and (sval[j]<> '(') and (sval[k]<> ')') and
        (sval[j]<> '&') and (sval[j]<> '%') and (sval[j]<> '[') and (sval[j]<> '{') and
        (sval[j]<> '}') and (sval[j]<> ']') and (sval[j]<> '|') and (sval[j]<> '\') and
        (sval[j]<> '-') and (sval[j]<> '+') and (sval[j]<> '?') do inc(j) ;

      sWord := Copy(sval, k, j - k) ;
      if pos(':',sword) <> 0 then begin
         sWord  := DelRSpace(ReplaceStr(sWord,':',''));
      end else begin
         sWord  := DelRSpace(sWord);
      end ;

   end; *)
//   Highlight; //[155]
end;

//------------------------------------------------------------------------------
procedure TfmLogfile.ShowLogFile;
var
  asVal : ansistring;
begin
  try
//    pgMain.ActivePage := tsLogDisplay;
//    pgAnalyze.ActivePage := tsLogDisplay;

//    stBar.Panels.Add;
//    stBar.Panels.Items[0].Text := 'Line Count: '+IntToStr(memlines.Lines.Count);
//    btnMenu.Caption := asVal;
//    fmLogDisplay.Timer.Enabled  := false;
    fmLogfile.Show;
//    fmLogDisplay.Timer.Enabled  := true;
  except on
   e : Exception do begin
    MessageDlg('The following exception occurred in:'+#13+#10+'ShowLogFile'+#13+#10+e.Message, mtWarning, [mbOK], 0);
   end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.spbReadagainClick(Sender: TObject);
begin;
  try
{    if pgmain.ActivePage = tsDetails then begin
//      fmLogDisplay.bbDetreadClick(nil)
    end else
    if pgmain.ActivePage = tsTime then begin
//      fmLogDisplay.bbTmReadClick(nil);
    end;}
  except on
   e : Exception do begin
    MessageDlg('The following exception occurred in:'+#13+#10+'spbReadagainClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
   end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.spbReadanotherClick(Sender: TObject);
begin
  try
  except on
   e : Exception do begin
    MessageDlg('The following exception occurred in:'+#13+#10+'spbReadagainClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
   end;
  end;
end;
(*procedure TfmLogfile.SynMultiSyn1CustomRange(Sender: TSynMultiSyn;
  Operation: TRangeOperation; var Range: Pointer);
begin

end;
*)
//------------------------------------------------------------------------------
procedure TfmLogfile.spbFindClick(Sender: TObject);
var
 idx,
 icnt,
 imat,iline, ilen  : integer;
 asStr : Ansistring;
begin
 try
   {idx  := 0;
   icnt := 0;
   imat := 0;
   if Not IsEmpty(edFindText.Text) then begin

     if not InitFindCDS then
      MessageDlg('Unable to clear the Find XML data.'+#13+#10+
                 'Results might be incorrect.'+#13+#10, mtWarning, [mbOK], 0);

     with rcLines do begin
       iline := rcLines.Lines.Count;
       while icnt <= Lines.Count do begin
         asStr := Lines.Strings[icnt];
         ilen  := Length(asstr);
  //       idx   := npos(edFindtext.Text, asStr, ilen);
         idx   := pos(edFindtext.Text, asStr);
  //       rcEdit.FindText(edFindText.text, 0, Length(Text),[stMatchCase]);
         //Build a list of all occurences
         //must include line numbers
         if idx <> 0 then begin
           cdsFind.Insert;
           cdsFind.FieldByName('linenr'  ).AsInteger := icnt;
           cdsFind.FieldByName('startpos').AsInteger := idx;
           cdsFind.FieldByName('endpos'  ).AsInteger := length(edFindText.Text);
           cdsFind.FieldByName('entry'   ).AsString  := '';
           cdsFind.FieldByName('linelen' ).AsInteger := ilen;
           cdsFind.Post;
           inc(imat);
         end;
         inc(icnt);
       end;
     end;
     lbmatchcnt.caption := inttostr(imat);
     application.ProcessMessages;

     cdsFind.last;

     application.ProcessMessages;
   end;}
   FindDialog.Execute;

  except on
   e : Exception do begin
    MessageDlg('The following exception occurred in:'+#13+#10+'spbFindClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
   end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.spbGolineClick(Sender: TObject);
begin
  Movetoline(1,StrtoInt(edLine.Text));
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.spbNextClick(Sender: TObject);
begin
  try
{    with cdsFind do begin
      if eof then begin
        First;
//        lbinfo.Caption := 'Last entry reached. Going to the start.';
      end else
        lbinfo.Caption := '';

        Next;
        Gottoline(FieldbyName('Linenr').AsInteger,
                   FieldbyName('Startpos').AsInteger,
                   FieldbyName('endpos').AsInteger,
                   FieldbyName('linelen').AsInteger);
    end;}
  except on
   e : Exception do begin
    MessageDlg('The following exception occurred in:'+#13+#10+'spbNextClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
   end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.spbPrevClick(Sender: TObject);
begin
  try
//    with cdsFind do begin
//      if BOF then begin
//        Previous;
//        lbinfo.Caption := 'Last entry reached. Going to the start.';
//      end else
//        lbinfo.Caption := '';
//
//        Previous;
//        Gottoline(FieldbyName('Linenr').AsInteger,
//                   FieldbyName('Startpos').AsInteger,
//                   FieldbyName('endpos').AsInteger,
//                   FieldbyName('linelen').AsInteger);
//    end;
  except on
   e : Exception do begin
    MessageDlg('The following exception occurred in:'+#13+#10+'spbPrevClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
   end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmLogfile.Gottoline(Linenr, Startpos, endpos, iLen : Integer);
begin
  try
  (*
    rcLines.SelStart  := rcLines.Perform(EM_LINEINDEX, Linenr, 0);
    rcLines.SetFocus;
    rcLines.SelLength := ilen;
    *)
  except on
   e : Exception do begin
    MessageDlg('The following exception occurred in:'+#13+#10+'spbPrevClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
   end;
  end;
end;

//------------------------------------------------------------------------------
procedure TfmLogfile.gpDblClick(Sender: TObject);
begin
 try
(*   if pnlmini = true then begin
     pnlNavigate.Height   := 175;
     pnlmini     := false;
     gp.Caption  := 'Navigate (Double Click to Hide)';
   end else begin
     pnlNavigate.Height   := 14;
     pnlmini     := true;
     gp.Caption  := 'Navigate (Double Click to Maximize)';
   end;*)
 except on
  e : Exception do begin
    MessageDlg('The following exception occurred in:'+#13+#10+'gpDblClick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
  end;
 end;
end;

procedure TfmLogfile.gpDetailsClick(Sender: TObject);
begin

end;

//------------------------------------------------------------------------------
function  TfmLogfile.Movetoline(len, line : integer) : boolean;
begin
 try
  ShowLogFile;
//  rcLines.ActiveLine := line-1;
  rcLines.GotoLineAndCenter(line);

{  rcLines.SelStart  := fmLogfile.rcLines.Perform(EM_LINEINDEX, Line, 0);
  rcLines.SelLength := len;    }
//  rcLines.SetFocus;
 except on
  e : Exception do begin
    MessageDlg('The following exception occurred in:'+#13+#10+'Movetoline'+#13+#10+e.Message, mtWarning, [mbOK], 0);
  end;
 end;
end;
//------------------------------------------------------------------------------
function  TfmLogfile.PopulateStringGrid : boolean;
begin
 try


 except on
  e : Exception do begin
    MessageDlg('The following exception occurred in:'+#13+#10+'PopulateStringGrid'+#13+#10+e.Message, mtWarning, [mbOK], 0);
  end;
 end;
end;
//------------------------------------------------------------------------------


end.


{procedure TForm1.RichEdit1MouseMove
  (Sender: TObject; Shift: TShiftState; X, Y: Integer) ;
var
   ci, //Character Index
   lix, //Line Index
   co, //Character Offset
   k, j: Integer;
   Pt: TPoint;
   s: string;
begin
   with TRichEdit(Sender) do
   begin
     Pt := Point(X, Y) ;
     ci := Perform(Messages.EM_CHARFROMPOS, 0, Integer(@Pt)) ;
     if ci < 0 then Exit;
     lix := Perform(EM_EXLINEFROMCHAR, 0, ci) ;
     co := ci - Perform(EM_LINEINDEX, lix, 0) ;
     if -1 + Lines.Count < lix then Exit;
     s := Lines[lix];
     Inc(co) ;
k := co;
     while (k > 0) and (s[k] <> ' ') do k:=k-1;
     Inc(co) ;
j := co;
     while (j <= Length(s)) and (s[j] <> ' ') do Inc(j) ;
     WordInRE := Copy(s, k, j - k) ;
   end;
end;}



(*

http://delphi.about.com/od/formsdialogs/a/frm_dock_screen.htm
http://stackoverflow.com/questions/5216860/start-program-and-dock-with-an-existing-program-delphi-2010

*)
