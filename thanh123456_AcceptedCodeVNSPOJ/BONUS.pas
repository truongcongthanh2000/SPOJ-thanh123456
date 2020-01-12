const
   fin='';fon='';
var
   t,n,k,i,j,max:longint;
   a,f:array [0..1001,0..1001] of longint;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(n,k);
   for i:=1 to n do
      begin
      for j:=1 to n do
         read(a[i,j]);
      readln;
      end;
   for i:=0 to n do
      begin
      f[0,i]:=0; f[i,0]:=0;
      end;
   for i:=1 to n do
      begin
      for j:=1 to n do
         f[i,j]:=f[i-1,j]+f[i,j-1]-f[i-1,j-1]+a[i,j];
      end;
   end;
function tinh(i,j:longint):longint;
   begin
   exit(f[i+k-1,j+k-1]-f[i-1,j+k-1]-f[i+k-1,j-1]+f[i-1,j-1]);
   end;
procedure xuli;
   begin
   max:=0;
   for i:=1 to n-k+1 do
      begin
      for j:=1 to n-k+1 do
         begin
         t:=tinh(i,j);
         if t>max then max:=t;
         end;
      end;
   writeln(max);
   close(input);
   close(output);
   end;
begin
nhap;
xuli;
end.
