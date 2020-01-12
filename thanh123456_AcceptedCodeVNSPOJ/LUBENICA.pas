uses math;
const
        fin='';fon='';
var
        n,log:longint;
        free:Array [0..10000000] of boolean;
        u,v,c,h,p,trace,a,d:array [0..10000000] of longint;
        rmq_max,rmq_min,b:array [0..trunc(1e6),0..31] of longint;
procedure nhap;
        begin
        assigN(input,fin);reset(input);
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
        begin
        free[u]:=true;
        for i:=h[u]+1 to h[u+1] do
                begin
                v:=a[i];
                if free[v]=false then
                        begin
                        rmq_max[v,0]:=p[i];
                        rmq_min[v,0]:=p[i];
                        d[v]:=d[u]+1;
                        trace[v]:=u;
                        dfs(v);
                        end;
                end;
        end;
function mu(x,k:longint):longint;
        begin
        if k=0 then exit(1)
        else exit(x shl (k-1));
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
                        begin
                        b[i,j]:=b[b[i,j-1],j-1];
                        rmq_min[i,j]:=min(rmq_min[i,j-1],rmq_min[b[i,j-1],j-1]);
                        rmq_max[i,j]:=max(rmq_max[i,j-1],rmq_max[b[i,j-1],j-1]);
                        end;
                end;
        {for i:=1 to n do
                begin
                for j:=0 to log do
                        write(rmq_max[i,j],' ');
                writeln;
                end;}

        end;
function lca(u,v:longint):longint;
        var
                j,k:longint;
        begin
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
                        if u=v then exit(u);
                        end;
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
function tinh1(u,v:longint):longint;
        var
                k,res,j:longint;
        begin
        res:=maxlongint;
        k:=d[v]-d[u];
        for j:=log downto 0 do
                begin
                if k-mu(2,j)>=0 then
                        begin
                        k:=k-mu(2,j);
                        res:=min(res,rmq_min[v,j]);
                        v:=b[v,j];
                        end;
                end;
        exit(res);
        end;
function tinh2(u,v:longint):longint;
        var
                k,res,j:longint;
        begin
        res:=0;
        k:=d[v]-d[u];
        for j:=log downto 0 do
                begin
                if k-mu(2,j)>=0 then
                        begin
                        k:=k-mu(2,j);
                        res:=max(res,rmq_max[v,j]);
                        v:=b[v,j];
                        end;
                end;
        exit(res);
        end;
procedure xuli(u,v:longint);
        var
                x:longint;
        begin
        x:=lca(u,v);
        writeln(min(tinh1(x,u),tinh1(x,v)),' ',max(tinh2(x,u),tinh2(x,v)));
        end;
procedure xuat;
        var
                i,u,v,q:longint;
        begin
        readln(q);
        for i:=1 to q do
                begin
                readln(u,v);
                xuli(u,v);
                end;
        close(input); close(output);
        end;
begin
nhap;
taomang;
init_1;
init_2;
xuat;
end.

