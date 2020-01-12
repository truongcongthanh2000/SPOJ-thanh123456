const
    fin='';fon='';
    maxn=trunc(2e6);
type
    mang=array [0..maxn] of longint;
var
    n,k,top:longint;
    a,stack,l,r:mang;
procedure nhap;
    var
        i:longint;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n,k);
        for i:=1 to n do read(a[i]);
    end;
procedure push(x:longint);
    begin
        inc(top);
        stack[top]:=x;
    end;
function Get:longint;
    begin
        exit(stack[top]);
    end;
procedure pop;
    begin
        stack[top]:=0;
        dec(top);
    end;
procedure Queue_Max;
    var
        i,res:longint;
        sl:int64;
    begin
        top:=0;
        for i:=1 to n do
            begin
                res:=0;
                while (top>0) and (a[get]<=a[i]) do
                    begin
                        res:=res+l[get];
                        pop;
                    end;
                push(i);
                l[i]:=res+1;
            end;
        top:=0;
        for i:=n downto 1 do
            begin
                res:=0;
                while (top>0) and (a[get]<a[i]) do
                    begin
                        res:=res+r[get];
                        pop;
                    end;
                push(i);
                r[i]:=res+1;
            end;
        sl:=0;
        for i:=1 to n do
            begin
                if a[i]=k then
                    sl:=int64(l[i])*int64(r[i])+sl;
            end;
        writeln(sl);
    close(input); close(outpuT);
    end;
begin
    nhap;
    Queue_Max;
end.


