var
        i,t,n,k,d,dodai,max,o:longint;
        a,c:array [0..10000000] of longint;
procedure nhap;
        begin
        readln(t);
        end;
procedure xuli;
        begin
        for o:=1 to t do
                begin
                readln(n,k);
                d:=0;
                for i:=1 to n do
                        begin
                        read(a[i]);
                        if a[i]=0 then
                                begin
                                inc(d);
                                c[d]:=i;
                                end;
                        end;
                readln;
                c[0]:=0;
                c[d+1]:=n+1;
                max:=0;
                for i:=1 to d-k+1 do
                        begin
                        dodai:=c[i+k]-1-(c[i-1]+1)+1;
                        if dodai>max then max:=dodai;
                        end;
                writeln(max);
                end;
        end;
begin
nhap;
xuli;
end.

