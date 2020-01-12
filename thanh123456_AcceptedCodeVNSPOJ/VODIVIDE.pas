const
    fin='';fon='';
    maxn=trunc(1e5);
    maxm=trunc(5e3);
type mang=array [0..maxn] of longint;
var
    a,b,cs,res:mang;
    free:array [0..maxn] of boolean;
    f:array [0..maxm,0..maxm] of longint;
    n,dem:longint;
procedure nhap;
    var
        i:longint;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n);
        for i:=1 to n do read(a[i]);
        for i:=1 to n do read(b[i]);
        for i:=1 to n do cs[i]:=i;
    end;
procedure swap(var x,y:longint);
    var
        tam:longint;
    begin
        tam:=x; x:=y; y:=tam;
    end;
procedure qsort(l,r:longint);
    var
        i,j,m,x:longint;
    begin
        i:=l; j:=r;
        m:=random(r-l)+l+1;
        x:=a[m];
        repeat
            while a[i]>x do inC(i);
            while a[j]<x do dec(j);
            if i<=j then
                begin
                    swap(a[i],a[j]);
                    swap(b[i],b[j]);
                    swap(cs[i],cs[j]);
                    inc(i); dec(j);
                end;
        until i>j;
        if l<j then qsort(l,j);
        if i<r then qsort(i,r);
    end;
function max(a,b:longint):longint;
    begin
        if a>b then exit(a)
        else exit(b);
    end;
procedure qhd;
    var
        i,j:longint;
    begin
        //f[1,0]:=b[1];
        qsort(1,n);
        for i:=2 to n do
            for j:=1 to i div 2 do
                begin
                    f[i,j]:=max(f[i-1,j],f[i-1,j-1]+b[i]);
                end;
        writeln(f[n,n div 2]);
    end;
procedure trace;
    var
        i,j:longint;
    begin
        i:=n; j:=n div 2;
        while (i>0) and (j>0) do
            begin
                if f[i,j]=f[i-1,j-1]+b[i] then
                    begin
                        inc(dem);
                        res[dem]:=i;
                        free[i]:=true;
                        dec(i);dec(j);
                    end
                else dec(i);
            end;
    end;
procedure xuat;
    var
        i,j:longint;
    begin
        for i:=1 to dem do
            begin
                for j:=res[i]-1 downto 1 do
                    begin
                        if free[j]=false then
                            begin
                                write(cs[j],' ');
                                free[j]:=true;
                                break;
                            end;
                    end;

                writeln(cs[res[i]]);
            end;
        close(input); close(output);
    end;
begin
    nhap;
    qhd;
    trace;
    xuat;
end.

