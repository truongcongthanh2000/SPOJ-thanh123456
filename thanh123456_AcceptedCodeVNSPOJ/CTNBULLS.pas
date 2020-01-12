const
   fin='';fon=''; t=2111992;
var
   i,n,k:longint;
   f:array [1..100000] of longint;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(n,k);
   end;
procedure xuli;
   begin
   for i:=1 to k+1 do
      f[i]:=(i+1) mod t;
   for i:=k+2 to n do
      f[i]:=((f[i-1] mod t)+(f[i-k-1] mod t)) mod t;
   writeln(f[n]);
   close(input);
   close(output);
   end;
begin
nhap;
xuli;
end.