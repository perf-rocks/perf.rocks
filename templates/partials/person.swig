{% set person_talks = name|author_related(talks) %}
{% set person_articles = name|author_related(articles) %}
{% set person_books = name|author_related(books) %}

{% include 'templates/partials/intro_avatar.swig' with {title: name, subtitle: bio, twitter_handle: twitter} %}

<div class="wrapper">
    <div class="card-list">
        {% if person_articles|length %}
                <div class="card-list__item card-list__item--large">
                    <h2 class="line-heading">Articles</h2>
                    <ul class="article-list">
                        {% for article in person_articles %}
                            <li class="article-list__item">
                                <p class="m0"><a class="unlink" href="{{ article.url }}" title="Read the {{ article.title }} article">{{ article.title }}</a></p>
                            </li>
                        {% endfor %}
                    </ul>
                </div>
        {% endif %}

        {% if person_talks|length %}
            <div class="card-list__item card-list__item--large">
                <h2 class="line-heading">Talks</h2>
                <ul class="article-list">
                    {% for talk in person_talks %}
                        <li class="article-list__item">
                            <p class="m0"><a class="unlink" href="{% if talk.talk_url %}{{ talk.talk_url }}{% else %}{{ talk.slides_url }}{% endif %}">{{ talk.title }}</a></p>
                            <p>
                                {% if talk.talk_url %}<a class="btn btn--tiny | mb--tiny" href="{{ talk.talk_url }}" title="Watch the {{ talk.talk_url }} talk video">video</a>{% endif %}
                                {% if talk.slides_url %}<a class="btn btn--tiny | mb--tiny" href="{{ talk.slides_url }}" title="See the {{ talk.slides_url }} talks slides">slides</a>{% endif %}
                            </p>
                        </li>
                    {% endfor %}
                </ul>
            </div>
        {% endif %}

        {% if person_books|length %}
            <div class="card-list__item card-list__item--large">
                <h2 class="line-heading">Books</h2>
                <ul class="article-list">
                    {% for book in person_books %}
                        <li class="article-list__item">
                            <p class="m0"><a class="unlink" href="{{ book.url }}">{{ book.title }}</a></p>
                        </li>
                    {% endfor %}
                </ul>
            </div>
        {% endif %}
    </div>

</div>
