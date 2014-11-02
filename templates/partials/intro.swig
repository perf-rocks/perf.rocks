<header class="intro | wrapper | text--center | small-pb medium-pb--huge large-pb--huge small-pt{% if hero == true %} large-pt--huge{% endif %}">
    <div class="intro__content">
        {% block avatar %}{% endblock %}
        <h1 class="intro-title">{{ title }}</h1>
        <p class="intro-subtitle | gamma | light-text-color | mb--large">{{ subtitle }}</p>
        {% block actions %}{% endblock %}
    </div>
</header>
