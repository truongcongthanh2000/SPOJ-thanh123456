uses math;
const
    fin='';fon='';
var
    n,m,top:longint;
    s:int64;
    a:array [0..trunc(1e7)] of int64;
procedure nhap;
    begin
        assigN(input,fin);reset(input);
        assigN(output,fon);rewrite(output);
        readln(n,m);
    end;
procedure taomang;
    var
        i,j,t,k,x:longint;
    begin
        s:=0;
        top:=0;
        for i:=1 to n do
            begin
                read(t,k);
                for j:=1 to k do
                    begin
                        read(x);
                        inc(top);
                        a[top]:=max(0,x-s);
                    end;
                s:=s+t;
            end;
    end;
procedure qsort(l,r:longint);
    var
        t,x,m,i,j:longint;
    begin
        i:=l; j:=r;
        m:=random(r-l)+l+1;
        x:=a[m];
        repeat
            while a[i]<x do inc(i);
            while a[j]>x do dec(j);
            if i<=j then
                begin
                    t:=a[i]; a[i]:=a[j]; a[j]:=t;
                    inc(i); dec(j);
                end;
        until i>j;
        if l<j then qsort(l,j);
        if i<r then qsort(i,r);
    end;
procedure solve;
    begin
        writeln(s+a[m]);
    close(input); close(output);
    end;
begin
    nhap;
    taomang;
    qsort(1,top);
    solve;
end.


