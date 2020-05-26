unit uSelectCompInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  strutils_d7, ads_strg, ads_date, uLogRead, uUsertypes_d7, rkGlassButton,
  Vcl.ExtCtrls, Vcl.ImgList, SynEditHighlighter, SynHighlighterGeneral, SynEdit,
  SynMemo, SynHighlighterMulti;

type
  TfmSelectCompInfo = class(TForm)
    gpbCompFinfo: TGroupBox;
    gpCompanalysInfo: TGroupBox;
    rcCompAnalysInfo: TRichEdit;
    Splitter1: TSplitter;
    Panel1: TPanel;
    bbClose: TrkGlassButton;
    il1: TImageList;
    rcCompInfo: TSynMemo;
    synHigh: TSynGeneralSyn;
    SynMultiSyn1: TSynMultiSyn;
    procedure FormCreate(Sender: TObject);
    procedure bbCloseClick(Sender: TObject);
    procedure SynMultiSyn1CustomRange(Sender: TSynMultiSyn;
      Operation: TRangeOperation; var Range: Pointer);
  private
    { Private declarations }
    asFileName : Ansistring;
  public
    { Public declarations }
    function loadcompfile(asFile : Ansistring) : boolean;
    function loadcompanalyfile(arCompre : array of Tcompmatrec) : boolean;
  end;

var
  fmSelectCompInfo: TfmSelectCompInfo;

implementation

{$R *.dfm}

//------------------------------------------------------------------------------
function TfmSelectCompInfo.loadcompfile(asFile : Ansistring) : boolean;
begin
  with rcCompInfo do begin
    Lines.Clear;
    Lines.LoadFromFile(asFile);
    asFileName := ExtractFileName(asFile);
  end;
end;
procedure TfmSelectCompInfo.SynMultiSyn1CustomRange(Sender: TSynMultiSyn;
  Operation: TRangeOperation; var Range: Pointer);
begin

end;

//------------------------------------------------------------------------------
procedure TfmSelectCompInfo.bbCloseClick(Sender: TObject);
begin
  rcCompAnalysInfo.Lines.Clear;
  rcCompInfo.Lines.Clear;
  close;
end;

procedure TfmSelectCompInfo.FormCreate(Sender: TObject);
begin
  rcCompAnalysInfo.Lines.Clear;
  rcCompInfo.Lines.Clear;
end;
//------------------------------------------------------------------------------
function TfmSelectCompInfo.loadcompanalyfile(arCompre : array of Tcompmatrec) : boolean;
var
  icnt :  integer;
begin
  icnt := 0;
  while (icnt < high(arCompre)) do begin
    if asFileName = arCompre[icnt].filename then begin;
      with rcCompAnalysInfo do begin

      rcCompAnalysInfo.Lines.add(arCompre[icnt].filename );
      rcCompAnalysInfo.Lines.add(arCompre[icnt].fname    );

      if not IsEmpty(arCompre[icnt].vardiff) then begin
        rcCompAnalysInfo.Lines.add(arCompre[icnt].vardiff  );
      end;
      if not IsEmpty(arCompre[icnt].obsdiff) then begin
        rcCompAnalysInfo.Lines.add(arCompre[icnt].obsdiff  );
      end;
      if not IsEmpty(arCompre[icnt].crdiff) then begin
        rcCompAnalysInfo.Lines.add(arCompre[icnt].crdiff   );
      end;
      if not IsEmpty(arCompre[icnt].moddiff) then begin
        rcCompAnalysInfo.Lines.add(arCompre[icnt].moddiff  );
      end;
//      rcCompAnalysInfo.Lines.add(arCompre[icnt].obsdiff  );
      if not IsEmpty(arCompre[icnt].dupnotes) then begin
        rcCompAnalysInfo.Lines.add(arCompre[icnt].dupnotes );
      end;
      if not IsEmpty(arCompre[icnt].obsrddiff) then begin
        rcCompAnalysInfo.Lines.add(arCompre[icnt].obsrddiff);
      end;
      if not IsEmpty(arCompre[icnt].equal) then begin
        rcCompAnalysInfo.Lines.add(arCompre[icnt].equal    );
      end;
      if not IsEmpty(arCompre[icnt].unequal  ) then begin
        rcCompAnalysInfo.Lines.add(arCompre[icnt].unequal  );
      end;
//      rcCompAnalysInfo.Lines.add(arCompre[icnt].compstat );
      end;
    end;
    inc(icnt);
  end;

end;
//------------------------------------------------------------------------------

end.


