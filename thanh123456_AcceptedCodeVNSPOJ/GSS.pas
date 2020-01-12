const
   fin='';fon='';
   maxn=trunc(1e9);
   gioihan=50000;
type love=record
   LiNa,Thu,Thanh,Hien:longint;
end;
///LiNa: Left, Thu:right, Thanh:sum; Hien:KetQua;
var
   t:array [1..4*gioihan] of love;
   n:longint;
   a:array [1..gioihan+1] of longint;
procedure nhap;
   var
      i:longint;
   begin
   assigN(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(n);
   for i:=1 to n do read(a[i]);
   end;
function max(a,b:longint):longint;
   begin
   if a>b then exit(a)
   else exit(b);
   end;
function XayDung(left,right:love):love;
   var
      tam:love;
   begin
   tam.Thanh:=left.Thanh+right.Thanh;
   tam.LiNa:=max(left.LiNa,left.Thanh+right.LiNa);
   tam.Thu:=max(right.Thu,right.Thanh+left.Thu);
   tam.Hien:=max(max(left.Hien,right.Hien),left.Thu+right.LiNa);
   exit(tam);
   end;
procedure taocay(i,l,r:longint);
   var
      mid:longint;
   begin
   if l=r then
      begin
      t[i].LiNa:=a[l];
      t[i].Thu:=a[l];
      t[i].Thanh:=a[l];
      t[i].Hien:=a[l];
      exit;
      end;
   mid:=(l+r) div 2;
   taocay(i*2,l,mid);
   taocay(i*2+1,mid+1,r);
   t[i]:=XayDung(t[i*2],t[i*2+1]);
   end;
function Tinh(i,l,r,u,v:longint):love;
   var
      mid:longint;
      left,right:love;
      KetQua:love;
   begin
   if (r<u) or (l>v) then
      begin
      KetQua.Thanh:=0;
      KetQua.LiNa:=-maxn;
      KetQua.Thu:=-maxn;
      KetQua.Hien:=-maxn;
      exit(KetQua);
      end
   else
      if (l>=u) and (r<=v) then exit(t[i])
         else
            begin
            mid:=(l+r) div 2;
            left:=Tinh(i*2,l,mid,u,v);
            right:=Tinh(i*2+1,mid+1,r,u,v);
            KetQua:=XayDung(left,right);
            exit(KetQua);
            end;
   end;
procedure xuat;
   var
      q,i,u,v:longint;
   begin
   readln(q);
   for i:=1 to q do
      begin
      readln(u,v);
      writeln(Tinh(1,1,n,u,v).Hien);
      end;
   close(input);
   close(output);
   end;
begin
nhap;
taocay(1,1,n);
xuat;
end.



