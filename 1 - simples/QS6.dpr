program QS6;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  uISubstitui in 'uISubstitui.pas',
  uSubstitui in 'uSubstitui.pas';

{$R *.RES}

{$APPTYPE CONSOLE}

var
  aSubstitui: TSubstitui;
begin
  aSubstitui := TSubstitui.Create;
  WriteLn(aSubstitui.Substituir('O rato roeu a roupa do rei de roma', 'ro', 'teste'));
  WriteLn(aSubstitui.Substituir('O rato roeu a roupa do rei de roma', 'o', 'a'));
  aSubstitui.Free;
  ReadLN;
end.

