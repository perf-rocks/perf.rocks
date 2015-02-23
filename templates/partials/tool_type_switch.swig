<nav class="mb | text--right">
    <ul class="nav">
        <li class="ml--tiny"><a class="btn btn--small{% if current_page == 'tools' %} | is-active{% endif %}" href="/tools/" title="View all web performance optimization tools">All</a></li>
        {% for tool_type in site.tool_types %}
            <li class="ml--tiny"><a class="btn btn--small{% if current_page === tool_type %} | is-active{% endif %}" href="/tools/{{ tool_type}}" title="View all {{ tool_type }} plugins for web performance optimization">{{ tool_type|capitalize }}</a></li>
        {% endfor %}
    </ul>
</nav>
