const
   fin='';fon='';
var
   i,n,m,j,max:longint;
   a,b:Array [1..10000] of longint;
   f:array [-1..10000,-1..10000] of longint;
procedure nhap;
   begin
   assign(input,fin);reseT(input);
   assign(output,fon);rewrite(output);
   readln(n,m);
   for i:=1 to n do readln(a[i]);
   for i:=1 to m do readln(b[i]);
   end;
function csmax(a,b:longint):longint;
   var kq:longint;
   begin
   kq:=a;
   if b>=kq then kq:=b;
   exit(kq);
   end;
procedure xuli;
   begin
   for i:=0 to n do f[i,0]:=0;
   for i:=0 to m do f[0,i]:=0;
   for i:=1 to n do
      begin
      for j:=1 to m do
         begin
         if a[i]=b[j] then f[i,j]:=f[i-2,j-2]+1
         else f[i,j]:=csmax(f[i-1,j],f[i,j-1]);
         end;
      end;
   writeln(f[n,m]);
   close(input);
   close(output);
   end;
begin
nhap;
xuli;
end.
