const
    fin='';fon='';
    maxm=trunc(1e6);
    maxn=trunc(1e3);
type
    mang=array [0..maxm+1] of int64;
var
    a,pos,res:mang;
    n:longint;
procedure nhap;
    begin
        assigN(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n);
    end;
Function Sum(i:longint):int64;
    var
        x:int64;
    begin
        x:=int64(i);
        exit((x*(X+1) div 2));
    end;
procedure taomang;
    var
        i,j:longint;
        vitri:int64;
    begin
        for i:=1 to maxn do a[i]:=Sum(i)-i+1;
        for i:=1 to maxn do
            begin
                for j:=a[i] to a[i+1]-1 do pos[j]:=i;
            end;
        for i:=1 to maxm do
            begin
                if pos[i]=pos[i-1]+1 then
                    begin
                        vitri:=pos[i];
                        res[i]:=(res[i-1]+(vitri-(res[i-1] mod vitri)));
                    end
                else
                    begin
                        vitri:=pos[i];
                        res[i]:=res[i-1]+vitri;
                    end;
            end;
    end;
procedure solve;
    begin
        writeln(res[n]);
    close(input); close(output);
    end;
begin
    nhap;
    taomang;
    solve;
end.

