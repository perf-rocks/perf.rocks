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
                        <a class="unlink" href="{{ book.url }}"><img src="{{ site.img }}/{{ book.title|slug }}.svg" alt="{{ book.title }}" width="100%"></a>
                        <h2 Class="line-heading"><a class="unlink" href="{{ book.url }}">{{ book.title }}</a></h2>
                        {% if book.author %}
                            <p class="micro | weak-text-color | m0">by <a href="/people/{{ book.author|slug }}/" title="{{ book.author}} profile on Perf.Rocks">{{ book.author }}</a> in {{ book.category }}</p>
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
