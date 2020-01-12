uses math;
const
     fin='';fon='';
     maxn=trunc(2e6)+1;
     module=trunc(1e9)+7;
type
     mang=array [0..maxn] of int64;
var
     n,m:longint;
     a,b:ansistring;
     pow,hash1,hash2:mang;
procedure nhap;
     var
          i:longint;
     begin
          assign(input,fin);reset(input);
          assign(output,fon);rewrite(output);
          readln(n,m);
          readln(a);
          readln(b);
          pow[0]:=1;
          for i:=1 to maxn do pow[i]:=(pow[i-1]*26) mod module;
     end;
procedure init(s:ansistring;var hash:mang);
     var
          i:longint;
     begin
          hash[0]:=0;
          for i:=1 to lengtH(s) do
               hash[i]:=(hash[i-1]*26+(ord(s[i])-97)) mod module;
     end;
function Get(i,j:longint;var hash:mang):int64;
     begin
          exit((hash[j]-(hash[i-1]*pow[j-i+1]) mod module+module) mod module);
     end;
Function Check(x1,y1,x2,y2:longinT):boolean;
     begin
          if Get(x1,y1,hash1)=Get(x2,y2,hash2) then exit(true)
          else exit(false);
     end;
procedure solve(x1,y1,x2,y2:longint);
     var
          l,r,mid,res:longint;
     begin
          l:=1;
          r:=min(y1-x1+1,y2-x2+1);
          res:=0;
          repeat
               mid:=(l+r) div 2;
               if Check(x1,x1+mid-1,x2,x2+mid-1)=true then
                    begin
                         res:=mid;
                         l:=mid+1;
                    end
               else r:=mid-1;
          until l>r;
          x1:=x1+res;
          x2:=x2+res;
          if (x1=y1+1) and (x2=y2+1) then
               write('=')
          else
          if (x1=y1+1) and (x2<y2+1) then
               write('<')
          else
          if (x1<=y1) and (x2=y2+1) then
               write('>')
          else
          if a[x1]<b[x2] then
               write('<')
          else
          if a[x1]>b[x2] then
               write('>')
          else write('=');
     end;
procedure xuat;
     var
          i,q,x1,y1,x2,y2:longint;
     begin
          readln(q);
          for i:=1 to q do
               begin
                    readln(x1,y1,x2,y2);
                    solve(x1,y1,x2,y2);
               end;
          close(input); close(output);
     end;
begin
     nhap;
     init(a,hash1);
     init(b,hash2);
     xuat;
end.
