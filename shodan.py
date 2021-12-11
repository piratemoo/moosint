import config
import time
import socket
import requests
import json


shodan_API_URL = "https://api.shodan.io"

# Prints the header
with open('moosint.txt', 'r') as f:
    print(f.read())

print("")
print("A small google dorking/OSINT gathering script updated from goohak by moo and ednas")
print("CLI Tool that gathers information, requires API keys to be set up")
time.sleep(3)


# Gathers the website the user is investigating
print("What website would you like to investigate?")
TARGET=input()

# Gets the Target's IP Address
Target_IP = socket.gethostbyname(TARGET)
print(f'The IP address of {TARGET} is: {socket.gethostbyname(TARGET)}')

print("Querying shodan")
searchString = shodan_API_URL + "/shodan/host/" + Target_IP + "?key=" + config.Shodan_API_key

response = requests.get(searchString)

def jprint(obj):
    # create a formatted string of the Python JSON object
    text = json.dumps(obj, sort_keys=True, indent=4)
    print(text)

jprint(response.json())

print(response)

# TODO - Drill down into the response. Possibly write results to a new file for storing the investigation results