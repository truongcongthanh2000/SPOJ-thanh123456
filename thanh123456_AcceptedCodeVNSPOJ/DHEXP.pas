const
        fin='';fon='';
var
        i,n,k:longint;
        s:int64;
        a:array [1..1000000] of int64;
procedure nhap;
        begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n,k);
        for i:=1 to n do read(a[i]);
        end;
procedure qsort(l,r:longint);
        var
                i,j,m,x,t:longint;
        begin
        i:=l;
        j:=r;
        m:=random(r-l+1)+l;
        x:=a[m];
        repeat
                while a[i]>x do inc(i);
                while a[j]<x do dec(j);
                if i<=j then
                        begin
                        t:=a[i]; a[i]:=a[j]; a[j]:=t;
                        inc(i); dec(j);
                        end;
        until i>j;
        if l<j then qsort(l,j);
        if i<r then qsort(i,r);
        end;
procedure xuli;
        begin
        s:=0;
        for i:=1 to k+1 do
                s:=s+a[i];
        for i:=k+2 to n do
                s:=s-a[i];
        writeln(s);
        close(input);
        close(output);
        end;
begin
nhap;
qsort(2,n);
xuli;
end.