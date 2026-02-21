# 📧 Contact Form Setup Guide

**Quick Answer:** Your contact form needs to be connected to an email service to work. This guide shows you how!

---

## 🎯 The Problem

The contact form in `index.html` currently has this placeholder:

```html
<form action="https://formspree.io/f/YOUR_FORM_ID" method="POST">
```

**This won't work!** You need to replace `YOUR_FORM_ID` with a real form ID from an email service.

---

## ✅ Solution Options

You have **3 free options** to make your contact form work:

1. **Formspree** (Recommended) - Easy, free up to 50 submissions/month
2. **EmailJS** - Free up to 200 emails/month
3. **Netlify Forms** (If hosting on Netlify) - 100 submissions/month free

---

## 🚀 Option 1: Formspree (Recommended - Easiest)

### Why Formspree?
- ✅ Super easy setup (5 minutes)
- ✅ No coding required
- ✅ Free plan: 50 submissions/month
- ✅ Works with static sites
- ✅ Spam protection included

### Step-by-Step Setup:

#### Step 1: Create Formspree Account

1. Go to: https://formspree.io
2. Click **"Get Started"** or **"Sign Up"**
3. Sign up with your email (free account)
4. Verify your email address

#### Step 2: Create a New Form

1. After logging in, click **"+ New Project"**
2. Name your project: "Jason Freeman Website"
3. Click **"+ New Form"**
4. Name the form: "Contact Form"
5. Click "Create Form"

#### Step 3: Get Your Form ID

After creating the form, you'll see your **Form Endpoint**:

```
https://formspree.io/f/xpwzabcd
                         ^^^^^^^^
                    This is your Form ID
```

**Copy the full URL!**

#### Step 4: Update Your Website

Open `index.html` and find line 173:

**BEFORE:**
```html
<form action="https://formspree.io/f/YOUR_FORM_ID" method="POST">
```

**AFTER:** (Replace with YOUR actual form ID)
```html
<form action="https://formspree.io/f/xpwzabcd" method="POST">
```

**⚠️ Important:** Use YOUR form ID, not `xpwzabcd`!

#### Step 5: Test Your Form

1. Save the file
2. Open your website
3. Fill out the contact form
4. Click "Send Message"
5. Check your email - you should receive the message!

**First submission:** Formspree will ask you to confirm it's your form. Click the confirmation link in the email.

### Formspree Dashboard Features:

After setup, you can:
- ✅ View all submissions
- ✅ Export to CSV
- ✅ Set up email notifications
- ✅ Add spam filtering
- ✅ Customize thank you page

---

## 🚀 Option 2: EmailJS (Alternative)

### Why EmailJS?
- ✅ Free plan: 200 emails/month
- ✅ Multiple email services supported (Gmail, Outlook, etc.)
- ✅ More customization options

### Step-by-Step Setup:

#### Step 1: Create EmailJS Account

1. Go to: https://www.emailjs.com
2. Click "Sign Up"
3. Create free account
4. Verify your email

#### Step 2: Add Email Service

1. Go to "Email Services" tab
2. Click "Add New Service"
3. Choose your email provider (Gmail recommended)
4. Follow instructions to connect your email
5. Note your **Service ID**

#### Step 3: Create Email Template

1. Go to "Email Templates" tab
2. Click "Create New Template"
3. Set up template with these fields:
   - `{{from_name}}` - Sender's name
   - `{{from_email}}` - Sender's email
   - `{{message}}` - Message content
4. Note your **Template ID**

#### Step 4: Get Your Public Key

1. Go to "Account" → "General"
2. Find your **Public Key**
3. Copy it

#### Step 5: Update Your Website

Replace the form section in `index.html` (lines 172-188):

```html
<!-- Load EmailJS SDK -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
<script type="text/javascript">
    (function() {
        emailjs.init("YOUR_PUBLIC_KEY"); // Replace with your public key
    })();
</script>

<form id="contact-form">
    <div class="form-group">
        <label for="name">Name</label>
        <input type="text" id="name" name="from_name" required>
    </div>
    <div class="form-group">
        <label for="email">Email</label>
        <input type="email" id="email" name="from_email" required>
    </div>
    <div class="form-group">
        <label for="message">Message</label>
        <textarea id="message" name="message" rows="5" required></textarea>
    </div>
    <button type="submit" class="submit-button">Send Message</button>
</form>

<script>
    document.getElementById('contact-form').addEventListener('submit', function(event) {
        event.preventDefault();
        
        emailjs.sendForm('YOUR_SERVICE_ID', 'YOUR_TEMPLATE_ID', this)
            .then(function() {
                alert('Message sent successfully!');
                document.getElementById('contact-form').reset();
            }, function(error) {
                alert('Failed to send message: ' + error.text);
            });
    });
</script>
```

**Replace:**
- `YOUR_PUBLIC_KEY` with your public key
- `YOUR_SERVICE_ID` with your service ID
- `YOUR_TEMPLATE_ID` with your template ID

---

## 🚀 Option 3: Netlify Forms (If using Netlify)

### Why Netlify Forms?
- ✅ Super simple if hosting on Netlify
- ✅ Free plan: 100 submissions/month
- ✅ No external service needed
- ✅ Built-in spam filtering

### Step-by-Step Setup:

#### Step 1: Update Your Form

In `index.html`, update the form (lines 173):

**BEFORE:**
```html
<form action="https://formspree.io/f/YOUR_FORM_ID" method="POST">
```

**AFTER:**
```html
<form name="contact" method="POST" data-netlify="true" netlify-honeypot="bot-field">
    <input type="hidden" name="form-name" value="contact" />
    <!-- Hidden field for spam protection -->
    <p style="display: none;">
        <label>Don't fill this out: <input name="bot-field" /></label>
    </p>
```

**Full form should look like:**
```html
<form name="contact" method="POST" data-netlify="true" netlify-honeypot="bot-field">
    <input type="hidden" name="form-name" value="contact" />
    <p style="display: none;">
        <label>Don't fill this out: <input name="bot-field" /></label>
    </p>
    <div class="form-group">
        <label for="name">Name</label>
        <input type="text" id="name" name="name" required>
    </div>
    <div class="form-group">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" required>
    </div>
    <div class="form-group">
        <label for="message">Message</label>
        <textarea id="message" name="message" rows="5" required></textarea>
    </div>
    <button type="submit" class="submit-button">Send Message</button>
</form>
```

#### Step 2: Deploy to Netlify

1. Commit and push your changes
2. Netlify will automatically detect the form
3. Go to Netlify dashboard → Forms
4. You'll see your contact form listed

#### Step 3: Configure Notifications

1. In Netlify Forms settings
2. Set up email notifications
3. Enter your email address

**That's it!** Netlify handles everything else.

---

## 🎯 Which Option Should You Choose?

### Choose Formspree if:
- ✅ You want the easiest setup
- ✅ You're not very technical
- ✅ 50 submissions/month is enough
- ✅ You want it working in 5 minutes

### Choose EmailJS if:
- ✅ You want more control
- ✅ You need 200 emails/month
- ✅ You want to use your own email service
- ✅ You're comfortable with a bit more setup

### Choose Netlify Forms if:
- ✅ You're hosting on Netlify
- ✅ You want the simplest possible setup
- ✅ You don't want to use external services

---

## 📝 Step-by-Step: Formspree Setup (Most Common)

Since Formspree is the easiest and most popular, here's the complete process:

### 1. Sign Up for Formspree

```
URL: https://formspree.io
Button: "Get Started" → "Sign Up"
Email: jason@jasonfreeman.org (or your email)
Password: Create a secure password
```

### 2. Verify Your Email

- Check your email inbox
- Click the verification link
- Return to Formspree dashboard

### 3. Create Your Form

```
Dashboard → "+ New Project" → Name: "Jason Freeman Website"
Click project → "+ New Form"
Form name: "Contact Form"
Click "Create Form"
```

### 4. Copy Your Form Endpoint

You'll see something like:
```
Form Endpoint: https://formspree.io/f/xpwzabcd
```

**Copy the entire URL!**

### 5. Update index.html

Find line 173 in `index.html`:

```html
<!-- OLD -->
<form action="https://formspree.io/f/YOUR_FORM_ID" method="POST">

<!-- NEW -->
<form action="https://formspree.io/f/xpwzabcd" method="POST">
```

**Use YOUR actual form ID!**

### 6. Save and Deploy

```bash
git add index.html
git commit -m "Configure contact form with Formspree"
git push
```

### 7. Test Your Form

1. Go to your website
2. Fill out the contact form:
   - Name: Test User
   - Email: your.email@example.com
   - Message: This is a test message
3. Click "Send Message"
4. **First time only:** Formspree will show a confirmation page
5. Check your email - you should receive the test message!

### 8. Configure Form Settings (Optional)

In Formspree dashboard:
- **Submissions:** View all form submissions
- **Settings:**
  - Add email notifications
  - Set up custom thank you page
  - Enable CAPTCHA (spam protection)
  - Export submissions to CSV

---

## 🔍 Testing Your Contact Form

### Test Checklist:

- [ ] Form loads on the page
- [ ] Can enter name, email, and message
- [ ] Submit button works
- [ ] See confirmation message
- [ ] Receive email with form data
- [ ] Reply-to address is correct
- [ ] No errors in browser console

### How to Test:

1. **Open your website**
   - Local: `file:///path/to/index.html`
   - Live: `https://yourdomain.com`

2. **Fill out the form:**
   ```
   Name: Test User
   Email: your.email@example.com
   Message: Testing the contact form!
   ```

3. **Click "Send Message"**

4. **Expected results:**
   - Success message appears
   - Form clears
   - Email arrives within 1 minute

5. **Check your email:**
   - Subject line shows form submission
   - Contains sender's name and email
   - Includes the message
   - Can reply to sender

---

## 🚨 Troubleshooting

### Problem: Form doesn't submit

**Solutions:**
1. **Check form action URL**
   - Is it still `YOUR_FORM_ID`?
   - Replace with your actual Formspree URL
   
2. **Check internet connection**
   - Form needs internet to work
   
3. **Clear browser cache**
   - Ctrl+Shift+Del → Clear cache
   
4. **Check browser console**
   - F12 → Console tab
   - Look for error messages

### Problem: Email not received

**Solutions:**
1. **Check spam folder**
   - Formspree emails might go to spam first
   
2. **Verify Formspree account**
   - Check if you confirmed your email
   - Log into Formspree dashboard
   - Check submissions tab
   
3. **Wait a few minutes**
   - First submission can take 2-5 minutes
   
4. **Check email settings in Formspree**
   - Dashboard → Form Settings → Notifications
   - Make sure your email is listed

### Problem: "Forbidden" or 403 error

**Solutions:**
1. **Confirm your form in Formspree**
   - First submission requires confirmation
   - Check your email for confirmation link
   
2. **Check form endpoint URL**
   - Must match exactly
   - Case sensitive!

### Problem: Spam submissions

**Solutions:**
1. **Enable CAPTCHA in Formspree**
   - Dashboard → Form Settings → CAPTCHA
   
2. **Add honeypot field**
   - Hidden field that bots fill out
   - Formspree auto-rejects those
   
3. **Use Netlify Forms**
   - Built-in spam filtering

---

## 📧 Email Notification Setup

### Formspree Email Notifications:

1. Go to Formspree dashboard
2. Select your form
3. Click "Settings"
4. Under "Email Notifications":
   - Add your email address
   - Choose notification frequency
   - Customize email template
5. Save changes

### Custom Reply-To:

Formspree automatically sets reply-to to the sender's email, so you can reply directly!

---

## 🔒 Security Best Practices

### Protect Against Spam:

1. **Use CAPTCHA**
   - reCAPTCHA v3 (invisible)
   - Formspree Pro feature
   
2. **Honeypot field**
   - Hidden field bots fill out
   - Already included in Formspree

3. **Rate limiting**
   - Formspree includes this
   - Prevents bot attacks

### Protect Your Email:

- ✅ Never put email directly in HTML
- ✅ Use form service instead
- ✅ Email addresses hidden from scrapers
- ✅ No spam to your inbox

---

## 💡 Pro Tips

### 1. Custom Thank You Page

Instead of generic confirmation, redirect to custom page:

```html
<form action="https://formspree.io/f/xpwzabcd" method="POST">
    <input type="hidden" name="_next" value="https://yourdomain.com/thank-you.html">
    <!-- rest of form -->
</form>
```

### 2. Custom Subject Line

Set custom email subject:

```html
<form action="https://formspree.io/f/xpwzabcd" method="POST">
    <input type="hidden" name="_subject" value="New Contact Form Submission!">
    <!-- rest of form -->
</form>
```

### 3. Auto-Reply to Sender

Send confirmation to person who filled form:

```html
<input type="hidden" name="_autoresponse" value="Thank you for contacting Jason Freeman. I'll get back to you soon!">
```

### 4. Disable CAPTCHA (if using Formspree)

```html
<input type="hidden" name="_captcha" value="false">
```

### 5. Redirect After Submission

```html
<input type="hidden" name="_next" value="https://jasonfreeman.org/thank-you">
```

---

## 📋 Quick Setup Summary

### For Formspree (5 minutes):

1. Sign up: https://formspree.io
2. Create form
3. Copy form ID
4. Replace `YOUR_FORM_ID` in line 173 of `index.html`
5. Save and deploy
6. Test the form

**Done!** Your contact form now works! 🎉

---

## 🔗 Useful Links

### Formspree:
- Website: https://formspree.io
- Documentation: https://help.formspree.io
- Pricing: https://formspree.io/pricing

### EmailJS:
- Website: https://www.emailjs.com
- Documentation: https://www.emailjs.com/docs
- Pricing: https://www.emailjs.com/pricing

### Netlify Forms:
- Documentation: https://docs.netlify.com/forms/setup
- Pricing: https://www.netlify.com/pricing

---

## ❓ FAQ

### Q: Is Formspree really free?

**A:** Yes! Free plan includes:
- 50 submissions per month
- Unlimited forms
- Email notifications
- Spam filtering
- File uploads (up to 10MB)

### Q: What happens after 50 submissions?

**A:** With free plan, form stops accepting submissions until next month. You can upgrade to paid plan for more.

### Q: Can I use my own email service?

**A:** Yes! Use EmailJS option to connect Gmail, Outlook, or any SMTP server.

### Q: Do I need a backend server?

**A:** No! These services work with static HTML sites. No server needed.

### Q: Will this work with GitHub Pages?

**A:** Yes! All three options work perfectly with GitHub Pages.

### Q: How do I know if form is working?

**A:** Test it! Fill out the form and check if you receive an email.

### Q: Can I see all submissions?

**A:** Yes! Formspree and EmailJS have dashboards showing all submissions.

### Q: Is my data secure?

**A:** Yes! All services use HTTPS encryption. Data is transmitted securely.

---

## ✅ Success Checklist

After setup, you should have:

- [ ] Form service account created (Formspree/EmailJS/Netlify)
- [ ] Form ID or configuration added to index.html
- [ ] Changes saved and deployed
- [ ] Form tested with real submission
- [ ] Email received successfully
- [ ] Can reply to form submissions
- [ ] Spam protection enabled (optional)
- [ ] Email notifications configured

---

## 🎉 You're Done!

Your contact form is now working! People can send you messages, and you'll receive them by email.

**Next steps:**
1. Test it again to make sure
2. Add form link to social media
3. Monitor submissions in dashboard
4. Respond to messages promptly

**Need help?** Check the troubleshooting section above or refer to your chosen service's documentation.

---

**Your professional wastewater website now has a fully functional contact form!** 📧✨
