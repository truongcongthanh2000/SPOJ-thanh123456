const
   fin='';fon='';
var
   i,n,m,dem,s:longint;
   v,u,c,a:array [1..trunc(2e4)] of longint;
   t:array [1..trunc(1e4),1..trunc(1e4)] of integer;
procedure nhap;
   begin
   assigN(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(n,m);
   for i:=1 to m do
      begin
      readln(u[i],v[i],c[i]);
      t[u[i],v[i]]:=c[i];
      t[v[i],u[i]]:=c[i];
      end;
   end;
procedure swap(var x,y:longint);
   var
      tam:longint;
   begin
   tam:=x; x:=y; y:=tam;
   end;
procedure qsort(l,r:longint);
   var
      i,j,m,x:longint;
   begin
   i:=l;  j:=r;
   m:=random(r-l)+l+1;
   x:=c[m];
   repeat
      while c[i]<x do inC(i);
      while c[j]>x do dec(j);
      if i<=j then
         begin
         swap(c[i],c[j]);
         swap(u[i],u[j]);
         swap(v[i],v[j]);
         inc(i); dec(j);
         end;
   until i>j;
   if l<J then qsort(l,j);
   if i<r then qsort(i,r);
   end;
procedure init;
   begin
   for i:=1 to n do a[i]:=-1;
   end;
function TimGoc(i:longinT):longint;
   var
      j:longint;
   begin
   j:=i;
   while a[j]<>-1 do j:=a[j];
   exit(j);
   end;
procedure DaoGoc(i:longint);
   begin
   if a[i]<>-1 then DaoGoc(a[i]);
   if a[i]<>-1 then a[a[i]]:=i;
   end;
procedure CayMin;
   begin
   dem:=0;
   init;
   for i:=1 to m do
      begin
      if TimGoc(u[i])<>TimGoc(v[i]) then
         begin
         inc(dem);
         if a[u[i]]=-1 then a[u[i]]:=v[i]
            else
            if a[v[i]]=-1 then a[v[i]]:=u[i]
               else
                  begin
                  DaoGoc(u[i]);
                  a[u[i]]:=v[i];
                  end;
         if dem=n-1 then exit;
         end;
      end;
   end;
procedure xuat;
   begin
   s:=0;
   for i:=1 to n do
      begin
      if a[i]<>-1 then
         s:=s+t[i,a[i]];
      end;
   writeln(s);
   close(input);
   close(output);
   end;
begin
nhap;
qsort(1,m);
Caymin;
xuat;
end.

