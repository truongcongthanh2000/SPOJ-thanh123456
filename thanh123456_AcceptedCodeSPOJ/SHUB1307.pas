uses math;
const
    fin='';fon='';
    maxn=100;
    maxk=500;
var
    test,n,m,k,res:longint;
    a:array [0..maxn,0..maxn] of integer;
    f:array [0..100,0..100,0..500] of boolean;
procedure nhap;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(Test);
    end;
procedure docdulieu;
    var
        i,j:longint;
    begin
        readln(n,m,k);
        for i:=1 to n do
            for j:=1 to m do read(a[i,j]);
    end;
procedure init;
    var
        i,j,u:longint;
    begin
        for i:=0 to n do
            for j:=0 to m do
                for u:=1 to k do
                    f[i,j,u]:=false;
        f[1,1,a[1,1]]:=true;
    end;
procedure qhd;
    var
        i,j,u:longint;
    begin
        for i:=1 to n do
            for j:=1 to m do
                begin
                    if (i=1) and (j=1) then continue;
                    for u:=1 to k do
                        begin
                            if u>=a[i,j] then
                                f[i,j,u]:=f[i-1,j,u-a[i,j]] or f[i,j-1,u-a[i,j]] or f[i-1,j-1,u-a[i,j]];
                        end;
                end;
    end;
procedure timres;
    var
        i:longint;
    begin
        res:=-1;
        for i:=k downto 1 do
            if f[n,m,i]=true then
                begin
                    res:=i;
                    exit;
                end;
    end;
procedure solve;
    var
        i:longint;
    begin
        for i:=1 to test do
            begin
                docdulieu;
                init;
                qhd;
                timres;
                writeln(res);
            end;
    close(input); close(output);
    end;
begin
    nhap;
    solve;
end.

