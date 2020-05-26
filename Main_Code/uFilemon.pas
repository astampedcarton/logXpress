unit uFilemon;

interface

type
TFilemon = class(Tobject)
  private
    arFilelst : array of string;

    procedure GetFilelist;
  public
    constructor create(); overload;
	  destructor destroy; override;
    procedure SetFilelist;
end;

implementation

constructor TFilemon.create();
begin
  inherited Create;             // Call TObject.Create.
   sgGridchk := sgGrid;
   aplocs    := aploc;
   tvTrees   := tvTree;
end;
//-------------------------------------------------------------------------------------------------------------------
destructor TFilemon.destroy;
begin

  inherited Destroy;
end;

end.
