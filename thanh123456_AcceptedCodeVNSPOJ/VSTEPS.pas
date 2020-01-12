const
        fin='';
        fon='';
var
   i,n,k:longint;
   f,a:array [1..100000] of qword;
procedure nhap;
        begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n,k);
        for i:=1 to k do
                read(a[i]);
        end;
procedure xuli;
        begin
        fillchar(f,sizeof(f),1);
        for i:=1 to k do
            f[a[i]]:=0;
        if f[3]<>0 then
         begin
         if f[2]<>0 then f[3]:=2
         else f[3]:=1;
         end;
        if f[2]<>0 then f[2]:=1;
        for i:=4 to n do
         begin
         if f[i]<>0 then f[i]:=((f[i-1] mod 14062008)+(f[i-2] mod 14062008)) mod 14062008
         end;
        writeln(f[n]);
        close(input);
        close(output);
        end;
begin
nhap;
xuli;
end.




