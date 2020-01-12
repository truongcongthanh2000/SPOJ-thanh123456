const
    fin='';fon='';
    maxn=trunc(1e6);
type mang=array [0..maxn] of longint;
var
    n,top1,top2:longint;
    a,b,c,d,stack,cs:mang;
function min(a,b:longint):longint;
    begin
        if a<b then exit(a)
        else exit(b);
    end;
function max(a,b:longint):longint;
    begin
        if a>b then exit(a)
        else exit(b);
    end;
procedure nhap;
    var
        i:longint;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n);
        for i:=1 to n do read(a[i]);
        for i:=1 to n do read(b[i]);
        for i:=1 to n do
            begin
                if a[i]<=b[i] then
                    begin
                        c[i]:=a[i];
                        d[i]:=1;
                    end
                else
                    begin
                        c[i]:=b[i];
                        d[i]:=2;
                    end;
                cs[i]:=i;
            end;
    end;
procedure swap(var x,y:longint);
    var
        tam:longint;
    begin
        tam:=x; x:=y;  y:=tam;
    end;
procedure qsort(l,r:longint);
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
                    swap(cs[i],cs[j]);
                    swap(d[i],d[j]);
                    inc(i); dec(j);
                end;
        until i>j;
        if l<j then qsort(l,j);
        if i<r then qsort(i,r);
    end;
procedure push1(x:longint);
    begin
        inc(top1);
        stack[top1]:=x;
    end;
procedure push2(x:longint);
    begin
        dec(top2);
        stack[top2]:=x;
    end;
procedure Johnson;
    var
        i:longint;
    begin
        top1:=0;
        top2:=n+1;
        for i:=1 to n do
            begin
                if d[i]=1 then push1(cs[i])
                else push2(cs[i]);
            end;
    end;
procedure solve;
    var
        i,sa,sb:longint;
    begin
        sa:=0;
        sb:=0;
        for i:=1 to n do
            begin
                sa:=sa+a[stack[i]];
                sb:=max(sa,sb)+b[stack[i]];
            end;
        if sa>sb then writeln(sa)
        else writeln(sb);
        for i:=1 to n do write(stack[i],' ');
    close(input); close(output);
    end;
begin
    nhap;
    qsort(1,n);
    Johnson;
    solve;
end.

