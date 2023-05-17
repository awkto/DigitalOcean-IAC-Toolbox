#!/bin/bash
curl -H "Authorization: Bearer $TOKEN" \
     -H "Content-Type: application/json" \
     -s \
     -X GET "https://api.digitalocean.com/v2/domains"
