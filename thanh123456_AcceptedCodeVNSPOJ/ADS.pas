const
    fin='';fon='';
    maxn=trunc(1e6);
type mang=array [0..maxn] of longint;
var
    u,v,h,a:mang;
    free:array [0..maxn] of boolean;
    n,m,res:longint;
procedure nhap;
    begin
        assigN(input,fin);reset(input);
        assigN(output,fon);rewrite(output);
        readln(n,m);
    end;
procedure taomang;
    var
        i:longint;
    begin
        for i:=1 to m do
            begin
                readln(u[i],v[i]);
                inc(h[u[i]]); inc(h[v[i]]);
            end;
        for i:=2 to n+1 do h[i]:=h[i-1]+h[i];
        for i:=m downto 1 do
            begin
                a[h[u[i]]]:=v[i];
                dec(h[u[i]]);
                a[h[v[i]]]:=u[i];
                dec(h[v[i]]);
            end;
    end;
procedure dfs(u:longint);
    var
        i,v:longint;
    begin
        free[u]:=true;
        for i:=h[u]+1 to h[u+1] do
            begin
                v:=a[i];
                if free[v]=false then dfs(v);
            end;
    end;
procedure solve;
    var
        i:longint;
    begin
        res:=0;
        for i:=1 to n do
            begin
                if free[i]=false then
                    begin
                        dfs(i);
                        inc(res);
                    end;
            end;
    end;
procedure xuat;
    begin
        writeln(res+m-n);
    close(input); close(output);
    end;
begin
    nhap;
    taomang;
    solve;
    xuat;
end.
