{% extends 'intro.swig' %}

{% block avatar %}
    <div class="text--center">
        <img class="avatar" src="data:image/gif;base64,R0lGODlhAQABAIAAAP///////yH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" style="background-image: url('{{ site.img }}/{{ name|slug }}.jpg')" width="150" height="150" alt="{{ name }}">
    </div>
{% endblock %}
{% block actions %}
    {% if twitter_handle %}
        <a class="btn" href="https://www.twitter.com/{{ twitter_handle }}" title="Follow {{ name }} on Twitter">Follow on Twitter</a>
    {% endif %}
{% endblock %}
