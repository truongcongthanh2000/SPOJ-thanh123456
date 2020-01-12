const
    fin='';fon='';
    maxn=trunc(1e3);
    maxc=trunc(1e9);
    maxd=(maxn+1)*maxc;
type diem=record
    u,v,c:longint;
end;
var
    e:array [1..maxn*maxn] of diem;
    d:array [1..maxn+1,1..maxn+1] of int64;
    n,m:longint;
procedure nhap;
    var
        i,u,v,c:longint;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n,m);
        for i:=1 to m do
            begin
                readln(u,v,c);
                e[i].u:=u;
                e[i].v:=v;
                e[i].c:=c;
            end;
    end;
procedure init;
    var
        i,j:longint;
    begin
        {for i:=1 to maxn div 8 do
            for j:=1 to maxn div 8 do d[i,j]:=maxd;}
        FillQWord(d, SizeOf(d) div 8, maxD);
        for i:=1 to n do
            d[1,i]:=0;
    end;
procedure solve;
    var
        i,j,u,v,c:longint;
    begin
        for i:=2 to n+1 do
            for j:=1 to m do
                begin
                    u:=e[j].u;
                    v:=e[j].v;
                    c:=e[j].c;
                    if d[i,v] > d[i-1,u] + c then
                        d[i,v]:=d[i-1,u] + c;
                end;
    end;
procedure xuat;
    var
        k,v:longint;
        res,tam,tmp:extended;
    begin
        res:=maxd;
        for v:=1 to n do
            if d[n+1,v] < maxd then
                begin
                    tam:=-maxd;
                    for k:=1 to n do
                        begin
                            if d[k,v] < maxd then
                                begin
                                    tmp:=(d[n+1,v]-d[k,v])/(n-k+1);
                                    if tam<tmp then tam:=tmp;
                                end;
                        end;
                    if res > tam then res:=tam;
                end;
    if res<>maxd then writeln(res:0:2)
    else writeln('NO TOUR');
    close(input); close(output);
    end;
begin
    nhap;
    init;
    solve;
    xuat;
end.






