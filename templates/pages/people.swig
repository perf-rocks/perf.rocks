---
layout: default.swig
title: People
base_url: "../"
section: people
slug: index
---

{% include 'templates/partials/intro.swig' with {title: title, subtitle: 'Performance evangelists. People that make the web a better –almost instant– place.'} %}

<div class="wrapper">
    <ul class="people-list">
        {% for person in people %}
            {% set person_talks = person.name|author_related(talks) %}
            {% set person_articles = person.name|author_related(articles) %}

            <li class="people-list__item | text--center">
                <a class="unlink" href="/people/{{ person.name|slug }}">
                    <img class="avatar | mb" src="data:image/gif;base64,R0lGODlhAQABAIAAAP///////yH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" style="background-image: url('{{ site.img }}/{{ person.name|slug }}.jpg')" width="128" height="128" alt="{{ person.name }}">
                    <h3 class="m0">{{ person.name }}</h3>
                </a>
            </li>
        {% endfor %}
    </ul>
</div>
