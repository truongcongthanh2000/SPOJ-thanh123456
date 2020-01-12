const
   fin='';fon='';
var
   a,b:ansistring;
   i,j,m,n:longint;
   kq:array [0..10000,0..10000] of longint;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(a);
   readln(b);
   end;
function max(x,y:longint):longint;
   begin
   if x>=y then exit(x)
   else exit(y);
   end;
procedure tinh;
   begin
   m:=length(a); n:=length(b);
   for i:=0 to m do kq[i,0]:=0;
   for i:=0 to n do kq[0,i]:=0;
   for i:=1 to m do
      begin
      for j:=1 to n do
         begin
         if a[i]=b[j] then kq[i,j]:=kq[i-1,j-1]+1
         else kq[i,j]:=max(kq[i-1,j],kq[i,j-1]);
         end;
      end;
   writeln(kq[m,n]);
   close(input);
   close(output);
   end;
begin
nhap;
tinh;
end.

