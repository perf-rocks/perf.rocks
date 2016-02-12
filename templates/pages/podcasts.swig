---
layout: default.swig
title: Podcasts
description: 'Web performance Podcasts and audioguides.'
base_url: "../"
section: podcasts
slug: index
---

{% include 'templates/partials/intro.swig' with {title: title, subtitle: 'A collection of podcasts and audioguides on web performance.'} %}

<div class="wrapper">
    {% include 'templates/partials/podcasts_list.swig' with {podcast_list: podcasts } %}
</div>
