<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <title>{% if page.title == 'Perf.Rocks' %}{{ page.title }}{% elseif page.name %}{{ page.name }} | Perf.Rocks{% elseif page.category %}{{ page.category }} posts | Perf.Rocks{% else %}{{ page.title }} | Perf.Rocks{% endif %}</title>
        <meta charset="utf-8">
        <meta name="description" content="{{ page.description }}">
        <meta name="keywords" content="{{ site.keywords }}">
        <meta name="author" content="{{ site.author.name }}">
        <meta http-equiv="refresh" content="0; url={{ site.url }}/{{ redirection_url }}" />
        <link rel="canonical" href="{{ site.url }}{{ redirection_url }}" />
    </head>
</html>
