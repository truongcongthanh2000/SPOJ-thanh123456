const
    fin='';fon='';
    maxn=trunc(1e6);
type
    mang1=array [0..maxn] of longint;
    mang2=array [0..maxn] of boolean;
var
    u,v,h,a,cc,low,number,c:mang1;
    free,kt:mang2;
    n,m,cau,khop,dem:longint;
procedure nhap;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n,m);
    end;
function min(a,b:longint):longint;
    begin
        if a<b then exit(a)
        else exit(b);
    end;
procedure taomang;
    var
        i,canh:longint;
    begin
        dem:=0;
        for i:=1 to m do
            begin
                readln(u[i],v[i]);
                inc(h[u[i]]);
                inc(h[v[i]]);
            end;
        for i:=2 to n+1 do h[i]:=h[i-1]+h[i];
        canh:=0;
        for i:=m downto 1 do
            begin
                inc(canh);
                a[h[u[i]]]:=v[i];
                cc[h[u[i]]]:=canh;
                dec(h[u[i]]);
                a[h[v[i]]]:=u[i];
                cc[h[v[i]]]:=canh;
                dec(h[v[i]]);
            end;

    end;
procedure dfs(u:longint);
    var
        i,v:longint;
    begin
        inc(dem); c[u]:=0;
        kt[u]:=false;
        number[u]:=dem;
        low[u]:=n+1;
        for i:=h[u]+1 to h[u+1] do
            begin
                v:=a[i];
                if free[cc[i]]=false then
                    begin
                        free[cc[i]]:=true;
                        if number[v]=0 then
                            begin
                                inc(c[u]);
                                dfs(v);
                                if low[v] >= number[u] then kt[u]:=true;
                                if low[v] > number[u] then inc(cau);
                                low[u]:=min(low[u],low[v]);
                            end
                        else
                            low[u]:=min(low[u],number[v]);
                    end;
            end;
    end;
procedure solve;
    var
        i:longint;
    begin
        for i:=1 to n do
            begin
                if number[i]=0 then
                    begin
                        dfs(i);
                        if c[i]<2 then kt[i]:=false;
                    end;
            end;
        for i:=1 to n do
            if kt[i]=true then inc(khop);
        writeln(khop,' ',cau);
    close(input); closE(output);
    end;
begin
    nhap;
    taomang;
    solve;
end.
