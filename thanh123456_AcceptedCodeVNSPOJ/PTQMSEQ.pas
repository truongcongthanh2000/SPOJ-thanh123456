const
    fin='';fon='';
    maxn=1094782;
type
    mang=array [0..2*maxn] of int64;
var
    n,k,bot,top:longint;
    s,a,min_s:mang;
    stack:array [0..2*maxn] of longint;
function min(a,b:int64):int64;
    begin
        if a<b then exit(a)
        else exit(b);
    end;
function max(a,b:int64):int64;
    begin
        if a>b then exit(a)
        else exit(b);
    end;
procedure nhap;
    var
        i:longint;
    begin
        assign(input,fin);reset(input);
        assigN(output,fon);rewritE(output);
        readln(n);
        k:=n;
        for i:=1 to n do read(a[i]);
        for i:=n+1 to 2*n-1 do a[i]:=a[i-n];
        n:=2*n-1;
        for i:=1 to n do s[i]:=s[i-1]+a[i];
    end;
procedure push(x:longint);
    begin
        inc(top);
        stack[top]:=x;
    end;
function get:longint;
    begin
        exit(stack[top]);
    end;
procedure pop_cuoi;
    begin
        stack[top]:=0;
        dec(top);
    end;
procedure pop_dau;
    begin
        stack[bot]:=0;
        inc(boT);
    end;
procedure De_queue;
    var
        i:longint;
    begin
        bot:=1;
        top:=0;
        for i:=1 to n do
            begin
                while (top>0) and (s[get]>=s[i]) do pop_cuoi;
                push(i);
                if i-stack[bot]+1>k-1 then pop_dau;
                min_s[i]:=s[stack[bot]];
            end;
    end;
procedure solve;
    var
        i,dem:longint;
        res,sum:int64;
    begin
        res:=-high(int64);
        dem:=0;
        sum:=0;
        for i:=1 to n do
            res:=max(s[i]-min_s[i-1],res);

            //res:=max(res,s[i]-min_s[i-1]);
        writeln(res);
        close(input); close(output);
    end;
begin
    nhap;
    de_queue;
    solve;
end.


	