uses math;
const
        fin='';fon='';
var
        test,n,log:longint;
        u,v,h,a,d,trace:array [1..1000000] of longint;
        c:array [0..100000,0..31] of longint;
        free:array [0..1000000] of boolean;
procedure nhap;
        begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(test);
        end;
procedure taomang;
        var
                i,k,m,x,j:longint;
        begin
        readln(n);
        log:=trunc(log2(N));
        m:=0;
        for i:=1 to n do
                begin
                read(k);
                for j:=1 to k do
                        begin
                        read(x);
                        trace[x]:=i;
                        end;
                end;
        end;
procedure init_1;
        var
                i:longint;
        begin
        for i:=1 to n do
                begin
                free[i]:=false;
                d[i]:=0;
                end;
        end;
function dfs(u:longint):longint;
        var
                i,v:longint;
        begin
        free[u]:=true;
        if u=0 then exit(0);
        if free[trace[u]]=true then
                begin
                d[u]:=d[trace[u]]+1;
                exit(d[u]);
                end
        else
        d[u]:=dfs(trace[u])+1;
        exit(d[u]);
        end;
procedure init_2;
        var
                i,j:longint;
        begin
        c[0,0]:=0;
        free[0]:=true;
        for i:=1 to n do
                begin
                if free[i]=false then d[i]:=dfs(i);
                end;
        for i:=1 to n do c[i,0]:=trace[i];
        for j:=1 to log do
                begin
                for i:=1 to n do
                        c[i,j]:=c[c[i,j-1],j-1];
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
                                        u:=c[u,j];
                                        end;
                                end;
                        end;
                if u=v then exit(u);
                for j:=log downto 0 do
                        begin
                        if c[u,j]<>c[v,j] then
                                begin
                                u:=c[u,j];
                                v:=c[v,j];
                                end
                        else lca:=c[u,j];
                        end;
                end
        else exit(lca(v,u));
        end;
procedure truyvan(k:longint);
        var
                q,i,u,v:longint;
        begin
        readln(q);
        writeln('Case ',k,':');
        for i:=1 to q do
                begin
                readln(u,v);
                writeln(lca(u,v));
                end;
        end;
procedure xuat;
        var
                i:longint;
        begin
        for i:=1 to test do
                begin
                taomang;
                init_1;
                init_2;
                truyvan(i);
                end;
        close(input); close(output);
        end;
begin
nhap;
xuat;
end.

