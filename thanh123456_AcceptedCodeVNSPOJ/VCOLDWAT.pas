const
     fin='';fon='';
     maxn=trunc(5e5);
type
     mang=array [0..maxn] of longint;
var
     n,c:longint;
     u,v,h,a,d:mang;
procedure nhap;
     begin
          assign(input,fin);reset(input);
          assigN(output,fon);rewrite(output);
          readln(n,c);
     end;
procedure taomang;
     var
          i,m,x,y,z:longint;
     begin
          m:=0;
          for i:=1 to c do
               begin
                    read(x,y,z);
                    inc(m);
                    u[m]:=x;
                    v[m]:=y;
                    inc(m);
                    u[m]:=x;
                    v[m]:=z;
               end;
          for i:=1 to m do
               begin
                    inC(h[u[i]]);
                    inc(h[v[i]]);
               end;
          for i:=2 to n+1 do h[i]:=h[i-1]+h[i];
          for i:=m downto 1 do
               begin
                    a[h[u[i]]]:=v[i];
                    dec(h[u[i]]);
                    a[h[v[i]]]:=u[i];
                    dec(h[v[i]]);
               end;
          d[1]:=1;
     end;
procedure Dfs(u:longint);
     var
          i,v:longint;
     begin
          for i:=h[u]+1 to h[u+1] do
               begin
                    v:=a[i];
                    if d[v]<>0 then continue;
                    d[v]:=d[u]+1;
                    dfs(v);
               end;
     end;
procedure xuat;
     var
          i:longint;
     begin
          for i:=1 to n do writeln(d[i]);
     close(input); close(output);
     end;
begin
     nhap;
     taomang;
     DFS(1);
     xuat;
end.
