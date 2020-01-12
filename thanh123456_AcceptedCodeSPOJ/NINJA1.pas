const
    fin='';fon='';
var
    a,b:array [1..1000000] of int64;
    giatri,tam:int64;
    i,n,k,t:longint;
    kt:boolean;
procedure nhap;
    begin
    assigN(input,fin);reset(input);
    assign(output,fon);rewritE(output);
    readln(t);
    end;
function min(a,b:int64):int64;
    begin
    if a<b then exit(a)
    else exit(b);
    end;
function max(a,b:int64):int64;
    begin
    if a>b then exit(a)
    else exit(b);
    end;
procedure xuli;
    begin
    for k:=1 to t do
        begin
        readln(n);
        for i:=1 to n do read(a[i]);
        readln;
        for i:=1 to n do read(b[i]);
        readln;
        kt:=true;
        tam:=min(a[1],b[1]);
        for i:=2 to n do
            begin
            if (min(a[i],b[i])<tam) and (max(a[i],b[i])<tam) then
                begin
                kt:=false;
                break;
                end
            else
                begin
                if (min(a[i],b[i])>=tam) then
                    tam:=min(a[i],b[i])
                else
                    tam:=max(a[i],b[i]);
                end;
            end;
        if kt then writeln('YES')
        else writeln('NO');
        end;
    close(input);
    close(output);
    end;
begin
nhap;
xuli;
end.

