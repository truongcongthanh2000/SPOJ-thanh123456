const
   fin='';fon='';
var
   x,y,c,i,n,minx,miny,maxx,maxy,x1,x2,dem,k:longint;
   kt:Array [-200..200,-200..200] of boolean;
   mau:array [-200..200,-200..200] of longint;
   SoCapmau:array [1..4,1..4] of longint;
procedure nhap;
   begin
   assigN(input,fin);reset(input);
   assigN(output,fon);rewrite(output);
   readln(n);
   minx:=maxlongint;
   miny:=maxlongint;
   maxx:=-minx;
   maxy:=-miny;
   for i:=1 to n do
      begin
      readln(x,y,c);
      kt[x,y]:=true;
      mau[x,y]:=c;
      if x>maxx then maxx:=x;
      if x<minx then minx:=x;
      if y>maxy then maxy:=y;
      if y<miny then miny:=y;
      end;
   end;
function min(a,b:longint):longint;
   begin
   if a<b then exit(a)
   else exit(b);
   end;
function max(a,b:longint):longint;
   begin
   if a>b then exit(a)
   else exit(b);
   end;
procedure xuli; ///xet moi cap Hoanh do dem tat ca cac cap dinh
                ///tren moi cap Hoanh do do sao cho khac mau
   begin
   dem:=0;
   for x1:=minx to maxx-1 do
      begin
      for x2:=x1+1 to maxx do
         begin
         fillchar(SoCapmau,sizeof(SoCapmau),0);
         for k:=miny to maxy do
            begin
            ////kiem tra cap dinh co khac mau khong.Neu phai thi tang so cap mau
            if (mau[x1,k]>0) and (mau[x2,k]>0) and (mau[x1,k]<>mau[x2,k]) then
               ///uu tien mau nho dung truoc, mau lon dung sau
               inc(SoCapmau[min(mau[x1,k],mau[x2,k]),max(mau[x1,k],mau[x2,k])]);
            end;
         //cap nhat lai ket qua
         inc(dem,Socapmau[1,2]*SoCapmau[3,4]+Socapmau[1,3]*socapmau[2,4]+socapmau[1,4]*socapmau[2,3]);
         end;
      end;
   writeln(dem);
   end;
begin
nhap;
xuli;
end.


