---
layout: default.swig
title: Tools
base_url: "../"
section: tools
slug: index
---

{% include 'templates/partials/intro.swig' with {title: title, subtitle: 'Analysis, optimization and monitoring tools including Grunt, Gulp and Brocoli plugins.'} %}

{% set article_categories = articles|get_categories %}

<div class="wrapper">

    <ul class="card-list">
        {% for tool in tools|invert %}
            <li class="card-list__item" data-platforms="{% if tool.website %}website,{% endif %%}{% if tool.node_module %}node_module,{% endif %}{% if tool.grunt_plugin %}grunt_plugin,{% endif %}{% if tool.gulp_plugin %}gulp_plugin,{% endif %}{% if tool.broccoli_plugin %}broccoli_plugin, {% endif %}">
                <div class="card">
                    <header class="card__header | mb">
                        <h2 Class="line-heading">{{ tool.name }}</h2>
                    </header>
                    <div class="card__content">
                        <p class="weak-text-color | m0">{{ tool.description }}</p>
                    </div>
                    <footer class="card__footer">
                        {% if tool.website %}
                            <a class="btn btn--tiny | mb--tiny" href="{{ tool.website}}">Website</a>
                        {% endif %}
                        {% if tool.node_module %}
                            <a class="btn btn--tiny | mb--tiny" href="{{ tool.node_module}}">Node.js</a>
                        {% endif %}
                        {% if tool.grunt_plugin %}
                            <a class="btn btn--tiny | mb--tiny" href="{{ tool.grunt_plugin}}">Grunt</a>
                        {% endif %}
                        {% if tool.gulp_plugin %}
                            <a class="btn btn--tiny | mb--tiny" href="{{ tool.gulp_plugin}}">Gulp</a>
                        {% endif %}
                        {% if tool.broccoli_plugin %}
                            <a class="btn btn--tiny | mb--tiny" href="{{ tool.broccoli_plugin}}">Broccoli</a>
                        {% endif %}
                    </footer>
                </div>
            </li>
        {% endfor %}
    </ul>
</div>
