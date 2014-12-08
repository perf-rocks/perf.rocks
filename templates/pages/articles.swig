---
layout: default.swig
title: Articles
description: 'Articles on web performance principles, analysis and monitoring, optimization, responsive web design and more.'
base_url: "../"
section: articles
slug: index
---

{% include 'templates/partials/intro.swig' with {title: title, subtitle: 'Articles on web performance principles, analysis and monitoring, optimization, responsive web design and more.'} %}

<div class="wrapper">
    {% include 'templates/partials/article_list.swig' with {article_list: articles } %}
    {% include 'templates/partials/article_categories.swig' %}
</div>
