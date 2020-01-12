const
    fin='';fon='';
    maxn=trunc(1e6);
type
    mang=array [0..maxn] of longint;
var
    a,u,v,c,h,p,con,parent:mang;
    n:longint;
procedure nhap;
    begin
        assign(input,fin);reset(input);
        assigN(output,fon);rewritE(output);
        readln(n);
    end;
function min(a,b:longint):longint;
    begin
        if a<b then exit(a)
        else exit(b);
    end;
procedure taomang;
    var
        i:longint;
    begin
        for i:=1 to n-1 do
            begin
                readln(u[i],v[i],c[i]);
                inc(h[u[i]]);
                inc(h[v[i]]);
            end;
        for i:=1 to n do h[i]:=h[i-1]+h[i];
        for i:=n-1 downto 1 do
            begin
                a[h[u[i]]]:=v[i];
                p[h[u[i]]]:=c[i];
                dec(h[u[i]]);
                a[h[v[i]]]:=u[i];
                p[h[v[i]]]:=c[i];
                dec(h[v[i]]);
            end;
    end;
procedure dfs(u:longint);
    var
        i,v:longint;
    begin
        con[u]:=1;
        for i:=h[u]+1 to h[u+1] do
            begin
                v:=a[i];
                if parent[u]=v then continue;
                if parent[v]=0 then
                    begin
                        parent[v]:=u;
                        dfs(v);
                        con[u]:=con[u]+con[v];
                    end;
            end;
    end;
procedure solve;
    var
        i,x,y:longint;
        res,s,dai,capdinh:int64;
    begin
        res:=0;
        for i:=1 to n-1 do
            begin
                x:=u[i];
                y:=v[i];
                dai:=c[i];
                if parent[y]=x then
                    capdinh:=con[y]*(n-con[y])
                else
                    capdinh:=con[x]*(n-con[x]);
                res:=res+dai*capdinh;
            end;
        writeln(res);
    close(input); closE(output);
    end;
begin
    nhap;
    taomang;
    dfs(0);
    solve;
end.
