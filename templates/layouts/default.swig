<!DOCTYPE html>
<html lang="en">
    {% include 'templates/partials/head.swig' %}

    <body class="bg">
        {% include 'templates/partials/header.swig' %}

        {{ body }}

        {% include 'templates/partials/footer.swig' %}
    </body>
</html>
