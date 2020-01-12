const
    fin='';fon='';
    maxn=trunc(1e5);
type
    mang1=array [0..maxn] of longint;
    mang2=array [0..maxn] of boolean;
var
    n,q,bot,top:longint;
    p,a,h,stack,d,u,v,c:mang1;
    free:mang2;
procedure nhap;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n,q);
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
procedure push(x:longint);
    begin
        inc(top);
        stack[top]:=x;
        free[x]:=true;
    end;
procedure Find_Path(x,y:longint);
    var
        i,u,v,w:longint;
        ThanhYeuThu:boolean;
    begin
        for i:=1 to n do
            begin
                free[i]:=false;
                d[i]:=0;
            end;
        top:=0;
        bot:=1;
        push(x);
        ThanhYeuThu:=true;
        repeat
            u:=stack[bot];
            inc(bot);
            for i:=h[u]+1 to h[u+1] do
                begin
                    v:=a[i];
                    w:=p[i];
                    if free[v]=true then continue;
                    d[v]:=d[u]+w;
                    push(v);
                    if v=y then
                        begin
                            writeln(d[y]);
                            exit;
                        end;
                end;
        until ThanhYeuThu=false;
    end;
procedure solve;
    var
        i,u,v:longint;
    begin
        for i:=1 to q do
            begin
                readln(u,v);
                Find_Path(u,v);
            end;
        closE(input); close(output);
    end;
begin
    nhap;
    taomang;
    solve;
end.
