const
    fin='';fon='';
var
    test,n,k,top,bot:longint;
    stack,a:array [0..trunc(1e5)] of longint;
procedure nhap;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(test);
    end;
procedure docdulieu;
    var
        i:longint;
    begin
        readln(n,k);
        for i:=1 to n do read(a[i]);
    end;
procedure push(i:longint);
    begin
        inc(top);
        stack[top]:=i;
    end;
procedure pop_cuoi;
    begin
        stack[top]:=0;
        dec(top);
    end;
function get_cuoi:longint;
    begin
        exit(stack[top]);
    end;
function get_dau:longint;
    begin
        exit(stack[bot]);
    end;
procedure pop_dau;
    begin
        inc(bot);
    end;
procedure De_Queue;
    var
        i:longint;
    begin
        top:=0;
        bot:=1;
        for i:=1 to k-1 do
            begin
                while (top>=bot) and (a[get_cuoi]>=a[i]) do pop_cuoi;
                push(i);
            end;
        for i:=k to n do
            begin
                while (top>=bot) and (a[get_cuoi]>=a[i]) do pop_cuoi;
                push(i);
                if get_dau+k<=i then pop_dau;
                write(a[get_dau],' ');
            end;
    end;
procedure xuat;
    var
        i:longint;
    begin
        for i:=1 to test do
            begin
                docdulieu;
                De_queue;
                writeln;
            end;
    close(input); close(output);
    end;
begin
    nhap;
    xuat;
end.



