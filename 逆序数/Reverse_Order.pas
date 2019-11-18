unit Reverse_Order;

interface

function ReverOrder(AArray: array of Integer): Integer;

implementation
//uses
 // System.SysUtils, Vcl.Dialogs;
function ReverOrder(AArray: array of Integer): Integer;
var
  Front: Integer;
  Num: Integer;
begin
  Result := 0;
  for Front := 0 to High(AArray) - 1 do
  begin
    for Num := Front + 1 to High(AArray) do
    begin
      if AArray[Front] > AArray[Num] then
      begin
        //showmessage('ͷ' + IntToStr(AArray[Front]));
        //showmessage('β' + IntToStr(AArray[Num]));
        Result := Result + 1;
      end;
    end;
  end;
end;

end.

