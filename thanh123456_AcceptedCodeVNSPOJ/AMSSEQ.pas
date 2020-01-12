const
   fin='';fon=''; lonnhat=100000;
var
   a,f:array [0..lonnhat] of longint;
   i,n,k,j,kq:longint;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(n,k);
   for i:=1 to n do read(a[i]);
   end;
function max(a,b:longint):longint;
   var kq:longint;
   begin
   kq:=a;
   if b>kq then kq:=b;
   exit(kq);
   end;
procedure qhd;
   begin
   for i:=1 to n do
      begin
      f[i]:=-lonnhat;
      for j:=1 to k do
         begin
         f[i]:=max(f[i],f[i-j]+a[i]);
         kq:=max(kq,f[i]);
         end;
      end;
   writeln(kq);
   close(input);
   close(output);
   end;
begin
nhap;
qhd;
end.
