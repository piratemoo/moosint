#!/bin/env/python

import requests
import tweepy
from moologo import logo
from bs4 import BeautifulSoup

print(logo)

menu = ["all", "facebook", "instagram", "linkedin", "mastodon", "twitter"]
choice = input("Please choose from one of the following options:\nall, facebook, instagram, linkedin, mastodon, twitter:\n")

if choice == menu[0]:
    print("You have picked all scans") 
    #TO-DO:
    #All scans congruently run after a user is input for search purposes
    
elif choice == menu[1]:
    print("You have picked facebook") 
    
    facebook_app_id = "xxx"
    # parameters = {
    #     "param1": test,
    #     "param2": test,
    # }
    # response = requests.get(url="http://api.open-notify.org/iss-now.json", params = parameters)
    # response.raise_for_status()
    # data = response.json()["iss_position"]["lattitude"]
    # print(data)
    # print(response)
    
elif choice == menu[2]:
    print("You have picked instagram")
      
    
elif choice == menu[3]:
    print("You have picked linkedin")
  
    
elif choice == menu[4]: 
    print("You have picked mastodon")
    
    #Mastodon keys and get requests
    mastodon_key="xx"
    mastodon_secret="xx"
    mastodon_token="xx"
    
    response = requests.get(f"https://mastodon.example/api/v1/statuses/:id")
    response.raise_for_status()
    
    #Scraping Mastodon example
    username = input("Please enter the username: ")
    response = requests.get(f"https://mastodon.social/{username}")
    reply = response.text
    soup = BeautifulSoup(reply, "html.parser")
    article_tag = soup.find(class_="account__header__content emojify")
    print(article_tag)
    
elif choice == menu[5]:
    print("You have picked twitter")
       
    #Twitter api keys and auth for tweepy
    twitter_key = "xx"
    twitter_secret = "xx"
    twitter_token = "xx"
    twitter_token_secret = "xx"

    auth = tweepy.OAuthHandler(twitter_key, twitter_secret)
    auth.set_access_token(twitter_token, twitter_token_secret)

    api = tweepy.API(auth) 
    
    #Get the user profile information
    user = api.get_user(screen_name="apiratemoo")
    print("The user id is:", user.id)
    print("The profile description is:", user.description)  
    print("Account creation:", user.created_at)
    
    #Prints the user block list 
    blocked_list = api.get_blocks(screen_name="apiratemoo")
    print("Blocked users:", len(blocked_list))  

    #Get the latest tweet/reply
    tweet = api.get_user(screen_name="apiratemoo")
    print(f"Most recent tweet: {tweet.status.text}")
    
    answer = input("Would you like to view the latest timeline? y/n: ")
    if answer == "y":
        public_tweets = api.home_timeline()
        for tweet in public_tweets:
            print(tweet.text)
    else:
        print(choice) 
    
    # print("Printing last 5 retweets")
    # retweets = api.get_retweets_of_me()
    # for tweet in retweets:
    #     print(tweet.text)
    
else:
    print("You have picked an invalid option")

# Gathers the website the user is investigating
#print("What website would you like to investigate?")
#TARGET=input()

# Gets the Target's IP Address
#Target_IP = socket.gethostbyname(TARGET)
#print(f'The IP address of {TARGET} is: {socket.gethostbyname(TARGET)}')
