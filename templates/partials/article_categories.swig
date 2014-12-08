<div class="categories | js-categories" id="category-list">
    <div class="wrapper | text--left | pt pb">
        <a class="unlink | giga | close | is-hidden-if-no-js | js-close-categories" href="javascript:void(0)">&times;</a>
        <h3 class="alpha | m0">Topics</h3>
        <ul class="category-list | gamma">
            <li class="category-list__item"><a class="unlink" href="/articles/">All</a></li>
            {% set article_categories = articles|get_categories %}
            {% for category in article_categories|sort %}
                <li class="category-list__item">
                    <a class="unlink" href="/articles/topic/{{ category|slug }}/" title="{{ category }} - web performance articles on Perf.Rocks">{{ category }}</a>
                </li>
            {% endfor %}
        </ul>
    </div>
</div>

<script src="{{ site.js }}/category-list.js" async></script>
