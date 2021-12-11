import config
import time
import socket
import requests
import json
#import censys


shodan_API_URL = "https://api.shodan.io"
censys_API_URL = "https://search.censys.io/api"

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
ShodanSearchString = censys_API_URL + "/v2/hosts/?key=" + config.Shodan_API_key

ShodanResponse = requests.get(ShodanSearchString)

def jprint(obj):
    # create a formatted string of the Python JSON object
    text = json.dumps(obj, sort_keys=True, indent=4)
    print(text)
# TODO - Drill down into the JSON for important informmation and get rid of cruft
jprint(ShodanResponse.json())


time.sleep(3)

print("Querying Censys")
# WIP - Probably need to switch to the Censys python library and delete this section
# CensysSearchString =  censys_API_URL + "/shodan/host/" + Target_IP + "?key=" + config.Censys_API_Key
# CensysResponse = requests.get(CensysSearchString)
# # jprint(CensysResponse.json())
# print(CensysResponse)

# TODO - Use the Censys python library to check (https://censys-python.readthedocs.io/en/stable/usage-v2.html)
# from censys.search import CensysHosts

# h = CensysHosts()

# # Fetch a specific host and its services
# host = h.view(Target_IP)
# print(host)

# # You can optionally pass in a RFC3339 timestamp to
# # fetch a host at the given point in time.
# # Please note historical API access is required.
# host = h.view(Target_IP, at_time="2021-03-01T17:49:05Z")
# print(host)

# # You can also pass in a date or datetime object.
# from datetime import date
# host = h.view(Target_IP, at_time=date(2021, 3, 1))
# print(host)

# TODO - Drill down into the response. Possibly write results to a new file for storing the investigation results