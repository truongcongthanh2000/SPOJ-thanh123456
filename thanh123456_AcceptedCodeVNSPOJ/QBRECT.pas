const
    fin='';fon='';
var
    c:array [0..2000,0..2000] of longint;
    a,stack,l,r:array [0..2000] of longint;
    n,m,top:longint;
procedure nhap;
    var
        i,j:longint;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n,m);
        for i:=1 to n do
            for j:=1 to m do read(c[i,j]);
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
procedure solve;
    var
        i,j,DienTich,res:longint;
    begin
        DienTich:=0;
        for i:=1 to n do
            begin
                for j:=1 to m do
                    if c[i,j]=1 then  inc(a[j])
                    else a[j]:=0;
                top:=0;
                l[1]:=1;
                push(1);
                for j:=2 to m do
                    begin
                        res:=0;
                        while (top>0) and (a[get]>=a[j]) do
                            begin
                                res:=res+l[get];
                                pop;
                            end;
                        l[j]:=res+1;
                        push(j);
                    end;
                r[m]:=1;
                top:=0;
                push(m);
                for j:=m-1 downto 1 do
                    begin
                        res:=0;
                        while (top>0) and (a[get]>=a[j]) do
                            begin
                                res:=res+r[get];
                                pop;
                            end;
                        r[j]:=res+1;
                        push(j);
                    end;
                 for j:=1 to m do
                    begin
                        if DienTich< a[j]*(r[j]+l[j]-1) then
                            DienTich:=a[j]*(r[j]+l[j]-1);
                    end;
                end;
        writeln(DienTich);
    close(input); close(output);
    end;
begin
    nhap;
    solve;
end.



