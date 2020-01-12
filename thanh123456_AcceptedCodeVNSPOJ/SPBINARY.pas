const
    fin='';fon='';
    maxn=600;
type
    mang1=array [0..maxn] of string;
    mang2=array [0..maxn,0..1] of string;
var
    n,k:longint;
    mu:mang1;
    f:mang2;
procedure nhap;
    var
        i:longint;
    begin
        assign(input,fin);reset(input);
        assigN(output,fon);rewrite(output);
        readln(n,k);
    end;
function Cong(a,b:string):string;
    var
        i,x,y,du,s:longint;
        c:string;
    begin
        while length(a)<length(b) do a:='0'+a;
        while length(a)>length(b) do b:='0'+b;
        c:='';
        du:=0;
        for i:=length(a) downto 1 do
            begin
                x:=ord(a[i])-48;
                y:=ord(b[i])-48;
                s:=x+y+du;
                du:=s div 10;
                c:=chr(s mod 10+48)+c;
            end;
        if du=1 then C:='1'+c;
        exit(c);
    end;
function Tru(a,b:string):string;
    var
        i,x,y,du,s:longint;
        c:string;
    begin
        while length(a)<length(b) do a:='0'+a;
        while length(a)>length(b) do b:='0'+b;
        c:='';
        du:=0;
        for i:=length(a) downto 1 do
            begin
                x:=ord(a[i])-48;
                y:=ord(b[i])-48;
                s:=x-y-du;
                if s<0 then
                    begin
                        s:=s+10;
                        du:=1;
                    end
                else du:=0;
                c:=chr(s+48)+c;
            end;
        while (c[1]='0') and (length(c)>1) do delete(c,1,1);
        exit(c);
    end;
procedure init;
    var
        i:longint;
    begin
        mu[0]:='1';
        for i:=1 to k do
            mu[i]:=Cong(mu[i-1],mu[i-1]);
        f[0,0]:='1';
        f[0,1]:='1';
        for i:=1 to k do
            begin
                f[i,0]:=mu[i-1];
                f[i,1]:=mu[i-1];
            end;
    end;
procedure qhd;
    var
        i:longint;
    begin
        for i:=k+1 to n do
            begin
                f[i,0]:=Cong(f[i-1,1],f[i-1,0]);
                f[i,0]:=Tru(f[i,0],f[i-k-1,0]);
                f[i,1]:=Cong(f[i-1,0],f[i-1,1]);
                f[i,1]:=Tru(f[i,1],f[i-k-1,1]);
            end;
        writeln(cong(f[n,1],f[n,0]));
    closE(input); close(output);
    end;
begin
    nhap;
    init;
    qhd;
end.

