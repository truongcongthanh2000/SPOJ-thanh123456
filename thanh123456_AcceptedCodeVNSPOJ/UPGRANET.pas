uses math;
const
   fin='';fon='';
   maxn=trunc(1e6);
type mang=array [0..maxn] of longint;
var
   n,m,top,log:longint;
   u,v,c,h,a,heap,pos,d,p,trace,x,y,ts:mang;
   free:array [0..maxn] of boolean;
   b,kc:array [0..maxn,0..20] of longint;
procedure nhap;
   begin
      assign(input,fin);reset(input);
      assign(output,fon);rewrite(output);
      readln(n,m);
   end;
procedure taomang;
   var
      i:longint;
   begin
      for i:=1 to m do
         begin
            readln(u[i],v[i],c[i]);
            inc(h[u[i]]); inc(h[v[i]]);
         end;
      for i:=2 to n+1 do h[i]:=h[i-1]+h[i];
      for i:=m downto 1 do
         begin
            a[h[u[i]]]:=v[i];
            p[h[u[i]]]:=c[i];
            dec(h[u[i]]);
            a[h[v[i]]]:=u[i];
            p[h[v[i]]]:=c[i];
            dec(h[v[i]]);
         end;
   end;
procedure swap(i,j:longint);
   var
      tam:longint;
   begin
      tam:=heap[i];
      heap[i]:=heap[j]; pos[heap[i]]:=i;
      heap[j]:=tam; pos[heap[j]]:=j;
   end;
procedure UpHeap(i:longint);
   begin
      if (i=1) or (d[heap[i]]<d[heap[i div 2]]) then exit;
      swap(i,i div 2);
      UpHeap(i div 2);
   end;
procedure DownHeap(i:longinT);
   var
      j:longint;
   begin
      j:=2*i;
      if j>top then exit;
      if (j<top) and (d[heap[j]]<d[heap[j+1]]) then inc(j);
      if d[heap[i]]<d[heap[j]] then
         begin
            swap(i,j);
            DownHeap(j);
         end;
   end;
procedure push(x:longinT);
   begin
      inc(top);
      heap[top]:=x;
      pos[x]:=top;
      UpHeap(top);
   end;
procedure UpDate(v:longint);
   var
      x:longint;
   begin
      x:=pos[v];
      if x=0 then push(v)
      else UpHeap(x);
   end;
procedure tinh(u,v,w:longint);
   begin
      if d[v] < w then
         begin
            d[v]:=w;
            trace[v]:=u;
            UpDate(v);
         end;
   end;
function pop:longint;
   begin
      pop:=heap[1];
      free[pop]:=true;
      heap[1]:=heap[top];
      heap[top]:=0;
      dec(top);
      DownHeap(1);
   end;
procedure CayKhung;
   var
      i,u,v,w:longint;
   begin
      push(1);
      repeat
         u:=pop;
         for i:=h[u]+1 to h[u+1] do
            begin
               v:=a[i];
               w
            :=p[i];
               if free[v]=false then tinh(u,v,w);
            end;
      until top=0;
   end;
procedure taodothi;
   var
      i:longint;
   begin
      //m:=0;
      top:=0;
      for i:=1 to m do
         begin
            if (trace[v[i]]=u[i]) or (trace[u[i]]=v[i]) then  continue;
            inc(top);
            x[top]:=u[i];
            y[top]:=v[i];
            ts[top]:=c[i];
         end;
      m:=0;
      fillchar(a,sizeof(a),0);
      fillchar(h,sizeof(h),0);
      fillchar(u,sizeof(u),0);
      fillchar(v,sizeof(v),0);
      fillchar(c,sizeof(c),0);
      fillchar(p,sizeof(p),0);
      fillchar(free,sizeof(free),false);
      log:=trunc(log2(n));
      for i:=1 to n do
         begin
            if trace[i]<>0 then
               begin
                  inc(m);
                  u[m]:=trace[i];
                  v[m]:=i;
                  c[m]:=d[i];
                  inc(h[u[m]]);
               end;
         end;
      for i:=2 to n+1 do h[i]:=h[i-1]+h[i];
      for i:=m downto 1 do
         begin
            a[h[u[i]]]:=v[i];
            p[h[u[i]]]:=c[i];
            dec(h[u[i]]);
         end;
      fillchar(d,sizeof(d),0);
   end;
procedure dfs(u:longint);
   var
      i,v:longint;
   begin
      free[u]:=true;
      for i:=h[u]+1 to h[u+1] do
         begin
            v:=a[i];
            if free[v]=false then
               begin
                  d[v]:=d[u]+1;
                  trace[v]:=u;
                  b[v,0]:=u;
                  kc[v,0]:=p[i];
                  dfs(v);
               end;
         end;
   end;
procedure init;
   var
      i,j:longint;
   begin
      for j:=1 to log do
         for i:=1 to n do
            begin
               b[i,j]:=b[b[i,j-1],j-1];
               kc[i,j]:=min(kc[i,j-1],kc[b[i,j-1],j-1]);
            end;
   end;
function mu(x,k:longint):longint;
   begin
      if k=0  then exit(1)
      else exit(x shl (k-1));
   end;
function lca(u,v:longint):longint;
   var
      j,k:longint;
   begin
      if d[u]>=d[v] then
         begin
            if d[u]>d[v] then
               begin
                  k:=d[u]-d[v];
                  for j:=log downto 0 do
                     begin
                        if k-mu(2,j)>=0 then
                           begin
                              k:=k-mu(2,j);
                              u:=b[u,j];
                           end;
                     end;
               end;
            if u=v then exit(u);
            for j:= log downto 0 do
               begin
                  if b[u,j]<>b[v,j] then
                     begin
                        u:=b[u,j];
                        v:=b[v,j];
                     end
                  else lca:=b[u,j];
               end;
         end
      else exit(lca(v,u));
   end;
function tinh(u,goc:longint):longint;
   var
      j,kq,k:longint;
   begin
      k:=d[u]-d[goc];
      kq:=maxlongint;
      for j:=log downto 0 do
         begin
         if k-mu(2,j)>=0 then
            begin
               k:=k-mu(2,j);
               kq:=min(kq,kc[u,j]);
               u:=b[u,j];
            end;
         end;
      exit(kq);
   end;
procedure xuli;
   var
      i,kq,goc,s1,s2:longint;
      dem:int64;
   begin
      dem:=0;
      for i:=1 to top do
         begin
            goc:=lca(x[i],y[i]);
            s1:=tinh(x[i],goc);
            s2:=tinh(y[i],goc);
            kq:=min(s1,s2);
            if kq>ts[i] then dem:=dem+kq-ts[i];
         end;
   writeln(dem);
   close(input); close(output);
   end;
begin
nhap;
taomang;
CayKhung;
taodothi;
dfs(1);
init;
xuli;
end.
