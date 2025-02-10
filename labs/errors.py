#x = input() user input ------ string all the time! -> input("give me....")


#part one:

serv_list = ["server1", "server2", "server3"]
user_input = input("Enter the server you want: ")    

try:
    if user_input in serv_list:
        print("good", user_input)
    else:
        raise ValueError
except ValueError:
    print("Error- this input not valid")
    raise

print("you chose", user_input)

#dict server active - active->yes/no error handle the error. 
server_dict = {"server1":"active", "server2":"active", "server3":"active"} 
user_input = input("Server Activity: print the server you want to check:")

for key in server_dict:
    print(key)
    try:
        if user_input == key : 
            print("server:", user_input, "is", server_dict[user_input])
            break
        else:
            raise KeyError
    except KeyError:
        print("Error- server not valid")
        raise

