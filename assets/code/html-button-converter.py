## This function converts HTML Button Labels
def switch_html_button_labels(html_root, current_label, new_label):
    
    # import required libraries
    import re # regular expressions
    from os import walk # directory listings
    
    html_root = 'C:/Users/gcox/Google Drive/1--MATLAB_textbook/4--master_copy/matlab-ebook/BOOK-OUTPUT/'

    # get files from html_root
    filenames = next(walk(html_root), (None, None, []))[2]  # [] if no file

    # get chapter content
    html_files = []
    for file in filenames:
        if re.search('.html$',file) != None:
            html_files.append(file)

    for html_file in html_files:
        new_html_lines = []
        html_fid = open(html_root + html_file,"r")
        html_lines = html_fid.readlines()
        html_fid.close()

        write_file = False
        for line in html_lines:
            if re.search(r'Evaluate \(Octave\)',line) != None:
                write_file = True
                new_html_lines.append(re.sub(current_label, new_label, line))
            else:
                new_html_lines.append(line)

        if write_file:
            print('Updating: ' + html_file)
            html_fid = open(html_root + html_file,"w+")
            html_fid.writelines(new_html_lines)
            html_fid.close()