const
    fin='';fon='';
    maxn=trunc(1e4);
type
    mang1=array [0..maxn] of longint;
    mang2=array [0..maxn] of boolean;
var
    u,v,x,y,a:mang1;
    kt,free:mang2;
    res,top,n,m:longint;
procedure nhap;
    var
        i:longint;
    begin
        assigN(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n,m);
        for i:=1 to m do
            readln(u[i],v[i]);
        res:=0;
        top:=0;
    end;
procedure init;
    var
        i:longint;
    begin
        for i:=1 to n do a[i]:=-1;
        for i:=1 to m do free[i]:=false;
    end;
function TimGoc(i:longint):longint;
    begin
        if a[i]=-1 then exit(i)
        else
            begin
                a[i]:=TimGoc(a[i]);
                exit(a[i]);
            end;
    end;
function Check:boolean;
    var
        i,s1,s2,dem:longint;
    begin
        init;
        dem:=0;
        for i:=1 to m do
            begin
                if kt[i]=true then continue;
                s1:=TimGoc(u[i]);
                s2:=TimGoc(v[i]);
                if s1<>s2 then
                    begin
                        free[i]:=true;
                        inc(dem);
                        a[s1]:=s2;
                    end;
                if dem=n-1 then exit(true);
            end;
        exit(false);
    end;
procedure push;
    var
        i:longint;
    begin
        for i:=1 to m do
            begin
                if free[i]=true then
                    begin
                        inc(top);
                        x[top]:=u[i];
                        y[top]:=v[i];
                    end;
            end;
        inc(res);
    end;
procedure solve;
    var
        i:longint;
    begin
        for i:=1 to m do
            begin
                kt[i]:=true;
                if Check=true then push;
                kt[i]:=false;
                if res=3 then exit;
            end;
    end;
procedure xuat;
    var
        i:longint;
    begin
        writeln(res);
        for i:=1 to top do writeln(x[i],' ',y[i]);
    close(input); closE(output);
    end;
begin
    nhap;
    solve;
    xuat;
end.
