const
    fin='';fon='';
    di:array [1..2] of longint=(0,1);
    dj:array [1..2] of longint=(1,0);
    maxn=600;
type
    mang1=array [0..maxn*maxn+4] of longint;
    mang2=array [0..maxn+1,0..maxn+1] of ansistring;
    mang3=array [0..maxn+1,0..maxn+1] of boolean;
var
    n,m,ra,vao:longint;
    queue_dong,queue_cot:mang1;
    f,c:mang2;
    kt,free:mang3;
procedure nhap;
    var
        i,j,x:longint;
        tam:string;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n,m);
        for i:=1 to n do
            begin
                for j:=1 to m do
                    begin
                        read(x);
                        str(x,tam);
                        c[i,j]:=tam;
                        if x<>2 then kt[i,j]:=true;
                    end;
            end;
    end;
procedure push(x,y,u,v:longint;var s1,s2:ansistring);
    begin
        inc(vao);
        queue_dong[vao]:=u;
        queue_cot[vao]:=v;
        f[u,v]:=s1+s2;
        free[u,v]:=true;
    end;
procedure UpDate(x,y,u,v:longint;var s1,s2:ansistring);
    begin
        if f[u,v] < s1+s2 then
            f[u,v]:=s1+s2;
    end;
procedure bfs;
    var
        x,y,k,u,v:longint;
    begin
        ra:=1;
        vao:=1;
        queue_dong[1]:=1;
        queue_cot[1]:=1;
        f[1,1]:=c[1,1];
        free[1,1]:=true;
        repeat
            x:=queue_dong[ra];
            y:=queue_cot[ra];
            for k:=1 to 2 do
                begin
                    u:=x+di[k];
                    v:=y+dj[k];
                    if kt[u,v]=false then continue;
                    if free[u,v]=false then
                        push(x,y,u,v,f[x,y],c[u,v])
                    else
                        UpDate(x,y,u,v,f[x,y],c[u,v]);
                end;
            inc(ra);
        until ra>vao;
    end;
procedure solve;
    begin
        writeln(f[n,m]);
    close(input); close(output);
    end;
begin
    nhap;
    bfs;
    solve;
end.


