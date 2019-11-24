unit uMaquina;

interface

uses
  uIMaquina, Classes, uTroco;

type

  TMaquina = class(TInterfacedObject, IMaquina)
  public
    function MontarTroco(aTroco: Double): TList;
  end;

implementation

function TMaquina.MontarTroco(aTroco: Double): TList;
var
  i: integer;
  troco: TTroco;
begin
  Result := TList.Create;
  i := 0;
  while i < length(CValorCedula) do
  begin
    troco := TTroco.Create(TCedula(i), trunc(aTroco / CValorCedula[TCedula(i)]));
    aTroco := aTroco - (Troco.Quantidade * CValorCedula[TCedula(i)]);
    result.Add(troco);
    inc(i);
  end;
end;

end.

