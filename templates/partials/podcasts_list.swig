
<ul class="article-list | js-article-list">
    {# <div class="browse-categories | mb--large">
        <a class="line-heading | js-show-categories | is-hidden-if-no-js" href="javascript:void(0)">Browse topics</a>
    </div> #}
    {% for podcast in podcast_list|reverse %}
        <li class="article-list__item">
            <h2 class="m0"><a class="unlink" href="{{ podcast.url }}">{{ podcast.title }}</a></h2>
            {% if podcast.author %}
                <p class="micro | weak-text-color | m0">by
                    {% for author in podcast.author %}
                    {% if loop.last and podcast.author|length > 1 %}and {% endif %}
                    <a href="/people/{{ author|slug }}/" title="{{ author }} profile on Perf.Rocks">{{ author }}</a>{% if loop.index < podcast.author|length -1 %}, {% endif %}
                    {% endfor %}
                </p>
            {% endif %}
        </li>
    {% endfor %}
</ul>
