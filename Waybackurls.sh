#!/bin/bash

# Define ANSI color codes
RED="\033[31m"
RESET="\033[0m"

# Define the Khukuri sword logo as ASCII art
logo="
						Webarchives Extractor
						-By Khukuririmal
"

# Prompt the user for a domain name
echo "Enter a domain name (e.g., example.com): "
read domain_name

# Construct the URL for web.archive.org with the provided domain
archive_url="https://web.archive.org/cdx/search/cdx?url=*.${domain_name}/*&output=text&fl=original&filter=statuscode:200"

# Download and extract the URLs, remove duplicates, and sort them
urls=$(curl -s "$archive_url" | sed '1d' | sort | uniq)

# Save the extracted URLs to a file
output_file="${domain_name}_urls.txt"
echo "$urls" > "$output_file"

echo "URLs extracted and saved in $output_file, with duplicates removed."
