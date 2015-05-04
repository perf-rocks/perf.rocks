{% extends 'intro.swig' %}

{% block avatar %}
    <div class="text--center">
        <div class="avatar">
            <picture>
                <source srcset="{{ site.img }}/{{ name|slug }}.webp" type="image/webp">
                <img class="avatar__image" src="{{ site.img }}/{{ name|slug }}.jpg" width="150" height="150" alt="{{ name }}">
            </picture>
        </div>
    </div>
{% endblock %}
{% block actions %}
    {% if twitter_handle %}
        <a class="btn" href="https://www.twitter.com/{{ twitter_handle }}" title="Follow {{ name }} on Twitter">Follow on Twitter</a>
    {% endif %}
{% endblock %}
