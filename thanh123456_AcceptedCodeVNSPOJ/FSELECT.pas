uses math;
const
    fin='';fon='';
    maxn=trunc(2e5);
type
    mang1=array [0..maxn*5] of longint;
    mang2=array [0..maxn,0..20] of longint;
var
    n,k,m,log,goc:longint;
    x,y,u,v,h,a,hh,aa,d:mang1;
    b:mang2;
procedure nhap;
    var
        i,a,b:longint;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n,k);
        log:=trunc(log2(n));
        m:=0;
        for i:=1 to n do
            begin
                readln(a,b);
                x[i]:=a;
                y[i]:=i;
                if b=0 then
                    begin
                        goc:=i;
                        continue;
                    end;
                inc(m);
                u[m]:=i;
                v[m]:=b;
            end;
    end;
procedure taomang;
    var
        i:longint;
    begin
        for i:=1 to m do
            begin
                inc(h[u[i]]);
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
        for i:=1 to n do
            inc(hh[x[i]]);
        for i:=2 to k+1 do hh[i]:=hh[i-1]+hh[i];
        for i:=1 to n do
            begin
                aa[hh[x[i]]]:=y[i];
                dec(hh[x[i]]);
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
                inc(i);
            end;
        for i:=h[u]+1 to h[u+1] do
            begin
                v:=a[i];
                if b[u,0]=v then continue;
                b[v,0]:=u;
                d[v]:=d[u]+1;
                dfs(v);
            end;
    end;
function mu(x,k:longint):longint;
    begin
        if k=0 then exit(1)
        else exit(x shl (k-1));
    end;
function lca(u,v:longint):longint;
    var
        k,j:longint;
    begin
        if d[u]<d[v] then
            begin
                k:=u; u:=v; v:=k;
            end;
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
procedure solve;
    var
        i,thutu,dinh,x,root,res,kc:longint;
    begin
        for thutu:=1 to k do
            begin
                dinh:=0;
                for i:=hh[thutu]+1 to hh[thutu+1] do
                    begin
                        x:=aa[i];
                        if d[x]>d[dinh] then dinh:=x;
                    end;
                res:=0;
                for i:=hh[thutu]+1 to hh[thutu+1] do
                    begin
                        x:=aa[i];
                        root:=lca(dinh,x);
                        kc:=d[x]+d[dinh]-2*d[root];
                        res:=max(res,kc);
                    end;
                writeln(res);
            end;
        close(input); close(output);
    end;
begin
    nhap;
    taomang;
    dfs(goc);
    solve;
end.
