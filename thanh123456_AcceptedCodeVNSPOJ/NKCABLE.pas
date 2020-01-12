const
   fin='';fon='';
var
   i,n:longint;
   f:array [1..25000] of int64;
   a:array [1..25000] of longint;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(n);
   for i:=1 to n-1 do
      readln(a[i]);
   end;
function min(a,b:int64):int64;
   begin
   if a<=b then exit(a);
   if a>b then exit(b);
   end;
procedure xuli;
   begin
   f[1]:=0;
   f[2]:=a[1];
   f[3]:=a[1]+a[2];
   for i:=4 to n do
      f[i]:=min(f[i-1]+a[i-1],f[i-2]+a[i-1]);
   writeln(f[n]);
   close(input);
   close(output);
   end;
begin
nhap;
xuli;
end.