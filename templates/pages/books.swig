---
layout: default.swig
title: Books
description: 'Front-end web performance paperback books and ebooks.'
base_url: "../"
section: books
slug: index
---

{% include 'templates/partials/intro.swig' with {title: title, subtitle: 'Front-end web performance books in paperback and ebook formats. '} %}


<div class="wrapper">

    <ul class="card-list">
        {% for book in books|invert %}
            <li class="card-list__item">
                <div class="card">
                    <header class="card__header | mb">
                        <a class="book-cover | unlink" href="{{ book.url }}"><img src="{{ site.img }}/{{ book.title|slug }}.png" alt="{{ book.title }}" width="325" height="500"></a>
                        <h2 Class="line-heading"><a class="unlink" href="{{ book.url }}">{{ book.title }}</a></h2>
                        {% if book.author %}
                            <p class="micro | weak-text-color | m0">by
                                {% for author in book.author %}
                                    {% if loop.last and book.author|length > 2 %}and {% endif %}
                                    <a href="/people/{{ author|slug }}/" title="{{ author }} profile on Perf.Rocks">{{ author }}</a>{% if loop.index < book.author|length -1 %}, {% endif %}
                                {% endfor %}
                            </p>
                        {% endif %}
                    </header>
                    <div class="card__content">
                        <p class="weak-text-color | m0">{{ book.description|truncate(200) }}</p>
                    </div>
                </div>
            </li>
        {% endfor %}
    </ul>
</div>
