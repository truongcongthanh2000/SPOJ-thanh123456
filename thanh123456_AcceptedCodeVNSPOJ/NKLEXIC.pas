const
    fin='';fon='';
    maxn=100;
type
    mang=array [0..maxn] of int64;
var
    test,n,m:longint;
    s:int64;
    Chu:string;
    free:array [0..maxn] of boolean;
    f,c,x,d:mang;
procedure nhap;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(test);
    end;
procedure qhd;
    var
        i:longint;
    begin
        f[0]:=1;
        for i:=1 to m do f[i]:=f[i-1]*int64(n-m+i);
    end;
Function Check1(n:longint;var s:string):boolean;
    var
        i:longint;
    begin
        for i:=1 to n do d[i]:=0;
        for i:=1 to length(s) do
            begin
                if (ord(s[i])>n+96) then exit(false);
                if d[ord(s[i])-96]>=1 then exit(false);
                inc(d[ord(s[i])-96]);
            end;
        exit(true);
    end;
function Check2(vitri:longint):boolean;
    begin
        if f[m]<vitri then exit(false)
        else exit(true);
    end;
procedure xuli1;
    var
        i,j:longint;
        SoLan,dem:int64;
    begin
        for i:=1 to n do free[i]:=false;
        for i:=1 to m do
            begin
                Solan:=s div f[m-i];
                if s mod f[m-i]<>0 then Inc(SoLan);
                dem:=0;
                for j:=1 to n do
                    begin
                        if free[j]=false then inc(dem);
                        if dem=SoLan then break;
                    end;
                free[j]:=true;
                Dec(s,f[m-i]*(SoLan-1));
                c[i]:=j;
            end;
        for i:=1 to m do write(chr(c[i]+96));
        writeln;
    end;
procedure xuli2;
    var
        i,j:longint;
        s,dem,res:int64;
    begin
        for i:=1 to n do free[i]:=false;
        for i:=1 to m do x[i]:=ord(chu[i])-96;
        res:=1;
        for i:=1 to m do
            begin
                dem:=0;
                for j:=1 to x[i] do
                    if free[j]=false then inc(dem);
                res:=res+f[m-i]*(dem-1);
                free[x[i]]:=true;
            end;
        writeln(res);
    end;
procedure solve;
    var
        i:longint;
        code:integer;
        c:char;
    begin
        for i:=1 to test do
            begin
                readln(n,m);
                qhd;
                read(c);
                if c='P' then
                    begin
                        readln(Chu);
                        delete(Chu,1,1);
                        if Check1(n,Chu)=false then writeln('Incorrect data')
                        else xuli2;
                    end
                else
                    begin
                        readln(Chu);
                        Delete(Chu,1,1);
                        val(Chu,s,code);
                        if Check2(s)=false then writeln('Incorrect data')
                        else xuli1;
                    end;
            end;
        close(input); close(output);
    end;
begin
    nhap;
    solve;
end.

