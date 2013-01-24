unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, Math, ComCtrls, ToolWin;

type
  TForm1 = class(TForm)
    tmr1: TTimer;
    txt1: TStaticText;
    img1: TImage;
    pnl1: TPanel;
    tlb1: TToolBar;
    btn_Exit: TToolButton;
    pnl2: TPanel;
    lbl1: TLabel;
    btn_Start: TToolButton;
    procedure tmr1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_ExitClick(Sender: TObject);
    procedure btn_StartClick(Sender: TObject);
  private
    { Private declarations }
    bStart:Boolean;
    iMin,iMax:integer;
    iCurrent:Integer;
    numbers:array [0..72] of Integer;
    procedure initRndArray;
    procedure Choujing;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.tmr1Timer(Sender: TObject);
begin
  if bStart then
  begin
    if iCurrent<iMax then
      Inc(iCurrent)
    else
      iCurrent :=0;

    txt1.Caption:= IntToStr(numbers[iCurrent]);
    txt1.Update;
  end;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  iMin := 1;
  iMax := 72;
  iCurrent := 1;

  txt1.DoubleBuffered := True;
  initRndArray;
  txt1.Caption := IntToStr(numbers[0]);
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=32 then
  begin
      Choujing;
  end;
end;

procedure TForm1.initRndArray;
var
  i,j,temp:integer;
  n:Integer;
begin
  n :=72;
  for i:=0 to 72 do
  begin
    numbers[i] :=i+1;
  end;

  Randomize;

  for i:=n-1 downto 0 do
  begin
    j := Random(i);
    temp := numbers[i];
    numbers[i] := numbers[j];
    numbers[j] := temp;
  end;

end;

procedure TForm1.btn_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.btn_StartClick(Sender: TObject);
begin
  Choujing;
end;

procedure TForm1.Choujing;
begin
  bStart:= not bStart;

  if bStart then
    btn_Start.Caption:='½áÊø³é½±'
  else
    btn_Start.Caption:='¿ªÊ¼³é½±'
end;

end.
