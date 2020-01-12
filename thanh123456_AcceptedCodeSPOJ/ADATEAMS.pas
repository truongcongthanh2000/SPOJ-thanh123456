const
    fin='';fon='';
    module=trunc(1e9)+7;
    maxn=trunc(1e6)+4;
var
    pow:array [0..maxn] of int64;
procedure nhap;
    var
        i:longint;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewritE(output);
        pow[0]:=1;
        for i:=1 to maxn do pow[i]:=(pow[i-1]*i) mod module;
    end;
function Mu(a,b:int64):int64;
    var
        tam:int64;
    begin
        if b=0 then exit(1);
        if b mod 2=1 then
            begin
                tam:=mu(a,b div 2);
                tam:=(tam*tam) mod module;
                exit((tam*a) mod module);
            end
        else
            begin
                tam:=mu(a,b div 2);
                tam:=(tam*tam) mod module;
                exit(tam);
            end;
    end;
function TinhChap(k,n:longint):int64;
    var
        ts,ms:int64;
    begin
        Ts:=pow[n] mod module;
        ms:=(pow[k]*pow[n-k]) mod module;
        exit((ts*(Mu(ms,module-2) mod module)) mod module);
    end;
procedure Xuli(n,a,b,d:longint);
    var
        Bo,res,x:int64;
    begin
        x:=TinhChap(d,b);
        Bo:=Mu(x,int64(a)) mod module;
        res:=(Bo*TinhChap(a,n)) mod module;
        writeln(res);
    end;
procedure solve;
    var
        n,a,b,d:longint;
    begin
        while not(eof(input)) do
            begin
                readln(n,a,b,d);
                xuli(n,a,b,d);
            end;
        close(input); close(output);
    end;
begin
    nhap;
    solve;
end.

