---
layout: default.swig
title: Articles
base_url: "../"
section: articles
slug: index
---

{% include 'templates/partials/intro.swig' with {title: title, subtitle: 'Articles on web performance principles, analysis and monitoring, optimization, responsive web design and more.'} %}

{% set article_categories = articles|get_categories %}

<div class="wrapper">

    <ul class="article-list">
        {% for article in articles %}
            <li class="article-list__item">
                <h2 class="m0"><a class="unlink" href="{{ article.url }}">{{ article.title }}</a></h2>
                {% if article.author %}
                    <p class="micro | weak-text-color | m0">by <a href="/people/{{ article.author|slug }}/">{{ article.author }}</a> in {{ article.category }}</p>
                {% endif %}
            </li>
        {% endfor %}
    </ul>

    {# <nav class="article-categories">
        <h3>Categories</h3>
        <ul>
            {% for category in article_categories %}
                <li><a href="/articles/{{ category|slug }}">{{ category }}</a></li>
            {% endfor %}
        </ul>
    </nav> #}
</div>
