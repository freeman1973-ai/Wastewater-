# Jason Freeman - Professional Wastewater Website

Professional website for Jason Freeman, Michigan Wastewater Class A Licensee.

## About

This website showcases professional wastewater treatment services and expertise. It features:

- **Professional Design**: Clean, modern design with blue color scheme representing water
- **Comprehensive Content**: Information about Class A licensing, services, and expertise
- **Photo Gallery**: Six wastewater treatment facility images
- **Contact Form**: Easy way for potential clients to get in touch
- **Mobile Responsive**: Works perfectly on all devices

## Website Sections

1. **Home/Hero**: Professional introduction and Class A license highlight
2. **About**: Detailed information about Michigan Class A licensing and expertise
3. **Services**: Six professional service offerings
4. **Gallery**: Wastewater treatment facility photos
5. **Contact**: Contact information and submission form

## Files

- `index.html` - Main website file
- `styles.css` - Professional CSS styling
- `images/` - Wastewater treatment facility images (6 photos)
- `DEPLOYMENT.md` - Complete deployment guide for JasonFreeman.org

## 🚀 Quick Start - Enable GitHub Pages

**Want your website live in 2 minutes?**

👉 **[Read: ENABLE_GITHUB_PAGES.md](ENABLE_GITHUB_PAGES.md)** - Simple step-by-step guide  
👉 **[Read: GITHUB_PAGES_VISUAL_GUIDE.md](GITHUB_PAGES_VISUAL_GUIDE.md)** - Visual guide with diagrams

**Quick Steps:**
1. Go to: https://github.com/freeman1973-ai/Wastewater-/settings/pages
2. Select "GitHub Actions" as source
3. Wait 1-2 minutes
4. Visit: https://freeman1973-ai.github.io/Wastewater-/

**Your website will be live!** 🎉

## 🌐 Make Your Website Appear at Your Domain

**Website looks good? Connect it to your domain!**

### ⚡ Quick Start (5 minutes setup)
👉 **[Read: DOMAIN_QUICK_START.md](DOMAIN_QUICK_START.md)** - Simple 2-step process to connect your domain

**The Process:**
1. **At your domain registrar:** Add DNS records (4 A records + 1 CNAME)
   - A Records: Name field = `@` (or blank)
   - CNAME Record: Name field = `www`
2. **At GitHub Pages:** Enter your domain in settings
3. **Wait 1-48 hours:** DNS propagates and your domain shows your website!

### ❓ Confused About the "Name" Field?
👉 **[Read: DNS_NAME_FIELD_GUIDE.md](DNS_NAME_FIELD_GUIDE.md)** - Clear explanation of what to enter

**Quick Answer:**
- For A records: Enter `@` (or leave blank)
- For CNAME record: Enter `www`
- Visual examples for all major registrars

### 📖 Detailed Instructions
👉 **[Read: CUSTOM_DOMAIN_SETUP.md](CUSTOM_DOMAIN_SETUP.md)** - Complete guide with troubleshooting

**Includes:**
- DNS configuration with exact IP addresses
- Registrar-specific instructions (GoDaddy, Namecheap, Google Domains, Cloudflare)
- GitHub Pages custom domain setup
- SSL/HTTPS automatic enablement
- Troubleshooting guide

### ⚠️ Cloudflare Users: Proxy vs DNS-Only
👉 **[Read: PROXY_VS_DNS_ONLY.md](PROXY_VS_DNS_ONLY.md)** - Critical configuration guide

**Important:** If using Cloudflare, you MUST use **DNS-only mode** (gray cloud ☁, not orange ☁️)
- Orange cloud (proxied) = Won't work ❌
- Gray cloud (DNS-only) = Works correctly ✅
- GitHub Pages requires direct DNS resolution

### 🔍 Check Your DNS Configuration
👉 **[Read: DNS_CHECK_GUIDE.md](DNS_CHECK_GUIDE.md)** - Verify your DNS is configured correctly

**Tools provided:**
- Online DNS checker instructions
- Command-line DNS verification
- Step-by-step troubleshooting
- DNS propagation status checking
- `check-dns.sh` script for automated checking

**Run DNS check:**
```bash
./check-dns.sh
```

## Other Deployment Options

See [DEPLOYMENT.md](DEPLOYMENT.md) for instructions on:
- Traditional web hosting setup (FTP, cPanel, SSH)
- Contact form configuration with Formspree
- Additional deployment options

## Local Preview

To preview the website locally:
1. Open `index.html` in your web browser
2. All features except the contact form will work without a server

## Contact Form Setup

The contact form requires setup with Formspree:
1. Sign up at https://formspree.io
2. Create a new form and get your form ID
3. Update line 172 in `index.html` with your form ID

## Technologies Used

- HTML5
- CSS3 (with responsive design)
- Professional color scheme optimized for wastewater industry

## License

© 2026 Jason Freeman - Michigan Class A Wastewater Licensee. All rights reserved.
