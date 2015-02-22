{% set current_page = basename|'.html' %}

{% include 'templates/partials/intro.swig' with {title: current_page|capitalize + ' plugins', subtitle: 'A collection of ' + current_page|capitalize + ' plugins to help you optimize your website´s performance.' } %}

<div class="wrapper">
    {% include 'templates/partials/tool_list.swig' with {tool_list: items } %}
</div>
