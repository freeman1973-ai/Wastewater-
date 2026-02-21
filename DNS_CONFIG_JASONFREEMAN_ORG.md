# DNS Configuration for jasonfreeman.org

## 🌐 Exact DNS Records to Add at Your Registrar

This document contains the **exact DNS records** you need to add at your domain registrar to make **jasonfreeman.org** work with GitHub Pages.

---

## ⚡ Quick Reference

**Copy these exact records into your registrar's DNS management:**

### A Records (4 required)
```
Type: A, Name: @, Value: 185.199.108.153
Type: A, Name: @, Value: 185.199.109.153
Type: A, Name: @, Value: 185.199.110.153
Type: A, Name: @, Value: 185.199.111.153
```

### CNAME Record (1 required)
```
Type: CNAME, Name: www, Value: freeman1973-ai.github.io
```

---

## 📋 Detailed DNS Records

### A Records - Point jasonfreeman.org to GitHub Pages

Add **4 A records** with these settings:

#### A Record #1
- **Type:** A
- **Name:** `@` (or `jasonfreeman.org` if using Cloudflare)
- **Value/Target/Points to:** `185.199.108.153`
- **TTL:** 3600 (or Auto/Default)
- **Proxy Status:** DNS only / Gray cloud ☁ (if Cloudflare)

#### A Record #2
- **Type:** A
- **Name:** `@` (or `jasonfreeman.org` if using Cloudflare)
- **Value/Target/Points to:** `185.199.109.153`
- **TTL:** 3600 (or Auto/Default)
- **Proxy Status:** DNS only / Gray cloud ☁ (if Cloudflare)

#### A Record #3
- **Type:** A
- **Name:** `@` (or `jasonfreeman.org` if using Cloudflare)
- **Value/Target/Points to:** `185.199.110.153`
- **TTL:** 3600 (or Auto/Default)
- **Proxy Status:** DNS only / Gray cloud ☁ (if Cloudflare)

#### A Record #4
- **Type:** A
- **Name:** `@` (or `jasonfreeman.org` if using Cloudflare)
- **Value/Target/Points to:** `185.199.111.153`
- **TTL:** 3600 (or Auto/Default)
- **Proxy Status:** DNS only / Gray cloud ☁ (if Cloudflare)

### CNAME Record - Point www.jasonfreeman.org to GitHub Pages

Add **1 CNAME record** with these settings:

- **Type:** CNAME
- **Name:** `www`
- **Value/Target/Points to:** `freeman1973-ai.github.io`
- **TTL:** 3600 (or Auto/Default)
- **Proxy Status:** DNS only / Gray cloud ☁ (if Cloudflare)

---

## 🔧 Registrar-Specific Instructions

### GoDaddy

1. **Login:** https://dcc.godaddy.com/manage/jasonfreeman.org/dns
2. Click **"Add"** or **"Add Record"**
3. Select **Type: A**
4. **Name:** `@`
5. **Value:** `185.199.108.153`
6. Click **Save**
7. **Repeat** for the other 3 A records (with different IPs)
8. Add CNAME:
   - **Type:** CNAME
   - **Name:** `www`
   - **Value:** `freeman1973-ai.github.io`
   - Click **Save**

**GoDaddy Interface:**
```
┌──────────┬────────┬──────────────────────┬─────────┐
│ Type     │ Name   │ Value                │ TTL     │
├──────────┼────────┼──────────────────────┼─────────┤
│ A        │ @      │ 185.199.108.153      │ 1 Hour  │
│ A        │ @      │ 185.199.109.153      │ 1 Hour  │
│ A        │ @      │ 185.199.110.153      │ 1 Hour  │
│ A        │ @      │ 185.199.111.153      │ 1 Hour  │
│ CNAME    │ www    │ freeman1973-ai...    │ 1 Hour  │
└──────────┴────────┴──────────────────────┴─────────┘
```

---

### Namecheap

1. **Login:** https://ap.www.namecheap.com
2. **Navigate:** Dashboard → jasonfreeman.org → Advanced DNS
3. Click **"Add New Record"**
4. **Type:** A Record
5. **Host:** `@`
6. **Value:** `185.199.108.153`
7. **TTL:** Automatic
8. Click **Save**
9. **Repeat** for other 3 A records
10. Add CNAME:
    - **Type:** CNAME Record
    - **Host:** `www`
    - **Value:** `freeman1973-ai.github.io.` (note the trailing dot)
    - Click **Save**

**Namecheap Note:** Namecheap may auto-add a trailing dot to CNAME values. This is normal!

---

### Cloudflare

⚠️ **CLOUDFLARE IS DIFFERENT - READ CAREFULLY!**

1. **Login:** https://dash.cloudflare.com
2. **Select:** jasonfreeman.org
3. **Click:** DNS tab
4. **Click:** Add record

#### For A Records:
- **Type:** A
- **Name:** `jasonfreeman.org` ← **Use full domain, NOT @**
- **IPv4 address:** `185.199.108.153`
- **Proxy status:** Click the orange cloud ☁️ to make it gray ☁ (DNS only)
- **TTL:** Auto
- Click **Save**
- **Repeat** for all 4 A records

#### For CNAME Record:
- **Type:** CNAME
- **Name:** `www`
- **Target:** `freeman1973-ai.github.io`
- **Proxy status:** Gray cloud ☁ (DNS only)
- **TTL:** Auto
- Click **Save**

**⚠️ CRITICAL for Cloudflare:**
- Use `jasonfreeman.org` instead of `@` for A records
- **MUST** set proxy to DNS only (gray cloud)
- Orange cloud ☁️ will break GitHub Pages!

**Cloudflare Interface:**
```
┌──────┬──────────────────┬────────────────────────┬─────┐
│ Type │ Name             │ Content                │ ☁   │
├──────┼──────────────────┼────────────────────────┼─────┤
│ A    │ jasonfreeman.org │ 185.199.108.153        │ ☁   │
│ A    │ jasonfreeman.org │ 185.199.109.153        │ ☁   │
│ A    │ jasonfreeman.org │ 185.199.110.153        │ ☁   │
│ A    │ jasonfreeman.org │ 185.199.111.153        │ ☁   │
│CNAME │ www              │ freeman1973-ai.g...    │ ☁   │
└──────┴──────────────────┴────────────────────────┴─────┘
```

📖 **More help:** See PROXY_VS_DNS_ONLY.md

---

### Google Domains

1. **Login:** https://domains.google.com
2. **Click:** jasonfreeman.org → DNS
3. **Scroll to:** Custom records
4. **Click:** Manage custom records

#### Add A Records:
- **Host name:** Leave blank (represents @)
- **Type:** A
- **TTL:** 1 hour
- **Data:** `185.199.108.153`
- Click **Add** or **+**
- **Repeat** for all 4 A records (you can add multiple on one line)

#### Add CNAME Record:
- **Host name:** `www`
- **Type:** CNAME
- **TTL:** 1 hour
- **Data:** `freeman1973-ai.github.io`
- Click **Add**

**Google Domains Interface:**
```
Custom resource records
┌────────────┬────────┬──────┬──────────────────────┐
│ Host name  │ Type   │ TTL  │ Data                 │
├────────────┼────────┼──────┼──────────────────────┤
│ (blank/@)  │ A      │ 1h   │ 185.199.108.153      │
│ (blank/@)  │ A      │ 1h   │ 185.199.109.153      │
│ (blank/@)  │ A      │ 1h   │ 185.199.110.153      │
│ (blank/@)  │ A      │ 1h   │ 185.199.111.153      │
│ www        │ CNAME  │ 1h   │ freeman1973-ai...    │
└────────────┴────────┴──────┴──────────────────────┘
```

---

## ⏱️ DNS Propagation Timeline

After adding DNS records:

- **Minimum:** 5 minutes
- **Typical:** 1 hour
- **Maximum:** 48 hours
- **Most common:** 15-30 minutes

**What affects propagation time:**
- Your registrar's DNS update speed
- Your ISP's DNS cache
- Global DNS cache servers
- TTL (Time To Live) settings

---

## ✅ Verification Methods

### Method 1: Automated Script (Easiest)
```bash
./verify-jasonfreeman-dns.sh
```

### Method 2: Command Line
```bash
# Check A records
dig jasonfreeman.org A

# Check CNAME
dig www.jasonfreeman.org CNAME

# Quick check
nslookup jasonfreeman.org
```

### Method 3: Online Tools
- **DNSChecker:** https://dnschecker.org
  - Enter: `jasonfreeman.org`
  - Type: A
  - Should show: 185.199.108-111.153
  
- **MX Toolbox:** https://mxtoolbox.com/SuperTool.aspx
  - Enter: `jasonfreeman.org`
  
- **What's My DNS:** https://www.whatsmydns.net
  - Enter: `jasonfreeman.org`
  - Shows propagation status globally

---

## 🎯 Expected Results

### When DNS is Configured Correctly

**A Records (jasonfreeman.org):**
```bash
$ dig jasonfreeman.org A +short
185.199.108.153
185.199.109.153
185.199.110.153
185.199.111.153
```

**CNAME Record (www.jasonfreeman.org):**
```bash
$ dig www.jasonfreeman.org CNAME +short
freeman1973-ai.github.io.
```

**Website Access:**
- ✅ http://jasonfreeman.org → Redirects to HTTPS
- ✅ https://jasonfreeman.org → Shows website with 🔒
- ✅ http://www.jasonfreeman.org → Redirects to HTTPS
- ✅ https://www.jasonfreeman.org → Shows website with 🔒

---

## 🚨 Troubleshooting

### Problem: DNS not resolving

**Check:**
```bash
dig jasonfreeman.org A
```

**If no results:**
- DNS records not added yet
- Incorrect values entered
- Still propagating (wait 1 hour)

**Solution:**
- Verify records in registrar dashboard
- Double-check IP addresses match exactly
- Wait for propagation
- Try https://dnschecker.org to see global status

---

### Problem: "DNS check unsuccessful" in GitHub Pages

**Check:**
1. Go to https://github.com/freeman1973-ai/Wastewater/settings/pages
2. Look at custom domain status

**Common causes:**
- DNS not propagated yet (wait)
- A records missing or incorrect
- CNAME file not in repository (should be there already ✓)
- Cloudflare proxy enabled (must be DNS only)

**Solution:**
- Verify all 4 A records are correct
- Ensure Cloudflare proxy is OFF (gray cloud)
- Wait 15-30 minutes and check again
- Run: `./verify-jasonfreeman-dns.sh`

---

### Problem: Cloudflare won't accept "@"

**Solution:**
Use `jasonfreeman.org` instead of `@` in the Name field.

**Example:**
```
❌ Wrong: Name = @
✅ Right: Name = jasonfreeman.org
```

📖 See: DNS_NAME_FIELD_GUIDE.md for complete Cloudflare instructions

---

### Problem: Can't enable HTTPS in GitHub Pages

**Requirements:**
1. ✅ DNS must show green checkmark first
2. ⏳ Wait 5-15 minutes after DNS check succeeds
3. 🔄 Refresh the Settings → Pages page

**If still greyed out:**
- Clear browser cache
- Wait another 15 minutes
- Check DNS propagation: https://dnschecker.org
- Verify all 4 A records point to correct IPs

---

## 📚 Additional Resources

### Complete Guides
- **DOMAIN_QUICK_START.md** - Quick setup walkthrough
- **CUSTOM_DOMAIN_SETUP.md** - Comprehensive guide
- **DNS_NAME_FIELD_GUIDE.md** - Help with Name field
- **PROXY_VS_DNS_ONLY.md** - Cloudflare proxy explained

### Verification Tools
- **verify-jasonfreeman-dns.sh** - Automated checker for jasonfreeman.org
- **check-dns.sh** - Generic DNS checker
- **DNS_CHECK_GUIDE.md** - Manual verification methods

### Status & Troubleshooting
- **JASONFREEMAN_ORG_CHECK_REPORT.md** - Current status check
- **TROUBLESHOOTING_REPORT.md** - Common issues and solutions

---

## ✅ Success Checklist

Mark each item as you complete it:

- [ ] Logged into domain registrar
- [ ] Added A record: 185.199.108.153
- [ ] Added A record: 185.199.109.153
- [ ] Added A record: 185.199.110.153
- [ ] Added A record: 185.199.111.153
- [ ] Added CNAME: www → freeman1973-ai.github.io
- [ ] Set Cloudflare to DNS only (if applicable)
- [ ] Saved all DNS records
- [ ] Ran verification: `./verify-jasonfreeman-dns.sh`
- [ ] Waited for DNS propagation (15-30 min typical)
- [ ] Checked GitHub Pages settings
- [ ] Verified green checkmark ✓ on custom domain
- [ ] Enabled "Enforce HTTPS"
- [ ] Tested https://jasonfreeman.org
- [ ] Tested https://www.jasonfreeman.org
- [ ] Website loads with 🔒 (HTTPS)

---

## 🎉 You're Done!

Once all checklist items are complete:
- ✅ jasonfreeman.org is live
- ✅ Secure HTTPS enabled
- ✅ Professional wastewater website accessible
- ✅ Both apex and www domains work
- ✅ Fast loading via GitHub Pages CDN

**Next optional steps:**
- Set up professional email: See ZOHO_EMAIL_SETUP.md
- Configure contact form: See CONTACT_FORM_SETUP.md
- Test on mobile devices
- Share your website!

---

## 📞 Need Help?

**Documentation available:**
- **Quick questions:** See FAQ sections in any guide
- **Cloudflare issues:** PROXY_VS_DNS_ONLY.md
- **DNS problems:** DNS_CHECK_GUIDE.md
- **General troubleshooting:** TROUBLESHOOTING_REPORT.md

**Verification tools:**
- Run: `./verify-jasonfreeman-dns.sh`
- Check: https://dnschecker.org
- Test: https://mxtoolbox.com

---

**Last updated:** 2026-02-21  
**Domain:** jasonfreeman.org  
**GitHub Pages:** freeman1973-ai.github.io/Wastewater
