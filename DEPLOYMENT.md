# Deployment Guide for Your Professional Website

This guide explains how to deploy your professional wastewater website.

## Website Structure

Your website includes:
- `index.html` - Main website file
- `styles.css` - Professional styling
- `images/` - Wastewater treatment facility images (6 images)

## Deployment Options

### Option 1: GitHub Pages (Recommended - FREE)

1. Ensure your repository is public
2. Go to repository Settings → Pages
3. Under "Source", select **"GitHub Actions"**
4. Your website will be live at: https://freeman1973-ai.github.io/Wastewater/
5. See ENABLE_GITHUB_PAGES.md for detailed instructions

### Option 2: FTP/SFTP Upload (Traditional Web Hosting)

1. Connect to your web hosting using an FTP client (like FileZilla):
   - Host: Your hosting provider's FTP address
   - Username: Your FTP username
   - Password: Your FTP password
   - Port: 21 (FTP) or 22 (SFTP)

2. Upload all files:
   - Upload `index.html` to the root directory (usually `public_html` or `www`)
   - Upload `styles.css` to the same directory
   - Create an `images` folder and upload all images from the `images/` directory

3. Test your website by visiting your domain

### Option 3: cPanel File Manager

1. Log into your hosting cPanel account
2. Open "File Manager"
3. Navigate to `public_html` or `www`
4. Upload all files:
   - `index.html`
   - `styles.css`
   - Create `images` folder and upload all images

### Option 4: Using Git on Server (If SSH access available)

```bash
# SSH into your server
ssh user@yourserver.com

# Navigate to web root
cd /var/www/html  # or public_html

# Clone the repository
git clone https://github.com/freeman1973-ai/Wastewater-.git temp
cd temp

# Copy files to web root
cp index.html ../
cp styles.css ../
cp -r images ../

# Clean up
cd ..
rm -rf temp
```

## DNS Configuration (If Using Custom Domain)

If you're using a custom domain with your hosting:

1. Log into your domain registrar (where you bought the domain)
2. Update DNS records:
   - A Record: Point to your hosting IP address
   - CNAME Record: `www` → your primary domain
3. Wait 24-48 hours for DNS propagation

## Contact Form Setup

The contact form uses Formspree. To activate it:

1. Sign up at https://formspree.io
2. Create a new form
3. Copy your form ID
4. Edit `index.html` line 172:
   - Replace `YOUR_FORM_ID` with your actual Formspree form ID
   - Example: `https://formspree.io/f/xpwzabcd`

## Testing Your Website

After deployment:
1. Visit your website URL
2. Check all sections load correctly
3. Verify images display properly
4. Test navigation links
5. Test contact form submission (if configured)
6. Check mobile responsiveness

## Troubleshooting

### Images not showing:
- Verify the `images` folder is in the same directory as `index.html`
- Check file permissions (should be 644 for files, 755 for directories)
- Ensure image filenames match exactly (case-sensitive)

### Website not loading:
- Verify DNS is pointing to correct server
- Check that `index.html` is in the correct directory
- Clear browser cache

### Contact form not working:
- Make sure you've set up Formspree and updated the form action URL
- Check that your email is verified in Formspree

## Updating Website Content

To update content:
1. Edit the files in your repository
2. Commit and push changes to GitHub
3. Re-upload changed files to your hosting

## Support

For hosting-specific questions, contact your hosting provider's support team.

## File Checklist

Before deployment, ensure you have:
- ✅ index.html
- ✅ styles.css
- ✅ images/aeration-tanks.jpg
- ✅ images/clarifiers.jpg
- ✅ images/control-room.jpg
- ✅ images/treatment-plant.jpg
- ✅ images/filtration.jpg
- ✅ images/lab-testing.jpg

## Website Features

Your website includes:
- Professional header with navigation
- Hero section highlighting Class A license
- Detailed about section
- Services offered (6 service cards)
- Photo gallery (6 wastewater facility images)
- Contact form and information
- Mobile-responsive design
- Professional blue color scheme
