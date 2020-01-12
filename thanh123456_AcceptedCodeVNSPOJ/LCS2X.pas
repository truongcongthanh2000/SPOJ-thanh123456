uses math;
const
    fin='';fon='';
    maxn=3000;
type
    mang1=array [0..maxn] of longint;
    mang2=array [0..maxn,0..maxn] of longint;
var
    test,n,m:longint;
    a,b,d:mang1;
    f:mang2;
procedure nhap;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(test);
    end;
procedure nhapdulieu;
    var
        i,j:longint;
    begin
        readln(n,m);
        for i:=1 to n do read(a[i]);
        for i:=1 to m do read(b[i]);
        for i:=1 to m do d[i]:=0;
        for i:=1 to n do
            for j:=1 to m do f[i,j]:=0;
    end;
procedure qhd;
    var
        i,j,gtmax,res:longint;
    begin
        for i:=1 to n do
            begin
                gtmax:=0;
                for j:=1 to m do
                    begin
                        if a[i]=b[j] then
                            f[i,j]:=gtmax+1;
                        if a[i] >= 2*b[j] then
                            begin
                                if gtmax < d[j] then gtmax:=d[j];
                            end;
                        if a[i]=b[j] then
                            begin
                                if d[j] < f[i,j] then d[j]:=f[i,j];
                            end;
                    end;
            end;
        res:=0;
        for i:=1 to n do
            for j:=1 to m do res:=max(f[i,j],res);
        writeln(res);
    end;
procedure xuat;
    var
        i:longint;
    begin
        for i:=1 to test do
            begin
                nhapdulieu;
                qhd;
            end;
        close(input); close(output);
    end;
begin
    nhap;
    xuat;
end.

