unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls,LResources, Spin, ComCtrls, Menus;

type
  Element = record
    x,y : integer;
  end;

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    ColorButton1: TColorButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    RadioGroup1: TRadioGroup;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  objek : Array[1..9] of Element;
  x,y,i : integer;
  p,q : LongInt;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormActivate(Sender: TObject);
begin
  Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);
  if RadioGroup1.ItemIndex=0 then
    Image1.Canvas.Ellipse(objek[1].x,objek[1].y,objek[2].x,objek[2].y)
  else
  begin
    Image1.Canvas.MoveTo(objek[1].x,objek[1].y);
    for i:= 1 to 8 do
    begin
      Image1.Canvas.LineTo(objek[i].x,objek[i].y);
    end;
  end;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Image1.Canvas.Brush.Style:=bsSolid;
  Image1.Canvas.Brush.Color:=ColorButton1.ButtonColor;
  Image1.Canvas.FloodFill(x,y,Image1.Canvas.Pixels[x,y],fsSurface);
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Label1.Caption:=inttostr(x); 
  Label2.Caption:=inttostr(y);
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
  p := SpinEdit1.Value;
end;

procedure TForm1.SpinEdit2Change(Sender: TObject);
begin
  q := SpinEdit2.Value;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex=0 then
    objek[1].x := 50;                    objek[1].y := 50;
    objek[2].x := 200;                   objek[2].y := 200;
  if RadioGroup1.ItemIndex=1 then
    begin
    objek[1].x := 50;                    objek[1].y := 100;
    objek[2].x := 90;                    objek[2].y := 40;
    objek[3].x := 130;                   objek[3].y := 100;
    objek[4].x := 110;                   objek[4].y := 100;
    objek[5].x := 110;                   objek[5].y := 160;
    objek[6].x := 70;                    objek[6].y := 160;
    objek[7].x := 70;                    objek[7].y := 100;
    objek[8].x := 50;                    objek[8].y := 100;
    end;
  if RadioGroup1.ItemIndex=2 then
    begin
    objek[1].x := 50;                    objek[1].y := 50;
    objek[2].x := 50;                    objek[2].y := 200;
    objek[3].x := 200;                   objek[3].y := 200;
    objek[4].x := 200;                   objek[4].y := 50;
    objek[5].x := 200;                   objek[5].y := 50;
    objek[6].x := 200;                   objek[6].y := 50;
    objek[7].x := 50;                    objek[7].y := 50;
    objek[8].x := 50;                    objek[8].y := 50;
    end;
  FormShow(sender);
end;

procedure TForm1.Button11Click(Sender: TObject);
var
  xt,yt,xa,ya: integer;
  ar: array[0..4] of integer;
begin
  ar[0]:=50;
  ar[1]:=80;
  ar[2]:=100;
  ar[3]:=125;
  ar[4]:=150;
  if RadioGroup1.ItemIndex=0 then
  begin
    xt:=0;
    yt:=0;
    for i:=1 to 2 do begin
      xt:=xt+objek[i].x;
      yt:=yt+objek[i].y;
    end;
    xa:= round(xt/2);
    ya:= round(yt/2);
    for i:=1 to 2 do begin
      objek[i].x:= objek[i].x-xa;
      objek[i].y:= objek[i].y-ya;
    end;
    for i:=1 to 2 do begin
      objek[i].x:= round(objek[i].x*ar[ComboBox2.ItemIndex]/100);
      objek[i].y:= round(objek[i].y*ar[ComboBox2.ItemIndex]/100);
    end;
    for i:=1 to 2 do begin
      objek[i].x:= objek[i].x+xa;
      objek[i].y:= objek[i].y+ya;
    end;
  end else begin
    xt:=0;
    yt:=0;
    for i:=1 to 8 do begin
      xt:=xt+objek[i].x;
      yt:=yt+objek[i].y;
    end;
    xa:= round(xt/8);
    ya:= round(yt/8);
    for i:=1 to 8 do begin
      objek[i].x:= objek[i].x-xa;
      objek[i].y:= objek[i].y-ya;
    end;
    for i:=1 to 8 do begin
      objek[i].x:= round(objek[i].x*ar[ComboBox2.ItemIndex]/100);
      objek[i].y:= round(objek[i].y*ar[ComboBox2.ItemIndex]/100);
    end;
    for i:=1 to 8 do begin
      objek[i].x:= objek[i].x+xa;
      objek[i].y:= objek[i].y+ya;
    end;
  end;
  FormShow(Sender);
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);
  Image1.Canvas.Brush.Style:=bsSolid;
  Image1.Canvas.Brush.Color:=clWhite;
  ColorButton1.ButtonColor:=clWhite;
  Image1.Canvas.FloodFill(50,50,Image1.Canvas.Pixels[50,50],fsSurface);
end;

procedure TForm1.Button13Click(Sender: TObject);
var
  TempObjek: array[1..9] of element;
  n,m : integer;
  Sdt : real;
begin
  if RadioGroup1.ItemIndex>0 then begin
    n := (objek[1].x+objek[3].x) div 2;
    m := (objek[2].y+objek[5].y) div 2;
    for i:=1 to 8 do
    begin
      objek[i].x:=objek[i].x-n;
      objek[i].y:=objek[i].y-m;
      Sdt:=90*pi/180;
      TempObjek[i].x:=round(Objek[i].x*cos(Sdt)-Objek[i].y*sin(Sdt));
      TempObjek[i].y:=round(Objek[i].x*sin(Sdt)+Objek[i].y*cos(Sdt));
      Objek[i]:=TempObjek[i];
      objek[i].x:=objek[i].x+n;
      objek[i].y:=objek[i].y+m;
    end;
    FormShow(Sender);
  end;
end;

procedure TForm1.Button14Click(Sender: TObject);
var
  TempObjek: array[1..9] of element;
  n,m : integer;
  Sdt : real;
begin
  if RadioGroup1.ItemIndex>0 then begin
    n := (objek[1].x+objek[3].x) div 2;
    m := (objek[2].y+objek[5].y) div 2;
    for i:=1 to 8 do
    begin
      objek[i].x:=objek[i].x-n;
      objek[i].y:=objek[i].y-m;
      Sdt:=-90*pi/180;
      TempObjek[i].x:=round(Objek[i].x*cos(Sdt)-Objek[i].y*sin(Sdt));
      TempObjek[i].y:=round(Objek[i].x*sin(Sdt)+Objek[i].y*cos(Sdt));
      Objek[i]:=TempObjek[i];
      objek[i].x:=objek[i].x+n;
      objek[i].y:=objek[i].y+m;
    end;
    FormShow(Sender);
  end;
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
  if ComboBox1.ItemIndex=0 then
    Image1.Canvas.Pen.Style:=psSolid;
  if ComboBox1.ItemIndex=1 then
    Image1.Canvas.Pen.Style:=psDash;
  if ComboBox1.ItemIndex=2 then
    Image1.Canvas.Pen.Style:=psDashDot;
  if ComboBox1.ItemIndex=3 then
    Image1.Canvas.Pen.Style:=psDashDotDot;
  FormShow(Sender);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  for i:=1 to 8 do
  begin
    objek[i].x := objek[i].x - p;
  end;
  FormShow(Sender);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  for i:=1 to 8 do
  begin
    objek[i].y := objek[i].y - p;
  end;
  FormShow(Sender);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  for i:=1 to 8 do
  begin
    objek[i].y := objek[i].y + p;
  end;
  FormShow(Sender);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  for i:=1 to 8 do
  begin
    objek[i].x := objek[i].x + p;
  end;
  FormShow(Sender);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  for i:=1 to 8 do
  begin
    objek[i].x := objek[i].x - p;
    objek[i].y := objek[i].y - p;
  end;
  FormShow(Sender);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  for i:=1 to 8 do
  begin
    objek[i].x := objek[i].x + p;
    objek[i].y := objek[i].y - p;
  end;
  FormShow(Sender);
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  for i:=1 to 8 do
  begin
    objek[i].x := objek[i].x - p;
    objek[i].y := objek[i].y + p;
  end;
  FormShow(Sender);
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  for i:=1 to 8 do
  begin
    objek[i].x := objek[i].x + p;
    objek[i].y := objek[i].y + p;
  end;
  FormShow(Sender);
end;

end.

