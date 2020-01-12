const
   fin='';fon='';
var
   n,k,i,j:longint;
   a:array [1..10000] of longint;
   f:array [0..1000,0..1000] of longint;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(n,k);
   for i:=1 to n do
      begin
      read(a[i]);
      a[i]:=a[i] mod k;
      end;
   end;
function max(a,b:longint):longint;
   begin
   if a>b then exit(a)
   else exit(b);
   end;
procedure solve;
   begin
   for i:=1 to k do f[0,i]:=-trunc(1e5);
   for i:=1 to n do
      begin
      for j:=0 to k-1 do
         begin
         if a[i]<=j then
            f[i,j]:=max(f[i-1,j],f[i-1,j-a[i]]+1)
         else
         f[i,j]:=max(f[i-1,j],f[i-1,j+k-a[i]]+1);
         end;
      end;
   end;
procedure xuat;
   begin
   writeln(f[n,0]);
   close(input);
   close(output);
   end;
begin
nhap;
solve;
xuat;
end.


