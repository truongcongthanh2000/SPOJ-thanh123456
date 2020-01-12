const
   fin='';fon='';
var
   cot,t,left,right,heap:array [0..trunc(1e7)] of longint;
   n,top:longint;
procedure nhap;
   var
      i:longint;
   begin
   assigN(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(n);
   for i:=1 to n do readln(cot[i],t[i]);
   end;
procedure swap(var x,y:longint);
   var
      tam:longint;
   begin
   tam:=x; x:=y; y:=tam;
   end;
procedure qsort(l,r:longint);
   var
      i,j,m,x:longint;
   begin
   i:=l; j:=r;
   m:=random(r-l)+1+l;
   x:=left[m];
   repeat
      while left[i]<x do inc(i);
      while left[j]>x do dec(j);
      if i<=j then
         begin
         swap(left[i],left[j]);
         swap(right[i],right[j]);
         inc(i); dec(j);
         end;
   until i>j;
   if l<j then qsort(l,j);
   if i<r then qsort(i,r);
   end;
procedure upHeap(i:longint);
   begin
   if (i=1) or (right[heap[i]]>right[heap[i div 2]]) then exit;
   swap(heap[i],heap[i div 2]);
   upHeap(i div 2);
   end;
procedure DownHeap(i:longint);
   var
      j:longint;
   begin
   j:=2*i;
   if j>top then exit;
   if (j<top) and (right[heap[j]]>right[heap[j+1]]) then inc(j);
   if right[heap[i]]>right[heap[j]] then
      begin
      swap(heap[i],heap[j]);
      DownHeap(j);
      end;
   end;
procedure push(x:longint);
   begin
   inc(top);
   heap[top]:=x;
   upHeap(top);
   end;
procedure pop;
   begin
   heap[1]:=heap[top];
   heap[top]:=0;
   dec(top);
   DownHeap(1);
   end;
function diduoc(time:longint):boolean;
   var
      i,j:longint;
   begin
   top:=0;
   for i:=1 to n do
      begin
      left[i]:=cot[i]-(time div t[i]);
      right[i]:=cot[i]+(time div t[i]);
      end;
   qsort(1,n);
   j:=1;
   for i:=1 to n do
      begin
      while (left[j]<=i) and (j<=n) do
         begin
         push(j); inc(j);
         end;
      if (top=0) or (right[heap[1]]<i) then exit(false);
      pop;
      end;
   exit(true);
   end;
procedure chat;
   var
      l,r,mid,kq:longint;
   begin
   l:=0; r:=trunc(1e8);
   repeat
      mid:=(l+r) div 2;
      if diduoc(mid)=true then begin kq:=mid; r:=mid-1; end
      else l:=mid+1;
   until l>r;
   writeln(kq);
   end;
begin
nhap;
chat;
end.

