unit uFrame;

interface

uses
  uComponente, uBotao, uLabel, uMemo;

type

  TFrame = class(TComponente)
  private
    FX: integer;
    FY: integer;
    FComponenteCount: integer;
    FAltura: integer;
    FLargura: integer;
    procedure resizeComponents;
    procedure setAltura(const Value: integer);
    procedure setLargura(const Value: integer);
  public
    constructor Create(posX, posY: integer);
    property Altura: integer read FAltura write setAltura;
    property Largura: integer read FLargura write setLargura;
    procedure AdicionaComponente(aComponente: TComponente); virtual;
    procedure RemoveComponente(aComponente: TComponente); virtual;
  end;

implementation

{ TFrame }

procedure TFrame.AdicionaComponente(aComponente: TComponente);
begin
  inc(FComponenteCount);
  setLength(FComponentes, FComponenteCount);
  FComponentes[FComponenteCount] := aComponente;
end;

constructor TFrame.Create(posX, posY: integer);
begin
  self.FX := posX;
  self.FY := posY;
  FComponenteCount := 0;
  setLength(self.FComponentes, FComponenteCount);
end;

procedure TFrame.RemoveComponente(aComponente: TComponente);
var
  i, indiceComponente: integer;
  tamanho: integer;
begin
  for i := Low(FComponentes) to High(FComponentes) do
  begin
    if FComponentes[i] = aComponente then
    begin
      indiceComponente := i;
      break;
    end;
  end;
  tamanho := length(FComponentes);
  Assert(tamanho > 0);
  Assert(indiceComponente < tamanho);
  for I := indiceComponente + 1 to Tamanho - 1 do
    FComponentes[i-1] := FComponentes[i];
  SetLength(FComponentes, tamanho - 1);
  FComponenteCount := tamanho - 1;
end;

procedure TFrame.resizeComponents;
const
  ESPACAMENTO = 8;
var
  i: integer;
  Proximo: TComponente;
  ultimo: boolean;
begin
  ultimo := false;
  for I := Low(self.FComponentes) to High(self.FComponentes) do
  begin
    if i < High(self.FComponentes) then
      ultimo := false
    else
      ultimo := true;
    if self.FComponentes[i].ClassType = TBotao then
    begin
      self.FComponentes[i].Largura := self.Largura - (self.FComponentes[i].X * 2);
    end
    else
    if (self.FComponentes[i].ClassType = TMemo) or
       (self.FComponentes[i].ClassType = TFrame) then
    begin
      self.FComponentes[i].Largura := self.Largura - (self.FComponentes[i].X * 2);
      self.FComponentes[i].Altura := (self.Altura - (self.FComponentes[i].Y * 2)) - proximo.Altura;
    end;
    // como o componente TLabel só precisa ajustar a posição X e Y ele entra num dos IFs abaixo
    if ultimo then
      self.FComponentes[i].Y := self.FComponentes[i-1].Altura +
        self.FComponentes[i-1].Y + ESPACAMENTO
    else
      self.FComponentes[i+1].Y := self.FComponentes[i].Altura +
        self.FComponentes[i].Y  + ESPACAMENTO;
  end;
end;

procedure TFrame.setAltura(const Value: integer);
begin
  FAltura := Value;
  resizeComponents;
end;

procedure TFrame.setLargura(const Value: integer);
begin
  FLargura := Value;
  resizeComponents;
end;

end.
