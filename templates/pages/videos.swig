---
layout: default.swig
title: Videos
description: 'Screencasts, courses and video tutorials on web performance principles, analysis and monitoring, optimization, responsive web design and more.'
base_url: "../"
section: videos
slug: index
---

{% include 'templates/partials/intro.swig' with {title: title, subtitle: 'A collection of screencasts, courses and video tutorials on web performance principles, analysis, audits, monitoring and optimization.'} %}

<div class="wrapper">
    {% include 'templates/partials/videos_list.swig' with {video_list: videos } %}
</div>
