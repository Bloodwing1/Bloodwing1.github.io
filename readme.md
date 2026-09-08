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
   - Oldest photos live at the top of this file, newest at the bottom.
     The number under each photo is automatic: its position in this file.
     Never write the number anywhere.
   - Archive pages hold **10 photos** each. `/archive/` always shows the newest
     ones; older photos slide back to `/archive-2/`, `/archive-3/`, …
     Pages up to Archive 4 (40 photos) already exist — ask me to add more
     beyond that.
   - Panoramas: add `wide: true` (aligned under `path:`) to give them a
     full-width row

5. **Optional — make it the picture of the day:** in `_data/featured.yml` set

   ```yaml
   image: "/assets/WebPics2/MBS_XXXX.webp"
   note: "your blurb, or leave empty: \"\""
   past:
     - "/assets/WebPics2/previous-potd.webp"   # newest first
   ```

   The current + past featured photos pin themselves to the top of the newest
   Archive page. The note only shows while the photo is featured.

6. **Check locally:** make sure the server is running (double-click `serve.bat`
   if the console isn't open), then open `http://localhost:4000` and press F5.
   Every file save rebuilds the site automatically.

7. **Go live** — in PowerShell, inside the site folder
   (`cd C:\Users\huber\Desktop\Bloodwing1.github.io-main\Bloodwing1.github.io-main`):

   ```
   git add -A
   git commit -m "Add new photo"
   git push origin main
   ```

   GitHub rebuilds the live site within ~2 minutes. If `bloodwing1.github.io`
   still looks old after 10 minutes, run `git commit --allow-empty -m "Trigger
   Pages rebuild"` and `git push origin main` again — the Pages build
   sometimes misses a push.

**Where do the camera settings come from?** Lightroom shows them in the
EXIF panel — or run this and read the output:

```
& "C:\Program Files\ImageMagick-7.1.2-Q16-HDRI\magick.exe" "C:\Users\huber\Desktop\Images for page 2\MBS_XXXX.jpg" -format "camera=%[EXIF:Model]|lens=%[EXIF:LensModel]|aperture=%[EXIF:FNumber]|shutter=%[EXIF:ExposureTime]|iso=%[EXIF:PhotographicSensitivity]|focal=%[EXIF:FocalLength]|date=%[EXIF:DateTimeOriginal]" info:
```

## Dumping many photos at once

Convert a whole folder in one go (writes the WebPs straight into the site):

```
& "C:\Program Files\ImageMagick-7.1.2-Q16-HDRI\magick.exe" mogrify -path "C:\Users\huber\Desktop\Bloodwing1.github.io-main\Bloodwing1.github.io-main\assets\WebPics2" -auto-orient -resize "2400x2400>" -quality 80 -define webp:method=6 "C:\Users\huber\Desktop\Images for page 2\*.jpg"
```

Then add one block per photo to `_data/gallery.yml` (order them oldest to
newest, newest must be at the bottom). For big dumps just tell me — batch
converting and wiring the YAML entries is exactly the kind of thing to hand over.


## Wishlist
- [ ] A way to see higher res versions of the images
