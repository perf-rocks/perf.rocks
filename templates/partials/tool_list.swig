{% include 'tool_type_switch.swig' %}

    <ul class="card-list">
    {% for tool in tool_list|reverse %}
        <li class="card-list__item">
            <div class="card">
                <header class="card__header | mb">
                    <h2 Class="line-heading">{{ tool.name }}</h2>
                </header>
                <div class="card__content">
                    <p class="weak-text-color | m0">{{ tool.description|truncate(200) }}</p>
                </div>
                <footer class="card__footer">
                    {% if tool.website %}
                        <a class="btn btn--tiny | mb--tiny" href="{{ tool.website}}">Website</a>
                    {% endif %}
                    {% if tool.node %}
                        <a class="btn btn--tiny | mb--tiny" href="{{ tool.node}}">Node.js</a>
                    {% endif %}
                    {% if tool.grunt %}
                        <a class="btn btn--tiny | mb--tiny" href="{{ tool.grunt}}">Grunt</a>
                    {% endif %}
                    {% if tool.gulp %}
                        <a class="btn btn--tiny | mb--tiny" href="{{ tool.gulp}}">Gulp</a>
                    {% endif %}
                    {% if tool.broccoli %}
                        <a class="btn btn--tiny | mb--tiny" href="{{ tool.broccoli}}">Broccoli</a>
                    {% endif %}
                </footer>
            </div>
        </li>
    {% endfor %}
</ul>
