const
    fin='';fon='';
    maxn=trunc(1e6);
type
    mang=array [0..maxn] of longint;
var
    n,a,b,top1,top2,bot1,bot2:longint;
    d,c,stack1,stack2:mang;
procedure nhap;
    var
        i:longint;
    begin
        assigN(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n,a,b);
        for i:=1 to n do readln(d[i],c[i]);
    end;
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
        x:=d[i];
        repeat
            while d[i]<x do inc(i);
            while d[j]>x do dec(j);
            if i<=j then
                begin
                    swap(d[i],d[j]);
                    swap(c[i],c[j]);
                    inc(i); dec(j);
                end;
        until i>j;
        if l<j then qsort(l,j);
        if i<r then qsort(i,r);
    end;
procedure push1(x:longint);
    begin
        inc(top1);
        stack1[top1]:=x;
        if top1-bot1+1>a then inc(bot1);
    end;
procedure push2(x:longint);
    begin
        inc(top2);
        stack2[top2]:=x;
        if top2-bot2+1>b then inc(bot2);
    end;
procedure solve;
    var
        i,res,s1,s2,s3,s4,s:longint;
    begin
        res:=maxlongint;
        top1:=0; top2:=0;
        bot1:=1; bot2:=1;
        for i:=1 to n do
            begin
                if c[i]=1 then push1(d[i])
                else push2(d[i]);
                if (top1-bot1+1<a) or (top2-bot2+1<b) then continue;
                s1:=stack1[top1]-stack2[bot2];
                s2:=stack2[top2]-stack1[bot1];
                s3:=stack1[top1]-stack1[bot1];
                s4:=stack2[top2]-stack2[bot2];
                s:=max(max(max(s1,s2),s3),s4);
                res:=min(s,res);
            end;
        if res=maxlongint then writeln(-1)
        else writeln(res);
    close(input); close(output);
    end;
begin
    nhap;
    qsort(1,n);
    solve;
end.
