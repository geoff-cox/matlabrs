function state = random_jerk_generator(state)

    data = state.data;
    random_jerk_indices = randperm(numel(data), state.j);
    state.jerks(random_jerk_indices) = true;
    state.data(random_jerk_indices) = -1;

end