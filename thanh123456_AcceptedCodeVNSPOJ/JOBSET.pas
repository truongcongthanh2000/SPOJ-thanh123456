uses math;
const
     fin='';fon='';
     maxn=505;
type
     mang1=array [-1..maxn,-1..maxn] of longint;
     mang2=array [0..maxn] of longint;
     mang3=array [0..maxn] of boolean;
var
     n,s,t,p:longint;
     a,flow:mang1;
     nhan,queue,de,trongso:mang2;
     free:mang3;
procedure nhap;
     var
          i:longint;
     begin
          assign(input,fin);reset(input);
          assign(output,fon);rewrite(output);
          readln(n);
          s:=0;
          t:=n+1;
          p:=n+1;
     end;
procedure taomang;
     var
          i,u,v,x,m,res:longint;
     begin
          for i:=1 to n do
               begin
                    read(x);
                    trongso[i]:=x;
                    if x>0 then
                         begin
                              a[s,i]:=x;
                              res:=res+x;
                         end
                    else
                         a[i,t]:=-x;
               end;
          readln(m);
          for i:=1 to m do
               begin
                    readln(u,v);
                    a[u,v]:=res+1;
               end;
     end;
Function BFS:boolean;
     var
          i,ra,vao,u,v:longint;
     begin
          for i:=0 to p do nhan[i]:=-1;
          queue[1]:=s;
          nhan[s]:=s;
          ra:=1;
          vao:=1;
          De[s]:=maxlongint;
          repeat
               u:=queue[ra];
               inc(ra);
               for v:=0 to p do
                    begin
                         if nhan[v]=-1 then
                              begin
                                   if flow[u,v]<a[u,v] then
                                        begin
                                             free[v]:=true;
                                             de[v]:=min(de[u],a[u,v]-flow[u,v]);
                                        end
                                   else
                                   if flow[v,u]>0 then
                                        begin
                                             free[v]:=false;
                                             de[v]:=min(de[u],flow[v,u]);
                                        end
                                   else continue;
                                   nhan[v]:=u;
                                   if v=t then exit(true);
                                   inc(vao);
                                   queue[vao]:=v;
                              end;
                    end;
          until ra>vao;
          exit(false);
     end;
procedure TangLuong;
     var
          u,v,dem:longint;
     begin
          v:=t;
          Dem:=de[t];
          repeat
               u:=nhan[v];
               if free[v]=true then flow[u,v]:=flow[u,v]+dem
               else flow[v,u]:=flow[v,u]-dem;
               v:=u;
          until v=s;
     end;
procedure init;
     begin
          while bfs=true do TangLuong;
     end;
procedure solve;
     var
          i,res:longint;
     begin
          res:=0;
          for i:=1 to n do
               begin
                    if nhan[i]<>-1 then
                         res:=res+trongso[i];
               end;
          writeln(res);
     close(input); close(output);
     end;
begin
     nhap;
     taomang;
     init;
     solve;
end.
