const
    fin='';fon='';
var
    n,count,dem:longint;
    number,low,u,v,h,a,parent,free:array [0..trunc(1e6)] of longint;
    free1:array [0..trunc(1e6)] of boolean;
procedure nhap;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n);
    end;
procedure taomang;
    var
        i,m:longint;
    begin
        for i:=1 to n-1 do
            begin
                readln(u[i],v[i]);
                inc(h[u[i]]); inc(h[v[i]]);
            end;
        readln(m);
        for i:=n to n+m-1 do
            begin
                readln(u[i],v[i]);
                inc(h[u[i]]); inc(h[v[i]]);
            end;
        for i:=2 to n+1 do h[i]:=h[i-1]+h[i];
        for i:=1 to n+m-1 do
            begin
                a[h[u[i]]]:=v[i];
                inc(dem);
                free[h[u[i]]]:=dem;
                dec(h[u[i]]);
                a[h[v[i]]]:=u[i];
                free[h[v[i]]]:=dem;
                dec(h[v[i]]);
            end;
    end;
procedure dfs(u:longint);
    var
        i,v:longint;
    begin
        inc(count);
        number[u]:=count;
        low[u]:=n+1;
        for i:=h[u]+1 to h[u+1] do
            begin
                v:=a[i];
                if free1[free[i]]=false then
                    begin
                        free1[free[i]]:=true;
                        if parent[v]=0 then
                            begin
                                parent[v]:=u;
                                dfs(v);
                                if low[u] > low[v] then low[u]:=low[v];
                            end
                    else
                        if low[u] > number[v] then low[u]:=number[v];
                    end;
            end;
    end;
procedure solve;
    var
        u:longint;
    begin
        count:=0;
        for u:=1 to n do
            begin
                if parent[u]=0 then
                    begin
                        parent[u]:=-1;
                        dfs(u);
                    end;
            end;
    end;
procedure xuat;
    var
        u,v,i,res:longint;
    begin
        res:=0;
        for v:=1 to n do
            begin
                u:=parent[v];
                if (u<>-1) and (low[v]>=number[v]) then inc(res);
            end;
        writeln(res);
    close(input); close(output);
    end;
begin
    nhap;
    taomang;
    solve;
    xuat;
end.
