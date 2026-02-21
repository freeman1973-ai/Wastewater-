# 🔍 DNS Check Guide for Your Website

This guide helps you verify that your DNS records are correctly configured for your website.

---

## 🎯 Quick DNS Check

### What DNS Records Should Be Set

For your website to work at your custom domain, these DNS records must be configured:

#### **A Records (for root domain)**
```
185.199.108.153
185.199.109.153
185.199.110.153
185.199.111.153
```

#### **CNAME Record (for www subdomain)**
```
www → freeman1973-ai.github.io
```

---

## 🔧 How to Check Your DNS

### Method 1: Online DNS Checker (Easiest)

**Use these free online tools:**

1. **DNSChecker.org** (Recommended)
   - Visit: https://dnschecker.org
   - Enter your domain name
   - Check if A records show GitHub's IPs (185.199.108-111.153)
   - Check if CNAME shows freeman1973-ai.github.io

2. **What's My DNS**
   - Visit: https://www.whatsmydns.net
   - Enter your domain
   - Select "A" record type
   - Should show all 4 GitHub IP addresses

3. **DNS Propagation Checker**
   - Visit: https://www.dnswatch.info
   - Enter your domain
   - Verify records are propagating globally

### Method 2: Command Line Check

**On Mac/Linux:**

```bash
# Check A records
dig yourdomain.com

# Should show:
# yourdomain.com.  300  IN  A  185.199.108.153
# yourdomain.com.  300  IN  A  185.199.109.153
# yourdomain.com.  300  IN  A  185.199.110.153
# yourdomain.com.  300  IN  A  185.199.111.153

# Check CNAME for www
dig www.yourdomain.com

# Should show:
# www.yourdomain.com.  300  IN  CNAME  freeman1973-ai.github.io.
```

**On Windows (PowerShell):**

```powershell
# Check A records
nslookup yourdomain.com

# Check CNAME
nslookup www.yourdomain.com
```

**Alternative (works everywhere):**

```bash
# Check A records
nslookup yourdomain.com 8.8.8.8

# Check CNAME
nslookup www.yourdomain.com 8.8.8.8
```

---

## ✅ What You Should See

### ✓ Correct A Record Response
```
yourdomain.com has address 185.199.108.153
yourdomain.com has address 185.199.109.153
yourdomain.com has address 185.199.110.153
yourdomain.com has address 185.199.111.153
```

### ✓ Correct CNAME Response
```
www.yourdomain.com is an alias for freeman1973-ai.github.io
```

### ❌ Incorrect Responses

**Problem:** Different IP addresses
```
yourdomain.com has address 192.168.1.1  ← Wrong!
```
**Solution:** Update A records at your domain registrar

**Problem:** No records found
```
** server can't find yourdomain.com: NXDOMAIN
```
**Solution:** DNS not configured yet or still propagating

**Problem:** Old IP addresses
```
yourdomain.com has address 192.0.2.1  ← Old hosting
```
**Solution:** Remove old records and add GitHub's IPs

---

## 📊 DNS Propagation Status

### Understanding Propagation

**What is DNS Propagation?**
- DNS changes take time to spread worldwide
- Different locations may see different results during propagation
- Usually completes in 1-48 hours

**Check Propagation:**
- Use: https://dnschecker.org
- Enter your domain
- See results from multiple locations worldwide
- Green checkmarks = propagated in that region

### Expected Timeline

| Time | Status |
|------|--------|
| **0-10 minutes** | Changes saved at registrar |
| **10-30 minutes** | First DNS servers update |
| **1-4 hours** | Most regions updated |
| **24-48 hours** | Fully propagated worldwide |

---

## 🔍 Step-by-Step DNS Verification

### Step 1: Verify GitHub Pages is Active

First, check your GitHub Pages site:
- Visit: https://freeman1973-ai.github.io/Wastewater/
- Should load your website ✓

### Step 2: Check DNS Records

**Using DNSChecker.org:**

1. Go to: https://dnschecker.org
2. Enter your domain (e.g., `yourdomain.com`)
3. Select "A" from dropdown
4. Click "Search"

**What to look for:**
- ✅ All locations show: 185.199.108.153, 109, 110, 111
- ❌ Different IPs = DNS not configured correctly
- ⏳ Mixed results = DNS still propagating

### Step 3: Check CNAME Record

1. At DNSChecker.org
2. Enter: `www.yourdomain.com`
3. Select "CNAME"
4. Click "Search"

**What to look for:**
- ✅ Shows: freeman1973-ai.github.io
- ❌ Shows nothing or different domain = Not configured

### Step 4: Check GitHub Pages Status

1. Go to: https://github.com/freeman1973-ai/Wastewater/settings/pages
2. Look at "Custom domain" section
3. Should see:
   - ✅ Your domain with green checkmark "DNS check successful"
   - ❌ Yellow warning "DNS check in progress"
   - ❌ Red error "DNS check unsuccessful"

---

## 🚨 Common DNS Issues & Fixes

### Issue 1: DNS Check Unsuccessful in GitHub

**Symptoms:**
- GitHub Pages shows error
- Domain doesn't load website

**Solutions:**

1. **Wait 10-30 minutes** - DNS takes time to update
2. **Verify all 4 A records** are added correctly
3. **Check CNAME** points to freeman1973-ai.github.io (no https://)
4. **Remove old DNS records** that might conflict
5. **Try again** - Click "Remove" then "Save" in GitHub Pages

### Issue 2: Mixed Content or SSL Errors

**Symptoms:**
- Site loads but shows "Not Secure"
- HTTPS doesn't work

**Solutions:**

1. **Wait 24 hours** - GitHub needs time to provision SSL
2. **Ensure "Enforce HTTPS"** is checked in GitHub Pages
3. **Clear browser cache** and try again
4. **Check all resources** use HTTPS not HTTP

### Issue 3: Site Not Loading

**Symptoms:**
- Domain shows "This site can't be reached"
- ERR_NAME_NOT_RESOLVED error

**Solutions:**

1. **Check DNS propagation** - May not be complete
2. **Verify records are correct** - Use dnschecker.org
3. **Clear DNS cache** on your computer:
   - Windows: `ipconfig /flushdns`
   - Mac: `sudo dscacheutil -flushcache`
   - Linux: `sudo systemd-resolve --flush-caches`
4. **Try different network** - Maybe your ISP's DNS is slow

### Issue 4: Shows Old Website

**Symptoms:**
- Domain loads but shows wrong content
- Not showing GitHub Pages site

**Solutions:**

1. **Remove old A records** at registrar
2. **Wait for cache to expire** (based on TTL)
3. **Use incognito mode** to test without cache
4. **Check you're testing the right domain**

---

## 📱 Quick Command Reference

### Check Your DNS Right Now

**Replace `yourdomain.com` with your actual domain:**

```bash
# Quick check - works on Mac/Linux/Windows with WSL
dig yourdomain.com +short

# Expected output:
# 185.199.108.153
# 185.199.109.153
# 185.199.110.153
# 185.199.111.153
```

```bash
# Check CNAME
dig www.yourdomain.com CNAME +short

# Expected output:
# freeman1973-ai.github.io.
```

### Force Fresh DNS Lookup

```bash
# Mac/Linux
dig yourdomain.com @8.8.8.8

# Windows PowerShell
Resolve-DnsName yourdomain.com -Server 8.8.8.8
```

---

## ✅ DNS Verification Checklist

Use this checklist to verify everything is set up correctly:

### At Your Domain Registrar
- [ ] Logged into domain registrar account
- [ ] Found DNS Management section
- [ ] Added 4 A records (185.199.108-111.153)
- [ ] Added CNAME record (www → freeman1973-ai.github.io)
- [ ] Saved all changes
- [ ] No old conflicting records remain

### At GitHub Pages
- [ ] Repository Settings → Pages accessed
- [ ] Custom domain entered
- [ ] Green checkmark "DNS check successful" ✓
- [ ] "Enforce HTTPS" is checked
- [ ] No error messages shown

### DNS Propagation
- [ ] Checked on dnschecker.org
- [ ] A records show GitHub IPs
- [ ] CNAME shows freeman1973-ai.github.io
- [ ] Waited at least 1 hour since DNS changes
- [ ] Tested from multiple devices/networks

### Website Access
- [ ] `https://yourdomain.com` loads website
- [ ] `https://www.yourdomain.com` loads website
- [ ] HTTPS works (padlock icon 🔒)
- [ ] No certificate errors
- [ ] All pages and images load correctly

---

## 🎯 Quick Troubleshooting Flow

```
Is GitHub Pages working?
└─ Yes → Check DNS at dnschecker.org
   ├─ Shows GitHub IPs?
   │  └─ Yes → Check GitHub Pages settings
   │     └─ Green checkmark?
   │        ├─ Yes → Wait for HTTPS (24hrs)
   │        └─ No → Remove and re-add domain
   └─ No → Update DNS records at registrar

Domain not loading?
└─ Check DNS propagation
   ├─ Not propagated → Wait 1-24 hours
   ├─ Mixed results → Wait for full propagation
   └─ Wrong IPs → Fix DNS records
```

---

## 📚 Additional Resources

### Documentation Links
- [CUSTOM_DOMAIN_SETUP.md](CUSTOM_DOMAIN_SETUP.md) - Complete domain setup guide
- [DOMAIN_QUICK_START.md](DOMAIN_QUICK_START.md) - Quick start instructions
- [DOMAIN_CHEAT_SHEET.md](DOMAIN_CHEAT_SHEET.md) - One-page reference
- [TROUBLESHOOTING_REPORT.md](TROUBLESHOOTING_REPORT.md) - General troubleshooting

### Online Tools
- **DNS Checker**: https://dnschecker.org
- **What's My DNS**: https://www.whatsmydns.net
- **DNS Watch**: https://www.dnswatch.info
- **MX Toolbox**: https://mxtoolbox.com/DNSLookup.aspx

### GitHub Documentation
- Custom domains: https://docs.github.com/pages/configuring-a-custom-domain-for-your-github-pages-site
- Troubleshooting: https://docs.github.com/pages/configuring-a-custom-domain-for-your-github-pages-site/troubleshooting-custom-domains-and-github-pages

---

## 💡 Pro Tips

1. **Use 8.8.8.8 (Google DNS)** for fresh lookups - bypasses your ISP's cache
2. **Check multiple locations** on dnschecker.org - DNS spreads unevenly
3. **Screenshot DNS check** when it shows correct IPs - proof it's configured
4. **Wait the full 48 hours** before declaring something broken
5. **Test in incognito mode** to avoid browser cache
6. **Use curl** to test: `curl -I https://yourdomain.com`

---

## 🎉 Success Indicators

You'll know DNS is working correctly when:

✅ DNSChecker.org shows all 4 GitHub IPs worldwide  
✅ GitHub Pages shows green checkmark  
✅ Your domain loads the website  
✅ HTTPS works with padlock icon 🔒  
✅ Both root and www domains work  
✅ No certificate warnings  

---

**Need help?** Check the [TROUBLESHOOTING_REPORT.md](TROUBLESHOOTING_REPORT.md) for more solutions!

**Ready to set up DNS?** See [DOMAIN_QUICK_START.md](DOMAIN_QUICK_START.md) for the setup guide!
