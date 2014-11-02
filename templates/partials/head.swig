<head>
  <title>
    {% if title == 'Perf.Rocks' %}
      {{ title }}
    {% else %}
      {{ title }} | Perf.Rocks
    {% endif %}
  </title>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="{{ site.description }}">
  <meta name="keywords" content="{{ site.keywords }}">
  <meta name="author" content="{{ site.author.name }}">

  <link rel="{{ site.img}}/apple-touch-icon-precomposed" href="apple-touch-icon-152x152.png">
  <link rel="icon" type="image/png" href="{{ site.img}}/favicon-32x32.png" sizes="32x32">
  <link rel="icon" type="image/png" href="{{ site.img}}/favicon-16x16.png" sizes="16x16">

  <!-- build:style inline test -->
  <link href="{{ site.css }}/style.css" rel="stylesheet">
  <!-- /build -->

</head>
