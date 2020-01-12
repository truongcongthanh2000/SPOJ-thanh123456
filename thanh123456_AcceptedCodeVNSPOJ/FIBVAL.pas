const
        fin='';fon='';
var
        test,l,r:longint;
procedure nhap;
        begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(test);
        end;
procedure xuli(l,r:longint);
        var
                tam,dai:longint;
        begin
        dai:=r-l+1;
        tam:=dai div 16;
        if tam>=2 then
                begin
                writeln(tam*16);
                exit;
                end;
        l:=l mod 16;
        if l=0 then l:=16;
        r:=r mod 16;
        if r=0 then r:=16;
        if dai>8 then writeln(2)
        else
        if ((l<=8) and (r>8)) or ((l>8) and (r<=8)) then writeln(2)
        else writeln(-1);
        end;
procedure xuat;
        var
                i:longint;
        begin
        for i:=1 to test do
                begin
                readln(l,r);
                xuli(l,r);
                end;
        close(input);
        close(output);
        end;

begin
nhap;
xuat;
end.


