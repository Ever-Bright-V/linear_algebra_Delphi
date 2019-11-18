unit Definition_Method;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Grids, Vcl.ExtCtrls;

type
  TForm3 = class(TForm)
    btn1: TButton;
    strngrd1: TStringGrid;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    procedure strngrd1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure strngrd1SetEditText(Sender: TObject; ACol, ARow: Integer; const Value: string);
    procedure btn1Click(Sender: TObject);
    procedure strngrd1DblClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure strngrd1SelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure btn3Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
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
begin
  // 入数组
  //全排列获取 每项的 列
  // 每个 全排列 的 逆序数
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  strngrd1.ColWidths[0] := 30;
  strngrd1.RowHeights[0] := 30;
  strngrd1.Brush.Color := clWhite;
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

