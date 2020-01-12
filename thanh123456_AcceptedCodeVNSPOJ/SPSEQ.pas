uses math;
const
   fin='';fon='';
var
   n,test,max:longint;
   b,f,a,a1,f1:array [1..100000] of longint;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   end;
procedure nhapdulieu(n:longint);
   var
      i:longint;
   begin
   for i:=1 to n do read(a[i]);
   end;
function tknp(x:longint):longint;
   var
      l,r,m:longint;
   begin
   l:=1;
   r:=max;
   repeat
      m:=(l+r) div 2;
      if (b[m]<x) and (x<=b[m+1]) then exit(m)
      else
         begin
         if b[m]<=x then l:=m+1
         else r:=m-1;
         end;
   until l>r;
   exit(0);
   end;
procedure qhd1;     //tang
   var
      i,vitri:longint;
   begin
   b[1]:=a[1];
   max:=1;
   f[1]:=1;
   for i:=2 to n do
      begin
      b[max+1]:=maxlongint;
      vitri:=tknp(a[i]);
      f[i]:=vitri+1;
      b[vitri+1]:=a[i];
      if vitri=max then inc(max);
      b[max+1]:=maxlongint;
      end;
   end;
procedure qhd2;     //giam
   var
      i,vitri:longint;
   begin
   //for i:=1 to n do b[i]:=0;
   b[1]:=a[n];
   max:=1;
   f1[n]:=1;
   for i:=n-1 downto 1 do
      begin
      b[max+1]:=maxlongint;
      vitri:=tknp(a[i]);
      f1[i]:=vitri+1;
      b[vitri+1]:=a[i];
      if vitri=max then inc(max);
      b[max+1]:=maxlongint;
      end;
   end;
procedure xuli;
   var
      i,max,s:longint;
   begin
   max:=0;
   for i:=1 to n do
      begin
      s:=min(f1[i],f[i]);
      if 2*s-1>max then max:=2*s-1;
      end;
   writeln(max);
   end;
procedure xuat;
   var
      i:longint;
   begin
      readln(n);
      nhapdulieu(n);
      qhd1;
      qhd2;
      xuli;
   close(input);
   close(output);
   end;
begin
nhap;
xuat;
end.


