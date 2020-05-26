unit uLogview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Menus, JvExControls, Strutils_d7,
  JvEditorCommon, JvEditor, JvHLEditor, AdvMemo, AdvMemoStylerManager, AdvmBS,
  rkGlassButton;//, AdvMemo, AdvmBS;

type
  Tfmlogview = class(TForm)
    stinfo: TStatusBar;
    ppMenu: TPopupMenu;
    Find1: TMenuItem;
    FindDialog: TFindDialog;
    rcLoglines1: TRichEdit;
//    rcLoglines: TAdvMemo;
    rcLines1: TRichEdit;
    AdvBasicMemoStyler1: TAdvBasicMemoStyler;
    AdvMemoStylerManager1: TAdvMemoStylerManager;
    rclogLines: TAdvMemo;
    pnlProgress: TPanel;
    spbGoline: TSpeedButton;
    lb1: TLabel;
    edLine: TEdit;
    pgBar: TProgressBar;
    chkLineson: TCheckBox;
    bbFind: TrkGlassButton;
    bbClose: TrkGlassButton;
    procedure bbCloseClick(Sender: TObject);
    procedure rcLoglinesMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure rcLoglinesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rcLoglinesChange(Sender: TObject);
    procedure rcLoglinesMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure spbFind1Click(Sender: TObject);
    procedure FindDialogFind(Sender: TObject);
    procedure edLineKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    function  Movetoline(len, line : integer) : boolean;
  end;

var
  fmlogview: Tfmlogview;

implementation

{$R *.dfm}

//------------------------------------------------------------------------------
procedure Tfmlogview.bbCloseClick(Sender: TObject);
begin
  close;
end;
//------------------------------------------------------------------------------
procedure Tfmlogview.edLineKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then begin
    if IsNotEmpty(edLine.Text) then
      rcLoglines.ActiveLine := strToInt(edLine.Text)-1;
  end else begin
    if IsNotEmpty(edLine.Text) then
      rcLoglines.ActiveLine := strToInt(edLine.Text)-1;
  end;
end;

procedure Tfmlogview.FindDialogFind(Sender: TObject);
var
 SelPos, SPos, SLen, TextLength: Integer;
 SearchString  : string;
 shft : Tshiftstate;
 Line : integer;

begin
 with TReplaceDialog(Sender) do begin
  TextLength:=Length(rcLoglines.Lines.Text);

  SPos:=rcLoglines.SelStart;
  SLen:=rcLoglines.SelLength;

  SearchString := Copy(rcLoglines.Lines.Text,
                       SPos + SLen + 1,
                       TextLength - SLen + 1);

  SelPos := Pos(FindText, SearchString);
  if SelPos > 0 then begin
    rcLoglines.SelStart := (SelPos - 1) + (SPos + SLen);
    rcLoglines.SelLength := Length(FindText);
    with rcLoglines do begin
       Line := Perform(EM_LINEFROMCHAR,SelStart, 0) ;
    end;
    stInfo.Panels[1].Text := 'Current Line: '+InttoStr(Line);

  end else MessageDlg('Could not find "' + FindText +
      '" in the Log file.', mtError, [mbOk], 0);
  end;

end;
//------------------------------------------------------------------------------
procedure Tfmlogview.FormCreate(Sender: TObject);
begin
 try
  stinfo.Panels.Add;
  stinfo.Panels[0].Width := 200;
  stinfo.Panels.Add;
  stinfo.Panels[1].Width := 200;
 except on
  e : Exception do begin
    MessageDlg('The following exception occurred in:'+#13+#10+'FormCreate'+#13+#10+e.Message, mtWarning, [mbOK], 0);
  end;
 end;
end;
//------------------------------------------------------------------------------
function  Tfmlogview.Movetoline(len, line : integer) : boolean;
begin
 try
//  ShowLogFile;
  rclogLines.ActiveLine := line;
  {rcLoglines.SelStart  := fmlogview.rcLoglines.Perform(EM_LINEINDEX, Line, 0);
  rcLoglines.SelLength := len;
  rcLoglines.SetFocus;   }
 except on
  e : Exception do begin
    MessageDlg('The following exception occurred in:'+#13+#10+'Movetoline'+#13+#10+e.Message, mtWarning, [mbOK], 0);
  end;
 end;
end;
//------------------------------------------------------------------------------
procedure Tfmlogview.rcLoglinesChange(Sender: TObject);
begin
    application.ProcessMessages;
    stinfo.Panels.Items[0].Text := 'Total Line Count: '+ IntToStr(rcloglines.Lines.Count);

end;
//------------------------------------------------------------------------------
procedure Tfmlogview.rcLoglinesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Line : integer;
begin
  with rclogLines do begin
     Line := Perform(EM_LINEFROMCHAR,SelStart, 0) ;
  end;
  stInfo.Panels[1].Text := 'Current Line: '+InttoStr(Line);
end;
//------------------------------------------------------------------------------
procedure Tfmlogview.rcLoglinesMouseDown(Sender: TObject; Button: TMouseButton;
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
procedure Tfmlogview.rcLoglinesMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  Line : integer;
begin
  with rclogLines do begin
     Line := Perform(EM_LINEFROMCHAR,SelStart, 0) ;
//     Column := SelStart - Perform(EM_LINEINDEX, Line, 0) ;
  end;
  stInfo.Panels[1].Text := 'Line nr: '+InttoStr(Line);
end;
procedure Tfmlogview.spbFind1Click(Sender: TObject);
begin
   //FindDialog1.Execute;

end;

//------------------------------------------------------------------------------
end.
