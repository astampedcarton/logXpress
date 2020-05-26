unit uUserrules;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  inifiles,
  uUserTypes_d7,
  strutils_d7, Menus, Buttons, Vcl.ComCtrls, rkGlassButton,
  KControls, KGrids, KGraphics, KFunctions, Vcl.ExtCtrls;

type
  TfmUsereefrule = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    PopupMenu1: TPopupMenu;
    AddNewRule1: TMenuItem;
    bbClose: TrkGlassButton;
    rkGlassButton1: TrkGlassButton;
    pgUserdefrules: TPageControl;
    tsSTDRules: TTabSheet;
    tsUserrules: TTabSheet;
    sgRules: TKGrid;
    sgSTDRules: TKGrid;
    bbNewRule: TrkGlassButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sgRules1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgRules1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure AddNewRule1Click(Sender: TObject);
    procedure bbSaveClick(Sender: TObject);
    procedure LoadDefaultRules1Click(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure sgRulesEditorCreate(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TWinControl);
    procedure sgRulesEditorDataFromGrid(Sender: TObject; AEditor: TWinControl;
      ACol, ARow: Integer; var AssignText: Boolean);
    procedure bbCloseClick(Sender: TObject);
    procedure sgSTDRulesEditorCreate(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TWinControl);
    procedure sgSTDRulesEditorDataFromGrid(Sender: TObject;
      AEditor: TWinControl; ACol, ARow: Integer; var AssignText: Boolean);
  private
    { Private declarations }
    Rules   : Tinifile;
    rcRules : Rulesets;
    function LoadRules : Boolean;
    function SaveRules : Boolean;
    function LoadDefaultrules(bempty : Boolean) : Boolean;
    function Setupgrid : Boolean;
    function Checkforemptyrows : boolean;
  public
    { Public declarations }
    procedure Init;
  end;



var
  fmUsereefrule: TfmUsereefrule;

implementation

{$R *.DFM}

type
  TMyTextCell = class(TKGridAttrTextCell)
  private
    FCheckBoxState: TCheckBoxState;
    FNumber: Integer;
  protected
    procedure Initialize; override;
  public
    procedure Assign(Source: TKGridCell); override;
    // we don't need to override other methods
    property CheckBoxState: TCheckBoxState read FCheckBoxState write FCheckBoxState;
    property Number: Integer read FNumber write FNumber;
  end;

{ TMyTextCell }
//------------------------------------------------------------------------------

procedure TMyTextCell.Assign(Source: TKGridCell);
begin
  inherited;
  if Source is TMyTextCell then
  begin
    FCheckBoxState := TMyTextCell(Source).CheckBoxState;
    FNumber := TMyTextCell(Source).Number;
  end;
end;
//------------------------------------------------------------------------------

procedure TMyTextCell.Initialize;
begin
  inherited;
  FCheckBoxState := cbChecked;
  FNumber := 0;
end;

//------------------------------------------------------------------------------
procedure TfmUsereefrule.Init;
var
  bproblem : boolean;
begin
  try
    bproblem := not Setupgrid;
    if not bproblem then begin
      (*memInstruct.Lines.Clear;
      memInstruct.Lines.Add('Instructions to add new rules');
      memInstruct.Lines.Add('Right Click on the Grid and select Add new rule');
      memInstruct.Lines.Add('Classification - is like NOTE:, WARNING etc. Make sure that the complete classification is entered.');
      memInstruct.Lines.Add('Description - This is the entry that you want to be check for specifically.');
      memInstruct.Lines.Add('Rule Label - Short label for the rule that should be displayed - the max length is 20.');   *)
      bproblem := not LoadRules;
    end;
  except on
    e : exception do begin
    end;
  end;
end;
//------------------------------------------------------------------------------
function TfmUsereefrule.LoadRules : Boolean;
var
  iNrofRules : Integer;
  icnt       : Integer;
  bproblem   : boolean;
  rcRules    : Rulesets;
begin
  try
    icnt             := 0;
    iNrofRules       := 0;
    Rules            := TIniFile.Create(ExtractFilePath(application.exename)+'Logrules.ini');
    iNrofRules       := Rules.ReadInteger('Rulecount','Rulecounts', iNrofRules);
    bproblem := not LoadDefaultrules(true);

    if iNrofRules = 0 then begin
      rules.Free;
//      MessageDlg('No rules found. Loading the Predefined Rules. '+#13+#10+'Press Enter.', mtInformation, [mbOK], 0);
      bproblem := not LoadDefaultrules(true);
      if not bproblem then begin
        bbSaveClick(nil);
      end;
    end else begin
      sgRules.RowCount := iNrofRules+1;
      if iNrofRules <= 1 then begin
        sgRules.Cells[0, 1] := Rules.ReadString('Rules','Classification', rcRules.Classf);
        sgRules.Cells[1, 1] := Rules.ReadString('Rules','Rule', rcRules.Rule);
        sgRules.Cells[2, 1] := Rules.ReadString('Rules','Rulelabel', rcRules.Rule);
      end else begin
       for icnt := 1 to iNrofRules do begin
        sgRules.Cells[0, icnt] := Rules.ReadString('Rules'+inttostr(icnt),'Classification', rcRules.Classf);
        sgRules.Cells[1, icnt] := Rules.ReadString('Rules'+inttostr(icnt),'Rule'          , rcRules.Rule);
        sgRules.Cells[2, icnt] := Rules.ReadString('Rules'+inttostr(icnt),'Rulelabel'     , rcRules.Rule);
       end;
       sgRules.Rowcount      := icnt;
      end;
      rules.Free;
    end;
    CheckForEmptyRows;
    result := true;
  except on
    e : exception do begin
      result := false;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TfmUsereefrule.SaveRules : Boolean;
var
  icnt : integer;
  iTot : Integer;
  bproblem : boolean;
begin
 try
  iTot := 0;
  bproblem := not CheckForEmptyRows;
  if not bproblem then begin
    Rules       := TIniFile.Create(ExtractFilePath(application.exename)+'Logrules.ini');
    for icnt := 1 to sgRules.RowCount do begin
     if IsNotEmpty(sgRules.Cells[0, icnt]) and IsNotEmpty(sgRules.Cells[1, icnt]) then begin
       inc(iTot);
       Rules.WriteString('Rules'+inttostr(iTot), 'Classification', sgRules.Cells[0, icnt]);
       Rules.WriteString('Rules'+inttostr(iTot), 'Rule', sgRules.Cells[1, icnt]);
       if IsEmpty(sgRules.Cells[2,icnt]) then sgRules.Cells[2, icnt] := 'Critical';
       Rules.WriteString('Rules'+inttostr(iTot), 'Rulelabel', (sgRules.Cells[2, icnt]));
     end;
    end;
    Rules.WriteInteger('Rulecount','Rulecounts',iTot (*sgRules.RowCount*));
    Rules.Free;
//    LoadFormatSettings;
  end;
  result := true;
 except on
    e : exception do begin
      result := false;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TfmUsereefrule.LoadDefaultrules(bempty : Boolean) : Boolean;
  procedure Rules;
  begin
    sgSTDRules.Rowcount    := 21;

    sgSTDRules.Cells[0, 1] := 'Note';
    sgSTDRules.Cells[1, 1] := 'numeric values have been converted to character values';
    sgSTDRules.Cells[2, 1] := 'Users Call';

    sgSTDRules.Cells[0, 2] := 'Note';
    sgSTDRules.Cells[1, 2] := 'character values have been converted to numeric values';
    sgSTDRules.Cells[2, 2] := 'Users Call';

    sgSTDRules.Cells[0, 3] := 'Note';
    sgSTDRules.Cells[1, 3] := ' is uninitialized';
    sgSTDRules.Cells[2, 3] := 'Users Call';

    sgSTDRules.Cells[0, 4] := 'Note';
    sgSTDRules.Cells[1, 4] := 'invalid';
    sgSTDRules.Cells[2, 4] := 'Critical';

    sgSTDRules.Cells[0, 5] := 'Note';
    sgSTDRules.Cells[1, 5] := 'note 484-185';
    sgSTDRules.Cells[2, 5] := 'Non-Critical';

    sgSTDRules.Cells[0, 6] := 'Note';
    sgSTDRules.Cells[1, 6] := 'note 485-185';
    sgSTDRules.Cells[2, 6] := 'Non-Critical';

    sgSTDRules.Cells[0, 7] := 'Note';
    sgSTDRules.Cells[1, 7] := 'merge statement has more than one data set with repeats of by values.';
    sgSTDRules.Cells[2, 7] := 'Critical';

    sgSTDRules.Cells[0, 8] := 'Note';
    sgSTDRules.Cells[1, 8] := 'division by zero detected during the compilation phase';
    sgSTDRules.Cells[2, 8] := 'Critical';

    sgSTDRules.Cells[0, 9] := 'Note';
    sgSTDRules.Cells[1, 9] := 'at least one w.d format was too small for the number to be printed.';
    sgSTDRules.Cells[2, 9] := 'Users Call';

    sgSTDRules.Cells[0,10] := 'Note';
    sgSTDRules.Cells[1,10] := 'missing values were generated';
    sgSTDRules.Cells[2,10] := 'Users Call';

    sgSTDRules.Cells[0,11] := 'Note';
    sgSTDRules.Cells[1,11] := 'repeats of by values';
    sgSTDRules.Cells[2,11] := 'Users Call';

    sgSTDRules.Cells[0,12] := 'Note';
    sgSTDRules.Cells[1,12] := 'mathematical operations could not';
    sgSTDRules.Cells[2,12] := 'Users Call';

    sgSTDRules.Cells[0,13] := 'Note';
    sgSTDRules.Cells[1,13] := 'no observations in data set';
    sgSTDRules.Cells[2,13] := 'Users Call';

    sgSTDRules.Cells[0,14] := 'Note';
    sgSTDRules.Cells[1,14] := 'input data set is empty';
    sgSTDRules.Cells[2,14] := 'Users Call';

    sgSTDRules.Cells[0,15] := 'Note';
    sgSTDRules.Cells[1,15] := 'no by statement for preceding merge statement';
    sgSTDRules.Cells[2,15] := 'Users Call';

    sgSTDRules.Cells[0,16] := 'Custom';
    sgSTDRules.Cells[1,16] := '::';
    sgSTDRules.Cells[2,16] := 'Users Call';

    sgSTDRules.Cells[0,17] := 'Note';
    sgSTDRules.Cells[1,17] := 'problem in observation';
    sgSTDRules.Cells[2,17] := 'Critical';

    sgSTDRules.Cells[0,18] := 'Note';
    sgSTDRules.Cells[1,18] := 'calculated coordinate lies outside the visible area';
    sgSTDRules.Cells[2,18] := 'Critical';

    sgSTDRules.Cells[0,19] := 'Note';
    sgSTDRules.Cells[1,19] := 'error detected in annotate';
    sgSTDRules.Cells[2,19] := 'Critical';

    sgSTDRules.Cells[0,20] := 'Error';
    sgSTDRules.Cells[1,20] := 'All Errors';
    sgSTDRules.Cells[2,20] := 'Critical';

    sgSTDRules.Cells[0,21] := 'Warning';
    sgSTDRules.Cells[1,21] := 'All Warnings';
    sgSTDRules.Cells[2,21] := 'Users Call';


      (*sgRules.Cells[0, 1] := 'Note';
      sgRules.Cells[1, 1] := '';
      sgRules.Cells[2, 1] := 'NOTE';

      sgRules.Cells[0, 2] := 'Note';
      sgRules.Cells[1, 2] := 'MERGE statement has more than one data set with repeats of BY values.';
      sgRules.Cells[2, 2] := 'MERGE STATEMENTS';

      sgRules.Cells[0, 3] := 'Note';
      sgRules.Cells[1, 3] := 'Numeric values have been converted to character values';
      sgRules.Cells[2, 3] := 'NUM TO CHAR';

      sgRules.Cells[0, 4] := 'Note';
      sgRules.Cells[1, 4] := 'Character values have been converted to numeric values';
      sgRules.Cells[2, 4] := 'CHAR TO NUM';

      sgRules.Cells[0, 4] := 'Note';
      sgRules.Cells[1, 4] := ' Invalid argument to function';
      sgRules.Cells[2, 4] := 'INVALID';

      sgRules.Cells[0, 5] := 'Note';
      sgRules.Cells[1, 5] := ' Division by zero detected during the compilation phase';
      sgRules.Cells[2, 5] := 'DIV BY ZERO';

      sgRules.Cells[0, 6] := 'Note';
      sgRules.Cells[1, 6] := ' is uninitialized';
      sgRules.Cells[2, 6] := 'UNINITIALIZED';

      sgRules.Cells[0, 7] := 'Info:';
      sgRules.Cells[1, 7] := '';
      sgRules.Cells[2, 7] := 'INFO';

      sgRules.Cells[0, 8] := 'Error';
      sgRules.Cells[1, 8] := '';
      sgRules.Cells[2, 8] := 'ERROR';

      sgRules.Cells[0, 9] := 'Warning';
      sgRules.Cells[1, 9] := '';
      sgRules.Cells[2, 9] := 'WARNING';
      *)
   end;
begin
  try
  if not bempty then begin
(*    if (MessageDlg('You''ve choosen to load the defaults, all other entered entries will be delete.'+#13+#10+
                   'If you wish to add these rules Right click on the Grid and select Add Defaults to Rule list.'+#13+#10+
                   'Do you want to continue? ', mtConfirmation, [mbYes, mbNo], 0) in [mrYes, mrNone]) then begin*)
//      Clears(sgRules);
      Setupgrid;
      rules;
//    end;
  end else begin
//      Clears(sgRules);
      Setupgrid;
      rules;
  end;
  result := true;
  except on
    e : exception do begin
     result := false;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TfmUsereefrule.Setupgrid : Boolean;
begin
  try
    sgRules.Cells[0,0]    := 'Classification';
    sgRules.ColWidths[0]  := 100;
    sgRules.Cells[1,0]    := 'Description';
    sgRules.ColWidths[1]  := 520;
(*    sgRules.Cells[2,0]    := 'Rule Label';
    sgRules.ColWidths[2]  := 105; *)
    sgRules.Cells[2,0]    := 'Critical';
    sgRules.ColWidths[2]  := 105;
    sgRules.RowCount      := 2;
    sgRules.FixedRows     := 0;

    sgSTDRules.Cells[0,0]    := 'Classification';
    sgSTDRules.ColWidths[0]  := 100;
    sgSTDRules.Cells[1,0]    := 'Description';
    sgSTDRules.ColWidths[1]  := 520;

    sgSTDRules.Cells[2,0]    := 'Critical';
    sgSTDRules.ColWidths[2]  := 105;
    sgSTDRules.RowCount      := 2;
    sgSTDRules.FixedRows     := 0;

    result := true;
  except on
    e : exception do begin
      result := false;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmUsereefrule.FormShow(Sender: TObject);
begin
  pgUserdefrules.ActivePage := tsSTDRules;
end;
//------------------------------------------------------------------------------
function  TfmUsereefrule.CheckForEmptyRows : boolean;
var
 icnt : integer;
 it   : integer;
 idel : integer;
begin
  try
    for icnt := 0 to sgRules.Rowcount do begin
      idel := 0;
      for it := 0 to 2 do begin
        if not isnotEmpty(sgRules.Cells[it, icnt]) then begin
          inc(idel);
        end;
      end;
     end;
    result := true;
  except on
   e : Exception do begin
//    MessageDlg('CheckforEmptyRows enountered a problem:', mtError, [mbOK], 0);
    result := false;
   end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmUsereefrule.FormCreate(Sender: TObject);
begin
  init;
end;
//------------------------------------------------------------------------------
procedure TfmUsereefrule.sgRules1KeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
begin

end;
//------------------------------------------------------------------------------
procedure TfmUsereefrule.sgRules1MouseUp(Sender: TObject;Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 Mouse : TPoint;
begin
   if Button = mbRight then begin
    GetCursorPos(mouse);
    PopupMenu1.Popup(Mouse.X,Mouse.Y);
   end;
end;
//------------------------------------------------------------------------------

procedure TfmUsereefrule.sgRulesEditorCreate(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TWinControl);
var
  InitialCol, InitialRow: Integer;
begin
    //AEditor := TComboBox.Create(nil);
    //TComboBox(AEditor).Style := csDropDown; // cannot set height on Win!

  InitialCol := sgRules.InitialCol(ACol); // map column indexes
  InitialRow := sgRules.InitialRow(ARow); // map row indexes
  // do not create any editor in the 1.row
  if InitialRow = sgRules.FixedRows then Exit
  // new feature: create TEdit in the fixed rows!
  else if InitialRow < sgRules.FixedRows then
  begin
    if gxEditFixedRows in sgRules.OptionsEx then
      AEditor := TEdit.Create(nil);
    Exit;
  end;
  // create custom editors
  case InitialCol of
    0:
    begin
      AEditor := TComboBox.Create(nil);   //Classification
//      TComboBox(AEditor).Style := csDropDown; // cannot set height on Win!
      TComboBox(AEditor).style := csOwnerDrawFixed;
    end;
    1:
    begin
      AEditor := TEdit.Create(nil);      //Description
    end;
    2:
    begin
//      AEditor := TEdit.Create(nil);      //Critical
      AEditor := TComboBox.Create(nil);
//      TComboBox(AEditor).Style := csDropDown; // cannot set height on Win!
      TComboBox(AEditor).style := csOwnerDrawFixed;

    end;
   else

    if gxEditFixedCols in sgRules.OptionsEx then
      AEditor := TEdit.Create(nil);
  end;
end;
//------------------------------------------------------------------------------
procedure TfmUsereefrule.sgRulesEditorDataFromGrid(Sender: TObject;
  AEditor: TWinControl; ACol, ARow: Integer; var AssignText: Boolean);
var
  I, InitialCol, InitialRow: Integer;
  Cell: TMyTextCell;
  S: TKString;
begin
  InitialCol := sgRules.InitialCol(ACol); // map column indexes
  InitialRow := sgRules.InitialRow(ARow); // map row indexes
  Cell := TMyTextCell(sgRules.Cell[ACol, ARow]);
  { Set data from the grid to the editors in an user defined way.
    Data can be set in EditorCreate but some assignments need
    that the inplace editor has a parent control and this is
    the fact here (grid is always parent of inplace editor). }
  if InitialRow < sgRules.FixedRows then Exit;
  S := Cell.Text;// + ' ' + IntToStr(Cell.Number);
  case InitialCol of
    0: with TComboBox(AEditor) do
    begin
      Items.Add('Notes');
      Items.Add('Warnings');
      Items.Add('Errors');
      Items.Add('Other');
      Items.Add('Custom');
      Items.Add('Info');
      Items.Add('Conversions');
      Items.Add('Uninit.');
      Items.Add('Division');
      Items.Add('Merge');
      Items.Add('Invalid');
      Items.Add('Datasets');
      Items.Add('Missing Value');
      Items.Add('Repeat by Value');
      Items.Add('Math Oper.');
      Items.Add('No Obs in Data');
      Items.Add('No By State');
      ItemIndex := Items.IndexOf(Cell.Text);
    end;

    2: with TComboBox(AEditor) do
    begin
      Items.Add('Critical');
      Items.Add('Users Call');
      Items.Add('Non-Critical');
      ItemIndex := Items.IndexOf(Cell.Text);
    end;


  end;
  { We must combine the text and number and assign it to the editor: }
  if AssignText and (Cell.Number <> 0) then
  begin
    SetControlText(AEditor, S);
    AssignText := False;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmUsereefrule.sgSTDRulesEditorCreate(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TWinControl);
var
  InitialCol, InitialRow: Integer;
begin
    //AEditor := TComboBox.Create(nil);
    //TComboBox(AEditor).Style := csDropDown; // cannot set height on Win!

  InitialCol := sgSTDRules.InitialCol(ACol); // map column indexes
  InitialRow := sgSTDRules.InitialRow(ARow); // map row indexes
  // do not create any editor in the 1.row
  if InitialRow = sgSTDRules.FixedRows then Exit
  // new feature: create TEdit in the fixed rows!
  else if InitialRow < sgSTDRules.FixedRows then
  begin
    if gxEditFixedRows in sgSTDRules.OptionsEx then
      AEditor := TEdit.Create(nil);
    Exit;
  end;
  // create custom editors
  case InitialCol of
    0:
    begin
      AEditor := TComboBox.Create(nil);   //Classification
//      TComboBox(AEditor).Style := csDropDown; // cannot set height on Win!
      TComboBox(AEditor).style := csOwnerDrawFixed;
    end;
    1:
    begin
      AEditor := TEdit.Create(nil);      //Description
    end;
    2:
    begin
//      AEditor := TEdit.Create(nil);      //Critical
      AEditor := TComboBox.Create(nil);
//      TComboBox(AEditor).Style := csDropDown; // cannot set height on Win!
      TComboBox(AEditor).style := csOwnerDrawFixed;
    end;
   else

    if gxEditFixedCols in sgSTDRules.OptionsEx then
      AEditor := TEdit.Create(nil);
  end;
end;
//------------------------------------------------------------------------------
procedure TfmUsereefrule.sgSTDRulesEditorDataFromGrid(Sender: TObject;
  AEditor: TWinControl; ACol, ARow: Integer; var AssignText: Boolean);
var
  I, InitialCol, InitialRow: Integer;
  Cell: TMyTextCell;
  S: TKString;
begin
  InitialCol := sgSTDRules.InitialCol(ACol); // map column indexes
  InitialRow := sgSTDRules.InitialRow(ARow); // map row indexes
  Cell := TMyTextCell(sgSTDRules.Cell[ACol, ARow]);
  { Set data from the grid to the editors in an user defined way.
    Data can be set in EditorCreate but some assignments need
    that the inplace editor has a parent control and this is
    the fact here (grid is always parent of inplace editor). }
  if InitialRow < sgSTDRules.FixedRows then Exit;
  S := Cell.Text;// + ' ' + IntToStr(Cell.Number);
  case InitialCol of
    0: with TComboBox(AEditor) do
    begin
      Items.Add('Notes');
      Items.Add('Warnings');
      Items.Add('Errors');
      Items.Add('Other');
      Items.Add('Custom');
      Items.Add('Info');
      Items.Add('Conversions');
      Items.Add('Uninit.');
      Items.Add('Division');
      Items.Add('Merge');
      Items.Add('Invalid');
      Items.Add('Datasets');
      Items.Add('Missing Value');
      Items.Add('Repeat by Value');
      Items.Add('Math Oper.');
      Items.Add('No Obs in Data');
      Items.Add('No By State');
      ItemIndex := Items.IndexOf(Cell.Text)
    end;

    2: with TComboBox(AEditor) do
    begin
      Items.Add('Critical');
      Items.Add('Users Call');
      Items.Add('Non-Critical');
      ItemIndex := Items.IndexOf(Cell.Text)
    end;


  end;
  { We must combine the text and number and assign it to the editor: }
  if AssignText and (Cell.Number <> 0) then
  begin
    SetControlText(AEditor, S);
    AssignText := False;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmUsereefrule.AddNewRule1Click(Sender: TObject);
begin
 sgRules.Rowcount := sgRules.Rowcount + 1;
 pgUserdefrules.ActivePage := tsUserrules;
end;
//------------------------------------------------------------------------------
procedure TfmUsereefrule.bbSaveClick(Sender: TObject);
var
  bproblem : boolean;
begin
  bproblem := not SaveRules;
(*  if not bproblem then
    MessageDlg('New rules saved sucessfully.', mtInformation, [mbOK], 0)
  else MessageDlg('New rules did not saved.', mtInformation, [mbOK], 0);*)
end;
//------------------------------------------------------------------------------
procedure TfmUsereefrule.LoadDefaultRules1Click(Sender: TObject);
var
  bproblem : boolean;
begin
  bproblem := not LoadDefaultrules(false);
(*  if not bproblem then
    MessageDlg('Pre-defined rules loaded successfully.', mtInformation, [mbOK], 0)
  else MessageDlg('Pre-defined rules not loaded successfully.', mtInformation, [mbOK], 0);*)
end;
//------------------------------------------------------------------------------

procedure TfmUsereefrule.bbCancelClick(Sender: TObject);
begin
  if (MessageDlg('Are you sure you want to exit?', mtConfirmation, [mbYes, mbNo], 0) in [mrYes, mrNone]) then
    close;

end;
procedure TfmUsereefrule.bbCloseClick(Sender: TObject);
begin

end;

//------------------------------------------------------------------------------
end.
