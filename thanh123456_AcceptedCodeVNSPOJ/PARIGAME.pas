const
   fin='';fon='';
   maxn=501;
var
   n,test:longint;
   f:array [0..maxn,0..maxn] of int64;
   kt:array [0..maxn,0..maxn] of boolean;
procedure nhap;
   begin
      assigN(input,fin);reset(input);
      assign(output,fon);rewritE(output);
      readln(test);
   end;
procedure docdulieu;
   var
      i,j,x:longint;
      //x:int64;
   begin
      readln(n);
      for i:=1 to n do
         begin
         for j:=1 to n do
            begin
               read(x);
               f[i,j]:=f[i-1,j]+f[i,j-1]-f[i-1,j-1]+x;
            end;
         readln;
         end;
   end;
procedure init;
   var
      i:longint;
   begin
      fillchar(kt,sizeof(kt),false);
      for i:=1 to n do
         begin
            if f[1,i] mod 2=0 then kt[1,i]:=true
               else kt[1,i]:=false;
            if f[i,1] mod 2=0 then kt[i,1]:=true
               else kt[i,1]:=false;
         end;
   end;
procedure qhd;
   var
      i,j:longint;
      cot,dong:int64;
   begin
      for i:=1 to n do
         begin
            for j:=1 to n do
               begin
                  dong:=f[i,j]-f[i-1,j];
                  cot:=f[i,j]-f[i,j-1];
                  if ((dong mod 2=0) and (kt[i-1,j]=false))
                  or ((cot mod 2=0) and (kt[i,j-1]=false)) then kt[i,j]:=true
                     else kt[i,j]:=false;
               end;

         end;
   end;
procedure xuat;
   begin
      if kt[n,n]=true then writeln('YES')
      else writeln('NO');
   end;
procedure xuli;
   var
      i:longint;
   begin
      for i:=1 to test do
         begin
            docdulieu;
            //init;
            qhd;
            xuat;
         end;
   close(input); close(output);
   end;
begin
   nhap;
   xuli;
end.

