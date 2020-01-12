const
   fin='';fon='';
var
   n,m,i,t,j,max,dem:longint;
   v,u,h,ds,d:array [1..100000] of longint;
   f:array[1..100000] of boolean;
procedure nhap;
   begin
   assigN(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(n,m,t);
   fillchar(f,sizeof(f),false);
   end;
procedure taomang;
   begin
   for i:=1 to m do
      begin
      readln(u[i],v[i]);
      inc(h[v[i]]);
      end;
   for i:=2 to n do h[i]:=h[i-1]+h[i];
   for i:=m downto 1 do
      begin
      ds[h[v[i]]]:=u[i];
      dec(h[v[i]]);
      end;
   h[n+1]:=m;
   end;
procedure dfs(u:longint);
   var v,i:longint;
   begin
   f[u]:=true;
   for i:=h[u]+1 to h[u+1] do
      begin
      v:=ds[i];
      if f[v]=false then dfs(v);
      end;
   end;
procedure xuli;
   begin
   dfs(t);
   for i:=1 to n do
      begin
      if f[i]=false then
         begin
         dfs(i);
         f[i]:=false;
         end;
      end;
   end;
procedure xuat;
   begin
   dem:=0;
   for i:=1 to n do
      if f[i]=false then inc(dem);
   writeln(dem);
   close(input);
   close(output);
   end;
begin
nhap;
taomang;
xuli;
xuat;
end.
