uses math;
const
  fi = '';
var
  a,b,cnt : array[0..2001] of longint;
  f : array[0..2001,0..511] of longint;
  dd : array[0..2001,0..511] of boolean;
  n,n1 : longint;

procedure enter;
  var
    i : longint;
  begin
    assign(input,fi);
    reset(input);
    readln(n);
    for i := 1 to n do
      read(b[i]);
    close(input);
  end;


procedure qsort(l,r : longint);
  var
    i,j,k,tmp : longint;
  begin
    i := l;
    j := r;
    k := b[l + random(r - l + 1)];
    while i < j do
      begin
        while b[i] < k do inc(i);
        while b[j] > k do dec(j);
        if i <= j then
          begin
            tmp := b[i];
            b[i] := b[j];
            b[j] := tmp;
            inc(i);
            dec(j);
          end;
      end;
    if l < j then qsort(l,j);
    if i < r then qsort(i,r);
  end;

function getbit(x,i : longint) : longint;
  begin
   exit(1 and (x shr (i - 1)));
  end;

function check(stt : longint) : boolean;
  begin
    if (getbit(stt,1) = 1) or (getbit(stt,8) = 1) or (getbit(stt,9) = 1) then exit(false);
    exit(true);
  end;

function batbit(x,i : longint) : longint;
  begin
    exit(x or (1 shl (i - 1)));
  end;

function sttnext(tt,stt,i : longint) : longint;
  var
    res,kc,j : longint;
  begin
    kc := a[i+1] - a[i];
    res := 0;
    for j := 0 to 9 - kc do
      if j = 0 then
        begin
          if tt = 1 then res := batbit(res,kc)
        end
      else
        if getbit(stt,j) = 1 then
          res := batbit(res,kc + j);
    exit(res);
  end;

procedure init;
  var
    i,j : longint;
  begin
    qsort(1,n);
    a[1] := b[1];
    j := 1;
    cnt[1]:=1;
    for i := 2 to n do
      if b[i] <> a[j] then
        begin
          inc(j);
          a[j] := b[i];
          cnt[j] := 1;
        end
      else inc(cnt[j]);
    n1:=j;
    a[n1+1] := high(longint)
  end;

function cal(i,stt: longint) : longint;
  var
    ff : longint;
  begin
    if dd[i,stt] then exit(f[i,stt]);
    dd[i,stt] := true;
    if i = n1 + 1 then
      ff := 0
    else
      begin
        ff := cal(i + 1,sttnext(0,stt,i)) + cnt[i];
        if check(stt) then
          ff := min(ff,cal(i + 1,sttnext(1,stt,i)));
      end;
    f[i,stt] := ff;
    exit(ff);
  end;

procedure print;
  begin
    writeln(cal(1,0));
  end;

begin
  enter;
  init;
  print;
end.