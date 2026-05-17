%HW5P2_my_ai_move_smithc
function selection=HW5P2_my_ai_move_smithc(game_state)
global unresponsive
E=game_state.data;
k=1;
c=0;
i=1;
M=zeros(1,9);
P=game_state.player;
inf_loop_counter = 0;
while k<=9
    inf_loop_counter = inf_loop_counter + 1;
    if inf_loop_counter > 1e6
        unresponsive = true;
        return
    end
    if E(k)== 0
        M(i)=k;
        i=i+1;
        k=k+1;
        c=c+1;
    else
        k=k+1;
    end
end
M(c+1:end)=[];
l=length(M);
GM=game_state.data;
T= GM(6);

 
for h=1:l
   GM=game_state.data;
   GM(M(h))= P;
   W=HW4P8_winner_check_smithc(GM);
   
   if W==P
       selection=M(h);
        GM=game_state.data;
        return
        
   else 
        GM=game_state.data;
   end 
end 
for n=1:l
     GM=game_state.data;
     GM(M(n))= -1*P;
     W=HW4P8_winner_check_smithc(GM);
    if W==true 
        selection=M(n);
        return
    else
        GM=game_state.data;
    end
end 

   if GM(6)==0
        selection= 6;
        return
    else 
      GM=game_state.data ;
   end
    
 for j=1:l
     if GM(1)==0
         selection=1;
     elseif GM(7)==0
         selection=7;
     elseif GM(3)== 0
         selection=3 ;
     elseif GM(9)==0
         selection=9;
     else 
         for z=1:l
     GM=game_state.data ;
    if c==0
        selection=[];   
    else
    L=length(M);
    R=randi(L);
    selection=M(R);
    end
         end
end 
 end

end







%HW4P8_winner_check_smithc
function result=HW4P8_winner_check_smithc(data)
M=data;
if M(1)==1 && M(4)==1 && M(7)==1
    result=1; 
elseif M(2)==1 && M(5)==1 && M(8)==1
    result=1;
elseif M(3)==1 && M(6)==1 && M(9)==1
    result=1;
elseif M(1)==1 && M(2)==1 && M(3)==1
    result=1;
elseif M(4)==1 && M(5)==1 && M(6)==1
    result=1;
elseif M(7)==1 && M(8)==1 && M(9)==1
    result=1;
elseif M(1)==1 && M(5)==1 && M(9)==1
    result=1;
elseif M(7)==1 && M(5)==1 && M(3)==1
    result=1;
elseif M(1)==-1 && M(4)==-1 && M(7)==-1
    result=-1;
elseif M(2)==-1 && M(5)==-1 && M(8)==-1
    result=-1;
elseif M(3)==-1 && M(6)==-1 && M(9)==-1
    result=-1;
elseif M(1)==-1 && M(2)==-1 && M(3)==-1
    result=-1;
elseif M(4)==-1 && M(5)==-1 && M(6)==-1
    result=-1;
elseif M(7)==-1 && M(8)==-1 && M(9)==-1
    result=-1;
elseif M(1)==-1 && M(5)==-1 && M(9)==-1
    result=-1;
elseif M(7)==-1 && M(5)==-1 && M(3)==-1
    result=-1;
else 
    
    result=0;
end
end 
