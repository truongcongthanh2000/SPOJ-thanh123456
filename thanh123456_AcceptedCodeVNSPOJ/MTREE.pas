const
    fin='';fon='';
    maxn=trunc(1e6);
    module=trunc(1e9)+7;
type
    mang=array [0..maxn] of int64;
var
    a,u,v,c,h,p,con,parent:mang;
    n:longint;
    res:int64;
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
        for i:=2 to n+1 do h[i]:=h[i-1]+h[i];
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
        this,s:int64;
    begin
        this:=0;
        for i:=h[u]+1 to h[u+1] do
            begin
                v:=a[i];
                if parent[u]=v then continue;
                if parent[v]=0 then
                    begin
                        parent[v]:=u;
                        dfs(v);
                        con[u]:=con[v];
                        s:=(con[u]*p[i]+p[i]) mod module;
                        res:=res+(s*this) mod module;
                        this:=(this+s) mod module;
                    end;
            end;
        res:=(res+this) mod module;
        con[u]:=this;
    end;
procedure solve;
    var
        i,x,y:longint;
        s,dai,capdinh:int64;
    begin
        res:=0;
        dfs(1);
        writeln(res);
    close(input); closE(output);
    end;
begin
    nhap;
    taomang;
    solve;
end.

