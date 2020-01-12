uses math;
const
    fin='';fon='';
var
    n,cs1,cs2,bot,top:longint;
    delta,q,p,m,kq:int64;
    a,b,stack:array [0..trunc(1e7)] of int64;
procedure nhap;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n,delta);
        readln(p,q,m);
    end;
procedure taomang;
    var
        i:longint;
    begin
        for i:=1 to n do
            a[i]:=(p*i) mod m+q;
    for i:=1 to 2*n-1 do
        begin
        if i<=n then b[i]:=a[i]+delta*i
        else b[i]:=a[i-n]+delta*i;
        end;
    for i:=1 to 2*n-1 do a[i]:=b[i];
    end;
{procedure init;
    var
        i:longint;
    begin
        cs1:=0;
        cs2:=0;
        for i:=1 to n do
            if a[i]>a[cs1] then cs1:=i;
        for i:=1 to n do
            if (a[i]>a[cs2]) and (i<>cs1) then cs2:=i;
        kq:=a[cs1];
    end; }
procedure Thanh(i:longint);
    begin
        inc(top);
        stack[top]:=i;
    end;
function Yeu:longint;
    begin
        Yeu:=stack[top];
    end;
procedure Thu;
    begin
        inc(bot);
    end;
function Nhieu:longint;
    begin
        Nhieu:=stack[bot];
    end;
procedure Lam;
    begin
        stack[top]:=0;
        dec(top);
    end;
procedure xuli;
    var
        i:longint;
        x:int64;
    begin
        kq:=high(int64);
        bot:=1;
        for i:=1 to 2*n-1 do
            begin
                while (top>=bot) and (a[Yeu]<=a[i]) do Lam;
                Thanh(i);
                if Nhieu+n<=i then Thu;
                if i>=n then
                    begin
                        x:=(a[Nhieu]-(i-n)*delta);
                        kq:=min(kq,x);
                    end;
            end;
    end;
procedure xuat;
    var
        i:longint;
    begin
        writeln(kq);
    close(input); close(output);
    end;
begin
nhap;
taomang;
xuli;
xuat;
end.

