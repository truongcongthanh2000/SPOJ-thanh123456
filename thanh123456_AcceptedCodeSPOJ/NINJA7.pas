const
        fin='';fon='';
var
        i,t,n:longint;
        a,b,c:array [1..1000000] of int64;
procedure nhap;
        begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(t);
        end;
procedure qsort(l,r:longint);
        var
                i,j,x,t,m:longint;
        begin
        i:=l;
        j:=r;
        m:=(l+r) div 2;
        x:=c[m];
        repeat
                while (c[i]<x) do inc(i);
                while (c[j]>x) do dec(j);
                if i<=j then
                        begin
                        t:=c[i]; c[i]:=c[j]; c[j]:=t;
                        inc(i); dec(j);
                        end;
        until i>j;
        if i<r then qsort(i,r);
        if l<j then qsort(l,j);
        end;
procedure xuli;
        var k,dem,i:longint;
                s:int64;
        begin
        for k:=1 to t do
                begin
                readln(n);
                for i:=1 to n do read(a[i]);
                for i:=1 to n do read(b[i]);
                readln;
                for i:=1 to n do c[i]:=a[i]-b[i];
                qsort(1,n);
                dem:=0;
                s:=0;
                for i:=n downto 1 do
                        begin
                        if s+c[i]>=0 then
                                begin
                                s:=s+c[i];
                                inc(dem);
                                end
                        else break;
                        end;
                writeln(dem);
                end;
        close(input);
        close(output);
        end;
begin
nhap;
xuli;
end.
