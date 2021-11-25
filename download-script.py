import os


# Uses youtube-dl to download videos from a text file

# format: <folder> <video-link>



# Change filename here
file1 = open('download-list.txt', 'r')


Lines = file1.readlines()


for line in Lines:
    split_line = line.split(" ")

    folder_name = split_line[0]
    playlist_url = split_line[1]

    create_folder = "mkdir " + split_line[0]
    move_into_folder = "cd " + split_line[0]
    download_command = "youtube-dl -f bestaudio " + playlist_url

    final_command = ""

    if os.path.isdir(split_line[0]):
        final_command = move_into_folder + " && " + download_command + " && cd .."
    else:
        final_command = create_folder + " && " + move_into_folder + " && " + download_command + " && cd .."

    print()
    print(final_command)
    print()

    os.system(final_command)
