# 📋 Domain Setup Cheat Sheet

**Print this page and follow along!**

---

## ✅ Checklist

- [ ] **Step 1:** Add DNS records at domain registrar
- [ ] **Step 2:** Add domain in GitHub Pages settings
- [ ] **Step 3:** Wait for DNS verification (green checkmark)
- [ ] **Step 4:** Enable "Enforce HTTPS"
- [ ] **Step 5:** Wait 1-48 hours for propagation
- [ ] **Step 6:** Test your domain - it should load your website!

---

## 📝 DNS Records to Add

**At your domain registrar (where you bought your domain):**

### Add 4 A Records:
```
Record 1:
Type: A
Name: @ (or blank)
Value: 185.199.108.153

Record 2:
Type: A
Name: @ (or blank)
Value: 185.199.109.153

Record 3:
Type: A
Name: @ (or blank)
Value: 185.199.110.153

Record 4:
Type: A
Name: @ (or blank)
Value: 185.199.111.153
```

### Add 1 CNAME Record:
```
Type: CNAME
Name: www
Value: freeman1973-ai.github.io
```

**TTL:** Use 3600 or Auto

---

## ⚙️ GitHub Pages Settings

**URL:** https://github.com/freeman1973-ai/Wastewater/settings/pages

### What to Do:
1. Scroll to "Custom domain" section
2. Enter your domain (example: `yourdomain.com`)
3. Click **Save**
4. Wait for green checkmark ✓
5. Check **"Enforce HTTPS"**

---

## 🔍 How to Verify

### Check DNS Configuration:
- Visit: https://dnschecker.org
- Enter your domain
- Should see GitHub IPs (185.199.108-111.153)

### Test Your Website:
- Visit: `http://yourdomain.com`
- Visit: `https://yourdomain.com`
- Visit: `http://www.yourdomain.com`
- All should load your website!

---

## ⏱️ Timeline

| Time | Status |
|------|--------|
| 0 minutes | Add DNS records |
| 5 minutes | Configure GitHub Pages |
| 10 minutes | DNS verification starts |
| 1-4 hours | Site accessible for most users |
| 24-48 hours | Fully propagated worldwide |

---

## 🆘 Quick Fixes

**Problem:** DNS check unsuccessful in GitHub  
**Fix:** Wait 10 minutes, verify all records are correct

**Problem:** Site not loading  
**Fix:** Wait full 48 hours, clear browser cache

**Problem:** SSL/HTTPS errors  
**Fix:** Wait 24 hours after propagation, check "Enforce HTTPS"

---

## 📞 Need Help?

- **Quick Start:** [DOMAIN_QUICK_START.md](DOMAIN_QUICK_START.md)
- **Full Guide:** [CUSTOM_DOMAIN_SETUP.md](CUSTOM_DOMAIN_SETUP.md)
- **Troubleshooting:** [TROUBLESHOOTING_REPORT.md](TROUBLESHOOTING_REPORT.md)

---

## 🎯 Success Indicators

✅ Green checkmark in GitHub Pages settings  
✅ Your domain loads the website  
✅ HTTPS works (🔒 padlock in browser)  
✅ Both `yourdomain.com` and `www.yourdomain.com` work  

---

**Your website is ready! Just connect your domain and go live!** 🚀
