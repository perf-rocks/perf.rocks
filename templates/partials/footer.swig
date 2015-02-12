<div class="container--brand-faded | text--center | pt--large pb--large">
    <p class="face--bold">{{ site.resource_count }} Resources so far. Let's improve the list!</p>
    <a class="btn | mb" href="/submit/" title="Submit a front-end web performance resource to Perf.Rocks">Submit a resource</a>
    <a class="btn | mb" href="https://twitter.com/intent/tweet?url={{ site.url|url_encode }}&text={{ site.title|url_encode }}: {{ site.description|url_encode }} /cc @Perf_Rocks" title="Share Perf.Rocks with others on Twitter">Spread the word</a>
    <a class="btn | mb" href="{{ site.github.repo }}" title="Github repo for Perf.Rocks.">Github project</a>
</div>

<footer class="site-footer | wrapper | pt pb">
  <div class="site-footer__author">
    <img class="avatar" src="data:image/gif;base64,R0lGODlhAQABAIAAAP///////yH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" style="background-image: url('{{ site.img }}/{{ site.author.name|slug }}.jpg')" width="32" height="32" alt="{{ site.author.name }}"> <span class="milli | weak-text-color | pl--tiny">Made by <a href="{{ site.author.url }}" title="Learn more about the author">{{ site.author.name }}</a></span>
  </div>
</footer>

<script>
  WebFontConfig = {
    google: { families: [ 'Open+Sans:300,600,400:latin' ] }
  };
  (function() {
    var wf = document.createElement('script');
    wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
      '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
    wf.type = 'text/javascript';
    wf.async = 'true';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(wf, s);
  })();

  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', '{{ site.ga }}', 'auto');
  ga('send', 'pageview');
</script>
