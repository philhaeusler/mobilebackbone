<cfimport prefix="demo" taglib="../libs/">

<demo:layout active="views">

<header class="jumbotron subhead" id="overview">
	<h1>Views</h1>

	<p class="lead">A view is a part of your interface backed by a Model or Collection</p>
</header>

<section id="models">

<h3>Create a View class</h3>
    
<pre class="prettyprint">&lt;script type="text/javascript">
    var ArticlesList = Backbone.View.extend({

        initialize: function() {
            alert('Initialize view');
        },
        
        render: function() {
            alert('Render view');
        }

    });
&lt;/script></pre>

<h3>Wiring a View to your UI</h3>

<pre class="prettyprint">
&lt;body>
    &lt;h1>Articles&lt;/h1>
    &lt;ul id="articles">&lt;/ul>

    &lt;script type="text/javascript">
        var articlesView = new ArticlesList({
    	    el: $("#articles")
        });
    &lt;/script>
&lt;/body></pre>

<a id="demoIt" class="btn btn-primary" href="views/demo1.cfm" target="_blank"><i class="icon-fire icon-white"></i> Demo It</a>

</section>

<hr/>
<p style="height:50px"></p>


<section id="collection">

<h3>Wiring a Collection to your UI</h3>

<pre class="prettyprint">
&lt;body>
    &lt;h1>Articles&lt;/h1>
    &lt;ul id="articles">&lt;/ul>

    &lt;script type="text/javascript">
        var ArticlesList = Backbone.View.extend({

            initialize: function() {
                this.render();
            },
        
            render: function() {
                alert('Render ' + this.collection.length + ' articles');
            }

        });
    
        var headlineArticles = new Articles();

        var articlesView = new ArticlesList({
    	    el: $("#articles"),
            collection: headlineArticles
        });
    &lt;/script>
&lt;/body></pre>
<a id="demoIt" class="btn btn-primary" href="views/demo2.cfm" target="_blank"><i class="icon-fire icon-white"></i> Demo It</a>

</section>

<hr/>
<p style="height:50px"></p>


<section id="events">
<h3>Views listening to Collections</h3>

<pre class="prettyprint">
&lt;body>
    &lt;h1>Articles&lt;/h1>
    &lt;ul id="articles">&lt;/ul>

    &lt;script type="text/javascript">
        var ArticlesList = Backbone.View.extend({

            initialize: function() {
                this.collection.on("reset", this.render, this);
                
                this.render();
            },
        
            render: function() {
                _.each(this.collection, function(article) {
                    console.log(article);
                });
            }

        });
    
        var headlineArticles = new Articles();

        var articlesView = new ArticlesList({
    	    el: $("#articles"),
            collection: headlineArticles
        });
    &lt;/script>
&lt;/body></pre>
<a id="demoIt" class="btn btn-primary" href="views/demo3.cfm" target="_blank"><i class="icon-fire icon-white"></i> Demo It</a>

</section>

<hr/>
<p style="height:50px"></p>


<section id="events">
<h3>Bringing it all together</h3>

<pre class="prettyprint">
&lt;body>
    &lt;h1>Articles&lt;/h1>
    &lt;ul id="articles">&lt;/ul>

    &lt;script type="text/javascript">
        var ArticlesList = Backbone.View.extend({

            initialize: function() {
                this.collection.on("reset", this.render, this);
                
                this.render();
            },
        
            render: function() {
            	this.$el.empty();
		        
                _.each(this.collection.models, function(article) {
                    this.$el.append('&lt;li>&lt;strong>' + article.get("title") + '&lt;/strong> by ' + article.get("author") + '&lt;/li>');
                }, this);
            }

        });
    
        var headlineArticles = new Articles();

        var articlesView = new ArticlesList({
    	    el: $("#articles"),
            collection: headlineArticles
        });
        
        headlineArticles.fetch();	
    &lt;/script>
&lt;/body></pre>
<a id="demoIt" class="btn btn-primary" href="views/demo4.cfm" target="_blank"><i class="icon-fire icon-white"></i> Demo It</a>

</section>



</demo:layout>
