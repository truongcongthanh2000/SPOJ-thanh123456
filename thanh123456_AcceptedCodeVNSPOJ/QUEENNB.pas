const
    fin='';fon='';
    maxn=1000;
type
    mang=array [0..maxn+1,0..maxn+1] of longint;
    mang2=array [1..maxn,1..maxn] of boolean;
var
    n,m:longint;
    hang,cot,cheo1,cheo2,f:mang;
    kt:mang2;
procedure nhap;
    var
        i,j:longint;
        c:char;
    begin
        assign(input,fin);reset(input);
        assigN(output,fon);rewrite(output);
        readln(n,m);
        for i:=1 to n do
            begin
                for j:=1 to m do
                    begin
                        read(c);
                        if c='#' then kt[i,j]:=true;
                    end;
                readln;
            end;
    end;
procedure QHD_1;
    var
        i,j:longint;
    begin
        for i:=1 to n do
            begin
                for j:=1 to m do
                    begin
                        if kt[i,j] then
                            begin
                                hang[i,j]:=0;
                                cot[i,j]:=0;
                                cheo1[i,j]:=0;
                                cheo2[i,j]:=0;
                                continue;
                            end;
                        hang[i,j]:=hang[i-1,j]+1;
                        cot[i,j]:=cot[i,j-1]+1;
                        cheo1[i,j]:=cheo1[i-1,j-1]+1;
                        cheo2[i,j]:=cheo2[i-1,j+1]+1;
                        f[i,j]:=hang[i,j]+cot[i,j]+cheo1[i,j]+cheo2[i,j]-3;
                    end;
            end;
        fillchar(hang,sizeof(hang),0);
        fillchar(cot,sizeof(cot),0);
        fillchar(cheo1,sizeof(cheo1),0);
        fillchar(cheo2,sizeof(cheo2),0);
    end;
procedure QHD_2;
    var
        i,j:longint;
    begin
        for i:=n downto 1 do
            begin
                for j:=m downto 1 do
                    begin
                        if kt[i,j] then
                            begin
                                hang[i,j]:=0;
                                cot[i,j]:=0;
                                cheo1[i,j]:=0;
                                cheo2[i,j]:=0;
                                continue;
                            end;
                        hang[i,j]:=hang[i+1,j]+1;
                        cot[i,j]:=cot[i,j+1]+1;
                        cheo1[i,j]:=cheo1[i+1,j+1]+1;
                        cheo2[i,j]:=cheo2[i+1,j-1]+1;
                        f[i,j]:=f[i,j]+hang[i,j]+cot[i,j]+cheo1[i,j]+cheo2[i,j]-4;
                    end;
            end;
    end;
procedure solve;
    var
        i,j:longint;
    begin
        for i:=1 to n do
            begin
                for j:=1 to m do write(f[i,j],' ');
            writeln;
            end;
        close(input); close(output);
    end;
begin
    nhap;
    QHD_1;
    QHD_2;
    solve;
end.

