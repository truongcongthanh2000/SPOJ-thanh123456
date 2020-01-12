const
   fin='';fon='';
var
   i,n,s,j:longint;
   f:array [0..10000,0..10000] of longint;
   a:array [1..100000] of longint;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(s,n);
   for i:=1 to n do readln(a[i]);
   end;
function max(a,b:longint):longint;
   begin
   if a>b then exit(a)
   else exit(b);
   end;
procedure solve;
   begin
   for i:=1 to n do
      begin
      for j:=s downto 1 do
         begin
         f[i,j]:=f[i-1,j];
         if j>=a[i] then
            f[i,j]:=max(f[i,j],f[i-1,j-a[i]]+a[i]);
         end;
      end;
   end;
procedure xuat;
   begin
   writeln(f[n,s]);
   close(input);
   close(output);
   end;
begin
nhap;
solve;
xuat;
end.

