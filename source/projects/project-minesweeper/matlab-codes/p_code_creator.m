% Create a p-code

filename = "jerksweeper.m";
file_dir = pwd;

if ~exist("p_codes","dir")
    mkdir("p_codes")
end

cd("p_codes")
pcode(file_dir + "\" + filename,"-R2022a")
cd(file_dir)