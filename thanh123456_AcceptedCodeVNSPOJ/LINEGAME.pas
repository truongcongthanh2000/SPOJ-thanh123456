const
        fin='';fon='';
var
        n:longint;
        maxS,s,dem:int64;
        f:array [0..trunc(1e7),0..1] of int64;
        a,x:array [1..trunc(1e7)] of longint;
procedure nhap;
        var
                i:longint;
        begin
        assign(input,fin);reseT(input);
        assign(output,fon);rewrite(output);
        readln(n);
        for i:=1 to n do read(a[i]);
        maxS:=0; dem:=0; s:=0;
        end;
function max(a,b:int64):int64;
        begin
        if a>b then exit(a)
        else exit(b);
        end;
procedure QHD;  ///0:+ 1:-
        var
                i:longint;
        begin
        f[0,0]:=0; f[0,1]:=0;
        f[1,0]:=a[1]; f[1,1]:=0;
        for i:=2 to n do
                begin
                f[i,0]:=max(f[i-1,1]+a[i],f[i-1,0]);
                f[i,1]:=max(f[i-1,0]-a[i],f[i-1,1]);
                end;
        end;
procedure xulibo;
        var
                i,dem:longint;
        begin
        if s>maxS then maxS:=s;
        end;
procedure vet(i:longint);
        var
                j:longint;
        begin
        for j:=0 to 1 do
                begin
                x[i]:=j;
                if x[i]=1 then
                        begin
                        inc(dem);
                        if dem mod 2=1 then inc(s,a[i])
                        else dec(s,a[i]);
                        end;
                if i=n then xulibo
                else vet(i+1);
                if x[i]=1 then
                        begin
                        if dem mod 2=1 then dec(s,a[i])
                        else inc(s,a[i]);
                        dec(dem);
                        end;
                end;
        end;
procedure sinhtest;
        var
                i:longint;
        begin
        randomize;
        assign(output,fin);rewrite(output);
        n:=random(25)+1;
        writeln(n);
        for i:=1 to n do write(random(10000)+1,' ');
        close(output);
        end;
procedure xuat;
        begin
        writeln(max(f[n,0],f[n,1]));//,' ',maxS);
        close(input);
        close(output);
        end;
begin
//sinhtest;
nhap;
QHD;
//vet(1);
xuat;
end.


