uses math;
const
        fin='';fon='';
var
        n,q,log,res:longint;
        trace,d,it,h,a,u,v:array [1..10000000] of longint;
        free:array [0..1000000] of boolean;
        b:array [0..trunc(1e6),0..31] of longint;
procedure nhap;
        var
                i:longint;
        begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n,q);
        log:=trunc(log2(n));
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
function dfs(u:longint):longint;
        var
                i,v:longint;
        begin
        free[u]:=true;
        for i:=h[u]+1 to h[u+1] do
                begin
                v:=a[i];
                if free[v]=false then
                        begin
                        trace[v]:=u;
                        d[v]:=d[u]+1;
                        dfs(v);
                        end;
                end;
        end;
procedure init_1;
        begin
        dfs(1);
        end;
procedure init_2;
        var
                i,j:longint;
        begin
        for i:=1 to n do b[i,0]:=trace[i];
        for j:=1 to log do
                begin
                for i:=1 to n do
                        b[i,j]:=b[b[i,j-1],j-1];
                end;
        end;
function mu(x,k:longint):longint;
        begin
        if k=0 then exit(1);
        exit(x shl (k-1));
        end;
function lca(u,v:longint):longint;
        var
                j,k:longint;
        begin
        if (u=-1) then exit(v);
        if (v=-1) then exit(u);
        if d[u]>=d[v] then
                begin
                if d[u]>d[v] then
                        begin
                        k:=d[u]-d[v];
                        for j:=log downto 0 do
                                begin
                                if k-mu(2,j)>=0 then
                                        begin
                                        k:=k-mu(2,j);
                                        u:=b[u,j];
                                        end;
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
                end
        else exit(lca(v,u));
        end;
procedure taocay(i,l,r:longint);
        var
                mid:longint;
        begin
        if l=r then
                begin
                it[i]:=l;
                exit;
                end;
        mid:=(l+r) div 2;
        taocay(i*2,l,mid);
        taocay(i*2+1,mid+1,r);
        it[i]:=lca(it[i*2],it[i*2+1]);
        end;
{function find(i,l,r,u,v:longint):longint;
        var
                left,right,mid:longint;
        begin
        if (r<u) or (l>v) then exit(0)
                else
                if (l>=u) and (r<=v) then exit(it[i])
                        else
                                begin
                                mid:=(l+r) div 2;
                                left:=find(i*2,l,mid,u,v);
                                right:=find(i*2+1,mid+1,r,u,v);
                                exit(lca(left,right));
                                end;
        end;}
procedure find(i,l,r,u,v:longint);
        var
                mid:longint;
        begin
        if (r<u) or (l>v) then exit;
        if (l>=u) and (r<=v) then
                begin
                res:=lca(res,it[i]);
                exit;
                end;
        mid:=(l+r) div 2;
        find(i*2,l,mid,u,v);
        find(i*2+1,mid+1,r,u,v);
        end;
procedure xuat;
        var
                i,u,v:longint;
        begin
        for i:=1 to q do
                begin
                readln(u,v);
                res:=-1;
                find(1,1,n,u,v);
                writeln(res);
                end;
        close(input); close(output);
        end;
begin
nhap;
init_1;
init_2;
taocay(1,1,n);
xuat;
end.

