const
    fin='';fon='';
var
    f,a,trace:array [0..trunc(1e6)] of int64;
    max,n:longint;
procedure nhap;
    var
        i:longint;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n);
        for i:=1 to n do read(a[i]);
    end;
procedure qhd;
    var
        i,j,jmax,max:longint;
    begin
        f[1]:=1;
        max:=1;
        for i:=2 to n do
            begin
                jmax:=0;
                for j:=1 to i-1 do
                    begin
                        if (a[i]*a[j]<0) and (abs(a[i])>abs(a[j])) and (f[j]>f[jmax]) then jmax:=j;
                    end;
                f[i]:=f[jmax]+1;
                trace[i]:=jmax;
                if f[i]>max then max:=f[i];
            end;
        writeln(max);
        close(input); close(output);
    end;
begin
    nhap;
    qhd;
end.
