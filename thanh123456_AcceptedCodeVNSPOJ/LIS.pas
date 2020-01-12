Const
   fin='';fon='';
		maxn=10000000;
Var
		f,a:array[0..maxn] of longint;
		k,n,i:longint;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(n);
   for i:=1 to n do read(a[i]);
   end;
function	tknp(i : longint):longint;
	var
		d,c,mid : longint;
	begin
		d:=1; c:= k;
		while d < c do
		begin
			mid:=(d + c) div 2;
			if a[f[mid]] >= a[i] then c:=mid else d:=mid+1;
		end;
		exit(d);
	end;
procedure	xuli;
	begin
		f[1]:= 1;
		k:=1;
		for i:= 2 to n do
			if a[i] > a[f[k]] then
			begin
				inc(k);
				f[k] := i;
			end else f[tknp(i)]:=i;
		writeln(k);
   close(input);
   close(output);
	end;
BEGIN
      nhap;
		xuli;
END.
