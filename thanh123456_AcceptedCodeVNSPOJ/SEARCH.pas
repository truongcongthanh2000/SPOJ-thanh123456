uses math;
const
    fin='';fon='';
    maxn=trunc(1e6);
type
    mang=array [0..maxn] of longint;
    mang2=array [0..maxn] of boolean;
var
    n,m,p,top,top1,dem:longint;
    a,b,c,q,stack:mang;
    free,free2,free1:mang2;
procedure nhap;
    var
        i:longint;
    begin
        assign(input,fin);reseT(input);
        assign(output,fon);rewrite(output);
        readln(m,n,p);
        for i:=1 to m do read(a[i]);
        for i:=1 to n do read(b[i]);
        for i:=1 to p do read(c[i]);

    end;
procedure swap(var x,y:longint);
    var
        tam:longint;
    begin
        tam:=x; x:=y; y:=tam;
    end;
procedure qsort(l,r:longint;var c:mang);
    var
        i,j,x,m:longint;
    begin
        i:=l; j:=r;
        m:=random(r-l)+l+1;
        x:=c[m];
        repeat
            while c[i]<x do inc(i);
            while c[j]>x do dec(j);
            if i<=j then
                begin
                    swap(c[i],c[j]);
                    inc(i); dec(j);
                end;
        until i>j;
        if l<j then qsort(l,j,c);
        if i<r then qsort(i,r,c);
    end;
procedure taomang;
    var
        i:longint;
    begin
        top1:=0;
        for i:=1 to m do
            begin
                if a[i]<>a[i-1] then
                    begin
                        inc(top1);
                        q[top1]:=a[i];
                        free1[q[top1]]:=true;
                    end;
            end;
        for i:=1 to n do free[b[i]]:=true;
    end;
procedure push(x:longint);
    begin
        inc(top);
        stack[top]:=x;
        if (free2[x]=false) and (free1[x]=true) then
            begin
                inc(dem);
                free2[x]:=true;
            end;
    end;
procedure solve;
    var
        i,j,res:longint;
    begin
        top:=0;
        res:=0;
        dem:=0;
        for i:=1 to p do
            begin
                if free[c[i]]=false then push(c[i])
                else
                    begin
                        if dem>=top1 then res:=max(res,top);
                        for j:=1 to top do free2[stack[j]]:=false;
                        top:=0;
                        dem:=0;
                    end;
            end;
        if dem>=top1 then res:=max(res,top);
        writeln(res);
    close(input); close(output);
    end;
begin
    nhap;
    qsort(1,m,a);
    qsort(1,n,b);
    taomang;
    solve;
end.

