const
    fin='';fon='';
    maxn=trunc(2e6);
type
    mang=array [0..maxn] of longint;
var
    n,top:longint;
    a,l,r,stack:mang;
procedure nhap;
    var
        i:longint;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n);
        for i:=1 to n do read(a[i]);
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
procedure pop;
    begin
        stack[top]:=0;
        dec(top);
    end;
procedure Left;
    var
        i,res:longint;
    begin
        top:=0;
        l[1]:=1;
        push(1);
        for i:=2 to n do
            begin
                res:=0;
                while (top>0) and (a[get]>=a[i]) do
                    begin
                        res:=res+l[get];
                        pop;
                    end;
                push(i);
                l[i]:=res+1;
            end;
    end;
procedure right;
    var
        i,res:longint;
    begin
        top:=0;
        r[n]:=1;
        push(n);
        for i:=n-1 downto 1 do
            begin
                res:=0;
                while (top>0) and (a[get]>=a[i]) do
                    begin
                        res:=res+r[get];
                        pop;
                    end;
                push(i);
                r[i]:=res+1;
            end;
    end;
procedure solve;
    var
        len,i,canh:longint;
        res:int64;
    begin
        res:=0;
        len:=0;
        for i:=1 to n do
            begin
                if l[i]+r[i]-1 >= a[i] then
                    canh:=a[i]
                else continue;
                if res < int64(a[i]) * int64(canh) then
                    begin
                        res:=int64(a[i])*int64(canh);
                        len:=canh;
                    end;
            end;
        writeln(len);
    close(input); closE(output);
    end;
begin
    nhap;
    left;
    right;
    solve;
end.
