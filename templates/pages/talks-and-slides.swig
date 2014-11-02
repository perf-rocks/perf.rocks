---
layout: default.swig
title: Talks & Slides
base_url: "../"
section: talks-and-slides
slug: index
---

{% include 'templates/partials/intro.swig' with {title: title, subtitle: 'A collection of talks on front-end web performance optmiziation.'} %}

{% set article_categories = articles|get_categories %}

<div class="wrapper">
    <ul class="article-list">
        {% for talk in talks %}
            <li class="article-list__item | mb">
                <h2 class="m0"><a class="unlink" href="{% if talk.talk_url %}{{ talk.talk_url }}{% else %}{{ talk.slides_url }}{% endif %}">{{ talk.title }}</a></h2>
                <p class="micro | weak-text-color | m0">by <a href="/people/{{ talk.author|slug }}/">{{ talk.author }}</a></p>
                <p>
                    {% if talk.talk_url %}<a class="btn btn--tiny | mb--tiny" href="{{ talk.talk_url }}">video</a>{% endif %}
                    {% if talk.slides_url %}<a class="btn btn--tiny | mb--tiny" href="{{ talk.slides_url }}">slides</a>{% endif %}
                </p>
            </li>
        {% endfor %}
    </ul>
</div>
