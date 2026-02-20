#!/bin/bash

# DNS Check Script for GitHub Pages
# This script checks if your DNS is correctly configured for GitHub Pages

echo "🔍 DNS Check for GitHub Pages Website"
echo "======================================"
echo ""

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Expected GitHub Pages IPs
EXPECTED_IPS=("185.199.108.153" "185.199.109.153" "185.199.110.153" "185.199.111.153")
EXPECTED_CNAME="freeman1973-ai.github.io"

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if required tools are available
if command_exists dig; then
    DNS_TOOL="dig"
elif command_exists nslookup; then
    DNS_TOOL="nslookup"
else
    echo "${RED}❌ Error: Neither 'dig' nor 'nslookup' command found.${NC}"
    echo "Please install one of these tools or use online DNS checker:"
    echo "👉 https://dnschecker.org"
    exit 1
fi

# Get domain from user
echo "Enter your domain name (e.g., yourdomain.com):"
read -r DOMAIN

if [ -z "$DOMAIN" ]; then
    echo "${RED}❌ No domain provided${NC}"
    exit 1
fi

echo ""
echo "Checking DNS for: $DOMAIN"
echo "======================================"
echo ""

# Check GitHub Pages site first
echo "📡 Checking GitHub Pages site..."
GITHUB_URL="https://freeman1973-ai.github.io/Wastewater/"
if command_exists curl; then
    if curl -s -o /dev/null -w "%{http_code}" "$GITHUB_URL" | grep -q "200"; then
        echo "${GREEN}✅ GitHub Pages site is active${NC}"
    else
        echo "${YELLOW}⚠️  GitHub Pages site may not be active${NC}"
    fi
else
    echo "${YELLOW}⚠️  curl not available, skipping GitHub Pages check${NC}"
fi

echo ""

# Check A records
echo "🔍 Checking A records for $DOMAIN..."
echo "Expected IPs: ${EXPECTED_IPS[*]}"
echo ""

if [ "$DNS_TOOL" = "dig" ]; then
    RESOLVED_IPS=$(dig +short "$DOMAIN" A | grep -E '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$')
else
    RESOLVED_IPS=$(nslookup "$DOMAIN" | grep -A1 "Name:" | grep "Address:" | awk '{print $2}')
fi

if [ -z "$RESOLVED_IPS" ]; then
    echo "${RED}❌ No A records found${NC}"
    echo "Action needed: Add A records at your domain registrar"
    echo ""
else
    echo "Found A records:"
    echo "$RESOLVED_IPS"
    echo ""
    
    # Check if all expected IPs are present
    ALL_CORRECT=true
    for ip in "${EXPECTED_IPS[@]}"; do
        if echo "$RESOLVED_IPS" | grep -q "$ip"; then
            echo "${GREEN}✅${NC} $ip"
        else
            echo "${RED}❌${NC} $ip (missing)"
            ALL_CORRECT=false
        fi
    done
    
    echo ""
    if [ "$ALL_CORRECT" = true ]; then
        echo "${GREEN}✅ All A records are correct!${NC}"
    else
        echo "${RED}❌ Some A records are missing or incorrect${NC}"
        echo "Action needed: Add missing A records at your domain registrar"
    fi
fi

echo ""
echo "======================================"
echo ""

# Check CNAME for www
echo "🔍 Checking CNAME record for www.$DOMAIN..."
echo "Expected CNAME: $EXPECTED_CNAME"
echo ""

if [ "$DNS_TOOL" = "dig" ]; then
    RESOLVED_CNAME=$(dig +short "www.$DOMAIN" CNAME)
else
    RESOLVED_CNAME=$(nslookup "www.$DOMAIN" | grep "canonical name" | awk '{print $NF}' | sed 's/\.$//')
fi

if [ -z "$RESOLVED_CNAME" ]; then
    echo "${YELLOW}⚠️  No CNAME record found for www.$DOMAIN${NC}"
    echo "Action needed: Add CNAME record at your domain registrar"
    echo ""
else
    echo "Found CNAME: $RESOLVED_CNAME"
    echo ""
    
    # Remove trailing dot if present
    RESOLVED_CNAME_CLEAN=$(echo "$RESOLVED_CNAME" | sed 's/\.$//')
    
    if [ "$RESOLVED_CNAME_CLEAN" = "$EXPECTED_CNAME" ]; then
        echo "${GREEN}✅ CNAME record is correct!${NC}"
    else
        echo "${RED}❌ CNAME record is incorrect${NC}"
        echo "Expected: $EXPECTED_CNAME"
        echo "Found: $RESOLVED_CNAME_CLEAN"
        echo "Action needed: Update CNAME record at your domain registrar"
    fi
fi

echo ""
echo "======================================"
echo ""

# Summary
echo "📊 Summary"
echo "======================================"
echo ""

# Test if domain loads
echo "🌐 Testing domain accessibility..."
if command_exists curl; then
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://$DOMAIN" 2>/dev/null)
    if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "301" ] || [ "$HTTP_CODE" = "302" ]; then
        echo "${GREEN}✅ Domain is accessible (HTTP $HTTP_CODE)${NC}"
    else
        echo "${YELLOW}⚠️  Domain returned HTTP $HTTP_CODE${NC}"
        echo "Note: DNS may still be propagating (can take 1-48 hours)"
    fi
else
    echo "${YELLOW}⚠️  curl not available, skipping accessibility check${NC}"
fi

echo ""
echo "======================================"
echo ""

# Recommendations
echo "📝 Recommendations:"
echo ""

if [ -z "$RESOLVED_IPS" ]; then
    echo "1. Add A records at your domain registrar:"
    for ip in "${EXPECTED_IPS[@]}"; do
        echo "   - $ip"
    done
fi

if [ -z "$RESOLVED_CNAME" ]; then
    echo "2. Add CNAME record at your domain registrar:"
    echo "   - www → $EXPECTED_CNAME"
fi

echo ""
echo "3. Check DNS propagation status:"
echo "   👉 https://dnschecker.org/?domain=$DOMAIN&type=A"
echo ""
echo "4. Verify GitHub Pages settings:"
echo "   👉 https://github.com/freeman1973-ai/Wastewater/settings/pages"
echo ""
echo "5. Read DNS Check Guide for more help:"
echo "   👉 DNS_CHECK_GUIDE.md"
echo ""
echo "======================================"
echo ""

# Final message
if [ "$ALL_CORRECT" = true ] && [ "$RESOLVED_CNAME_CLEAN" = "$EXPECTED_CNAME" ]; then
    echo "${GREEN}🎉 DNS configuration looks correct!${NC}"
    echo ""
    echo "If your site isn't loading yet:"
    echo "- Wait 1-48 hours for DNS propagation"
    echo "- Clear your browser cache"
    echo "- Check GitHub Pages for green checkmark"
else
    echo "${YELLOW}⚠️  DNS needs configuration${NC}"
    echo ""
    echo "Follow the recommendations above to fix DNS records."
    echo "See DOMAIN_QUICK_START.md for step-by-step instructions."
fi

echo ""
