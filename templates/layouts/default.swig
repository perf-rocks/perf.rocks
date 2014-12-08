<!DOCTYPE html>
<html class="no-js" lang="en">
    {% include 'templates/partials/head.swig' %}

    <body class="bg">
        {% include 'templates/partials/header.swig' %}

        <div class="mb--huge">
            {{ body }}
        </div>

        {% include 'templates/partials/footer.swig' %}
    </body>
</html>
