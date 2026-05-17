function [selection] = HW5P2_my_ai_move_Clark(state)
global unresponsive

who = state.player;
new_state = [];
counter = 1;
counter2 = 0;
b = 0;
c = 0;
for i =1:9
    if state.data(i) == 0
        new_state(counter) = i;
        counter = counter+1;
    else
        counter2=counter2+1;
    end
end
checker1 = length(new_state);
new=state.data;
for a = 1:checker1
    new(new_state(a)) = who;
    if HW4P8_winner_check_Clark(new) == who
        selection = new_state(a);
        b = 1;
        c = 1;
        break
    else
        new(new_state(a)) = 0;
    end
end
if b == 1
else
    for d = 1:checker1
        new(new_state(d)) = -1*who;
        if HW4P8_winner_check_Clark(new) == -1*who
            selection = new_state(d);
            c = 1;
            break
        else
            new(new_state(d)) = 0;
        end
    end
end
last = 1;
if c == 1
else
inf_loop_counter = 0;
while last <= checker1
    inf_loop_counter = inf_loop_counter + 1;
    if inf_loop_counter > 1e6
        unresponsive = true;
        return
    end
    if new_state(last) == 1
        selection = 1;
        last = checker1+1;
    elseif new_state(last) == 3
        selection = 3;
        last = checker1+1;
    elseif new_state(last) == 7
        selection = 7;
        last = checker1+1;
    elseif new_state(last) == 9
        selection = 9;
        last = checker1+1;
    else
        last = last+1;
    end
    if last == checker1
          l = length(new_state);
    x = randi([1 l]);
    selection = new_state(x);
    end
end
end
end

%% HW 4 P 8
function [result] = HW4P8_winner_check_Clark(data)
answers = HW3P10_row_col_diag_sums_Clark(data);
la = length(answers);
result = 0;
for i =1:la
if answers(i) == 3
    result = 1;
elseif  answers(i) == -3
    result = -1;
end
end
end
%Hw3 P10
function [sum_list] = HW3P10_row_col_diag_sums_Clark(A)
% Smith KR helped me find my error with my anti-diag sum calculator.  I
% researched how to put different size vectors into the same vector until i
% realized thats not how that works and figured out how to do the actual
% thing on my own.
HH=A(1:end,1);
BB=length(HH);
CC=1;
DD=zeros(1:BB);
inf_loop_counter = 0;
while CC<=BB
    inf_loop_counter = inf_loop_counter + 1;
    if inf_loop_counter > 1e6
        unresponsive = true;
        return
    end
    DD(CC)=sum(A(CC,1:end));
    CC=CC+1;
end
GG=A(1,1:end);
II=length(GG);
Mac=length(GG);
JJ=[];
FF=1;
inf_loop_counter = 0;
while FF <= II
    inf_loop_counter = inf_loop_counter + 1;
    if inf_loop_counter > 1e6
        unresponsive = true;
        return
    end
    JJ(FF)=sum(A(1:end,FF));
    FF=FF+1;
end
LL=1;
MM=0;
if BB >II
    Aa=II;
else 
    Aa=BB;
end
inf_loop_counter = 0;
while LL <=Aa
    inf_loop_counter = inf_loop_counter + 1;
    if inf_loop_counter > 1e6
        unresponsive = true;
        return
    end
    MM=MM+A(LL,LL);
    LL=LL+1;
end
OO=0;
PP=1;
x=0;
inf_loop_counter = 0;
while x==0
    inf_loop_counter = inf_loop_counter + 1;
    if inf_loop_counter > 1e6
        unresponsive = true;
        return
    end
if II >0 && PP <=BB
    OO=OO+A(PP, II);
    II=II-1;
    PP=PP+1;
    x=0;
else
    x=1;
end
end
Cc=1;
Dd=[];
inf_loop_counter = 0;
while Cc<=BB
    inf_loop_counter = inf_loop_counter + 1;
    if inf_loop_counter > 1e6
        unresponsive = true;
        return
    end
    Dd(Cc)=DD(Cc);
    Cc=Cc+1;
end
Ff=1;
inf_loop_counter = 0;
while Cc <=Mac+BB
    inf_loop_counter = inf_loop_counter + 1;
    if inf_loop_counter > 1e6
        unresponsive = true;
        return
    end
    Dd(Cc)=JJ(Ff);
    Ff=Ff+1;
    Cc=Cc+1;
end
Dd(Cc)=MM;
Dd(Cc+1)=OO;
sum_list=pagetranspose(Dd);
end
