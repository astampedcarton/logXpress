unit uOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, uLogRead, inifiles;

type
  TfmOptions = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    ckColorOn: TCheckBox;
    ckReportOnly: TCheckBox;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    memFulldesc: TMemo;
    Label5: TLabel;
    ckClearFolHistory: TCheckBox;
    ckReadonStartup: TCheckBox;
    RadioGroup1: TRadioGroup;
    rbClassic: TRadioButton;
    rbAlternative: TRadioButton;
    ckClearFileHist: TCheckBox;
    Panel1: TPanel;
    bbClose: TBitBtn;
    bbSave: TBitBtn;
    procedure rbClassicClick(Sender: TObject);
    procedure rbClassicEnter(Sender: TObject);
    procedure rbAlternativeEnter(Sender: TObject);
    procedure ckColorOnEnter(Sender: TObject);
    procedure ckReadonStartupEnter(Sender: TObject);
    procedure ckClearFolHistoryEnter(Sender: TObject);
    procedure ckClearFileHistEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ckReportOnlyEnter(Sender: TObject);
    procedure bbCloseClick(Sender: TObject);
    procedure bbSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Settings : TInifile;
    etDisplaytype : etDisptype;
    procedure loadoptions;
  public
    { Public declarations }
  end;

var
  fmOptions: TfmOptions;

implementation

{$R *.dfm}

//------------------------------------------------------------------------------
procedure TfmOptions.bbCloseClick(Sender: TObject);
begin
  close;
end;
//------------------------------------------------------------------------------
procedure TfmOptions.bbSaveClick(Sender: TObject);
var
  itype  : integer;
begin
  Settings        := TIniFile.Create(ExtractFilePath(application.exename)+'saslogdisp.ini');
  iType           := Settings.ReadInteger('displayoption', 'display', integer(etDisplaytype) );

  if rbclassic.Checked = true then itype := 1
  else if rbAlternative.Checked = true then itype := 2;

  Settings.WriteInteger('displayoption', 'display', itype);
  Settings.WriteBool('Appr', 'Colors', ckColorOn.Checked);
  Settings.WriteBool('Appr', 'ReportOnly', ckReportOnly.Checked);
{  Settings.WriteBool('Appr', 'ReadonStart', ckReadonStartup.Checked);
  Settings.WriteBool('Appr', 'ClearFile', ckClearFileHist.Checked);
  Settings.WriteBool('Appr', 'Clearfoler', ckClearFolHistory.Checked);}

  Settings.Free;

  bbCloseClick(nil);

end;
//------------------------------------------------------------------------------
procedure TfmOptions.ckClearFileHistEnter(Sender: TObject);
begin
   with memFulldesc.Lines do begin
     clear;
     add('To minimize the potential of locks a copy of the file is created and read');
     add('So when the application exit. Should the file be deleted or not.');
     add('This setting really is personal preference, but can minimize the overall');
     add('memory. So you can consider switching this on.');
   end;
end;
//------------------------------------------------------------------------------
procedure TfmOptions.ckClearFolHistoryEnter(Sender: TObject);
begin
   with memFulldesc.Lines do begin
     clear;
     add('When the Folder Read application exit. Should the Folder data be deleted or not');
     add('This setting really is personal preference, but can minimize the overall memory.');
     add('So you can consider switching this on.');
   end;
end;
//------------------------------------------------------------------------------
procedure TfmOptions.ckColorOnEnter(Sender: TObject);
begin
   with memFulldesc.Lines do begin
     clear;
     add('Do you want the custom colors displayed or not. When switched off the ');
     add('screens are rather dull, but it can be usefull for people who are color blind');
   end;
end;
//------------------------------------------------------------------------------
procedure TfmOptions.ckReadonStartupEnter(Sender: TObject);
begin
   with memFulldesc.Lines do begin
     clear;
     add('When the application loads should the file last read be read.');
     add('If not the application will rest till it receives a new file to read');
     add('This settings is not really recommended.');
   end;

end;
//------------------------------------------------------------------------------

procedure TfmOptions.ckReportOnlyEnter(Sender: TObject);
begin
   with memFulldesc.Lines do begin
     clear;
     add('In certain cases you might only want to know if there was reportable entries.');
     add('The process is faster than if you would have Report Only off.');
     add('This settings is not really recommended.');
   end;

end;

//------------------------------------------------------------------------------
procedure TfmOptions.FormCreate(Sender: TObject);
begin
  memFulldesc.lines.Clear;
  rbclassic.Checked := true;
  ckColorOn.Checked := true;
  ckReportOnly.Checked := false;
  ckReadonStartup.Checked := true;
  ckClearFolHistory.Checked := true;
  ckClearFileHist.Checked := true;
  LoadOptions;
end;
//------------------------------------------------------------------------------

procedure TfmOptions.FormShow(Sender: TObject);
begin
  FormCreate(nil);
end;

//------------------------------------------------------------------------------
procedure TfmOptions.rbAlternativeEnter(Sender: TObject);
begin
   memFulldesc.Lines.Clear;
   memFulldesc.Lines.Add('The program will be displayed as normal form. This is a newer view.');
   memFulldesc.Lines.Add('People with multiple screens tend to use this view. It contains a bit');
   memFulldesc.Lines.Add('more detail that makes working with it easier. ');

end;
//------------------------------------------------------------------------------

procedure TfmOptions.rbClassicClick(Sender: TObject);
begin

end;
//------------------------------------------------------------------------------

procedure TfmOptions.rbClassicEnter(Sender: TObject);
begin
   memFulldesc.Lines.Clear;
   memFulldesc.Lines.Add('The program will be displayed as a thin looking bar at the');
   memFulldesc.Lines.Add('top of the main screen. This is very usefull when you have ');
   memFulldesc.Lines.Add('only one screen. ');

end;
//------------------------------------------------------------------------------
procedure TfmOptions.loadoptions;
var
 iType : integer;
begin
  Settings  := TIniFile.Create(ExtractFilePath(application.exename)+'saslogdisp.ini');
  iType     := Settings.ReadInteger('displayoption', 'display', integer(etDisplaytype) );

  if iType = 1 then
    rbclassic.Checked := true
  else if iType = 2 then
    rbAlternative.Checked := true;

  ckColorOn.Checked            := Settings.ReadBool('Appr', 'Colors', ckColorOn.Checked);
  ckReportOnly.Checked         := Settings.ReadBool('Appr', 'ReportOnly', ckReportOnly.Checked);
{  ckReadonStartup.Checked      := Settings.ReadBool('Appr', 'ReadonStart', ckReadonStartup.Checked);
  ckClearFileHist.Checked      := Settings.ReadBool('Appr', 'ClearFile', ckClearFileHist.Checked);
  ckClearFolHistory.Checked    := Settings.ReadBool('Appr', 'Clearfoler', ckClearFolHistory.Checked);}
  Settings.Free;

end;

end.
