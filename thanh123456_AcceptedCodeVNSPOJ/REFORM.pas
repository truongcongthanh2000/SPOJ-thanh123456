uses math;
const
     fin='';fon='';
     maxn=trunc(1e6);
type
     mang1=array [0..maxn] of longint;
     mang2=array [0..maxn] of int64;
     mang3=array [0..maxn] of boolean;
var
     n,m,count,len:longint;
     u,v,h,a,cc,number,low,parent:mang1;
     sl,con:mang2;
     free:mang3;
procedure nhap;
     begin
          assign(input,fin);reset(input);
          assigN(output,foN);rewritE(output);
          readln(n,m);
     end;
procedure taomang;
     var
          i:longint;
     begin
          for i:=1 to m do
               begin
                    readln(u[i],v[i]);
                    inc(h[u[i]]);
                    inc(h[v[i]]);
               end;
          for i:=2 to n+1 do h[i]:=h[i-1]+h[i];
          for i:=1 to m do
               begin
                    a[h[u[i]]]:=v[i];
                    cc[h[u[i]]]:=i;
                    dec(h[u[i]]);
                    a[h[v[i]]]:=u[i];
                    cc[h[v[i]]]:=i;
                    dec(h[v[i]]);
               end;
     end;
procedure dfs_1(u:longint);
     var
          i,v:longint;
     begin
          free[u]:=true;
          inc(sl[len]);
          for i:=h[u]+1 to h[u+1] do
               begin
                    v:=a[i];
                    if free[v]=false then dfs_1(v);
               end;
     end;
procedure init_1;
     var
          i:longint;
     begin
          len:=0;
          for i:=1 to n do
               begin
                    if free[i]=false then
                         begin
                              inc(len);
                              dfs_1(i);
                         end;
               end;
          fillchar(free,sizeof(free),false);
     end;
procedure dfs(u:longint);
     var
          i,v:longint;
     begin
          inc(count);
          number[u]:=count;
          low[u]:=n+1;
          con[u]:=1;
          for i:=h[u]+1 to h[u+1] do
               begin
                    v:=a[i];
                    if free[cc[i]]=false then
                         begin
                              free[cc[i]]:=true;
                              if parent[v]=0 then
                                   begin
                                        parent[v]:=u;
                                        dfs(v);
                                        con[u]:=con[u]+con[v];
                                        low[u]:=min(low[u],low[v]);
                                   end
                              else low[u]:=min(low[u],number[v]);
                         end;
               end;
     end;
procedure tarjan;
     var
          i:longint;
     begin
          count:=0;
          for i:=1 to n do
               begin
                    if parent[i]=0 then
                         begin
                              parent[i]:=-1;
                              dfs(i);
                         end;
               end;
     end;
function Check(u,v:longint):boolean;
     var
          x,y:longint;
     begin
          x:=parent[u];
          if (x=v) and (low[u] > number[v]) then exit(true);
          y:=parent[v];
          if (y=u) and (low[v] > number[u]) then exit(true);
          exit(false);
     end;
procedure th2;
     var
          i:longint;
          res:int64;
     begin
          res:=0;
          for i:=1 to m do
               begin
                    if Check(u[i],v[i])=false then
                         res:=res+sl[1]*sl[2];
               end;
          writeln(res);
     end;
procedure th1;
     var
          i:longint;
          res,tam:int64;
     begin
          res:=0;
          tam:=(int64(n)*int64(n-1)) div 2;
          for i:=1 to m do
               begin
                    if Check(u[i],v[i])=false then
                         res:=res+(tam-m)
                    else
                         begin
                              if parent[v[i]]=u[i] then
                                   res:=res+(n-con[v[i]])*(con[v[i]])-1
                              else res:=res+(n-con[u[i]])*(con[u[i]])-1;
                         end;
               end;
          writeln(reS);
     end;
procedure solve;
     var
          i:longint;
     begin
          if len>2 then
               begin
                    writeln(0);
                    exit;
               end;
          if len=1 then th1
          else th2;
          close(input); close(output);
     end;
begin
     nhap;
     taomang;
     init_1;
     tarjan;
     solve;
end.
