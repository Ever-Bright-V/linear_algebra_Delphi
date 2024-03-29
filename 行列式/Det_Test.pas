unit Det_Test;

interface

uses
  Expansion_Method_Det, TransPose_Det, GetMinor_Det, Trangle_Method_Det,
  Definition_Method_Det, Reverse_Order, Perm, Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ExtCtrls;

type
  TForm3 = class(TForm)
    btn1: TButton;
    strngrd1: TStringGrid;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    btn7: TButton;
    mmo1: TMemo;
    pnl1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    StringGrid1: TStringGrid;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    procedure strngrd1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure strngrd1SetEditText(Sender: TObject; ACol, ARow: Integer; const Value: string);
    procedure btn1Click(Sender: TObject);
    procedure strngrd1DblClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure strngrd1SelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure btn3Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function func(x: integer): integer;
    procedure GetMaxCol_Row(Grid: TStringGrid; var ColNum: Integer; var RowNum: Integer);
    procedure GetDimension(Grid: TStringGrid; var Dimension: Integer);
    procedure GridToIntArray(Grid: TStringGrid; var IntArray: TTDimIntArray);
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.btn1Click(Sender: TObject);
begin
  strngrd1.ColCount := strngrd1.ColCount + 1;
end;

procedure TForm3.btn2Click(Sender: TObject);
begin
  strngrd1.Cells[2, 4] := 'asfsdf';
end;

procedure TForm3.btn3Click(Sender: TObject);
begin
  Canvas.Brush.Color := clWhite;
  Canvas.FillRect(Tstringgrid(Sender).CellRect(1, 1));
  //Canvas.TextOut();
end;

procedure TForm3.btn5Click(Sender: TObject);
var
  CalArray: TTDimIntArray;
  Dimension: Integer;
  RowArray: TArray<Integer>;
  Num: Integer;
  NumNextlevel: Integer;
  PermResult: TStringList;
  PermResArray: PermResultIntArray;
  Sing1eTerm: Integer;
  SingleReverOrder: Integer;
  SingleTermMUtiL: Integer;
  Temp: Integer;
  ToTal: Integer;
begin
  // 入数组
  Temp := 0;
  Sing1eTerm := 0;
  SingleReverOrder := 0;
  SingleTermMUtiL := 1;
  ToTal := 0;
  GridToIntArray(strngrd1, CalArray);
  //ShowMessage(IntToStr(CalArray[3, 3]));
 // ShowMessage(Length(CalArray).ToString);
  //全排列获取 每项的 列
  {获取维数}
  GetDimension(strngrd1, Dimension);
  {获取全排列数组，列的下标所有情况}
  SetLength(RowArray, Dimension);
  for Num := Low(RowArray) to High(RowArray) do
  begin
    RowArray[Num] := Num + 1;
  end;
  {获取全排列}
  PermResult := TStringList.Create;
  PermInt(RowArray, 0, High(RowArray), PermResult);   // 共 n！ 个 ，每个 存的 是 一种 排列情况 以 1,2,3,4 显示 ，通过list 可以 转换得到下标
  PermListToArray(PermResult, PermResArray);     // 转换  数组
  // 每个 全排列 的 逆序数
    {在计算时 一起完成}
  // 计算 每一项 求和
  for Num := low(PermResArray) to High(PermResArray) do
  begin
    for NumNextlevel := Low(PermResArray[Num]) to High(PermResArray[Num]) do
    begin
      Temp := PermResArray[Num, NumNextlevel];  // ***
      //ShowMessage('阵列' + CalArray[NumNextlevel, Temp - 1].ToString);
      //ShowMessage(Length(CalArray).ToString + ',' + Length(CalArray[0]).ToString);
      SingleTermMUtiL := SingleTermMUtiL * CalArray[NumNextlevel, Temp - 1];
      //ShowMessage(SingleTermMUtiL.ToString);
    end;
    // 一项的乘积 计算
    SingleReverOrder := ReverOrder(PermResArray[Num]);
    //处理 每项乘积
    if SingleReverOrder mod 2 = 0 then
    begin
      Sing1eTerm := SingleTermMUtiL;
    end
    else
    begin
      Sing1eTerm := SingleTermMUtiL * (-1);
      //ShowMessage(Sing1eTerm.ToString);
    end;
    ToTal := ToTal + Sing1eTerm;
    SingleTermMUtiL := 1;
  end;
  ShowMessage(ToTal.ToString);
end;

procedure TForm3.btn6Click(Sender: TObject);
var
  X, Y: Integer;
begin
  GetMaxCol_Row(strngrd1, X, Y);
  ShowMessage('X:' + X.ToString + ';Y:' + Y.ToString);
end;

procedure TForm3.btn7Click(Sender: TObject);
var
  BArray: TTDimIntArray;
  X, Y: Integer;
begin
  mmo1.Clear;
  GridToIntArray(strngrd1, BArray);
  //ShowMessage(BArray[3][2].ToString);
  ShowMessage(Length(BArray).ToString);
  for X := Low(BArray) to High(BArray) do
  begin
    for Y := Low(BArray[X]) to High(BArray[X]) do
    begin
      mmo1.Lines.Add(Format('Array(%d,%d):%d', [X, Y, BArray[X, Y]]));
    end;
  end;
end;

procedure TForm3.Button10Click(Sender: TObject);
var
  CalcuArray: TTDimIntArray;
  ResultArray: TTransResultRealArray;
  ColNum, RowNum: Integer;
  Flag: Boolean;
begin
  GridToIntArray(strngrd1, CalcuArray);
  ShowMessage(Trangle_Method(TDimIntArray(CalcuArray), ResultArray, Flag).ToString);
  for RowNum := Low(ResultArray) to High(ResultArray) do
  begin
    for ColNum := Low(ResultArray[0]) to High(ResultArray[0]) do
    begin
      //StringGrid1.Cells[ColNum + 1, RowNum + 1] := FloatToStr(ResultArray[ColNum, RowNum]);
      StringGrid1.Cells[ColNum + 1, RowNum + 1] := FloatToStr(Round(ResultArray[ColNum, RowNum] * 100) / 100);
    end;
  end;
  if Flag = True then
  begin
    ShowMessage('经过交换');
  end;

end;

procedure TForm3.Button1Click(Sender: TObject);
var
  CalcuArray: TTDimIntArray;
begin
  GridToIntArray(strngrd1, CalcuArray);
  ShowMessage(Define_Method(CalcuArray).ToString);
end;

procedure TForm3.Button2Click(Sender: TObject);
var
  CalcuArray: TTDimIntArray;
  //CalArray: TDimIntArray;
begin
  GridToIntArray(strngrd1, CalcuArray);
  ShowMessage(Trangle_Method(TDimIntArray(CalcuArray)).ToString);
end;

procedure TForm3.Button3Click(Sender: TObject);
var
  CalcuArray: TTDimIntArray;
  ResultArray: TTransResultRealArray;
  ColNum, RowNum: Integer;
begin
  GridToIntArray(strngrd1, CalcuArray);
  ShowMessage(Trangle_Method(TDimIntArray(CalcuArray), ResultArray).ToString);
  for RowNum := Low(ResultArray) to High(ResultArray) do
  begin
    for ColNum := Low(ResultArray[0]) to High(ResultArray[0]) do
    begin
      //StringGrid1.Cells[ColNum + 1, RowNum + 1] := FloatToStr(ResultArray[ColNum, RowNum]);
      StringGrid1.Cells[ColNum + 1, RowNum + 1] := FloatToStr(Round(ResultArray[ColNum, RowNum] * 100) / 100);
    end;
  end;
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
  ShowMessage(func(3).ToString);
end;

procedure TForm3.Button5Click(Sender: TObject);
var
  TestArry: TCalIntArray;
  Num, X, Y: Integer;
  TestNum: Integer;
  ResultArray: TTransResultRealArray;
  XXXArray: Toparray;
begin
  Num := 1;
  SetLength(TestArry, 3, 3);
  for X := 0 to 2 do
  begin
    for Y := 0 to 2 do
    begin
      TestArry[X, Y] := Num;
      Num := Num + 1;
    end;
  end;
  //TestArry[0, 0] := 0;
  TestArry[0, 1] := 5;
  //TestArry[0, 2] := 0;
  // 测试数组赋值
  ShowMessage(Expansion_method(TestArry).ToString);
end;
{var
  TestArry: TCalIntArray;
  Num, RowNum, ColNum: Integer;
  TestNum: Integer;
begin
  Num := 0;
  SetLength(TestArry, 3, 3);
  for ColNum := 0 to 2 do
  begin
    for RowNum := 0 to 2 do
    begin
      TestArry[ColNum, RowNum] := Num;
      Num := Num + 1;
    end;
  end;
  TestNum := TestArry[0, 2];
  TestNum := TestArry[1, 2];
  TestNum := length(TestArry[1]);
  ShowMessage(Expansion_Method(TestArry).ToString);
end; }

procedure TForm3.Button6Click(Sender: TObject);
var
  CalcuArray: TTDimIntArray;
  CalArray: TCalIntArray;
  ResultArray: TResultIntArray;
  ColNum, RowNum: Integer;
  ResultArr: TOpArray;
begin
  GridToIntArray(strngrd1, CalcuArray);
  CalArray := TCalIntArray(CalcuArray);
  TransPose(TOpArray(CalArray), ResultArr);
  GetMinor(TCalIntArray(ResultArr), 0, 1, ResultArray);
  for RowNum := Low(ResultArray) to High(ResultArray) do
  begin
    for ColNum := Low(ResultArray[0]) to High(ResultArray[0]) do
    begin
      StringGrid1.Cells[ColNum + 1, RowNum + 1] := ResultArray[ColNum, RowNum].ToString;
    end;
  end;
end;

procedure TForm3.Button7Click(Sender: TObject);
var
  TestArry: TCalIntArray;
  Num, RowNum, ColNum: Integer;
  TestNum: Integer;
  ResultArray: TResultIntArray;
begin
  Num := 0;
  SetLength(TestArry, 3, 3);
  for ColNum := 0 to 2 do
  begin
    for RowNum := 0 to 2 do
    begin
      TestArry[ColNum, RowNum] := Num;
      Num := Num + 1;
    end;
  end;
  GetMinor(TestArry, 0, 0, ResultArray);
  for RowNum := Low(ResultArray) to High(ResultArray) do
  begin
    for ColNum := Low(ResultArray[0]) to High(ResultArray[0]) do
    begin
      StringGrid1.Cells[RowNum + 1, ColNum + 1] := ResultArray[ColNum, RowNum].ToString;
    end;
  end;
end;

procedure TForm3.Button8Click(Sender: TObject);
var
  TestArry: TDimIntArray;
  Num, X, Y: Integer;
  TestNum: Integer;
  ResultArray: TTransResultRealArray;
  XXXArray: Toparray;
begin
  Num := 1;
  SetLength(TestArry, 3, 3);
  for X := 0 to 2 do
  begin
    for Y := 0 to 2 do
    begin
      TestArry[X, Y] := Num;
      Num := Num + 1;
    end;
  end;
  TransPose(Toparray(TestArry), XXXArray);
  Trangle_Method(TDimIntArray(XXXArray), ResultArray);
  //Trangle_Method(TDimIntArray(TestArry), ResultArray);
  for Y := Low(ResultArray) to High(ResultArray) do
  begin
    for X := Low(ResultArray[0]) to High(ResultArray[0]) do
    begin
      StringGrid1.Cells[X + 1, Y + 1] := FloatToStr(Round(ResultArray[X, Y] * 100) / 100);
    end;
  end;
end;

procedure TForm3.Button9Click(Sender: TObject);
var
  CalcuArray: TTDimIntArray;
begin
  GridToIntArray(strngrd1, CalcuArray);
  ShowMessage(Expansion_method(TCalIntArray(CalcuArray)).ToString);
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  strngrd1.ColWidths[0] := 30;
  strngrd1.RowHeights[0] := 30;
  strngrd1.Brush.Color := clWhite;
  StringGrid1.ColWidths[0] := 30;
  StringGrid1.RowHeights[0] := 30;
end;

function TForm3.func(x: integer): integer;
var
  Temp: Integer;
begin
  //Result := 0; //每次会被重置
  //Temp := 0;
  if x = 0 then
    result := 1
  else
  begin
    ShowMessage(Temp.ToString);
    Temp := Temp + x * func(x - 1);
    Result := Result + Temp;
  end;

end;

procedure TForm3.GetDimension(Grid: TStringGrid; var Dimension: Integer);
var
  ColNum, RowNum: Integer;
begin
  GetMaxCol_Row(Grid, ColNum, RowNum);
  if ColNum > RowNum then
  begin
    Dimension := ColNum;
  end
  else
  begin
    Dimension := RowNum;
  end;
end;

procedure TForm3.GetMaxCol_Row(Grid: TStringGrid; var ColNum, RowNum: Integer);
var
  CNum: Integer;
  RNum: Integer;
begin
  ColNum := 0;
  RowNum := 0;
  for CNum := 1 to Grid.ColCount - 1 do
  begin
    for RNum := 1 to Grid.RowCount - 1 do
    begin
      if Grid.Cells[CNum, RNum] <> '' then
      begin
        ColNum := CNum;
        RowNum := RNum;
      end;
    end;
  end;
end;

procedure TForm3.GridToIntArray(Grid: TStringGrid; var IntArray: TTDimIntArray);
var
  ColNum, RowNum: Integer;
  Dimension: Integer;
  CNum, RNum: Integer;
begin
  Self.GetDimension(Grid, Dimension);
  SetLength(IntArray, Dimension, Dimension);
  for CNum := 0 to Dimension - 1 do
  begin
    for RNum := 0 to Dimension - 1 do
    begin
      if Grid.cells[CNum + 1, RNum + 1] <> '' then
      begin
        IntArray[CNum, RNum] := Trim(Grid.cells[CNum + 1, RNum + 1]).toInteger;
      end
      else
      begin
        IntArray[CNum, RNum] := 0;
      end;
    end;
  end;
end;

procedure TForm3.strngrd1DblClick(Sender: TObject);
var
  ColMax: Integer;
  RowMax: Integer;
  Num: Integer;
  RowFlag, ColFlag: Boolean;
  ColNum, RowNum: Integer;
  TagColNum, TagRowNum: Integer;
begin
  //ShowMessage('测试');
  ColMax := TStringGrid(Sender).ColCount;
  RowMax := TStringGrid(Sender).RowCount;
  RowFlag := False;
  ColFlag := False;
  //ShowMessage(ColMax.ToString);
  for Num := 1 to RowMax do
  begin
    if TStringGrid(Sender).Cells[ColMax - 1, Num] <> '' then
    begin
      ColFlag := True;
    end;
  end;
  for Num := 1 to ColMax do
  begin
    if TStringGrid(Sender).Cells[Num, RowMax - 1] <> '' then
    begin
      RowFlag := True;
    end;
  end;
  if ColFlag then
  begin
    TStringGrid(Sender).ColCount := TStringGrid(Sender).ColCount + 1;
    for Num := 1 to TStringGrid(Sender).RowCount - 1 do
    begin
      TStringGrid(Sender).Cells[TStringGrid(Sender).colCount - 1, Num] := '';
    end;
  end;
  if RowFlag then
  begin
    TStringGrid(Sender).RowCount := TStringGrid(Sender).RowCount + 1;
    for Num := 1 to TStringGrid(Sender).ColCount - 1 do
    begin
      TStringGrid(Sender).Cells[Num, TStringGrid(Sender).RowCount - 1] := '';
    end;
  end;
  //新行//列 有 显示问题
  //到末尾 增加行列
  // 加上 行//列标 （和 行列式 不同，行列式 是 行-列；表格是 col-row
  // 思路 每次写入，判断 有字的 地方 是都有数；有数 就记录 这个 列标
  //然后 填充 这个 列标之前的
  TagColNum := 0;
  TagRowNum := 0;
  for ColNum := 1 to ColMax - 1 do
  begin
    for RowNum := 1 to RowMax - 1 do
    begin
      if TStringGrid(Sender).Cells[ColNum, RowNum] <> '' then
      begin
        if TagColNum < ColNum then
        begin
          TagColNum := ColNum;
        end;
        if TagRowNum < RowNum then
        begin
          TagRowNum := RowNum;
        end;
      end;
    end;
  end;
  for Num := 0 to RowNum do
  begin
    TStringGrid(Sender).Cells[0, RowNum] := Num.ToString;
  end;
  for Num := 0 to ColNum do
  begin
    TStringGrid(Sender).Cells[ColNum, 0] := Num.ToString;
  end;
  TStringGrid(Sender).Repaint;
  //ShowMessage(TStringGrid(Sender).Cells[TStringGrid(Sender).RowCount - 1, TStringGrid(Sender).RowCount - 1]);
  //TStringGrid(Sender).Repaint;
end;

procedure TForm3.strngrd1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  sText: string;
begin
  with Tstringgrid(Sender) do
  begin
    canvas.Brush.Color := clWhite;
    if State = [gdSelected, gdFocused] then
    begin
      sText := Cells[ACol, ARow];
      if sText <> '' then
      begin
        Canvas.FillRect(Rect);
        with Canvas.Font do
        begin
          Size := 18;
          Name := 'Time New Romans'
        end;
        DrawText(Canvas.Handle, PChar(sText), Length(sText), Rect, DT_CENTER or DT_VCENTER or DT_SINGLELINE);
      //Canvas.TextOut(0, 0, sText);
      //Canvas.TextRect(Rect, sText, [tfSingleLine, tfCenter, tfVerticalCenter]);
      end;
    end;
    //TStringGrid(Sender).Refresh;
  end;
end;

procedure TForm3.strngrd1SelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  //ShowMessage(TStringGrid(Sender).Cells[ACol, ARow]);
end;

procedure TForm3.strngrd1SetEditText(Sender: TObject; ACol, ARow: Integer; const Value: string);         //判断边界
begin
  TStringGrid(Sender).OnDblClick(Sender);
 // TStringGrid(Sender).Repaint;
end;

end.

