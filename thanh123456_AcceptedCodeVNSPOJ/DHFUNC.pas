const
        fin='';fon='';
var
        f:array [1..501] of qword;
        s1,s2,s3,a,b,b1:qword;
        t:array [0..501,0..501] of qword;
        x,y,i,j,test,k:longint;
procedure nhap;
        begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(test);
        end;
function max(a,b:longint):longint;
	begin
	if a>b then exit(a)
	else exit(b);
	end;
procedure taomang;
        begin
        f[1]:=1;
        f[2]:=1;
        for i:=3 to max(x,y) do f[i]:=((f[i-1] mod b1)+(f[i-2] mod b1)) mod b1;
        end;
function ucln(x,y:qword):qword;
        var t:qword;
        begin
        t:=y mod x;
        while t<>0 do
                begin
                t:=x mod y;
                x:=y;
                y:=t;
                end;
        exit(x);
        end;
function nhan(a,b:qword):qword;
        begin
        if b=0 then exit(0);
        if b=1 then exit(a mod b1);
        if b mod 2=0 then
                exit(nhan(a,b div 2)*2 mod b1)
        else
                exit((nhan(a,b div 2)*2+a) mod b1);
        end;
procedure xuli;
        var i:longint;
        begin
        for i:=0 to x do t[i,0]:=i mod b1;
        for i:=0 to y do t[0,i]:=i mod b1;
        for i:=1 to x do
                begin
                for j:=1 to y do
                        t[i,j]:=(nhan(a,t[i-1,j])+nhan(b,t[i,j-1])+(f[ucln(i,j)] mod b1)) mod b1;
                end;
        end;

procedure xuat;
        begin
        for k:=1 to test do
                begin
                readln(x,y,a,b,b1);
            
                        begin
                        taomang;
                        xuli;
                        writeln(t[x,y]);
                        end;
                end;
        close(input);
        close(output);
        end;
begin
nhap;
xuat;
end.

