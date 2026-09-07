---
layout: home
title: "Archive"
permalink: /archive/
page_id: archive
chunk: 1
---

{% assign images = site.data.gallery.images %}
{% include gallery.html images=images chunk=1 featured_first=true %}
