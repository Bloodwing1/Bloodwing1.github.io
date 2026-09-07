# Web Pics
A page to showcase my photography.
still very much in test phase


## How to add a new photo (the whole process)

1. **Drop the original JPG** (from Lightroom, unchanged export is fine) into
   `C:\Users\huber\Desktop\Images for page 2\`.

2. **Open PowerShell** and convert it to WebP. Replace `MBS_XXXX` with your filename:

   ```
   & "C:\Program Files\ImageMagick-7.1.2-Q16-HDRI\magick.exe" "C:\Users\huber\Desktop\Images for page 2\MBS_XXXX.jpg" -auto-orient -resize "2400x2400>" -quality 80 -define webp:method=6 "C:\Users\huber\Desktop\Bloodwing1.github.io-main\Bloodwing1.github.io-main\assets\WebPics2\MBS_XXXX.webp"
   ```

   - `2400x2400>` = shrink so the longest side is max 2400px (never enlarges)
   - `quality 80` = good size/quality balance
   - Photos come out around 200–800 KB, keep the original JPG elsewhere as backup

3. **Read the dimensions** (needed for the next step):

   ```
   & "C:\Program Files\ImageMagick-7.1.2-Q16-HDRI\magick.exe" identify -format "%wx%h" "C:\Users\huber\Desktop\Bloodwing1.github.io-main\Bloodwing1.github.io-main\assets\WebPics2\MBS_XXXX.webp"
   ```

4. **Add an entry** at the bottom of `_data/gallery.yml`. Copy an existing block and change:

   ```yaml
     - title: "Your title"
       path: "/assets/WebPics2/MBS_XXXX.webp"
       description: "your description"
       date: "2026-09-06"
       width: 2400          # from step 3
       height: 1602         # from step 3
       settings:
         aperture: "f/3.5"
         shutter_speed: "4s"
         iso: "ISO 1600"
         focal_length: "15mm"
         film: "Only if it's a film shot — delete the line otherwise"
       camera:
         model: "Pentax-K1 Mark II"
         lens: "HD Pentax-D FA 15-30mm F2.8"
   ```

   - **Keep 4-space indents exactly like the entries above — spaces, never tabs**
   - The number under the photo (19, 20, …) is automatic: it's the position in
     this file + 9 (the archive-2 set). Don't write it anywhere.
   - Panoramas: add `wide: true` (aligned under `path:`) to give them a
     full-width row

5. **Optional — make it the picture of the day:** in `_data/featured.yml` set

   ```yaml
   image: "/assets/WebPics2/MBS_XXXX.webp"
   note: "your blurb, or leave empty: \"\""
   past:
     - "/assets/WebPics2/previous-potd.webp"   # newest first
   ```

   The current + past featured photos pin themselves to the top of the Archive
   page. The note only shows while the photo is featured.

6. **Check locally:** open `preview.html` (and `preview-archive.html`) in the
   browser, Ctrl+F5 to refresh.

7. **Go live:** push `main` to GitHub — or just ask me to do it.
   If the site doesn't update after ~10 minutes, push an empty commit
   (`git commit --allow-empty -m "Trigger Pages rebuild"` + push) — the Pages
   build sometimes misses a push.


## Wishlist
- [ ] A way to see higher res versions of the images
