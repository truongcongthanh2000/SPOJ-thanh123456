var
        i,n:longint;
        kq,songay:int64;
        a,b,c:Array [1..1000000] of longint;
procedure nhap;
        begin
        randomize;
        readln(n);
        for i:=1 to n do
         begin
         c[i]:=i;
                read(a[i]);
         end;
        readln;
        for i:=1 to n do read(b[i]);
        end;
function gtri(i:longint):real;
        begin
        exit(a[i]/b[i]);
        end;
procedure qsort(l,r:longint);
        var i,j,m,t:longint;
                x:real;
        begin
        if l>=r then exit;
        i:=l; j:=r;
        x:=gtri(1+random(r-l)+l);
        repeat
                while gtri(i)>x do inc(i);
                while gtri(j)<x do dec(j);
                if i<=j then
                        begin
                        if i<j then
                        	begin
                        	t:=a[i]; a[i]:=a[j]; a[j]:=t;
                        	t:=b[i]; b[i]:=b[j]; b[j]:=t;
                        	t:=c[i]; c[i]:=c[j]; c[j]:=t;
                           end;
                        inc(i); dec(j);
                        end;
        until i>j;
        qsort(l,j);
        qsort(i,r);
        end;
procedure xuli;
        begin
        songay:=0;
        kq:=0;
        for i:=1 to n do
                begin
                songay:=songay+b[i];
                kq:=kq+a[i]*songay;
                end;
        end;
procedure xuat;
        begin
        writeln(kq);
        for i:=1 to n do write(c[i],' ');
        end;
begin
nhap;
qsort(1,n);
xuli;
xuat;
end.


