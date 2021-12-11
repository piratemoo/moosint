#!/bin/bash

cat moosint.txt
echo ""
echo "A small google dorking/OSINT gathering script updated from goohak by moo"

TARGET="$1"
BROWSER="firefox"

TIME="sleep 7"

$TIME
#Target's website
echo "opening http/https site of target"
$BROWSER http://$TARGET 2> /dev/null | $BROWSER https://$TARGET 2> /dev/null

$TIME
echo "starting basic osint search..."
# netcraft, shodan, censys, security headers, threatcrows, zoomeye
echo "opening netcraft"
$BROWSER http://toolbar.netcraft.com/site_report?url=$TARGET 2> /dev/null

$TIME
echo "opening shodan"
$BROWSER https://www.shodan.io/search?query=$TARGET 2> /dev/null

$TIME
echo "opening censys"
$BROWSER https://www.censys.io/ipv4?q=$TARGET 2> /dev/null

$TIME
echo "opening security headers"
$BROWSER https://securityheaders.com/?q=$TARGET 2> /dev/null

$TIME
echo "opening threatcrowd"
$BROWSER https://www.threatcrowd.org/domain.php?domain=$TARGET 2> /dev/null

$TIME
echo "opening zoomeye"
$BROWSER https://www.zoomeye.org/searchResult/bugs?q=$TARGET 2> /dev/null

echo "starting SSL checks..."
# SSL Checks crt.sh, ssl labs, 
$TIME
echo "opening crt.sh"
$BROWSER https://crt.sh/?q=%25.$TARGET 2> /dev/null

$TIME
echo "opening ssl labs"
$BROWSER https://www.ssllabs.com/ssltest/analyze.html?d=$TARGET 2> /dev/null

$TIME
echo "opening ssl shopper"
$BROWSER https://www.sslshopper.com/ssl-checker.html#hostname=$TARGET 2> /dev/null

echo "starting dns checks: please enter target into dns dumpster..."
# dnsdumpster, security trails, viewdns, wayback machine
$TIME
echo "opening dns dumpster"
$BROWSER https://dnsdumpster.com 2> /dev/null

$TIME
echo "opening security trails"
$BROWSER https://securitytrails.com/search/domain/$TARGET 2> /dev/null

$TIME
echo "opening view dns"
$BROWSER http://viewdns.info/reversewhois/?q=$TARGET 2> /dev/null

$TIME
echo "opening wayback machine archive"
$BROWSER https://web.archive.org/web/*/$TARGET 2> /dev/null

cat "starting social media scans..."
#social media
$TIME
echo "opening LinkedIn employees list"
$BROWSER https://www.google.com/search?q=site:linkedin.com+employees+$TARGET" 2> /dev/null

$TIME
echo "opening UVRX social media search by Google"
$BROWSER http://www.uvrx.com/results-social/index.html?cx=008219812513279254587%3Ao2g7x-v-esw&cof=FORID%3A9&ie=UTF-8&q=$TARGET&sa=Search&siteurl=www.uvrx.com%2Fresults-social%2Findex.html%3Fcx%3D008219812513279254587%253Ao2g7x-v-esw&ref=&ss=990j192670j9 2> /dev/null

$TIME
echo "opening wordpress/wordpress plugins"
$BROWSER https://www.google.com/search?q=site:$TARGET+inurl:wp-+OR+inurl:plugin+OR+i>

echo "starting subdomain and login page lookup..."
# subdomains, login pages
$TIME
echo "opening subdomains"
$BROWSER https://www.google.com/search?q=site:*.$TARGET 2> /dev/null

$TIME
$BROWSER https://www.google.com/search?q=site:*.*.$TARGET 2> /dev/null

$TIME
echo "opening login queries"
$BROWSER https://www.google.com/search?q=site:$TARGET+username+OR+password+OR+login+>

echo "searching for backdoors, setup, or install files and open redirects..."
# backdoors/setup-install files, open redirects
$TIME
echo "opening shells and backdoors"
$BROWSER https://www.google.com/search?q=site:$TARGET+inurl:shell+OR+inurl:backdoor+>

$TIME
echo "opening licenses and readme files"
$BROWSER https://www.google.com/search?q=site:$TARGET+inurl:readme+OR+inurl:license+>

$TIME
echo "opening redirects"
$BROWSER https://www.google.com/search?q=site:$TARGET+inurl:redir+OR+inurl:url+OR+in>

echo "searching for files and documents by extension and pastebin..."
# files/docs by extension, pastebin
$TIME
echo "opening cgi, php, asp, extensions"
$BROWSER https://www.google.com/search?q=site:$TARGET+ext:cgi+OR+ext:php+OR+ext:asp+>

$TIME
echo "opening doc, docx and csv files"
$BROWSER https://www.google.com/search?q=site:$TARGET+ext:doc+OR+ext:docx+OR+ext:csv>

$TIME
echo "opening pastebins"
$BROWSER https://www.google.com/search?q=site:pastebin.com+$TARGET" 2> /dev/null

exit 0
