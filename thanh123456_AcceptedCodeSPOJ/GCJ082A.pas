uses math;
const
    fin='';fon='';
    maxn=trunc(1e5);
    maxm=trunc(1e9);
type
    mang1=array [0..maxn] of longint;
    mang2=array [0..maxn,0..1] of longint;
var
    test,n,v,m:longint;
    ts,kt,bac,h:mang1;
    f:mang2;
procedure nhap;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(test);
    end;
procedure taomang;
    var
        i:longint;
    begin
        readln(n,v);
        for i:=1 to n+1 do
            begin
                h[i]:=0;
                bac[i]:=0;
                ts[i]:=0;
                kt[i]:=0;
            end;
        for i:=1 to (n-1) div 2 do
            begin
                readln(ts[i],kt[i]);
                if i=1 then continue;
            end;
        for i:=(n-1) div 2+1 to n do
            begin
                readln(ts[i]);
                bac[i]:=1;

            end;
        for i:=1 to n do
            begin
                f[i,0]:=n;
                f[i,1]:=n;
            end;
    end;
procedure dfs(i:longint);
    var
        s1,s2,s3,s:longint;
    begin
        if bac[i]=1 then
            begin
                f[i,ts[i]]:=0;
                exit;
            end;
        dfs(i*2);
        dfs(i*2+1);
        if ts[i]=1 then
            begin
                s1:=f[i*2,0]+f[i*2+1,0];
                s2:=f[i*2,0]+f[i*2+1,1];
                s3:=f[i*2,1]+f[i*2+1,0];
                s:=min(min(s1,s2),s3);
                f[i,0]:=min(f[i,0],s);
                f[i,1]:=min(f[i,1],f[i*2,1]+f[i*2+1,1]);
                if kt[i]=1 then
                    begin
                        f[i,0]:=min(f[i,0],f[i*2,0]+f[i*2+1,0]+1);
                        s1:=f[i*2,0]+f[i*2+1,1]+1;
                        s2:=f[i*2,1]+f[i*2+1,0]+1;
                        s3:=f[i*2,1]+f[i*2+1,1]+1;
                        s:=min(min(s1,s2),s3);
                        f[i,1]:=min(f[i,1],s);
                    end;
            end
        else
            begin
                f[i,0]:=min(f[i,0],f[i*2,0]+f[i*2+1,0]);
                s1:=f[i*2,0]+f[i*2+1,1];
                s2:=f[i*2,1]+f[i*2+1,0];
                s3:=f[i*2,1]+f[i*2+1,1];
                s:=min(min(s1,s2),s3);
                f[i,1]:=min(f[i,1],s);
                if kt[i]=1 then
                    begin
                        f[i,1]:=min(f[i,1],f[i*2,1]+f[i*2+1,1]+1);
                        s1:=f[i*2,0]+f[i*2+1,0]+1;
                        s2:=f[i*2,0]+f[i*2+1,1]+1;
                        s3:=f[i*2,1]+f[i*2+1,0]+1;
                        s:=min(min(s1,s2),s3);
                        f[i,0]:=min(f[i,0],s);
                    end;
            end;
    end;
procedure solve;
    var
        i:longint;
    begin
        for i:=1 to test do
            begin
                taomang;
                dfs(1);
                write('Case #',i,': ');
                if min(f[1,v],f[1,v])>=n then writeln('IMPOSSIBLE')
                else writeln(min(f[1,v],f[1,v]));
            end;
        close(input); close(output);
    end;
begin
    nhap;
    solve;
end.


