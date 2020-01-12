const
    fin='';fon='';
var
    n:longint;
    a,b,c:array [0..trunc(1e7)] of longint;
procedure nhap;
    var
        i:longint;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n);
        n:=2*n;
        for i:=1 to n do
            begin
                readln(a[i],b[i]);
                c[i]:=b[i]-a[i];
            end;
    end;
procedure swap(var x,y:longinT);
    var
        tam:longint;
    begin
        tam:=x; x:=y; y:=tam;
    end;
procedure qsort(l,r:longint);
    var
        i,j,m,x,y:longint;
    begin
        i:=l; j:=r;
        m:=random(r-l)+l+1;
        x:=c[m];
        repeat
            while (c[i]>x) do inc(i);
            while (c[j]<x) do dec(j);
            if i<=j then
                begin
                    swap(a[i],a[j]);
                    swap(b[i],b[j]);
                    swap(c[i],c[j]);
                    inc(i); dec(j);
                end;
        until i>j;
        if l<j then qsort(l,j);
        if i<r then qsort(i,r);
    end;
procedure xuli;
    var
        i:longint;
        kq:int64;
    begin
        kq:=0;
        n:=n div 2;
        for i:=1 to n do kq:=kq+a[i];
        for i:=n+1 to n*2 do kq:=kq+b[i];
        writeln(kq);
    close(input);close(output);
    end;
begin
nhap;
qsort(1,n);
xuli;
end.

