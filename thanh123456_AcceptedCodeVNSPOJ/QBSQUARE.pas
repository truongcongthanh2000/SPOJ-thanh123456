const
   fin='';fon='';
var
   i,n,m,j,maxf:longint;
   a,f:array [0..1001,0..1001] of longint;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(m,n);
   for i:=1 to m do
      begin
      for j:=1 to n do
         read(A[i,j]);
      readln;
      end;
    fillchar(f,sizeof(f),0);
   end;
function min(a,b,c:longint):longint;
   var
      kq:longint;
   begin
   kq:=a;
   if b<kq then kq:=b;
   if c<kq then kq:=c;
   exit(kq);
   end;
procedure xuli;
   begin
   for i:=1 to m do
      begin
      for j:=1 to n do
         begin
         if (a[i,j]=a[i-1,j]) and (a[i,j]=a[i,j-1]) and (a[i,j]=a[i-1,j-1]) then f[i,j]:=min(f[i-1,j-1],f[i-1,j],f[i,j-1])+1
         else f[i,j]:=1;
         end;
      end;
   maxf:=1;
   for i:=1 to m  do
      begin
      for j:=1 to n do
         begin
         if f[i,j]>maxf then maxf:=f[i,j];
         end;
      end;
   writeln(maxf);
   close(input);
   close(output);
   end;
begin
nhap;
xuli;
end.