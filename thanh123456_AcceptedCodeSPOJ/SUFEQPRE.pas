const
        fin='';fon='';
var
        test:longint;
        z:array [1..trunc(1e7)] of longint;
procedure nhap;
        begin
        assigN(input,fin);reset(input);
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
                i,l,r:longint;
        begin
        l:=1; r:=1;
        for i:=1 to length(s) do z[i]:=0;
        for i:=2 to length(s) do
                begin
                if i<=r then z[i]:=min(r-i+1,z[i-l+1]);
                while (i+z[i]<=length(s)) and (s[z[i]+1]=s[z[i]+i]) do inc(z[i]);
                if i+z[i]-1>r then
                        begin
                        l:=i;
                        r:=i+z[i]-1;
                        end;
                end;
        end;
procedure xuli(k:longint;var s:ansistring);
        var
                i,n,dem:longint;
        begin
        ham_z(s);
        dem:=0;
        n:=length(s);
        for i:=2 to n do
                begin
                if (z[i]<>0) and (i+z[i]=n+1) then inc(dem);
                end;
        writeln('Case ',k,': ',dem);
        end;
procedure xuat;
        var
                i:longint;
                s:ansistring;
        begin
        for i:=1 to test do
                begin
                readln(s);
                xuli(i,s);
                end;
        close(input); close(output);
        end;
begin
nhap;
xuat;
end.


