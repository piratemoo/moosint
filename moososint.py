import webbrowser
import time
import socket

shodanWeb = "https://www.shodan.io/search?query=hostname%3A"

# Prints the header
with open('moosint.txt', 'r') as f:
    print(f.read())

print("")
print("A small google dorking/OSINT gathering script updated from goohak by moo and ednas")

time.sleep(3)

# Gathers the website the user is investigating
print("What website would you like to investigate?")
TARGET=input()

# Gets the Target's IP Address
Target_IP = socket.gethostbyname(TARGET)
print(f'The IP address of {TARGET} is: {socket.gethostbyname(TARGET)}')

# Opens Shodan.io in a web browser
print("opening shodan")
webbrowser.open_new(shodanWeb + TARGET)

time.sleep(3)

# TODO - look at moosin.sh to continue adding more services to this script



