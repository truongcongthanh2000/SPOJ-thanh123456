const
    fin='';fon='';
var
    b,n:longint;
procedure nhap;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(b,n);
    end;
function Check(m:longint):boolean;
    var
        ts,ms,s1,s2,s3:int64;
    begin
        s1:=0-m;
        s2:=b;
        s3:=m-2*n;
        ts:=s1*s2*s3;
        ms:=n;
        ms:=ms*ms;
        if ts mod ms=0 then exit(true)
        else exit(false);
    end;
procedure solve;
    var
        m,res:longint;
    begin
        res:=0;
        for m:=1 to 2*n-1 do
            if Check(m)=true then inc(res);
        writeln(res);
    close(input); close(output);
    end;
begin
    nhap;
    solve;
end.
