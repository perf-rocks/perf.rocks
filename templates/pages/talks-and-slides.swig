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
        {% for talk in talks|reverse %}
            <li class="article-list__item | mb">
                <h2 class="m0"><a class="unlink" href="{% if talk.talk_url %}{{ talk.talk_url }}{% else %}{{ talk.slides_url }}{% endif %}">{{ talk.title }}</a></h2>
                <p class="micro | weak-text-color | m0">by
                    {% for author in talk.author %}
                        {% if loop.last and talk.author|length > 2 %}and {% endif %}
                        <a href="/people/{{ author|slug }}/" title="{{ author }} profile on Perf.Rocks">{{ author }}</a>
                        {% if loop.index < talk.author|length -1 %}, {% endif %}
                    {% endfor %}
                </p>
                <p>
                    {% if talk.talk_url %}<a class="btn btn--tiny | mb--tiny" href="{{ talk.talk_url }}" title="Watch the {{ talk.title }} talk by {{ talk.author }}">video</a>{% endif %}
                    {% if talk.slides_url %}<a class="btn btn--tiny | mb--tiny" href="{{ talk.slides_url }}" title="See the {{ talk.title }} talk slides by {{ talk.author }}">slides</a>{% endif %}
                </p>
            </li>
        {% endfor %}
    </ul>
</div>
