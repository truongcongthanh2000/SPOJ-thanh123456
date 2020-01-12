const
    fin='';fon='';
    maxn=trunc(5e6);
type
    mang1=array [0..maxn] of longint;
    mang2=array [0..maxn] of int64;
    mang3=array [0..trunc(1e4),0..trunc(1e4)] of boolean;
    mang4=array [0..maxn] of boolean;
var
    n,m,s,ra,vao:longint;
    u,v,h,a,queue,d:mang1;
    bac:mang2;
    free:mang3;
    kt:mang4;
procedure nhap;
    begin
        assigN(input,fin);reset(input);
        assigN(output,fon);rewrite(output);
        readln(n,m,s);
    end;
procedure taomang;
    var
        i,canh,x,y:longint;
    begin
        canh:=0;
        for i:=1 to m do
            begin
                readln(x,y);
                if free[x,y]=true then continue;
                inc(canh);
                u[canh]:=x;
                v[canh]:=y;
                inc(h[u[canh]]);
                free[x,y]:=true;
                //inc(h[v[i]]);
            end;
        for i:=2 to n+1 do h[i]:=h[i-1]+h[i];
        for i:=canh downto 1 do
            begin
                a[h[u[i]]]:=v[i];
                dec(h[u[i]]);
                //a[h[v[i]]]:=u[i];
                //dec(h[v[i]]);
            end;
    end;
procedure push(x:longint);
    begin
        inc(vao);
        queue[vao]:=x;
    end;
procedure bfs;
    var
        i,u,v:longint;
    begin
        ra:=1;
        push(s);
        d[s]:=0;
        bac[s]:=1;
        kt[s]:=true;
        repeat
            u:=queue[ra];
            inc(ra);
            for i:=h[u]+1 to h[u+1] do
                begin
                    v:=a[i];
                    if kt[v]=false then
                        begin
                            push(v);
                            bac[v]:=bac[u];
                            d[v]:=d[u]+1;
                            kt[v]:=true;
                        end
                    else
                    if (d[u]+1=d[v]) and (kt[v]=true) and (bac[v]<2) then
                        bac[v]:=bac[v]+bac[u];

                end;
        until ra>vao;
    end;
procedure solve;
    var
        i,res:longint;
    begin
        res:=0;
        for i:=1 to n do
            if bac[i]>1 then inC(res);
        writeln(res);
    close(input); closE(output);
    end;
begin
    nhap;
    taomang;
    bfs;
    solve;
end.

