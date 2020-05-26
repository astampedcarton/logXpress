unit ufileExtract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ComCtrls, SynEdit, SynMemo;
//  AdvMemo,  AdvmBS;

type
  TfmExtract = class(TForm)
    rcExtract: TSynMemo;
{    AdvMemoStylerManager1: TAdvMemoStylerManager;
    AdvBasicMemoStyler1: TAdvBasicMemoStyler;
    rcExtract: TAdvMemo;       }
    procedure spbCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmExtract: TfmExtract;

implementation

{$R *.dfm}

procedure TfmExtract.spbCloseClick(Sender: TObject);
begin
  close;
end;

end.
