const
    fin='';fon='';
    maxm=trunc(5e5);
type
    mang=array [0..maxm] of longint;
var
    n,m:longint;
    pos,a:mang;
procedure nhap;
    var
        i:longint;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n,m);
        for i:=1 to n do read(a[i]);
    end;
procedure swap(var x,y:longint);
    var
        tam:longint;
    begin
        tam:=x; x:=y; y:=tam;
    end;
procedure qsort(l,r:longint);
    var
        i,j,x,m:longint;
    begin
        i:=l; j:=r;
        m:=random(r-l)+l+1;
        x:=a[m];
        repeat
            while a[i]<x do inc(i);
            while a[j]>x do dec(j);
            if i<=j then
                begin
                    swap(a[i],a[j]);
                    inc(i); dec(j);
                end;
        until i>j;
        if l<j then qsort(l,j);
        if i<r then qsort(i,r);
    end;
procedure taomang;
    var
        i,j:longint;
    begin
        for i:=1 to n do pos[a[i]]:=i;
        a[n+1]:=maxm;
        for i:=1 to n do
            begin
                for j:=a[i]+1 to a[i+1]-1 do
                    pos[j]:=i;
            end;
    end;
procedure solve;
    var
        i,j,vitri,res:longint;
    begin
        res:=0;
        for i:=1 to n-2 do
            begin
                for j:=i+1 to n-1 do
                    begin
                        if a[i]+a[j]>m then break;
                        vitri:=pos[m-(a[i]+a[j])];
                        if vitri>j then
                            begin
                                if res<a[i]+a[j]+a[vitri] then
                                    res:=a[i]+a[j]+a[vitri];
                            end;
                    end;
            end;
        writeln(Res);
    close(input); closE(output);
    end;
begin
    nhap;
    qsort(1,n);
    taomang;
    solve;
end.
