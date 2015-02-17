{# @todo: Move descriptions to a proper yml file. Improve descriptions. #}

{% if category == '60 FPS' %}
    {% set description = 'Smooth animations, fast transitions and optimized scrolling performance. Learn to profile, analyze and optimze website rendering.' %}
{% elseif category == 'Analysis' %}
    {% set description = 'Learn how to measure and analyze page speeds and overall website performance.' %}
{% elseif category == 'Budgeting' %}
    {% set description = 'Performance budgeting will help you and your team maintain a faster, more performant website.' %}
{% elseif category == 'Business' %}
    {% set description = "Website performance has a real impact on business metrics. Learn why it's important and how to make it an integral part of your company's culture."  %}
{% elseif category == 'CSS' %}
    {% set description = "Learn all the tips on how to build optimized, scalable and performant stylesheets. Learn how to deliver CSS and how CSS properties impact your site's performance" %}
{% elseif category == 'Case Studies' %}
    {% set description = 'This is how front-end developers and companies have improved their website performance.' %}
{% elseif category == 'Critical Rendering Path' %}
    {% set description = "Optimizing the critical rendering path is critical for improving a website's performance. Learn how to allow the browser to paint the page as quickly as possible." %}
{% elseif category == 'Delivery' %}
    {% set description = 'Learn how to deliver your static assets as quickly as possible.' %}
{% elseif category == 'Design' %}
    {% set description = 'Performance is a design concern that has a direct impact on user experience.' %}
{% elseif category == 'Images' %}
    {% set description = 'Optimize your images: compress, reformat, combine, defer. Learn how to deliver the most optimized images to the browser, including SVG.' %}
{% elseif category == 'JS' %}
    {% set description = "Javascript can have a deep impact in your site's performance for the best, or the worst. Learn to leverage browser storage, deliver async scripts and learn about the pros and cons of client-side rendering." %}
{% elseif category == 'Prefetching' %}
    {% set description = 'Prefetching, prebrowsing and prerendering. Learn the techniques to improve subsequent page visits load times.' %}
{% elseif category == 'Principles and Fundamentals' %}
    {% set description = 'The principles you need to learn in order to design and code fast websites.' %}
{% elseif category == 'Responsive Web Design' %}
    {% set description = 'All you need to know on how to code performant RWD sites.' %}
{% elseif category == 'Third Party' %}
    {% set description = "Third party components can harm you website's performance, learn how to tackle this issue." %}
{% elseif category == 'Tips & Tricks' %}
    {% set description = 'Quick tips and tricks that will help you build faster websites.' %}
{% elseif category == 'UX' %}
    {% set description = "Performance is impacts the experience of your site. Learn how to plan, design and code for a better user experience." %}
{% elseif category == 'Web Components' %}
    {% set description = 'Web components are almost here. They might have a hidden cost on performance, but they may also have a positive impact on it.' %}
{% elseif category == 'Webfonts' %}
    {% set description = 'Learn how to deliver webfonts responsibly.' %}
{% endif %}

{% include 'templates/partials/intro.swig' with {title: 'Articles on ' + category, subtitle: description } %}

<div class="wrapper">
    {% set category_articles = category|category_related(articles) %}
    {% include 'templates/partials/article_list.swig' with {article_list: category_articles } %}
    {% include 'templates/partials/article_categories.swig' %}
</div>
