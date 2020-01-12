const
    fin='';fon='';
    maxn=trunc(1e6)+1;
type
    mang=array [0..maxn] of longint;
var
    s:ansistring;
    a,d:mang;
    n,top:longint;
procedure nhap;
    begin
        assigN(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(s);
        n:=length(s);
        s:=s+'*';
    end;
procedure init;
    var
        l,r:longint;
    begin
        top:=0;
        l:=1;
            while l<=n do
                begin
                    if s[l]<>'7' then
                        begin
                            inc(l);
                            continue;
                        end;
                    r:=l;
                    while (s[l]=s[r]) do inc(r);
                    dec(r);
                    inc(top);
                    a[top]:=r-l+1;
                    l:=r+1;
                end;
    end;
procedure solve;
    var
        i,j:longint;
    begin
        for i:=top downto 1 do
            begin
                for j:=1 to a[i] do
                    inc(d[j],a[i]-j+1);
            end;
    end;
procedure xuat;
    var
        len:longint;
    begin
        for len:=1 to n do
            begin
                if d[len]<>0 then
                    writeln(len,' ',d[len])
                else break;
            end;
        close(input); close(output);
    end;
begin
    nhap;
    init;
    solve;
    xuat;
end.


