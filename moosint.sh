#!/bin/bash

cat moosint.txt
echo ""
echo "A small google dorking/OSINT gathering script by moo"
echo "https://www.piratemoo.com | piratemoo@protonmail.com"


BROWSER="firefox"
TARGET="address"
TARGETDORK="dorkling"

function osintLookup()
	{
			#Target's website
			echo "opening http/https versions of the target"
			$BROWSER http://$address | $BROWSER https://$address

			# netcraft, shodan, censys, security headers, threatcrows, zoomeye
			echo "starting basic osint search..."
			echo "opening shodan.io"
			$BROWSER https://www.shodan.io/search?query=$address
			echo "opening censys: please input your search in the field"
			$BROWSER https://www.censys.io/ipv4?q=
			echo "opening netcraft"
			$BROWSER http://sitereport.netcraft.com/?url=$address
			echo "opening security headers"
			$BROWSER https://securityheaders.com/?q=$address
			echo "opening threatcrowd"
			$BROWSER https://www.threatcrowd.org/domain.php?domain=$address
			echo "opening zoomeye"
			$BROWSER https://www.zoomeye.org/searchResult/bugs?q=$address

			# SSL Checks crt.sh, ssl labs, ssl shopper
			echo "startecho "starting SSL checks..."
			echo "opening crt.sh"
			$BROWSER https://crt.sh/?q=$address
			echo "opening ssl labs"
			$BROWSER https://www.ssllabs.com/ssltest/analyze.html?d=$address
			echo "opening ssl shopper"
			$BROWSER https://www.sslshopper.com/ssl-checker.html#hostname=$address

			#DNS checks
			echo "starting DNS checks..."
			echo "opening dns dumpster"
			$BROWSER https://dnsdumpster.com
			echo "opening security trails"
			$BROWSER https://securitytrails.com/list/keyword/$address
			echo "opening view dns"
			$BROWSER http://viewdns.info/reversewhois/?q=$address
			echo "opening wayback machine archive
			$BROWSER https://web.archive.org/web/*/$address
		}

function googleDork()
	{
                        # inurl check
                        echo "checking inurl statements..."
                        $BROWSER https://www.google.com/search?q=inurl:$dorkling

                        # login checks
                        echo "checking login statements..."
                        $BROWSER https://www.google.com/search?q=site%3A*+$dorkling
                        $BROWSER https://www.google.com/search?q=site:*.*.+$dorkling
			$BROWSER https://www.google.com/search?q=site:%3A+$dorkling+%2Busername%2Bor%2Bpassword%2Bor%2Blogin

	}

menu=(
	"osint lookup"
	"search for a human"
	"dork it!"
	"social media search"
        "quit"
     )

select option in "${menu[@]}"
do
	case "$REPLY" in

		1) read -p "enter target address:" address
		   echo "Targeting $address..."
		   osintLookup ;;

  		2) read -p "enter the name:" human
                   echo "Targeting $human..." ;;

                3) read -p "what would you like to dork?" dorkling
                   echo "Targeting $dorkling..."
		   googleDork ;;

		4) read -p "whose social media accounts would you like to lookup?" social
		   echo "Targeting $social..." ;;

		5) exit ;;
    esac
done
exit
