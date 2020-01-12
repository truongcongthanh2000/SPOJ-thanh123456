const
    fin='';fon='';
    maxn=trunc(1e6);
type
    mang=array [0..maxn] of int64;
var
    n:longint;
    q:int64;
    p,c:mang;
procedure nhap;
    var
        i:longint;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n,q);
        for i:=1 to n do readln(p[i],c[i]);
    end;
procedure swap(var x,y:int64);
    var
        tam:int64;
    begin
        tam:=x; x:=y; y:=tam;
    end;
procedure qsort(l,r:longint);
    var
        i,j,m:longint;
        x:int64;
    begin
        i:=l; j:=r;
        m:=random(r-l)+l+1;
        x:=p[m];
        repeat
            while p[i]<x do inC(i);
            while p[j]>x do dec(j);
            if i<=j then
                begin
                    swap(p[i],p[j]);
                    swap(c[i],c[j]);
                    inc(i); dec(j);
                end;
        until i>j;
        if l<j then qsort(l,j);
        if i<r then qsort(i,r);
    end;
function min(a,b:int64):int64;
    begin
        if a<b then exit(a)
        else exit(b);
    end;
procedure solve;
    var
        i:longint;
        solan:int64;
        res:qword;
    begin
        res:=0;
        i:=1;
        while (q>0) and (i<=n) do
            begin
                if q<p[i] then break;
                solan:=min(q div p[i],c[i]);
                res:=res+solan;
                q:=q-(p[i]*solan);
                inc(i);
            end;
        writeln(res);
    close(input); close(output);
    end;
begin
    nhap;
    qsort(1,n);
    solve;
end.

