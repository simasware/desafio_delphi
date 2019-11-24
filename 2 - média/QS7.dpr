program QS7;

{$APPTYPE CONSOLE}

{$R *.RES}

uses
  Classes,
  TypInfo,
  uTroco in 'uTroco.pas',
  uIMaquina in 'uIMaquina.pas',
  uMaquina in 'uMaquina.pas';

var
  m: TMaquina;
  t: TList;
  i: integer;
begin
  m := TMaquina.Create;
  t := m.MontarTroco(125.00);
  for I := 0 to Pred(t.Count) do
  begin
    if TTroco(t.Items[i]).Quantidade > 0 then
      Writeln(
      GetEnumName(TypeInfo(TCedula),
        integer(TTroco(t.Items[i]).Tipo)), #9,
      TTroco(t.Items[i]).Quantidade);
  end;
  m.free;
  ReadLn;
end.

