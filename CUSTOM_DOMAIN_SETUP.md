# 🌐 How to Point Your Custom Domain to GitHub Pages

This guide explains how to direct web traffic from your custom domain to your GitHub Pages site at `https://freeman1973-ai.github.io/Wastewater/`

---

## 📋 Overview

**What you'll achieve:**
- Your custom domain (e.g., `yourdomain.com`) will display your GitHub Pages website
- Visitors can access your site using your domain instead of the GitHub URL
- SSL/HTTPS will be automatically enabled

**Time Required:** 5-10 minutes setup + 24-48 hours for DNS propagation

---

## 🎯 Two-Part Process

### Part 1: Configure DNS at Your Domain Registrar
### Part 2: Configure GitHub Pages Settings

---

## Part 1: Configure DNS Settings (At Your Domain Registrar)

### Step 1: Log Into Your Domain Registrar

Go to the website where you purchased your domain (examples: GoDaddy, Namecheap, Google Domains, etc.)

### Step 2: Find DNS Settings

Look for one of these sections:
- "DNS Management"
- "DNS Settings"
- "Name Servers"
- "Advanced DNS"

### Step 3: Add DNS Records

You need to add **EITHER** Option A **OR** Option B (not both):

#### **Option A: Using Apex Domain (Recommended)**
*Use this if you want: `yourdomain.com`*

Add these **A Records**:
```
Type: A
Name: @ (or leave blank)
Value/Points to: 185.199.108.153
TTL: 3600 (or Auto)

Type: A
Name: @ (or leave blank)
Value/Points to: 185.199.109.153
TTL: 3600

Type: A
Name: @ (or leave blank)
Value/Points to: 185.199.110.153
TTL: 3600

Type: A
Name: @ (or leave blank)
Value/Points to: 185.199.111.153
TTL: 3600
```

**Plus, add a CNAME for www:**
```
Type: CNAME
Name: www
Value/Points to: freeman1973-ai.github.io
TTL: 3600
```

#### **Option B: Using Subdomain**
*Use this if you want: `www.yourdomain.com`*

Add only this **CNAME Record**:
```
Type: CNAME
Name: www
Value/Points to: freeman1973-ai.github.io
TTL: 3600
```

---

## Part 2: Configure GitHub Pages Settings

### Step 1: Go to Repository Settings

Visit: https://github.com/freeman1973-ai/Wastewater/settings/pages

### Step 2: Enable GitHub Pages (if not already enabled)

Under "Source", select: **"GitHub Actions"**

### Step 3: Add Your Custom Domain

1. Scroll down to the "Custom domain" section
2. Enter your domain (examples):
   - `yourdomain.com` (if using Option A)
   - `www.yourdomain.com` (if using Option B)
3. Click **"Save"**

### Step 4: Wait for DNS Check

GitHub will automatically:
- Verify your DNS configuration
- Check that DNS records are set up correctly
- Show a green checkmark ✓ when successful

This may take a few minutes.

### Step 5: Enable HTTPS (Recommended)

Once DNS verification succeeds:
1. Check the box: **"Enforce HTTPS"**
2. This provides secure access to your site

---

## 🕐 DNS Propagation Timeline

After making DNS changes:

| Time | Status |
|------|--------|
| **0-1 hour** | Changes start propagating |
| **1-4 hours** | Most locations updated |
| **24-48 hours** | Fully propagated worldwide |

**Note:** You can check your site even during propagation, but some users might still see the old settings.

---

## ✅ Verification Steps

### Check DNS Propagation

Use these online tools:
- https://dnschecker.org
- https://www.whatsmydns.net

Enter your domain and check if:
- A records point to GitHub's IPs
- CNAME record points to `freeman1973-ai.github.io`

### Test Your Domain

After 1-2 hours, try:
1. Visit `http://yourdomain.com` in your browser
2. It should redirect to `https://yourdomain.com`
3. Your website should load with your professional content

---

## 📊 Common DNS Configurations

### Example 1: Using Root Domain (yourdomain.com)

```
DNS Records:
├─ A     @    185.199.108.153
├─ A     @    185.199.109.153
├─ A     @    185.199.110.153
├─ A     @    185.199.111.153
└─ CNAME www  freeman1973-ai.github.io

GitHub Pages Setting:
└─ Custom domain: yourdomain.com
```

### Example 2: Using www Subdomain (www.yourdomain.com)

```
DNS Records:
└─ CNAME www  freeman1973-ai.github.io

GitHub Pages Setting:
└─ Custom domain: www.yourdomain.com
```

---

## 🔧 Domain Registrar-Specific Instructions

### GoDaddy

1. Log in → My Products → Domains
2. Click domain → DNS Management
3. Click "Add" to add records
4. Enter the values above
5. Save

### Namecheap

1. Log in → Domain List
2. Click "Manage" next to your domain
3. Advanced DNS tab
4. Add new records
5. Save

### Google Domains

1. Log in → My Domains
2. Click DNS (under your domain)
3. Custom resource records
4. Add the records
5. Save

### Cloudflare (if using)

1. Log in → Select your domain
2. DNS tab
3. Add records
4. **Important:** Set proxy status to "DNS only" (gray cloud, not orange)

---

## 🚨 Troubleshooting

### Domain not working after 48 hours?

**Check these:**
1. ✓ DNS records are exactly correct (no typos)
2. ✓ GitHub Pages shows green checkmark for custom domain
3. ✓ "Enforce HTTPS" is checked in GitHub Pages
4. ✓ DNS propagation is complete (use dnschecker.org)

### Getting SSL/HTTPS errors?

1. Wait 24 hours after DNS propagation completes
2. GitHub needs time to provision SSL certificate
3. Try accessing with `http://` first, then it will redirect to `https://`

### GitHub says "DNS check failed"?

1. Verify your DNS records are correct
2. Wait 5-10 minutes and try again
3. Make sure you're using the correct format:
   - A records: Use `@` or leave Name blank
   - CNAME: Use `www` for Name field

### Both www and non-www not working?

Make sure you have:
- 4 A records pointing to GitHub's IPs (for root domain)
- 1 CNAME record pointing to `freeman1973-ai.github.io` (for www)

---

## 📱 Quick Reference Card

```
╔════════════════════════════════════════════════════════╗
║  CUSTOM DOMAIN SETUP - QUICK REFERENCE                 ║
╠════════════════════════════════════════════════════════╣
║  GitHub Pages URL:                                     ║
║  https://freeman1973-ai.github.io/Wastewater/          ║
║                                                        ║
║  Required DNS Records (for root domain):               ║
║  A Records → 185.199.108-111.153 (4 records)          ║
║  CNAME www → freeman1973-ai.github.io                  ║
║                                                        ║
║  GitHub Settings Location:                             ║
║  github.com/freeman1973-ai/Wastewater/settings/pages   ║
║                                                        ║
║  Propagation Time:                                     ║
║  24-48 hours (full), works partially after 1-4 hours  ║
╚════════════════════════════════════════════════════════╝
```

---

## 🎯 Step-by-Step Summary

**For fastest setup:**

1. **At your domain registrar (5 minutes):**
   - Add 4 A records with GitHub's IPs
   - Add 1 CNAME record for www

2. **At GitHub (2 minutes):**
   - Go to Settings → Pages
   - Enter your domain in "Custom domain"
   - Save and wait for verification

3. **Wait (1-48 hours):**
   - DNS propagates
   - GitHub provisions SSL
   - Site becomes accessible via your domain

4. **Enable HTTPS:**
   - Check "Enforce HTTPS" in GitHub Pages
   - Your site is now secure!

---

## 💡 Benefits of Custom Domain

Once configured, you get:
- ✅ Professional branded URL
- ✅ Automatic HTTPS/SSL
- ✅ Better SEO ranking
- ✅ Email addresses match your domain
- ✅ More memorable for clients
- ✅ GitHub Pages still hosts for free!

---

## 📞 Need Help?

If you're stuck:
1. Check DNS records with dnschecker.org
2. Verify GitHub shows green checkmark
3. Wait full 48 hours before troubleshooting
4. Review GitHub's custom domain documentation:
   https://docs.github.com/pages/configuring-a-custom-domain-for-your-github-pages-site

---

**Remember:** Your website files don't change at all - you're just adding a custom domain that points to your existing GitHub Pages site!

*Last Updated: February 18, 2026*
