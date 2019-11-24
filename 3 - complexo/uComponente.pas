unit uComponente;

interface

type

  TComponente = class;

  TComponenteArray = array of TComponente;

  TComponente = class
  protected
    FX: Integer;
    FY: Integer;
    FAltura: Integer;
    FLargura: Integer;
    FComponenteCount: integer;
    FComponentes: TComponenteArray;
  public
    procedure AdicionaComponente(aComponente: TComponente); virtual;
    procedure RemoveComponente(aComponente: TComponente); virtual;
    property X: integer read FX write FX;
    property Y: integer read FY write FY;
    property Altura: integer read FAltura write FAltura;
    property Largura: integer read FLargura write FLargura;
  end;

implementation

procedure TComponente.AdicionaComponente(aComponente: TComponente);
begin
end;

procedure TComponente.RemoveComponente(aComponente: TComponente);
begin    
end;
  
end.

