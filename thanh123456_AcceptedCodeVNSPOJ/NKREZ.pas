const
        fin='';fon='';
var
        i,n,j,jmax,max,csmax,k:longint;
        f,a,b,cs,t,kq:array [0..10000000] of longint;
procedure nhap;
        begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n);
        for i:=1 to n do begin cs[i]:=i; readln(a[i],b[i]); end;
        end;
procedure qsort(l,r:longint);
        var
                i,j,m,x,t:longint;
        begin
        i:=l; j:=r;
        m:=(l+r) div 2;
        x:=b[m];
        repeat
                while b[i]<x do inc(i);
                while b[j]>x do dec(j);
                if i<=j then
                        begin
                        t:=b[i]; b[i]:=b[j]; b[j]:=t;
                        t:=a[i]; a[i]:=a[j]; a[j]:=t;
                        t:=cs[i]; cs[i]:=cs[j]; cs[j]:=t;
                        inc(i); dec(j);
                        end;
        until i>j;
        if j>l then qsort(l,j);
        if i<r then qsort(i,r);
        end;
procedure xuli;
        begin
        qsort(1,n);
        f[1]:=b[1]-a[1]; f[0]:=0;
        csmax:=1;
        for i:=2 to n do
                begin
                jmax:=0;
                for j:=1 to i-1 do
                        begin
                        if (a[i]>=b[j]) and (f[j]>f[jmax]) then jmax:=j;
                        end;
                if jmax>0 then begin t[i]:=jmax; f[i]:=f[jmax]+b[i]-a[i]; end
                else begin t[i]:=0; f[i]:=b[i]-a[i]; end;
                if f[i]>f[csmax] then csmax:=i;
                end;
        writeln(f[csmax]);
        close(input);
        close(output);
        end;
begin
nhap;
xuli;
end.

