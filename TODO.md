# Tomorrow / next session

1. Add **contact information** (probably a small page or box — decide layout then)
2. **Extra gallery tabs** for special stuff (panoramas / weird shots)
3. **Full page check**: everything clean, consistent, human readable (titles, descriptions, dead ends)
4. **Split `_data/gallery.yml`** into separate files per set so it's easier to overview
   (needs a small template change — the include takes a data source parameter)
5. **Share/link previews**: add Open Graph meta tags so WhatsApp/Telegram/etc.
   show a thumbnail + title when someone opens a link. WhatsApp needs an
   absolute image URL in the page's <head> (one fixed og-image file; per-day
   dynamic image possible later). Bonus: point Instagram-like preview bots
   at an og:image sized ~1200x630.
5. thinking about adding lightroom presets

Not urgent reminders:
- `serve.bat` = the local live-preview server (localhost:4000, F5 to refresh)
- Push pending when happy — local commits only right now
- readme.md documents the whole "add a photo" flow
