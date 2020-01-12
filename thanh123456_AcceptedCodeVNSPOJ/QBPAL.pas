const
    fin='';fon='';
    maxn=200;
type
    mang=array [0..maxn,0..maxn] of string;
var
    s:string;
    n:longint;
    f:mang;
procedure nhap;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewritE(output);
        readln(s);
        n:=length(s);
    end;
function Cong(a,b:string):string;
    var
        i,x,du,s,y:longint;
        c:string;
    begin
        while length(a)<length(b) do a:='0'+a;
        while length(a)>length(b) do b:='0'+b;
        c:=''; du:=0;
        for i:=length(a) downto 1 do
            begin
                x:=ord(a[i])-48;
                y:=ord(b[i])-48;
                s:=x+y+du;
                du:=s div 10;
                c:=chr(s mod 10+48)+c;
            end;
        if du=1 then c:='1'+c;
        exit(c);
    end;
function Tru(a,b:string):string;
    var
        i,x,y,du,s:longint;
        c:string;
     begin
        while length(a)<length(b) do a:='0'+a;
        while length(a)>length(b) do b:='0'+b;
        c:=''; du:=0;
        for i:=length(a) downto 1 do
            begin
                x:=ord(a[i])-48;
                y:=ord(b[i])-48;
                s:=x-y-du;
                if s<0 then
                    begin
                        du:=1;
                        s:=s+10;
                    end
                else du:=0;
                c:=chr(s+48)+c;
            end;
        while (length(c)>1) and (c[1]='0') do delete(c,1,1);
        exit(c);
     end;
procedure qhd;
    var
        i,j:longint;
    begin
        for i:=1 to n do f[i,i]:='1';
        for i:=n-1 downto 1 do
            begin
                for j:=i+1 to n do
                    begin
                        if s[i]=s[j] then
                            f[i,j]:=cong(cong(f[i+1,j],f[i,j-1]),'1')
                        else
                            f[i,j]:=tru(cong(f[i+1,j],f[i,j-1]),f[i+1,j-1]);
                    end;
            end;
        writeln(f[1,n]);
        {for i:=1 to n do
            begin
                for j:=1 to n do write(f[i,j],' ');
                writeln;
            end;}
    close(input); close(output);
    end;
begin
    nhap;
    qhd;
end.

