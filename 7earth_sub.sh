#!/bin/bash

# Define the target domain
if [ -z "$1" ];then
  TARGET_DOMAIN="$1"
else
  echo "[*] usage : 7earth_sub.sh your_domain_here"
fi

# Create a directory to store the results
mkdir -p subdomain_enumeration
cd subdomain_enumeration

# Run Sublist3r
echo "Running Sublist3r..."
python3 ../Sublist3r/sublist3r.py -d $TARGET_DOMAIN -o sublist3r.txt

# Run AssetFinder
echo "Running AssetFinder..."
assetfinder $TARGET_DOMAIN | tee assetfinder.txt

# Run Amass
echo "Running Amass..."
amass enum -d $TARGET_DOMAIN -o amass.txt

# Run SubFinder
echo "Running SubFinder..."
subfinder -d $TARGET_DOMAIN -o subfinder.txt

# Run Findomain
echo "Running Findomain..."
findomain -t $TARGET_DOMAIN -o
cat $TARGET_DOMAIN.txt | tee findomain.txt
rm $TARGET_DOMAIN.txt

# Run MassDNS
echo "Running MassDNS..."
massdns -r ../massdns/lists/resolvers.txt -t A -o S -w massdns.txt -i sublist3r.txt assetfinder.txt amass.txt subfinder.txt findomain.txt

# Run AltDNS
echo "Running AltDNS..."
altdns -i sublist3r.txt assetfinder.txt amass.txt subfinder.txt findomain.txt -o altdns.txt -w words.txt -r -s altdns_output.txt

# Combine all results into one file
cat sublist3r.txt assetfinder.txt amass.txt subfinder.txt findomain.txt massdns.txt altdns_output.txt | sort -u > all_subdomains.txt

echo "Subdomain enumeration completed! Results saved in all_subdomains.txt"