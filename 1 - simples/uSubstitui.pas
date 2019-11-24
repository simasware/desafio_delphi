unit uSubstitui;

interface

uses
  uISubstitui, System.SysUtils, System.Classes;

type

  TSubstitui = class(TInterfacedObject, ISubstitui)
  public
    function Substituir(aStr, aVelho, aNovo: String): String;
  end;

implementation

function TSubstitui.Substituir(aStr, aVelho, aNovo: String): String;
var
  aux: String;
  i, l: integer;
begin
  result := '';
  if aStr.Length = 0 then
    exit;
  l := aVelho.Length;
  for I := 1 to aStr.Length do
  begin
    if aStr[i] in [#0..#32] then
    begin
      result := result + aux + aStr[i];
      aux := '';
    end
    else
      aux := aux + aStr[i];
    if aux.Length = l then
    begin
      if trim(aux) = aVelho then
        aux := aNovo;
      result := result + aux;
      aux := '';
    end;
  end;
end;

end.
