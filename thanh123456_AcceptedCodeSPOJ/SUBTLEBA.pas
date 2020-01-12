uses math;
const
     fin='';fon='';
     maxn=trunc(2e5);
type
     mang1=array [0..maxn] of longint;
     mang2=array [0..maxn] of boolean;
     mang3=array [0..maxn,0..20] of longint;
var
     log,n,m,s:longint;
     u,v,c,a,h,p,d:mang1;
     free:mang2;
     b,kc:mang3;
procedure nhap;
     begin
          assigN(input,fin);reset(input);
          assign(output,fon);rewrite(output);
     end;
procedure nhapdulieu;
     var
          i:longint;
     begin
          readln(n,m,s);
          fillchar(b,sizeof(b),0);
          fillchar(kc,sizeof(kc),0);
          for i:=1 to m do
               begin
                    readln(u[i],v[i],c[i]);
                    free[i]:=false;
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
          i,j,x,m:longint;
     begin
          i:=l; j:=r;
          m:=random(r-l)+l+1;
          x:=c[m];
          repeat
               while c[i]>x do inc(i);
               while c[j]<x do dec(j);
               if i<=j then
                    begin
                         swap(c[i],c[j]);
                         swap(u[i],u[j]);
                         swap(v[i],v[j]);
                         inc(i); dec(j);
                    end;
          until i>j;
          if l<j then qsort(l,j);
          if i<r then qsort(i,r);
     end;
procedure init;
     var
          i:longint;
     begin
          for i:=1 to n do a[i]:=-1;
     end;
function TimGoc(i:longint):longint;
     begin
          if a[i]=-1 then exit(i)
          else
               begin
                    a[i]:=TimGoc(a[i]);
                    exit(a[i]);
               end;
     end;
procedure union(u,v,i:longint);
     var
          x,y:longint;
     begin
          x:=TimGoc(u);
          y:=TimGoc(v);
          if x=y then exit;
          free[i]:=true;
          a[x]:=y;
     end;
procedure CayKhung;
     var
          i:longint;
     begin
          init;
          for i:=1 to m do
               union(u[i],v[i],i);
     end;
procedure taodothi;
     var
          i:longint;
     begin
          log:=trunc(log2(n));
          for i:=1 to n+1 do h[i]:=0;
          for i:=1 to m do
               begin
                    if free[i]=true then
                         begin
                              inc(h[u[i]]);
                              inc(h[v[i]]);
                         end;
               end;
          for i:=2 to n+1 do h[i]:=h[i-1]+h[i];
          for i:=1 to m do
               begin
                    if free[i]=true then
                         begin
                              a[h[u[i]]]:=v[i];
                              p[h[u[i]]]:=c[i];
                              dec(h[u[i]]);
                              a[h[v[i]]]:=u[i];
                              p[h[v[i]]]:=c[i];
                              dec(h[v[i]]);
                         end;
               end;
     end;
procedure dfs(u:longint);
     var
          i,v:longint;
     begin
          i:=0;
          while b[u,i]<>0 do
               begin
                    if b[b[u,i],i]=0 then break;
                    b[u,i+1]:=b[b[u,i],i];
                    kc[u,i+1]:=min(kc[u,i],kc[b[u,i],i]);
                    inC(i);
               end;
          for i:=h[u]+1 to h[u+1] do
               begin
                    v:=a[i];
                    if b[u,0]=v then continue;
                    b[v,0]:=u;
                    kc[v,0]:=p[i];
                    d[v]:=d[u]+1;
                    dfs(v);
               end;
     end;
function mu(x,k:longint):longint;
     begin
          if k=0 then exit(1)
          else exit(x shl (k-1));
     end;
function LCA(u,v:longint):longint;
     var
          j,k:longint;
     begin
          if d[u]<d[v] then swap(u,v);
          k:=d[u]-d[v];
          for j:=log downto 0 do
               begin
                    if k>=mu(2,j) then
                         begin
                              u:=b[u,j];
                              k:=k-mu(2,j);
                         end;
               end;
          if u=v then exit(u);
          for j:=log downto 0 do
               begin
                    if b[u,j]<>b[v,j] then
                         begin
                              u:=b[u,j];
                              v:=b[v,j];
                         end
                    else lca:=b[u,j];
               end;
     end;
function Tinh(u,goc:longint):longint;
     var
          i,kq,k:longint;
     begin
          kq:=maxlongint;
          k:=d[u]-d[goc];
          for i:=log downto 0 do
               begin
                    if k>=mu(2,i) then
                         begin
                              kq:=min(kq,kc[u,i]);
                              u:=b[u,i];
                              k:=k-mu(2,i);
                         end;
               end;
          exit(kq);
     end;
procedure solve;
     var
          i,goc,s1,s2,u,v:longint;
     begin
          for i:=1 to s do
               begin
                    readln(u,v);
                    goc:=LCA(u,v);
                    s1:=Tinh(u,goc);
                    s2:=Tinh(v,goc);
                    writeln(min(s1,s2));
               end;
     end;
procedure xuat;
     var
          i:longint;
     begin
          while not(eof(input)) do
               begin
                    nhapdulieu;
                    qsort(1,m);
                    CayKhung;
                    TaoDoThi;
                    dfs(1);
                    solve;
               end;
          close(input); close(output);
     end;
begin
     nhap;
     xuat;
end.
