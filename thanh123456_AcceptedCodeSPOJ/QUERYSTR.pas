const
        fin='';fon='';
var
        test:longint;
        z:array [1..trunc(1e7)] of longint;
procedure nhap;
        begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(test);
        end;
function min(a,b:longint):longint;
        begin
        if a<b then exit(a)
        else exit(b);
        end;
procedure ham_z(s:ansistring);
        var
                i,r,l,n:longint;
        begin
        l:=1; r:=1;
        n:=length(s);
        for i:=1  to n do z[i]:=0;
        for i:=2 to n do
                begin
                if i<=r then z[i]:=min(r-i+1,z[i-l+1]);
                while (i+z[i]<=n) and (s[z[i]+1]=s[i+z[i]]) do inc(z[i]);
                if i+z[i]-1>r then
                        begin
                        l:=i; r:=i+z[i]-1;
                        end;
                end;
        end;
procedure xuli;
        var
                s1,s:ansistring;
                i,n,x,q:longint;
        begin
        readln(s1);
        s:='';
        n:=length(s1);
        for i:=n downto 1 do s:=s+s1[i];
        ham_z(s);
        z[1]:=n;
        readln(q);
        for i:=1 to q do
                begin
                readln(x);
                writeln(z[n-x+1]);
                end;
        end;
procedure xuat;
        var
                i:longint;
        begin
        for i:=1 to test do xuli;
        close(input); close(output);
        end;
begin
nhap;
xuat;
end.
