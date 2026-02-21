#!/bin/bash

# DNS Verification Script for jasonfreeman.org
# Checks if DNS is configured correctly for GitHub Pages

DOMAIN="jasonfreeman.org"
WWW_DOMAIN="www.jasonfreeman.org"
GITHUB_PAGES_TARGET="freeman1973-ai.github.io"

# GitHub Pages IPs
REQUIRED_IPS=(
    "185.199.108.153"
    "185.199.109.153"
    "185.199.110.153"
    "185.199.111.153"
)

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo "═══════════════════════════════════════════════════════"
echo "  DNS Verification for jasonfreeman.org"
echo "═══════════════════════════════════════════════════════"
echo ""

# Check if dig is available
if ! command -v dig &> /dev/null; then
    if command -v nslookup &> /dev/null; then
        echo -e "${YELLOW}⚠️  'dig' not found, using 'nslookup' instead${NC}"
        USE_NSLOOKUP=1
    else
        echo -e "${RED}❌ Neither 'dig' nor 'nslookup' found. Please install 'dnsutils' or 'bind-utils'.${NC}"
        exit 1
    fi
fi

echo -e "${BLUE}Checking A records for${NC} $DOMAIN..."
echo ""

# Check A records
if [ -z "$USE_NSLOOKUP" ]; then
    A_RECORDS=$(dig +short $DOMAIN A 2>/dev/null | grep -E '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$' | sort)
else
    A_RECORDS=$(nslookup $DOMAIN 2>/dev/null | grep 'Address:' | grep -v '#' | awk '{print $2}' | grep -E '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$' | sort)
fi

if [ -z "$A_RECORDS" ]; then
    echo -e "${RED}❌ No A records found for $DOMAIN${NC}"
    echo -e "${YELLOW}   DNS may not be configured yet or still propagating${NC}"
    echo ""
    ALL_GOOD=0
else
    echo "Found A records:"
    FOUND_COUNT=0
    for ip in "${REQUIRED_IPS[@]}"; do
        if echo "$A_RECORDS" | grep -q "$ip"; then
            echo -e "  ${GREEN}✓${NC} $ip"
            ((FOUND_COUNT++))
        else
            echo -e "  ${RED}✗${NC} $ip ${RED}(missing)${NC}"
        fi
    done
    echo ""
    
    if [ $FOUND_COUNT -eq 4 ]; then
        echo -e "${GREEN}✓ All 4 required A records are configured correctly!${NC}"
        echo ""
        A_RECORDS_OK=1
    else
        echo -e "${RED}❌ Only $FOUND_COUNT out of 4 A records found${NC}"
        echo -e "${YELLOW}   Add the missing A records at your domain registrar${NC}"
        echo ""
        ALL_GOOD=0
    fi
fi

echo "───────────────────────────────────────────────────────"
echo ""

# Check CNAME record for www
echo -e "${BLUE}Checking CNAME record for${NC} $WWW_DOMAIN..."
echo ""

if [ -z "$USE_NSLOOKUP" ]; then
    CNAME_RECORD=$(dig +short $WWW_DOMAIN CNAME 2>/dev/null | sed 's/\.$//')
else
    CNAME_RECORD=$(nslookup -query=CNAME $WWW_DOMAIN 2>/dev/null | grep 'canonical name' | awk '{print $NF}' | sed 's/\.$//')
fi

if [ -z "$CNAME_RECORD" ]; then
    echo -e "${RED}❌ No CNAME record found for $WWW_DOMAIN${NC}"
    echo -e "${YELLOW}   Add CNAME record: www → $GITHUB_PAGES_TARGET${NC}"
    echo ""
    ALL_GOOD=0
else
    echo "Found CNAME: $CNAME_RECORD"
    if [ "$CNAME_RECORD" == "$GITHUB_PAGES_TARGET" ]; then
        echo -e "${GREEN}✓ CNAME record is configured correctly!${NC}"
        echo ""
        CNAME_OK=1
    else
        echo -e "${RED}❌ CNAME points to wrong target${NC}"
        echo -e "${YELLOW}   Expected: $GITHUB_PAGES_TARGET${NC}"
        echo -e "${YELLOW}   Found:    $CNAME_RECORD${NC}"
        echo ""
        ALL_GOOD=0
    fi
fi

echo "───────────────────────────────────────────────────────"
echo ""

# Check if domain is accessible
echo -e "${BLUE}Testing website accessibility...${NC}"
echo ""

if command -v curl &> /dev/null; then
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 https://$DOMAIN 2>/dev/null)
    
    if [ "$HTTP_CODE" == "200" ] || [ "$HTTP_CODE" == "301" ] || [ "$HTTP_CODE" == "302" ]; then
        echo -e "${GREEN}✓ Website is accessible at https://$DOMAIN${NC}"
        echo -e "  ${GREEN}HTTP Status: $HTTP_CODE${NC}"
        WEBSITE_OK=1
    elif [ "$HTTP_CODE" == "000" ]; then
        echo -e "${YELLOW}⚠️  Cannot connect to https://$DOMAIN${NC}"
        echo -e "   ${YELLOW}DNS may still be propagating...${NC}"
    else
        echo -e "${YELLOW}⚠️  Unexpected response from https://$DOMAIN${NC}"
        echo -e "   ${YELLOW}HTTP Status: $HTTP_CODE${NC}"
    fi
else
    echo -e "${YELLOW}⚠️  'curl' not found, skipping website accessibility test${NC}"
fi

echo ""
echo "═══════════════════════════════════════════════════════"
echo "  Summary"
echo "═══════════════════════════════════════════════════════"
echo ""

# Summary
if [ -n "$A_RECORDS_OK" ] && [ -n "$CNAME_OK" ] && [ -n "$WEBSITE_OK" ]; then
    echo -e "${GREEN}🎉 SUCCESS! Your DNS is configured correctly!${NC}"
    echo ""
    echo "Your website should be accessible at:"
    echo -e "  ${GREEN}✓${NC} https://jasonfreeman.org"
    echo -e "  ${GREEN}✓${NC} https://www.jasonfreeman.org"
    echo ""
    echo "Next steps:"
    echo "  1. Visit: https://github.com/freeman1973-ai/Wastewater/settings/pages"
    echo "  2. Verify custom domain shows green checkmark ✓"
    echo "  3. Enable 'Enforce HTTPS' if not already enabled"
    echo ""
elif [ -n "$A_RECORDS_OK" ] && [ -n "$CNAME_OK" ]; then
    echo -e "${YELLOW}⚠️  DNS is configured but website not yet accessible${NC}"
    echo ""
    echo "Possible reasons:"
    echo "  • DNS still propagating (wait 15-30 minutes)"
    echo "  • GitHub Pages not yet configured"
    echo "  • HTTPS certificate being generated"
    echo ""
    echo "What to do:"
    echo "  1. Wait 15-30 minutes for DNS propagation"
    echo "  2. Check: https://dnschecker.org"
    echo "  3. Verify GitHub Pages settings"
    echo ""
else
    echo -e "${RED}❌ DNS configuration incomplete${NC}"
    echo ""
    echo "Action required:"
    
    if [ -z "$A_RECORDS_OK" ]; then
        echo -e "  ${RED}•${NC} Add 4 A records pointing to GitHub Pages IPs"
    fi
    
    if [ -z "$CNAME_OK" ]; then
        echo -e "  ${RED}•${NC} Add CNAME record: www → $GITHUB_PAGES_TARGET"
    fi
    
    echo ""
    echo "📖 Complete instructions:"
    echo "   DNS_CONFIG_JASONFREEMAN_ORG.md"
    echo ""
    echo "Quick reference:"
    echo "   DOMAIN_QUICK_START.md"
    echo ""
fi

echo "───────────────────────────────────────────────────────"
echo ""
echo "Helpful resources:"
echo "  • DNS configuration guide: DNS_CONFIG_JASONFREEMAN_ORG.md"
echo "  • Check DNS propagation: https://dnschecker.org"
echo "  • GitHub Pages settings: https://github.com/freeman1973-ai/Wastewater/settings/pages"
echo "  • Troubleshooting: TROUBLESHOOTING_REPORT.md"
echo ""
echo "═══════════════════════════════════════════════════════"
