const
    fin='';fon='';
var
    n:longint;
    f:array [0..4000,0..500] of string;
procedure nhap;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n);
    end;
function cong(a,b:string):string;
    var
        i,x,y,du,s:longint;
        c:string;
    begin
        while length(a)>length(b) do b:='0'+b;
        while length(a)<length(b) do a:='0'+a;
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
        if du=1 then c:='1'+c;
        exit(c);
    end;
procedure qhd;
    var
        i,j:longint;
        res:string;
    begin
        f[0,0]:='1';
        for i:=1 to n do
            for j:=1 to trunc(sqrt(2*i))+1 do
                begin
                    if j*(j+1)<=2*i then
                        f[i,j]:=cong(f[i-j,j-1],f[i-j,j])
                    else
                    break;
                end;
        res:='0';
        for i:=2 to trunc(sqrt(2*i))+1 do
            res:=cong(res,f[n,i]);
        writeln(res);
    close(input); close(output);
    end;
begin
    nhap;
    qhd;
end.

