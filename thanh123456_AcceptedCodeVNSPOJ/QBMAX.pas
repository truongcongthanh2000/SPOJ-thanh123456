const
   fin='';fon='';
var
   i,h,t,s,j,m,n,max:longint;
   a,f:array [0..101,0..101] of longint;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(m,n);
   for i:=1 to m do
      for j:=1 to n do
         read(a[i,j]);
   end;
function kt(a,b,c:longint):longint;
   begin
   kt:=a;
   if kt<b then kt:=b;
   if kt<c then kt:=c;
   end;
procedure xuli;
   begin
   for i:=1 to m do
      f[i,1]:=a[i,1];
   for i:=1 to n-1 do
      begin
      f[0,i]:=-maxint;
      f[n+1,i]:=-maxint;
      end;
   for j:=2 to n do
      begin
      for i:=1 to m do
         begin
         f[i,j]:=kt(f[i-1,j-1],f[i,j-1],f[i+1,j-1])+a[i,j];
         end;
      end;
   max:=f[1,n];
   for i:=2 to m do
      begin
      if f[i,n]>max then max:=f[i,n];
      end;
   writeln(max);
   close(input);
   close(output);
   end;
begin
nhap;
xuli;
end.

