const
    fin='';fon='';
    maxn=trunc(1e7);
type
    mang1=array [0..maxn] of longint;
    mang2=array [0..maxn] of boolean;
var
    u,v,bac_vao,h,a,queue:mang1;
    free:mang2;
    n,top:longint;
procedure nhap;
    begin
        assigN(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n);
    end;
procedure taomang;
    var
        i,j,canh:longint;
        c:char;
    begin
        canh:=0;
        for i:=1 to n do
            begin
                for j:=1 to n do
                    begin
                        read(c);
                        if c='1' then
                            begin
                                inc(canh);
                                u[canh]:=i;
                                v[canh]:=j;
                                inc(h[u[canh]]);
                                inc(bac_vao[j]);
                            end;
                    end;
                readln;
            end;
        for i:=2 to n+1 do h[i]:=h[i-1]+h[i];
        for i:=canh downto 1 do
            begin
                a[h[u[i]]]:=v[i];
                dec(h[u[i]]);
            end;
        top:=0;
        for i:=1 to n do
            begin
                if bac_vao[i]=0 then
                    begin
                        inc(top);
                        queue[top]:=i;
                    end;
            end;
        if top>1 then
            begin
                writeln(-1);
                halt;
            end;
        top:=n;
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
        queue[top]:=u;
        dec(top);
    end;
procedure Topo;
    var
        i,u,v,ra:longint;
    begin
        ra:=1;
        repeat
            u:=queue[ra];
            inc(ra);
            for i:=h[u]+1 to h[u+1] do
                begin
                    v:=a[i];
                    dec(bac_vao[v]);
                    if bac_vao[v]=0 then
                        begin
                            inc(top);
                            queue[top]:=v;
                        end;
                end;
        until ra>top;
    end;
procedure Topo_DFS;
    var
        i:longint;
    begin
        for i:=1 to n do
            if free[i]=false then dfs(i);
    end;
procedure solve;
    var
        i:longint;
    begin
        if top>0 then writeln(-1)
        else
            begin
                for i:=1 to n do write(queue[i],' ');
            end;
        close(input); close(output);
    end;
begin
    nhap;
    taomang;
    //topo;
    topo_dfs;
    solve;
end.
