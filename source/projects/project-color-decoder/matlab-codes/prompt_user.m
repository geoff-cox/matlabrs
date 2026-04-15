function user_string = prompt_user()

    disp('Enter your four letter color guess. You can use the same color more than once.')
    disp('b = blue')
    disp('g = green')
    disp('r = red')
    
    user_string = input('y = yellow\n',"s");
    
    %valid_boolean = check_user_input(user_string);
    
end