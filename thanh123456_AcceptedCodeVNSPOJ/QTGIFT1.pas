const
    fin='';fon='';
    maxn=trunc(2e6)+1;
type
    mang1=array [0..maxn] of longint;
    mang2=array [0..maxn] of int64;
var
    i,n,k,top,bot:longint;
    a,stack:mang1;
    f:mang2;
    s:int64;
procedure nhap;
    var
        i:longint;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n,k);
        for i:=1 to n do read(a[i]);
        for i:=1 to n do s:=s+int64(a[i]);
    end;
procedure push(x:longint);
    begin
        inc(top);
        stack[top]:=x;
    end;
procedure pop_left;
    begin
        stack[bot]:=0;
        inc(bot);
    end;
procedure pop_right;
    begin
        stack[top]:=0;
        dec(top);
    end;
function get_right:longint;
    begin
        exit(stack[top]);
    end;
function get_left:longint;
    begin
        exit(stack[bot]);
    end;
procedure init;
    var
        i:longint;
    begin
        bot:=1;
        top:=0;
        for i:=1 to k do
            begin
                f[i]:=a[i];
                while (top>=bot) and (f[get_right]>=f[i]) do pop_right;
                push(i);
            end;
    end;
procedure solve;
    var
        i:longint;
    begin
        for i:=k+1 to n+k do
            begin
                f[i]:=f[get_left]+int64(a[i]);
                while (top>=bot) and (f[get_right]>=f[i]) do pop_right;
                push(i);
                if i-get_left+1>k then pop_left;
            end;
    end;
procedure xuat;
    begin
        writeln(s-f[n+1]);
    close(input); close(output);
    end;
begin
    nhap;
    init;
    solve;
    xuat;
end.
