const
        fin='';fon='';
var
        t,k,n,i,vt1,vt2:longint;
        kt1,kt2:boolean;
        a:array [1..1000000] of int64;
procedure nhap;
        begin
        assigN(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(t);
        end;
procedure qsort(l,r:longint);
        var
                i,j,m,t,x:longint;
        begin
        i:=l;
        j:=r;
        m:=(l+r) div 2;
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
procedure xuli;
        begin
        for k:=1 to t do
                begin
                readln(n);
                for i:=1 to n do read(a[i]);
                readln;
                qsort(1,n);
                kt1:=false;
                kt2:=false;
                for i:=n downto 2 do
                        begin
                        if a[i]=a[i-1] then
                                begin
                                vt1:=i-1;
                                kt1:=true;
                                break;
                                end;
                        end;
                for i:=vt1-1 downto 2 do
                        begin
                        if a[i]=a[i-1] then
                                begin
                                vt2:=i-1;
                                kt2:=true;
                                break;
                                end;
                        end;
                if (kt1=true) and (kt2=true) then writeln(a[vt1]*a[vt2])
                else writeln(-1);
                end;
        close(input);
        close(output);
        end;
begin
nhap;
xuli;
end.

