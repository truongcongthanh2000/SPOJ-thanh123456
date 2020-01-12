///left[i] la vi tri ben trai xa nhat ma a[i]<=a[left[i]];
///right[i] la vitri ben phai xa nhat ma a[i]<=a[right[i]];
const
    fin='';fon='';
    maxn=trunc(1e5);
type
    mang=array [0..maxn] of longint;
var
    test,n,top:longint;
    a,l,r,stack:mang;
procedure nhap;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(test);
    end;
procedure nhapdulieu;
    var
        i:longint;
    begin
        readln(n);
        for i:=1 to n do read(a[i]);
    end;
procedure push(x:longinT);
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
procedure qhd_left;
    var
        i,res:longint;
    begin
        top:=0;
        push(1);
        l[1]:=1;
        for i:=2 to n do
            begin
                res:=0;
                while (a[get]>=a[i]) and (top>0) do
                    begin
                        res:=res+l[get];
                        pop;
                    end;
                push(i);
                l[i]:=res+1;
            end;
    end;
procedure qhd_right;
    var
        i,res:longint;
    begin
        top:=0;
        push(n);
        r[n]:=1;
        for i:=n-1 downto 1 do
            begin
                res:=0;
                while (a[get]>=a[i]) and (top>0) do
                    begin
                        res:=res+r[get];
                        pop;
                    end;
                push(i);
                r[i]:=res+1;
            end;
    end;
procedure xuat;
    var
        i,res,left,right:longint;
    begin
        res:=0;
        left:=0;
        right:=0;
        for i:=1 to n do
            begin
                if res<a[i]*(r[i]+l[i]-1) then
                    begin
                        res:=a[i]*(r[i]+l[i]-1);
                        left:=i-l[i]+1;
                        right:=i+r[i]-1;
                    end;
            end;
        writeln(res,' ',left,' ',right);
    end;
procedure solve;
    var
        i:longint;
    begin
        for i:=1 to test do
            begin
                nhapdulieu;
                qhd_left;
                qhd_right;
                xuat;
            end;
        close(input); closE(output);
    end;
begin
    nhap;
    solve;
end.



