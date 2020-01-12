const
   fin=''; fon='';
var
   i,m,jmax,n,j,k:longint;
   s:string;
   a,f,cs,kq:array [0..10000000] of longint;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(N);
   for i:=1 to n do read(A[i]);
   end;
function max(x:longint):longint;
   var
      kq,i:longint;
   begin
   kq:=f[1];
   for i:=2 to x do
      begin
      if f[i]>kq then kq:=f[i];
      end;
   exit(kq);
   end;
function csmax(x:longint):longint;
   var
      cs,i:longint;
   begin
   cs:=1;
   for i:=2 to x do
      begin
      if f[i]>f[cs] then cs:=i;
      end;
   exit(cs);
   end;
procedure xuli;
   begin
   f[1]:=1;
   for i:=2 to n do
      begin
      jmax:=0; f[0]:=-1;
      for j:=1 to i-1 do
         begin
         if (a[j]<a[i]) and (f[j]>f[jmax]) then jmax:=j;
         end;
      if jmax=0 then f[i]:=1
      else
         begin
         f[i]:=f[jmax]+1;
         cs[i]:=jmax;
         end;
      end;
   writeln(max(n));
   close(input);
   close(output);
   end;
begin
nhap;
xuli;
end.


