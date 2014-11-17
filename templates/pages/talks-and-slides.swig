---
layout: default.swig
title: Talks & Slides
description: 'A collection of talks on front-end web performance optimization. Videos and slides.'
base_url: "../"
section: talks-and-slides
slug: index
---

{% include 'templates/partials/intro.swig' with {title: title, subtitle: 'A collection of talks on front-end web performance optmiziation.'} %}

{% set article_categories = articles|get_categories %}

<div class="wrapper">
    <ul class="article-list">
        {% for talk in talks|invert %}
            <li class="article-list__item | mb">
                <h2 class="m0"><a class="unlink" href="{% if talk.talk_url %}{{ talk.talk_url }}{% else %}{{ talk.slides_url }}{% endif %}">{{ talk.title }}</a></h2>
                <p class="micro | weak-text-color | m0">by <a href="/people/{{ talk.author|slug }}/" title="{{ talk.author }} profile on Perf.Rocks">{{ talk.author }}</a></p>
                <p>
                    {% if talk.talk_url %}<a class="btn btn--tiny | mb--tiny" href="{{ talk.talk_url }}" title="Watch the {{ talk.title }} talk by {{ talk.author }}">video</a>{% endif %}
                    {% if talk.slides_url %}<a class="btn btn--tiny | mb--tiny" href="{{ talk.slides_url }}" title="See the {{ talk.title }} talk slides by {{ talk.author }}">slides</a>{% endif %}
                </p>
            </li>
        {% endfor %}
    </ul>
</div>
