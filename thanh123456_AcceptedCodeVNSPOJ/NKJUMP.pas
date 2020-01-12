const
   fin='';fon='';
var
   a,h,u,v,d:array [0..1000000] of int64;
   kt:array [0..1000000] of boolean;
   n,i,canh,j,k:longint;
   max:int64;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(n);
   for i:=1 to n do read(a[i]);
   end;
procedure qsort(l,r:longint);
   var
      i,j,m,x,t:longint;
   begin
   i:=l; j:=r;
   m:=l+random(r-l)+1;
   x:=a[m];
   repeat
      while a[i]<x do inc(i);
      while a[j]>x do dec(j);
      if i<=j then
         begin
         t:=a[i]; a[i]:=a[j]; a[j]:=t;
         inc(i); dec(j);
         end;
   until i>j;
   if l<j then qsort(l,j);
   if i<r then qsort(i,r);
   end;
function kqmax(a,b:int64):int64;
	begin
	if a>b then exit(a)
	else exit(b);
	end;
function tknp(x:longint):longint;
   var
      l,r,m:longint;
   begin
   l:=j+1;
   r:=n;
   repeat
      m:=(l+r) div 2;
      if a[m]=x then exit(m)
      else
         begin
         if a[m]<x then l:=m+1
         else r:=m-1;
         end;
   until l>r;
   exit(-1);
   end;
procedure push(x,y:longint);
   begin
   inc(canh);
   u[canh]:=x;
   v[canh]:=y;
   end;
procedure taodothi;
   begin
   for i:=1 to n-2 do
      begin
      for j:=i+1 to n-1 do
         begin
         k:=tknp(a[i]+a[j]);
         if k<>-1 then
            begin
            push(i,k);
            push(j,k);
            end;
         end;
      end;
   end;
procedure taomang;
   begin
   for i:=1 to canh do
      inc(h[u[i]]);
   for i:=2 to n+1 do h[i]:=h[i-1]+h[i];
   for i:=canh downto 1 do
      begin
      a[h[u[i]]]:=v[i];
      dec(h[u[i]]);
      end;
   end;
procedure dfs(u:longint);
   var
      v:longint;
   begin
   d[u]:=1;
   for v:=h[u]+1 to h[u+1] do
      begin
      if kt[a[v]]=true then
         begin
         kt[a[v]]:=false;
         dfs(a[v]);
         end;
      end;
    for v:=h[u]+1 to h[u+1] do
    	d[u]:=kqmax(d[u],d[a[v]]+1);
   end;
procedure xuli;
   begin
   for i:=1 to n do kt[i]:=true;
   for i:=1 to n do dfs(i);
   max:=0;
   for i:=1 to n do
      begin
      if d[i]>max then max:=d[i];
      end;
   writeln(max);
   close(input);
   close(output);
   end;
begin
nhap;
qsort(1,n);
taodothi;
taomang;
xuli;
end.
 