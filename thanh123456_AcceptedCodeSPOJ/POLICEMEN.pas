uses math;
const
    fin='';fon='';
    maxn=trunc(1e5);
type
    mang1=array [0..maxn] of longint;
    mang2=array [0..maxn,0..20] of longint;
var
    n,log:longint;
    u,v,h,a,d:mang1;
    b:mang2;
procedure nhap;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n);
        log:=trunc(log2(n));
    end;
procedure taomang;
    var
        i:longint;
    begin
        for i:=1 to n-1 do
            begin
                readln(u[i],v[i]);
                inc(h[u[i]]);
                inc(h[v[i]]);
            end;
        for i:=2 to n+1 do h[i]:=h[i-1]+h[i];
        for i:=n-1 downto 1 do
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
function Mu(x,k:longint):longint;
    begin
        if k=0 then exit(1);
        exit(x shl (k-1));
    end;
function lca(u,v:longint):longint;
    var
        j,k:longint;
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
procedure Tinh(u,v:longinT);
    var
        x,Kc_Trom,Kc_Minh:longint;
    begin
        x:=lca(u,v);
        Kc_Trom:=d[u]-d[x];
        Kc_Minh:=d[v]-d[x];
        if Kc_Minh<=Kc_Trom then
            writeln('YES ',x)
        else writeln('NO');
    end;
procedure solve;
    var
        i,q,u,v:longint;
    begin
        readln(q);
        for i:=1 to q do
            begin
                readln(u,v);
                Tinh(u,v);
            end;
        close(inpuT); closE(output);
    end;
begin
    nhap;
    taomang;
    dfs(1);
    solve;
end.


