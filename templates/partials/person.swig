---
layout: default.swig
title: Person
base_url: "../"
---

{% set person_talks = name|author_related(talks) %}
{% set person_articles = name|author_related(articles) %}

{% include 'templates/partials/intro_avatar.swig' with {title: name, subtitle: bio, twitter_handle: twitter} %}

<div class="wrapper">
    <div class="card-list" style="margin-left: auto; margin-right: auto;">
        <div class="card-list__item card-list__item--large">
            <h2 class="line-heading">Articles</h2>
                {% if person_articles|length %}
                <ul class="article-list">
                    {% for article in person_articles %}
                        <li class="article-list__item">
                            <p class="m0"><a class="unlink" href="{{ article.url }}">{{ article.title }}</a></p>
                        </li>
                    {% endfor %}
                {% else %}
                    <p class="weak-text-color | micro"><a href="#">Submit an article by {{ name }}</a></p>
                {% endif %}
            </ul>
        </div>

        <div class="card-list__item card-list__item--large">
            <h2 class="line-heading">Talks</h2>
            {% if person_talks|length %}
                <ul class="article-list">
                    {% for talk in person_talks %}
                        <li class="article-list__item">
                            <p class="m0"><a class="unlink" href="{% if talk.talk_url %}{{ talk.talk_url }}{% else %}{{ talk.slides_url }}{% endif %}">{{ talk.title }}</a></p>
                        </li>
                    {% endfor %}
                </ul>
            {% else %}
            <p class="weak-text-color | micro"><a href="#">Submit a talk by {{ name }}</a></p>
            {% endif %}
        </div>
    </div>

</div>
