const
    fin='';fon='';
    maxn=trunc(1e3);
type
    mang=array [0..maxn,0..maxn] of longint;
var
    a,f,kq:mang;
    n,m,k,res:longint;
procedure nhap;
    var
        i,j:longint;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n,m,k);
        for i:=1 to n do
            for j:=1 to m do read(a[i,j]);
    end;
procedure qhd;
    var
        i,j:longint;
    begin
        for i:=1 to n do
            for j:=1 to m do f[i,j]:=f[i-1,j]+f[i,j-1]-f[i-1,j-1]+a[i,j];
    end;
function Get(i,j,x,y:longint):longint;
    begin
        exit(f[x,y]-f[i-1,y]-f[x,j-1]+f[i-1,j-1]);
    end;
procedure solve;
    var
        x,x1,x2,y1,y2,s:longint;
    begin
        res:=maxlongint;
        for x1:=1 to n do
            for x2:=x1 to n do
                begin
                    y1:=1;
                    y2:=1;
                    while (y2<=m) and (y1<=y2) do
                        begin
                            x:=Get(x1,y1,x2,y2);
                            if x>=k then
                                begin
                                    s:=(x2-x1+1)*(y2-y1+1);
                                    if s<res then
                                        begin
                                            res:=s;
                                            kq[1,1]:=x1;
                                            kq[1,2]:=y1;
                                            kq[2,1]:=x2;
                                            kq[2,2]:=y2;
                                        end;
                                    inc(y1);
                                end
                            else inc(y2);
                        end;
                end;
    end;
procedure xuat;
    var
        i:longint;
    begin
        if res=maxlongint then writeln(-1)
        else
            begin
                writeln(res);
                for i:=1 to 2 do write(kq[i,1],' ',kq[i,2],' ');
            end;
        close(input); close(output);
    end;
begin
    nhap;
    qhd;
    solve;
    xuat;
end.
