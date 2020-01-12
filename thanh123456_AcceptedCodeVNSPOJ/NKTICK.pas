const
   fin='';fon='';
var
   i,n:longint;
   f,a,b:array [1..10000000] of int64;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(n);
   for i:=1 to n do
      read(a[i]);
   readln;
   for i:=1 to n-1 do
      read(b[i]);
   end;
function min(a,b:int64):int64;
   begin
   if a>=b then exit(b)
   else exit(a);
   end;
procedure xuli;
   begin
   f[1]:=a[1];
   f[2]:=min(a[1]+a[2],b[1]);
   for i:=3 to n do
      f[i]:=min((f[i-1]+a[i]),(f[i-2]+b[i-1]));
   writeln(f[n]);
   close(input);
   close(output);
   end;
begin
nhap;
xuli;
end.