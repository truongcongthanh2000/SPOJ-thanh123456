const
        fin='';fon='';
var
        n,i,j,k:longint;
        s:string;
        f1:array [0..100000] of longint;
        f:array [1..255,1..255] of boolean;
procedure nhap;
        begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(s);
        n:=length(s);
        end;
procedure taomang;
        begin
        fillchar(f,sizeof(f),falsE);
        for i:=1 to n do f[i,i]:=true;
        for i:=n-1 downto 1 do
                begin
                for j:=i+1 to n do
                        begin
                        if (s[i]=s[j]) then
                                begin
                                if j=i+1 then f[i,j]:=true
                                else
                                if f[i+1,j-1]=true then f[i,j]:=true;
                                end;
                        end;
                end;
        {for i:=1 to n do
                begin
                for j:=1 to n do
                        begin
                        if f[i,j]=true then write(1,' ')
                        else write(0,' ');
                        end;
                writeln;
                end; }
        end;
function min(a,b:longint):longint;
        begin
        if a<b then exit(a)
        else exit(b);
        end;
procedure solve;
        begin
        f1[0]:=0;
        for i:=1 to n do
                begin
                f1[i]:=i;
                for j:=1 to i do
                        begin
                        if f[j,i]=true then f1[i]:=min(f1[i],f1[j-1]+1);
                        end;
                end;
        writeln(f1[n]);
        close(input);
        close(output);
        end;
begin
nhap;
taomang;
solve;
end.
