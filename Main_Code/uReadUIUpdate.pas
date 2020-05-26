unit uReadUIUpdate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, StrUtils_d7, uUserTypes_d7,
  ads_strg, uLogRead, uLogFileRead, ComCtrls, dialogs,  ads_date, Strutils, Grids, KControls, KGrids;

type
TReadUIUpdate = class(Tobject)
  private
    pgbars    : TProgressbar;
    tvTrees   : TTreeView;
    sgGridchk : TStringGrid;
    sgrowi    : integer;
    aplocs     : Ansistring;
    etTypes   : etLoad;
    function  BuildFilterTree(etTyp : etLoad; pgBar : Tprogressbar; tvTree : TTreeView; bFilter : boolean=True) : boolean;
  public
    constructor create(sgGrid : TStringGrid; aploc : ansistring; tvTree : TTreeView ); overload;
	  destructor destroy; override;
    procedure Griddblclick(sggrid: TStringGrid; Detailsgrid : TKGrid; pgBar : TProgressbar; tvTree : TTreeview;
                                     sgRow : integer; Sender: TObject; bfolder : boolean=false);
    procedure ClearCounters(sgGrid: Tstringgrid; Sender: TObject);
    function  UpdateGrid
    (sggrid : Tstringgrid; lfReadobj : TLogFileRead; pgBar : TProgressbar) : Boolean;
    function  LoadDetails(etType : etLoad; DetailsGrid : TKGrid; pgBar : Tprogressbar; tvTree : TTreeview;
                          ileft, iright, itop, ibottom : integer; bfolder : boolean; bBuildin :Boolean =false ) : boolean;
    procedure FilterbyType(etType : etLoad; sgDetailgrid : TKGrid; pgBar : TProgressbar; tvTree : TTreeView; bFolder : boolean);
    procedure sgToCheckSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure tvViewMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

end;

implementation

uses uLogFile;
//-------------------------------------------------------------------------------------------------------------------
constructor TReadUIUpdate.create(sgGrid : TStringGrid; aploc : ansistring; tvTree : TTreeView );
begin
  inherited Create;             // Call TObject.Create.
   sgGridchk := sgGrid;
   aplocs    := aploc;
   tvTrees   := tvTree;
end;
//-------------------------------------------------------------------------------------------------------------------
destructor TReadUIUpdate.destroy;
begin

  inherited Destroy;
end;
//-------------------------------------------------------------------------------------------------------------------
procedure TReadUIUpdate.Griddblclick(sggrid: TStringGrid; Detailsgrid : TKGrid; pgBar : TProgressbar; tvTree : TTreeview;
                                     sgRow : integer; Sender: TObject; bfolder : boolean=false);
var
  etTypes : etLoad;
begin
 try
//   sgToCheck.Enabled := false;
   with sggrid do begin
     if cells[0, sgRow]  = 'Notes' then etTypes := etNotes
     else if cells[0, sgRow]  = 'Info' then etTypes := etinfo
     else if cells[0, sgRow]  = 'Conversions' then etTypes := etConvert
     else if cells[0, sgRow]  = 'Uninitialized' then etTypes := etUnint
     else if cells[0, sgRow]  = 'Errors' then etTypes := eterror
     else if cells[0, sgRow]  = 'Division' then etTypes := etdivs
     else if cells[0, sgRow]  = 'Merge' then etTypes := etmerge
     else if cells[0, sgRow]  = 'Invalid' then etTypes := etinvalid
     else if cells[0, sgRow]  = 'Warnings' then etTypes := etwarn
     else if cells[0, sgRow]  = 'Other' then etTypes := etalloth
     else if cells[0, sgRow]  = 'Custom' then etTypes := etCust
     else if cells[0, sgRow]  = 'Datasets' then etTypes := etlast
     else if cells[0, sgrow]  = 'Missing Value' then etTypes := etmisvals
     else if cells[0, sgrow]  = 'Repeat by Value' then etTypes := etrepbyval
     else if cells[0, sgrow]  = 'Math Opertion' then etTypes := etmathop
     else if cells[0, sgrow]  = 'No Obs in Data' then etTypes := etnobosdata
     else if cells[0, sgrow]  = 'No By Statement' then etTypes := etnobystate
     else if cells[0, sgrow]  = 'User Defined' then etTypes := etUserdefined ;
   end;

   if not bfolder then begin
  //   if not LoadDetails(etTypes, fmoptmenu.Width ,0, sggrid.Top, 0) then

     if not LoadDetails(etTypes, DetailsGrid, pgBar, nil, 0, 0, 0, 0, false, true ) then
        MessageDlg('Grid containing detailed information failed to populate. ', mtError, [mbOK], 0);
    end else begin
      if not LoadDetails(etTypes, DetailsGrid, pgBar, tvTree, 0, 0, 0, 0, true, true ) then
    end;
   sggrid.Enabled := true;
 except on
    e : Exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'TReadUIUpdate.Griddblclick'+#13+#10+e.Message, mtWarning, [mbOK], 0);
     sggrid.Enabled := true;
   end;
 end;
end;
//-------------------------------------------------------------------------------------------------------------------
procedure TReadUIUpdate.ClearCounters(sgGrid: Tstringgrid; Sender: TObject);
begin
  try
    with sgGrid do begin
     cells[0, 1]  := 'Notes';
     cells[0, 2]  := 'Info';
     cells[0, 3]  := 'Conversions';
     cells[0, 4]  := 'Uninitialized';
     cells[0, 5]  := 'Errors';
     cells[0, 6]  := 'Division';
     cells[0, 7]  := 'Merge';
     cells[0, 8]  := 'Invalid';
     cells[0, 9]  := 'Warnings';
     cells[0, 10] := 'Other';
     cells[0, 11] := 'Custom';
//     cells[0, 12] := 'Datasets';
     cells[0, 12] := 'Missing Value';
     cells[0, 13] := 'Repeat by Value';
     cells[0, 14] := 'Math Opertion';
     cells[0, 15] := 'No Obs in Data';
     cells[0, 16] := 'No By Statement';
//     cells[0, 18] := 'Annotate Errors';
     cells[0, 17] := 'User Defined';

	   cells[1, 1]  := '0';
     cells[1, 2]  := '0';
     cells[1, 3]  := '0';
     cells[1, 4]  := '0';
     cells[1, 5]  := '0';
     cells[1, 6]  := '0';
     cells[1, 7]  := '0';
     cells[1, 8]  := '0';
     cells[1, 9]  := '0';
     cells[1, 10] := '0';
     cells[1, 11] := '0';
     cells[1, 12] := '0';
     cells[1, 13] := '0';
     cells[1, 14] := '0';
     cells[1, 15] := '0';
     cells[1, 16] := '0';
     cells[1, 17] := '0';

    end;

  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'Tfmoptmenu.ClearCounters2Click'+#13+#10+e.Message+#13+#10, mtWarning, [mbOK], 0);
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
function  TReadUIUpdate.UpdateGrid(sggrid : Tstringgrid; lfReadobj : TLogFileRead; pgBar : TProgressbar) : Boolean;
var
  icnt : integer;
begin
  try
//  for icnt := 1 to high(rcFlogs) do begin
    with sgGrid do begin
     cells[0, 1]  := 'Notes';
     cells[0, 2]  := 'Info';
     cells[0, 3]  := 'Conversions';
     cells[0, 4]  := 'Uninitialized';
     cells[0, 5]  := 'Errors';
     cells[0, 6]  := 'Division';
     cells[0, 7]  := 'Merge';
     cells[0, 8]  := 'Invalid';
     cells[0, 9]  := 'Warnings';
     cells[0, 10] := 'Other';
     cells[0, 11] := 'Custom';
//     cells[0, 12] := 'Datasets';
     cells[0, 12] := 'Missing Value';
     cells[0, 13] := 'Repeat by Value';
     cells[0, 14] := 'Math Opertion';
     cells[0, 15] := 'No Obs in Data';
     cells[0, 16] := 'No By Statement';
//     cells[0, 18] := 'Annotate Errors';
     cells[0, 17] := 'User Defined';

     cells[1, 1]  := inttostr(lfReadobj.getcntnote);
     cells[1, 2]  := inttostr(lfReadobj.getCntWarn);
     cells[1, 3]  := inttostr(lfReadobj.getconvnotescnt);
     cells[1, 4]  := inttostr(lfReadobj.getuninitcnt);
     cells[1, 5]  := inttostr(lfReadobj.getcnterr);
     cells[1, 6]  := inttostr(lfReadobj.getdivzero);
     cells[1, 7]  := inttostr(lfReadobj.getcntmerge);
     cells[1, 8]  := inttostr(lfReadobj.getcntinvalid);
     cells[1, 9]  := inttostr(lfReadobj.getcntwarn);
     cells[1, 10] := inttostr(lfReadobj.getalloth);
     cells[1, 11] := inttostr(lfReadobj.getcustcnt);
     cells[1, 12] := inttostr(lfReadobj.getmissvalue);
     cells[1, 13] := inttostr(lfReadobj.getrepbyval);
     cells[1, 14] := inttostr(lfReadobj.getmathop);
     cells[1, 15] := inttostr(lfReadobj.getnoobsdata);
     cells[1, 16] := inttostr(lfReadobj.getnobystate);
     cells[1, 17] := inttostr(lfReadobj.getusrdef);
    end;

    (*setconvnotescnt;
    setuninitcnt;
    setcnterr;
    setdivzero;
    setcntmerge;
    setcntinvalid;
    setcntwarn;
    setalloth;
    setcustcnt;
    setcntinfo;

    ActivateForm; *)

    result := true;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'UpdateGrid'+#13+#10+e.Message, mtWarning, [mbOK], 0);
      result := false;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
function  TReadUIUpdate.LoadDetails(etType : etLoad; DetailsGrid : TKGrid; pgBar : Tprogressbar; tvTree : TTreeview;
                                    ileft, iright, itop, ibottom : integer; bfolder : boolean; bBuildin :Boolean =false ) : boolean;
var
  asStr : Ansistring;
begin
  try
  //If the Details will have to be displayed in a "build in" Grid This section will
  //no executed. This is to make provision for the Compact version
    if bbuildin = False then begin
//      Timer1.Enabled    := false;
//      pnlResults.Enabled := false; //[B 35]
//      fmDetails.LoadDetails(etType, ileft, iright, itop, ibottom);

//      pnlResults.Enabled:= true;
//      Timer1.Enabled    := true;
    end else begin
      if not bfolder then begin
        FilterbyType(etType,DetailsGrid, pgBar, nil, false);
        application.ProcessMessages; //[B 15]
      end else begin
        FilterbyType(etType,DetailsGrid, pgBar, tvTree, true);
        application.ProcessMessages; //[B 15]
      end;
    end;
    result := true;
  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'LoadDetails'+#13+#10+e.Message, mtWarning, [mbOK], 0);
      result := false;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TReadUIUpdate.FilterbyType(etType : etLoad; sgDetailgrid : TKgrid; pgBar : TProgressbar; tvTree : TTreeView; bFolder : boolean);
var
  rc1flogs : Tloginfo;
  irow     : integer;
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

    sgDetailgrid.RowCount       := 1;
    imod := 350;

    if not bfolder then begin

      assignfile(flogs, aplocs+'logs.dat');
      reset(flogs);
      irow := 1;
      icnt := 1;
      pgBar.Position := 0;
      try
        pgBar.Max := filesize(flogs);

        if pgBar.Max > 5000 then imod := 1500;

  //      sgDetailgrid.Visible    := true;
        while not EOF(flogs) do begin
          read(flogs, rc1Flogs);
          if rc1flogs.types <> '' then begin
            if (rc1flogs.Types = asFilt) then begin
              sgDetailgrid.RowCount       := sgDetailgrid.RowCount + 1;
              sgDetailgrid.Cells[0, irow] := Inttostr(rc1Flogs.LineNr);
              sgDetailgrid.Cells[1, irow] := rc1Flogs.entry;

              inc(irow);
            end;
          end;
          inc(icnt);

          if irow mod imod = 0 then  begin  //[B 15]
            pgBar.Position := icnt;
            application.ProcessMessages;
          end;
        end;

        pgBar.Position := icnt;
        application.ProcessMessages;

      finally
        if irow > 1 then
          sgDetailgrid.FixedRows    := 1;

        closefile(flogs);
        fillchar(rc1flogs, 0,0); //[187]
      end;
   end else begin
     irow := sgrowi;
     if (sgDetailgrid.Cells[1, irow] <> '') then begin
//       if (StrToInt(sgDetailgrid.Cells[1, irow]) > 0) then begin
         BuildFilterTree(etType,pgBar, tvTree);
//       end;
     end;
   end;
  sgDetailgrid.Enabled := true;

  except on
    e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'FilterbyType'+#13+#10+e.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TReadUIUpdate.sgToCheckSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
   sgRowi := Arow;
end;
//------------------------------------------------------------------------------
//VERY DUMB WAY!!!!! that I need to fix
function  TReadUIUpdate.BuildFilterTree(etTyp : etLoad; pgBar : Tprogressbar; tvTree : TTreeView; bFilter : boolean=True) : boolean;
var
  node : array of TTreeNode;
  tmp  : TTreeNode;
  ix   : integer;
  prev,
  prFol,
  prFile : Ansistring;
  ic     : integer;
  ichk   : integer;
  sStmp  : Ansistring;
  ifst   : integer;
  iflst  : integer;
  iflstfnd: integer;
  scprev,
  scFol,
  scFile : Ansistring;
  sDescr : Ansistring;
  rc2flogs : TLoginfo;
  iloopcnt : integer;
begin
 try
   ifst   := 0;

   if tvTree.Items.Count <> 0 then begin;
     tvTree.Items.Clear;
   end;

   ic       := 0;
   ix       := 1;
   ichk     := 1;
   iflst    := 1;
   iflstfnd := 0;
   setlength(node, ic+1);
   try
     AssignFile(ffollogs,aplocs+'follogs.dat') ;
     reset(ffollogs);
     if FileSize(ffollogs) > 0 then begin;
       read(ffollogs, rc2Flogs);
       prFile   := rc2Flogs.Filename;

(*       fmProgress.Setlabel('Building Tree. Please wait...',1);
       fmProgress.SetMaxPogress(filesize(ffollogs),0);
 *)
       inc(ic);
       setlength(node, ic+1);

      if (etTyp = etError) then begin
        sDescr :=  'Errors';
      end else
      if (etTyp = etWarn) then begin
        sDescr := 'Warnings';
      end else
      if (etTyp = etUnint) then begin
        sDescr := 'Uninitialized';
      end else
      if (etTyp = etMerge) then begin
        sDescr := 'Merge Notes';
      end else
      if (etTyp = etInvalid) then begin
        sDescr := 'Invalid Notes';
      end else
      if (etTyp = etConvert) then begin
        sDescr := 'Conversion Notes';
      end else
      if (etTyp = etCust) then begin
        sDescr := 'Custom Log Entries';
      end else
      if (etTyp = etalloth) then begin  //[176]
        sDescr := 'All Others...';
      end else
      if (etTyp = etDivs) then begin
        sDescr := 'Division by 0';
      end else
      if (etTyp = etmisvals) then begin
        sDescr := 'Missing Value';
      end;
      if (etTyp = etrepbyval) then begin
        sDescr := 'Repeat by Values';
      end;
      if (etTyp = etmathop) then begin
        sDescr := 'Math. Operation';
      end;
      if (etTyp = etnobosdata) then begin
        sDescr := 'No OBS in data';
      end;
      if (etTyp = etnobystate) then begin
        sDescr := 'No by Statemetn';
      end;

       node[ic] := tvTree.Items.Add(nil, 'Filtering for '+sdescr);
       tmp      := node[ic];
       ifst     := 1;

       iloopcnt := 0;

       sStmp  := rc2flogs.Types;

       while (not eof(ffollogs) ) or (eof(ffollogs)) and (iloopcnt = 0)  do begin
          if (iloopcnt > 0) and (not eof(ffollogs)) and (sStmp <> '' ) then
             read(ffollogs, rc2Flogs);

          inc(iloopcnt);

          sStmp  := rc2flogs.Types;
          scprev := rc2flogs.Folder;
          scFile := rc2flogs.Filename;

          if scfile = prFile then begin
            inc(iflst);
          end else begin
            iflst    := 0;
            iflstfnd := 0;
          end;
          bfilter := true;
          if etTyp = etnone then begin
            if (rc2flogs.Types = 'Merge') or
               (rc2flogs.Types = 'Invalid') or
               (rc2flogs.Types = 'Uninitialized') or
               (rc2flogs.Types = 'Error') or
               (rc2flogs.Types = 'Division') or
               (rc2flogs.Types = 'Warning') or
               (rc2flogs.Types = 'Cust') or
               (rc2flogs.Types = 'Conversion') or
               (rc2flogs.Types = 'missval') or
               (rc2flogs.Types = 'repbyval') or
               (rc2flogs.Types = 'methop') or
               (rc2flogs.Types = 'nobosdata') or
               (rc2flogs.Types = 'nobystate')
               then begin
                 iChk := 1;
            end;
          end else
          //[134]
          if (etTyp = etError) then begin
            sDescr := 'Filter : Errors';
            if (rc2flogs.types = 'Error') then iChk := 1
            else iChk := 0;
          end else
          if (etTyp = etWarn) then begin
            sDescr := 'Filter : Warnings';
            if (rc2flogs.types = 'Warning') then iChk := 1
            else iChk := 0;
          end else
          if (etTyp = etUnint) then begin
            sDescr := 'Filter : Uninitialized';
            if (rc2flogs.types = 'Uninitialized') then iChk := 1
            else iChk := 0;
          end else
          if (etTyp = etMerge) then begin
            sDescr := 'Filter : Merge Notes';
            if (rc2flogs.types = 'Merge') then iChk := 1
            else iChk := 0;
          end else
          if (etTyp = etInvalid) then begin
            sDescr := 'Filter : Invalid Notes';
            if (rc2flogs.types = 'Invalid') then iChk := 1
            else iChk := 0;
          end else
          if (etTyp = etConvert) then begin
            sDescr := 'Filter : Conversion Notes';
            if (rc2flogs.types = 'Conversion') then iChk := 1
            else iChk := 0;
          end else
          if (etTyp = etCust) then begin
            sDescr := 'Filter : Custom Log Entries';
            if (rc2flogs.types = 'Cust') then iChk := 1
            else iChk := 0;
          end else
          if (etTyp = etalloth) then begin  //[176]
            sDescr := 'Filter : All Others...';
            if (rc2flogs.types = 'AllOth') then iChk := 1
            else iChk := 0;
          end else
          if (etTyp = etDivs) then begin
            sDescr := 'Filter : Division by 0';
            if (rc2flogs.types = 'Division') then iChk := 1
            else iChk := 0;
          end else
          if (etTyp = etmisvals) then begin
            sDescr := 'Filter : Missing Value';
            if (rc2flogs.types = 'missval') then iChk := 1
            else iChk := 0;
          end else
          if (etTyp = etrepbyval) then begin
            sDescr := 'Filter : Repeat by Value';
            if (rc2flogs.types = 'repbyval') then iChk := 1
            else iChk := 0;
          end else
          if (etTyp = etmathop) then begin
            sDescr := 'Filter : Math Opertion.';
            if (rc2flogs.types = 'methop') then iChk := 1
            else iChk := 0;
          end else
          if (etTyp = etnobosdata) then begin
            sDescr := 'Filter : No Obs in Data';
            if (rc2flogs.types = 'nobosdata') then iChk := 1
            else iChk := 0;
          end else
          if (etTyp = etnobystate) then begin
            sDescr := 'Filter : No By Statement';
            if (rc2flogs.types = 'nobystate') then iChk := 1
            else iChk := 0;
          end else ichk := 0;

         prFol := rc2flogs.Filename + '==' +rc2flogs.Entry;

          if iChk = 1 then begin
            if (prev = rc2flogs.folder) or (iflstfnd = 0) then begin//[153]
              if (prFile = rc2flogs.filename) or (iflstfnd = 0) then begin //[153]
                inc(iflstfnd);
                if (iflstfnd = 1) then begin //[134]
                  node[ic] := tvTree.Items.Add(tmp ,rc2flogs.Folder +rc2flogs.filename);
                  node[ic] := tvTree.Items.AddChild(node[ic],'['+Inttostr(rc2flogs.linenr)+']   '+ rc2flogs.Entry);
                end else
                if (iflst > 1) then begin
                  node[ic] := tvTree.Items.Add(node[ic],'['+Inttostr(rc2flogs.linenr)+']   '+ rc2flogs.Entry);
                end;
              end
            end;
          end;

         ifst   := 0;
         prev   := rc2flogs.folder;
         prFile := rc2flogs.Filename;

         inc(ix);

         if ix mod 500 = 0 then  begin //[B13]
           application.ProcessMessages;
         //*fmProgress.SetPogress(ix); //[B 29]
         end;
       end;
//       lbFilters.Caption := sDescr; //[169]
     end;
   finally
     closefile(ffollogs);
   end;

   result := true;
 except on
   e : Exception do begin
     MessageDlg('The following exception occurred in:'+#13+#10+'BuildFilterTree'+#13+#10+e.Message, mtWarning, [mbOK], 0);
     result := false;
   end;
 end;
end;
//------------------------------------------------------------------------------
procedure TReadUIUpdate.tvViewMouseUp(Sender: TObject; Button: TMouseButton;
                                      Shift: TShiftState; X, Y: Integer);
var
  ttNode  : TTreeNode;
  ttNode1 : TTreeNode;
  ttNode2 : TTreeNode;
  sStr    : String;
  asfile  : Ansistring;
  iline   : integer;
  idx     : integer;
  idx2    : integer;
  stmp    : String;
  m       : TPoint;
  sval    : ansistring;
  prevNode : TTreeNode;
  ilevel  : integer;
begin
  try
    if (tvTrees.Selected <> nil)  then begin
      ilevel := tvTrees.Selected.level;
      if ((tvTrees.Selected.level > 1) and (tvTrees.Selected.Selected)) then begin
        ttNode1 := tvTrees.Selected.Parent;
        ttNode  := ttNode1.Parent; //this is the "topnode"
        if (ttNode <> nil) or (prevNode <> ttNode1) then begin
          prevNode := ttNode1;
          sstr    := ttNode.Text;
          asfile  := sstr+ ttnode1.Text;//this is the file name
          sstr    := tvTrees.Selected.Text; //this is what to search for
          idx     := pos('[',sstr);
          idx2    := pos(']',sstr);

          if not Trystrtoint(copy(sstr, idx+1, ((idx2-1)-idx)),iline) then begin
            iline  := 0;
          end;

          stmp    := copy(sstr, idx2+1, length(sstr));
          idx     := length(copy(sstr, idx2+1, length(sstr)))-1;

          fmLogfile.rcLines.Lines.LoadFromFile(asFile);
          fmLogfile.Caption := 'Log file '+ExtractFileName(asfile)+' Looking for: '+stmp;
          fmLogfile.visible := true;
//          fmLogFolder.FormStyle := fsNormal;
          fmLogfile.Movetoline(idx, iline);
        end;
      end else
      if (tvTrees.Selected.level = 1) and (tvTrees.Selected.Selected) (*and bfilter*) then begin //[166]
         ttNode1 := tvTrees.Items.Item[0]; //Get the file path
         ttNode2 := tvTrees.Selected.Parent;
        if (ttNode <> nil) or (prevNode <> ttNode1) then begin
          sstr    := ttNode1.Text; //This is the filename to search for
          asfile  := ttnode2.Text; //[B 10]
          sstr    := tvTrees.Selected.Text; //this is what to search for
          idx     := pos('[',sstr);
          idx2    := pos(']',sstr);
          if not Trystrtoint(copy(sstr, idx+1, ((idx2-1)-idx)),iline) then begin
            iline  := 0;
          end;

          stmp    := copy(sstr, idx2+1, length(sstr));
          idx     := length(copy(sstr, idx2+1, length(sstr)))-1;

          fmLogfile.rcLines.lines.Clear;
          fmLogfile.edLine.Text  := '';

          if FileExists(asFile) then begin {[C2]}
            fmLogfile.rcLines.Lines.LoadFromFile(asFile);
            fmLogfile.Caption := 'Log file '+ExtractFileName(asfile)+' Looking for: '+stmp;
            fmLogfile.visible := true;
            fmLogfile.SetFocus;
            fmLogfile.Movetoline(idx, iline);
          end;

        end;

      end;
      if tvTrees.Selected.Selected = true then
        tvTrees.Selected.Selected := false;
    end;
//    if button = mbRight then begin //[124]
//      GetCursorPos(m);
//      popupmenu1.Popup(m.X, m.Y);
//    end;

  except on
   e : exception do begin
      MessageDlg('The following exception occurred in:'+#13+#10+'tvTreesMouseUp'+#13+#10+e.Message, mtWarning, [mbOK], 0);

   end;
  end;
end;
//------------------------------------------------------------------------------
end.
