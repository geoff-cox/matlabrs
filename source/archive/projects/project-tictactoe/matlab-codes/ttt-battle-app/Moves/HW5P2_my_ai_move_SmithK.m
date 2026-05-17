function [selection] = HW5P2_my_ai_move_SmithKR(game_state);
global unresponsive
LLL=HW3P10_row_col_diag_sums_SmithKR(game_state.data);
i=1;
L=9;
selection=0;
Y=1;
if game_state.player == 1
    inf_loop_counter = 0;
    while i<=8
        inf_loop_counter = inf_loop_counter + 1;
        if inf_loop_counter > 1e6
            unresponsive = true;
            return
        end
        if LLL(i) == 2
            k=1;
            Y=1;
           inf_loop_counter = 0;
           while k<=L
               inf_loop_counter = inf_loop_counter + 1;
               if inf_loop_counter > 1e6
                   unresponsive = true;
                   return
               end
               J=game_state.data(k);
               game_state.data(k) = 1;
               p=HW3P10_row_col_diag_sums_SmithKR(game_state.data);
               if p(i) == 3
                   s(Y)=k;
                   game_state.data(k)=J;
                   Y=Y+1;
                   k=k+1;
               else
                   game_state.data(k)=J;
                   k=k+1;
               end
           end
        end
        i=i+1;
    end
    if Y==1
        i=1;
    end
    inf_loop_counter = 0;
    while i<=8
        inf_loop_counter = inf_loop_counter + 1;
        if inf_loop_counter > 1e6
            unresponsive = true;
            return
        end
        if LLL(i) == -2
            k=1;
            Y=1;
           inf_loop_counter = 0;
           while k<=L
               inf_loop_counter = inf_loop_counter + 1;
               if inf_loop_counter > 1e6
                   unresponsive = true;
                   return
               end
               J=game_state.data(k);
               game_state.data(k) = -1;
               p=HW3P10_row_col_diag_sums_SmithKR(game_state.data);
               if p(i) == -3
                   s(Y)=k;
                   game_state.data(k)=J;
                   k=k+1;
                   Y=Y+1;
               else
                   game_state.data(k)=J;
                   k=k+1;
               end
           end
        end
        i=i+1;
    end
elseif game_state.player == -1
        inf_loop_counter = 0;
        while i<=8
            inf_loop_counter = inf_loop_counter + 1;
            if inf_loop_counter > 1e6
                unresponsive = true;
                return
            end
        if LLL(i) == -2
            k=1;
            Y=1;
           inf_loop_counter = 0;
           while k<=L
               inf_loop_counter = inf_loop_counter + 1;
               if inf_loop_counter > 1e6
                   unresponsive = true;
                   return
               end
               J=game_state.data(k);
               game_state.data(k) = -1;
               p=HW3P10_row_col_diag_sums_SmithKR(game_state.data);
               if p(i) == -3
                   s(Y)=k;
                   game_state.data(k)=J;
                   k=k+1;
                   Y=Y+1;
               else
                   game_state.data(k)=J;
                   k=k+1;
               end
           end
        end
        i=i+1;
    end
if Y==1;
    i=1;
end
    inf_loop_counter = 0;
    while i<=8
        inf_loop_counter = inf_loop_counter + 1;
        if inf_loop_counter > 1e6
            unresponsive = true;
            return
        end
        if LLL(i) == 2
            k=1;
            Y=1;
           inf_loop_counter = 0;
           while k<=L
               inf_loop_counter = inf_loop_counter + 1;
               if inf_loop_counter > 1e6
                   unresponsive = true;
                   return
               end
               J=game_state.data(k);
               game_state.data(k) = 1;
               p=HW3P10_row_col_diag_sums_SmithKR(game_state.data);
               if p(i) == 3
                   s(Y)=k;
                   game_state.data(k)=J;
                   Y=Y+1;
                   k=k+1;
               else
                   game_state.data(k)=J;
                   k=k+1;
               end
           end
        end
        i=i+1;
    end
end
if Y==2;
    selection=s;
end
if Y>2
    H=length(s);
    F=1;
    U=1;
    inf_loop_counter = 0;
    while U<=H
        inf_loop_counter = inf_loop_counter + 1;
        if inf_loop_counter > 1e6
            unresponsive = true;
            return
        end
        if s(F)<s(H-(U-1))
            U=U+1;
        elseif s(F)>s(H-(U-1))
            F=F+1;
            U=1;
        end
    end
    selection=s(F);
end
R=1;
if selection == 0
    if game_state.data(5) == 0 && R == 1
        selection = 5;
        R=2;
    end
    if game_state.data(1)==0 && R == 1
        selection = 1;
        R=2;
    end
    if game_state.data(3) == 0 && R == 1
        selection = 3;
        R=2;
    end
    if game_state.data(9) == 0 && R == 1
        selection = 9;
        R=2;
    end
    if game_state.data(7) == 0 && R == 1
        selection = 7;
        R=2;
    end
end

if selection == 0
    selection=HW4P9_dumb_ai_move_SmithKR(game_state);
end
end

function selection=HW4P9_dumb_ai_move_SmithKR(game_state);
k=1;
i=1;
j=1;
vector=[];
inf_loop_counter = 0;
while k==1
    inf_loop_counter = inf_loop_counter + 1;
    if inf_loop_counter > 1e6
        unresponsive = true;
        return
    end
    if game_state.data(i)==0
        vector(j)=i;
        i=i+1;
        j=j+1;
    else
        i=i+1;
    end
    if i>9
        k=2;
    end
end
L=length(vector);
if L==0
    selection=[];
else
random=randi(L);
selection=vector(random);
end
end
function [sum_list] = HW3P10_row_col_diag_sums_SmithKR(A);
i=1;
w=width(A);
h=height(A);
k=1;
inf_loop_counter = 0;
while k==1
    inf_loop_counter = inf_loop_counter + 1;
    if inf_loop_counter > 1e6
        unresponsive = true;
        return
    end
    if i<=h
        sum_row(i)=sum(A(i,:));
    end
    if i<=w
        sum_column(i)=sum(A(:,i));
    end
    if w>=i && h>=i
        diagonal(i)=A(i,i);
    end
    if h-i>=0 && w>=i
        pp=h-(i-1);
        adiagonal(i)=A(pp,i);
    end
     i=i+1;
    if i>h && i>w
        k=2;
    end
end
sum_diagonal=sum(diagonal);
sum_adiagonal=sum(adiagonal);
    Lr=length(sum_row);
    Lc=length(sum_column);
    Ld=length(sum_diagonal);
    La=length(sum_adiagonal);
    LLL=Lr+Lc+Ld+La;
    u=1;
    j=1;
    y=1;
    o=1;
    z=1;
    inf_loop_counter = 0;
    while u<=LLL
        inf_loop_counter = inf_loop_counter + 1;
        if inf_loop_counter > 1e6
            unresponsive = true;
            return
        end
        inf_loop_counter = 0;
        while j<=Lr
            inf_loop_counter = inf_loop_counter + 1;
            if inf_loop_counter > 1e6
                unresponsive = true;
                return
            end
        sum_list(u)=sum_row(j);
        j=j+1;
        u=u+1;
        end
        inf_loop_counter = 0;
        while y<=Lc
            inf_loop_counter = inf_loop_counter + 1;
            if inf_loop_counter > 1e6
                unresponsive = true;
                return
            end
        sum_list(u)=sum_column(y);
        y=y+1;
        u=u+1;
        end
        inf_loop_counter = 0;
        while o<=Ld
            inf_loop_counter = inf_loop_counter + 1;
            if inf_loop_counter > 1e6
                unresponsive = true;
                return
            end
        sum_list(u)=sum_diagonal(o);
        o=o+1;
        u=u+1;
        end
        inf_loop_counter = 0;
        while z<=La
            inf_loop_counter = inf_loop_counter + 1;
            if inf_loop_counter > 1e6
                unresponsive = true;
                return
            end
        sum_list(u)=sum_adiagonal(z);
        z=z+1;
        u=u+1;
        end
    end
sum_list=sum_list';
end

