unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls,LResources, Spin;

type
  Element = record
    x,y : integer;
  end;

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    SpinEdit1: TSpinEdit;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
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
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure SpinEdit1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  objek : Array[1..9] of Element;
  x,y,i : integer;
  p : LongInt;

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
  Image1.Canvas.MoveTo(objek[1].x,objek[1].y);
  for i:= 1 to 5 do
  begin
    Image1.Canvas.LineTo(objek[i].x,objek[i].y);
  end;
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

procedure TForm1.Button1Click(Sender: TObject);
begin
  objek[1].x := 50;                    objek[1].y := 50;
  objek[2].x := 50;                    objek[2].y := 200;
  objek[3].x := 200;                   objek[3].y := 200;
  objek[4].x := 200;                   objek[4].y := 50;
  objek[5].x := 50;                    objek[5].y := 50;
  FormShow(sender);
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  for i:=1 to 5 do
  begin
    objek[1].x := objek[1].x+p;                    objek[1].y := objek[1].y+p;
    objek[2].x := objek[2].x+p;                    objek[2].y := objek[2].y-p;
    objek[3].x := objek[3].x-p;                    objek[3].y := objek[3].y-p;
    objek[4].x := objek[4].x-p;                    objek[4].y := objek[4].y+p;
    objek[5].x := objek[5].x+p;                    objek[5].y := objek[5].y+p;
  end;
  FormShow(Sender);
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  for i:=1 to 5 do
  begin
    objek[1].x := objek[1].x-p;                    objek[1].y := objek[1].y-p;
    objek[2].x := objek[2].x-p;                    objek[2].y := objek[2].y+p;
    objek[3].x := objek[3].x+p;                    objek[3].y := objek[3].y+p;
    objek[4].x := objek[4].x+p;                    objek[4].y := objek[4].y-p;
    objek[5].x := objek[5].x-p;                    objek[5].y := objek[5].y-p;
  end;
  FormShow(Sender);
end;

procedure TForm1.Button12Click(Sender: TObject);
var
  TempObjek: array[1..6] of element;
  Sdt : real;
begin
  for i:=1 to 5 do
  begin
    objek[i].x:=objek[i].x-Image1.Width div 2;
    Objek[i].y:=Objek[i].y-Image1.Height div 2;
    Sdt:=10*pi/180;
    TempObjek[i].x:=round(Objek[i].x*cos(Sdt)-Objek[i].y*sin(Sdt));
    TempObjek[i].y:=round(Objek[i].x*sin(Sdt)+Objek[i].y*cos(Sdt));
    Objek[i]:=TempObjek[i];
    objek[i].x:=objek[i].x+Image1.Width div 2;
    objek[i].y:=objek[i].y+Image1.Height div 2;
  end;
  FormShow(Sender);
end;

procedure TForm1.Button13Click(Sender: TObject);
var
  TempObjek: array[1..6] of element;
  n,m : integer;
  Sdt : real;
begin
  n := (objek[1].x+objek[3].x) div 2; 
  m := (objek[1].y+objek[3].y) div 2;
  begin
    n := Objek[3].x;
    m := Objek[3].y;
    objek[i].x:=objek[i].x-n;
    objek[i].y:=objek[i].y-m;
    Sdt:=10*pi/180;
    TempObjek[i].x:=round(Objek[i].x*cos(Sdt)-Objek[i].y*sin(Sdt));
    TempObjek[i].y:=round(Objek[i].x*sin(Sdt)+Objek[i].y*cos(Sdt));
    Objek[i]:=TempObjek[i];
    objek[i].x:=objek[i].x+n;
    objek[i].y:=objek[i].y+m;
  end;
  FormShow(Sender);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  for i:=1 to 5 do
  begin
    objek[i].x := objek[i].x - p;
  end;
  FormShow(Sender);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  for i:=1 to 5 do
  begin
    objek[i].y := objek[i].y - p;
  end;
  FormShow(Sender);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  for i:=1 to 5 do
  begin
    objek[i].y := objek[i].y + p;
  end;
  FormShow(Sender);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  for i:=1 to 5 do
  begin
    objek[i].x := objek[i].x + p;
  end;
  FormShow(Sender);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  for i:=1 to 5 do
  begin
    objek[i].x := objek[i].x - p;
    objek[i].y := objek[i].y - p;
  end;
  FormShow(Sender);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  for i:=1 to 5 do
  begin
    objek[i].x := objek[i].x + p;
    objek[i].y := objek[i].y - p;
  end;
  FormShow(Sender);
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  for i:=1 to 5 do
  begin
    objek[i].x := objek[i].x - p;
    objek[i].y := objek[i].y + p;
  end;
  FormShow(Sender);
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  for i:=1 to 5 do
  begin
    objek[i].x := objek[i].x + p;
    objek[i].y := objek[i].y + p;
  end;
  FormShow(Sender);
end;

end.

