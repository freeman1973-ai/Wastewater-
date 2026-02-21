# 📝 DNS "Name" Field Guide - What to Enter

**Quick Answer:** 
- **For A Records:** Use `@` (or leave blank, or enter your domain name)
- **For CNAME Record:** Use `www`

---

## 🎯 The Question

When adding DNS records at your domain registrar, you'll see a field called **"Name"** (also called "Host" or "Hostname"). 

**What should you enter?**

This guide shows exactly what to put in that field.

---

## 📋 For A Records (Root Domain)

### What to Enter in "Name" Field:

You have **THREE OPTIONS** (depending on your registrar):

1. **`@`** ← Most registrars (GoDaddy, Namecheap, Google Domains)
2. **Leave it blank** ← Some registrars
3. **Your domain name** (e.g., `jasonfreeman.org`) ← **Cloudflare users: Use this!**

**⚠️ Cloudflare Users:** If Cloudflare won't accept `@`, enter your full domain name instead!

### Examples by Registrar:

#### GoDaddy
```
Type: A
Name: @ ← Enter this
Value: 185.199.108.153
TTL: 3600
```

#### Namecheap
```
Type: A Record
Host: @ ← Enter this
Value: 185.199.108.153
TTL: Automatic
```

#### Google Domains
```
Type: A
Name: @ ← Enter this (or leave blank)
IPv4 address: 185.199.108.153
TTL: 1H
```

#### Cloudflare

**⚠️ IMPORTANT: Cloudflare is different!**

Cloudflare often doesn't accept `@` - instead, enter your **full domain name**:

```
Type: A
Name: jasonfreeman.org ← Enter YOUR domain (not @)
IPv4 address: 185.199.108.153
Proxy status: DNS only (gray cloud ☁)
TTL: Auto
```

**Alternative:** Some Cloudflare configurations accept `@`, but if it doesn't work, use your domain name!

### What `@` Means:

`@` is DNS shorthand for **"the root domain"** or **"the apex domain"**

If your domain is `jasonfreeman.org`, then:
- `@` = `jasonfreeman.org`
- It represents the domain itself (not a subdomain)

### Why A Records Use `@`:

A records for the root domain point your **bare domain** to GitHub Pages:
- `jasonfreeman.org` → GitHub Pages
- `http://jasonfreeman.org` → Your website
- `https://jasonfreeman.org` → Your website

---

## 📋 For CNAME Record (www Subdomain)

### What to Enter in "Name" Field:

**ALWAYS enter:** `www`

### Examples by Registrar:

#### GoDaddy
```
Type: CNAME
Name: www ← Enter this
Value: freeman1973-ai.github.io
TTL: 3600
```

#### Namecheap
```
Type: CNAME Record
Host: www ← Enter this
Target: freeman1973-ai.github.io
TTL: Automatic
```

#### Google Domains
```
Type: CNAME
Name: www ← Enter this
Data: freeman1973-ai.github.io
TTL: 1H
```

#### Cloudflare
```
Type: CNAME
Name: www ← Enter this
Target: freeman1973-ai.github.io
Proxy status: DNS only
TTL: Auto
```

### What `www` Means:

`www` creates a **subdomain** of your main domain.

If your domain is `jasonfreeman.org`, then:
- `www` = `www.jasonfreeman.org`
- It represents the www subdomain

### Why CNAME Uses `www`:

CNAME for www makes sure the www version also works:
- `www.jasonfreeman.org` → GitHub Pages
- `http://www.jasonfreeman.org` → Your website
- `https://www.jasonfreeman.org` → Your website

---

## 🎨 Visual Guide

### Complete DNS Configuration

Here's what ALL your DNS records should look like:

```
┌─────────────────────────────────────────────────────┐
│ DNS Records for: jasonfreeman.org                   │
├─────────┬──────────┬─────────────────────┬─────────┤
│ Type    │ Name     │ Value/Target        │ TTL     │
├─────────┼──────────┼─────────────────────┼─────────┤
│ A       │ @        │ 185.199.108.153     │ 3600    │
│ A       │ @        │ 185.199.109.153     │ 3600    │
│ A       │ @        │ 185.199.110.153     │ 3600    │
│ A       │ @        │ 185.199.111.153     │ 3600    │
│ CNAME   │ www      │ freeman1973-ai...   │ 3600    │
└─────────┴──────────┴─────────────────────┴─────────┘
                ↑
           THIS is the "Name" field!
```

---

## 🔍 Common Name Field Variations

Different registrars call this field different names:

| Registrar | Field Name | For A Records | For CNAME |
|-----------|------------|---------------|-----------|
| **GoDaddy** | Name | `@` | `www` |
| **Namecheap** | Host | `@` | `www` |
| **Google Domains** | Name | `@` or blank | `www` |
| **Cloudflare** | Name | **Your domain** (or `@`) | `www` |
| **Domain.com** | Host | `@` | `www` |
| **Bluehost** | Name | `@` | `www` |
| **HostGator** | Name | `@` | `www` |

**Note:** Cloudflare often requires your full domain name (e.g., `jasonfreeman.org`) instead of `@`

---

## ❓ Frequently Asked Questions

### Q: Cloudflare won't let me use `@` - what do I do?

**A:** This is common! Cloudflare uses a different interface. **Solution:**

**Instead of `@`, enter your full domain name:**
```
Type: A
Name: jasonfreeman.org ← Use YOUR domain
IPv4 address: 185.199.108.153
Proxy status: DNS only (gray cloud)
```

**Do this for all 4 A records** - each time, enter your domain name (not `@`).

This is normal for Cloudflare and works perfectly! ✅

---

### Q: Should I use `@` or leave it blank?

**A:** Depends on your registrar:
- **GoDaddy, Namecheap:** Use `@`
- **Google Domains:** Use `@` or leave blank
- **Cloudflare:** Use your domain name (e.g., `jasonfreeman.org`)

### Q: Can I type my domain name instead of `@`?

**A:** Yes! Especially for Cloudflare. Most other registrars prefer `@`, but Cloudflare often requires the full domain name.

### Q: What if I only enter `@` for 1 A record?

**A:** You need ALL 4! Enter `@` (or blank) for each of the 4 A records.

### Q: Do I need to type `www.jasonfreeman.org` for CNAME?

**A:** No! Just `www`. The system adds your domain automatically.

### Q: What about `@.jasonfreeman.org`?

**A:** No! Don't include your domain. Just use `@` alone.

---

## 📝 Step-by-Step Example

### Example: Adding Records for jasonfreeman.org at GoDaddy

#### Record 1 - First A Record:
```
1. Click "Add" or "Add Record"
2. Select Type: A
3. Name field: @ ← Type this
4. Value field: 185.199.108.153 ← Type this
5. TTL: 3600 (or leave default)
6. Click "Save"
```

#### Record 2 - Second A Record:
```
1. Click "Add" again
2. Type: A
3. Name: @ ← Same as before
4. Value: 185.199.109.153 ← Different IP
5. TTL: 3600
6. Save
```

#### Record 3 - Third A Record:
```
1. Click "Add"
2. Type: A
3. Name: @ ← Still same
4. Value: 185.199.110.153 ← Different IP
5. TTL: 3600
6. Save
```

#### Record 4 - Fourth A Record:
```
1. Click "Add"
2. Type: A
3. Name: @ ← Still same
4. Value: 185.199.111.153 ← Different IP
5. TTL: 3600
6. Save
```

#### Record 5 - CNAME Record:
```
1. Click "Add"
2. Type: CNAME
3. Name: www ← Now it's different!
4. Value: freeman1973-ai.github.io
5. TTL: 3600
6. Save
```

**Done!** You should have 5 records total.

---

## 📝 Special Instructions for Cloudflare Users

### Example: Adding Records at Cloudflare for jasonfreeman.org

**⚠️ Important:** Cloudflare uses your domain name, not `@`

#### Record 1 - First A Record:
```
1. Go to: DNS tab in Cloudflare
2. Click "Add record"
3. Type: A
4. Name: jasonfreeman.org ← YOUR domain (not @)
5. IPv4 address: 185.199.108.153
6. Proxy status: Click orange cloud to make it gray ☁
7. Click "Save"
```

#### Record 2-4 - Other A Records:
```
Repeat above with these IPs:
- 185.199.109.153
- 185.199.110.153
- 185.199.111.153

Each time:
- Name: jasonfreeman.org (YOUR domain)
- Proxy: DNS only (gray cloud)
```

#### Record 5 - CNAME Record:
```
1. Click "Add record"
2. Type: CNAME
3. Name: www ← Just www for this one!
4. Target: freeman1973-ai.github.io
5. Proxy status: Gray cloud ☁ (DNS only)
6. Save
```

**Cloudflare Tip:** The interface auto-completes, so you might see it change `jasonfreeman.org` to `@` after saving - that's okay!

---

## ✅ How to Verify You Did It Right

### Check Your DNS Records List

After adding all records, you should see:

```
Your DNS Records:

A       @       185.199.108.153     ✓
A       @       185.199.109.153     ✓
A       @       185.199.110.153     ✓
A       @       185.199.111.153     ✓
CNAME   www     freeman1973-ai.github.io    ✓

Total: 5 records
```

### Online Verification

1. Go to: https://dnschecker.org
2. Enter: `jasonfreeman.org`
3. Type: A
4. Should show all 4 GitHub IPs

Then:
1. Change Type to: CNAME
2. Enter: `www.jasonfreeman.org`
3. Should show: `freeman1973-ai.github.io`

---

## 🚨 Common Mistakes

### ❌ Mistake 1: Using full domain instead of `@`

**Wrong:**
```
Type: A
Name: jasonfreeman.org ← Don't include .org!
Value: 185.199.108.153
```

**Right:**
```
Type: A
Name: @ ← Just this!
Value: 185.199.108.153
```

### ❌ Mistake 2: Using `@` for CNAME

**Wrong:**
```
Type: CNAME
Name: @ ← Wrong for CNAME!
Value: freeman1973-ai.github.io
```

**Right:**
```
Type: CNAME
Name: www ← Use www for CNAME!
Value: freeman1973-ai.github.io
```

### ❌ Mistake 3: Including protocol in Name

**Wrong:**
```
Type: A
Name: http://@ ← Don't add http://!
Value: 185.199.108.153
```

**Right:**
```
Type: A
Name: @ ← Just the symbol!
Value: 185.199.108.153
```

### ❌ Mistake 4: Adding domain to www

**Wrong:**
```
Type: CNAME
Name: www.jasonfreeman.org ← Too much!
Value: freeman1973-ai.github.io
```

**Right:**
```
Type: CNAME
Name: www ← Just www!
Value: freeman1973-ai.github.io
```

---

## 📖 Quick Reference Card

**Print and keep this handy:**

```
┌───────────────────────────────────────────┐
│     DNS "Name" Field Quick Reference      │
├───────────────────────────────────────────┤
│                                           │
│  For A RECORDS (4 of them):               │
│  Most registrars: @                       │
│  Cloudflare: YOUR DOMAIN NAME             │
│             (e.g., jasonfreeman.org)      │
│                                           │
│  For CNAME RECORD (1 of them):            │
│  All registrars: www                      │
│                                           │
│  Example Domain: jasonfreeman.org         │
│                                           │
│  @ means → jasonfreeman.org               │
│  www means → www.jasonfreeman.org         │
│                                           │
└───────────────────────────────────────────┘
```

### 🔵 Special Card for Cloudflare Users

```
┌───────────────────────────────────────────┐
│    CLOUDFLARE DNS "Name" Field Guide      │
├───────────────────────────────────────────┤
│                                           │
│  ⚠️ Cloudflare won't accept @             │
│                                           │
│  For A RECORDS (4 of them):               │
│  Name: jasonfreeman.org                   │
│        ↑ YOUR domain, not @               │
│  Proxy: Gray cloud ☁ (DNS only)           │
│                                           │
│  For CNAME RECORD (1 of them):            │
│  Name: www                                │
│  Proxy: Gray cloud ☁ (DNS only)           │
│                                           │
│  Remember:                                │
│  • Use your full domain for A records     │
│  • Use "www" for CNAME                    │
│  • Always gray cloud (DNS only)!          │
│                                           │
└───────────────────────────────────────────┘
```

---

## 🔗 Related Documentation

- [DOMAIN_QUICK_START.md](DOMAIN_QUICK_START.md) - Quick domain setup
- [DOMAIN_CHEAT_SHEET.md](DOMAIN_CHEAT_SHEET.md) - Printable cheat sheet
- [CUSTOM_DOMAIN_SETUP.md](CUSTOM_DOMAIN_SETUP.md) - Complete setup guide
- [DNS_CHECK_GUIDE.md](DNS_CHECK_GUIDE.md) - Verify configuration
- [check-dns.sh](check-dns.sh) - Automated checker

---

## 💡 Pro Tips

1. **Copy-paste `@` symbol** - Don't try to type it wrong
2. **Use consistent format** - If one A record uses `@`, all should
3. **Double-check spelling** - `www` not `wwww` or `ww`
4. **Save after each record** - Don't lose your work
5. **Screenshot when done** - Proof of correct configuration

---

## 🎯 Summary

### For Your Domain (jasonfreeman.org)

**A Records (4 times):**
- Name field: `@`
- What this creates: `jasonfreeman.org`

**CNAME Record (1 time):**
- Name field: `www`
- What this creates: `www.jasonfreeman.org`

### The Result:

Both of these will work:
- ✅ `jasonfreeman.org` → Your website
- ✅ `www.jasonfreeman.org` → Your website

---

**That's it! Just remember: `@` for A records, `www` for CNAME!** 🎉

---

## 📞 Still Confused?

If you're still not sure what to enter:

1. **Take a screenshot** of your registrar's "Add DNS Record" page
2. Look for the field called "Name" or "Host"
3. For A records: Try `@` first
4. For CNAME: Use `www`
5. Save and test

**Most common answer:** Just use `@` for A records and `www` for CNAME!
