
<ul class="article-list | js-article-list">
    {# <div class="browse-categories | mb--large">
        <a class="line-heading | js-show-categories | is-hidden-if-no-js" href="javascript:void(0)">Browse topics</a>
    </div> #}
    {% for screencast in screencast_list|reverse %}
        <li class="article-list__item">
            <h2 class="m0"><a class="unlink" href="{{ screencast.url }}">{{ screencast.title }}</a></h2>
            {% if screencast.author %}
                <p class="micro | weak-text-color | m0">by
                    {% for author in screencast.author %}
                        {% if loop.last and screencast.author|length > 1 %}and {% endif %}
                        <a href="/people/{{ author|slug }}/" title="{{ author }} profile on Perf.Rocks">{{ author }}</a>{% if loop.index < screencast.author|length -1 %}, {% endif %}
                    {% endfor %}
                </p>
            {% endif %}
        </li>
    {% endfor %}
</ul>
