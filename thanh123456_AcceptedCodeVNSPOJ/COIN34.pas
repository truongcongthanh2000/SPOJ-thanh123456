const
     fin='';fon='';
     N = trunc(2e6);
     maxn = 2000000000;
type
     mang=array [0..N] of int64;
var
     w,stk1,stk2,a,b:mang;
     test,s2,top,top1,pos:longint;
     s1:int64;
function max(a,b:longinT):longint;
     begin
          if A>b then exit(a)
          else exit(b);
     end;
procedure nhap;
     var
          i:longint;
     begin
          assign(input,fin);reset(input);
          assign(output,fon);rewritE(output);
          readln(test);
          w[1]:=2;
          w[2]:=3;
          w[3]:=5;
          for i:=4 to 34 do w[i]:=w[i-1]+w[i-2]+w[i-3];
     end;
procedure xuli;
     begin
          if s1<>0 then
               begin
                    inc(top);
                    stk1[top]:=s1;
                    stk2[top]:=s2;
               end;
     end;
procedure swap(var x,y:int64);
     var
          tam:int64;
     begin
          tam:=x; x:=y; y:=tam;
     end;
procedure qsort(l,r:longint;var a,b:mang);
     var
          i,j,x,m,y:longint;
     begin
          i:=l; j:=r;
          m:=random(r-l)+l+1;
          x:=a[m];
          y:=b[m];
          repeat
               while (a[i]<x) or ((a[i]=x) and (b[i]<y)) do inc(i);
               while (a[j]>x) or ((a[j]=x) and (b[j]>y)) do dec(j);
               if i<=j then
                    begin
                         swap(a[i],a[j]);
                         swap(b[i],b[j]);
                         inc(i); dec(j);
                    end;
          until i>j;
          if l<j then qsort(l,j,a,b);
          if i<r then qsort(i,r,a,b);
     end;
procedure vet(i:longint);
     var
          j:longint;
     begin
          for j:=0 to 1 do
               begin
                    if (j=1) and (s1+w[i]<=maxN) then
                         begin
                              s1:=s1+w[i];
                              inc(s2);
                              if (i=pos) then xuli
                              else vet(i+1);
                              s1:=s1-w[i];
                              dec(s2);
                         end
                    else
                         begin
                              if (i=pos) then xuli
                              else vet(i+1);
                         end;
               end;
     end;
procedure taomang;
     var
          i:longint;
     begin
          top:=0;
          s1:=0;
          s2:=0;
          pos:=18;
          vet(1);
          for i:=1 to top do
               begin
                    a[i]:=stk1[i];
                    b[i]:=stk2[i];
               end;
          top1:=top;
          top:=0;
          s1:=0;
          s2:=0;
          pos:=34;
          vet(19);
          qsort(1,top1,a,b);
          qsort(1,top,stk1,stk2);
     end;
function tknp(x:longint):longint;
     var
          l,r,mid,res:longint;
     begin
          res:=0;
          l:=1;
          r:=top1;
          repeat
               mid:=(l+r) div 2;
               if (a[mid]=x) then res:=mid;
               if (a[mid]<=x) then l:=mid+1
               else r:=mid-1;
          until l>r;
          exit(res);
     end;
procedure solve;
     var
          i,t,x,res,vitri:longint;
     begin
          for t:=1 to test do
               begin
                    readln(x);
                    res:=-1;
                    for i:=0 to top do
                         begin
                              if (stk1[i] > x) then break;
                              if (stk1[i]=x) then res:=max(res,stk2[i]);
                              vitri:=tknp(x-stk1[i]);
                              if (vitri=0) then continue;
                              res:=max(res,b[vitri]+stk2[i]);
                         end;
                    writeln('Case #',t,': ',res);
               end;
     end;
begin
     nhap;
     taomang;
     solve;
end.

