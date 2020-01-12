var
   n,h,top,t,i:longint;
   d:qword;
   stack,sl:array [1..500000] of longint;
procedure nhap;
   begin
   readln(n);
   end;
procedure push_stack;
   begin
   for i:=1 to n do
      begin
      readln(h);
      while (top>0) and (h>stack[top]) do
         begin
         inc(d,sl[top]); dec(top);
         end;
      if (top>0) and (h=stack[top]) then
         begin
         t:=sl[top]; inc(d,t); dec(top);
         end
      else t:=0;
      if top>0 then inc(d);
      inc(top); stack[top]:=h; sl[top]:=t+1;
      end;
   writeln(d);
   end;
begin
nhap;
push_stack;
end.

