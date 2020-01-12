const
    fin='';fon='';
var
    free,kt:array [0..50] of boolean;
    x:array [0..50] of longint;
    a:array [0..500000,0..50] of longint;
    n,top:longint;
procedure nhap;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n);
        top:=0;
        x[1]:=1;
        kt[2]:=true;
        kt[3]:=true;
        kt[5]:=true;
        kt[7]:=true;
        kt[11]:=true;
        kt[13]:=true;
        kt[17]:=true;
        kt[19]:=true;
        kt[23]:=true;
        kt[29]:=true;
        kt[31]:=true;
        kt[37]:=true;
        kt[41]:=true;
    end;
procedure xuat;
    var
        i:longint;
    begin
        if kt[x[2*n]+1]=false then exit;
        inc(top);
        if top>10000 then exit;
        for i:=1 to 2*n do
            a[top,i]:=x[i];
    end;
procedure vet(i:longint);
    var
        j:longint;
    begin
        for j:=2 to 2*n do
            begin
                if (free[j]=false) and (kt[j+x[i-1]]=true) then
                    begin
                        x[i]:=j;
                        free[j]:=true;
                        if i=2*n then xuat
                        else vet(i+1);
                        free[j]:=false;
                    end;
            end;
    end;
procedure solve;
    var
        i,j:longint;
    begin
    	writeln(top);
        if top>10000 then top:=10000;
        for i:=1 to top do
            begin
                for j:=1 to 2*n do write(a[i,j],' ');
                writeln;
            end;
        close(input); close(output);
    end;
begin
    nhap;
    vet(2);
    solve;
end.
