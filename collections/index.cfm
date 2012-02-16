<cfimport prefix="demo" taglib="../libs/">

<demo:layout active="collections">

<header class="jumbotron subhead" id="overview">
  <h1>Collections</h1>

	<p class="lead">Collections are, erm... a Collection of Models</p>

</header>

<section id="models">

<h3>Create a Collection</h3>
    
<pre class="prettyprint">&lt;script type="text/javascript">
    var Article = Backbone.Model.extend({});

    var Articles = Backbone.Collection.extend({
    	model: Article
    });
    
    var headlineArticles = new Articles();
&lt;/script></pre>

<h3>Adding Models to a Collection</h3>

<pre class="prettyprint">&lt;script type="text/javascript">
    headlineArticles.add(
        new Article({
            title: "How to use Backbone",
            author: "Phil"
        })
    );

    headlineArticles.add(
        new Article({
            title: "How to succeed in business without really trying",
            author: "J Pierrepont Finch"
        })
    );
    
    alert('There are ' + headlineArticles.length + ' headline articles');
&lt;/script></pre>

<a id="demoIt" class="btn btn-primary"><i class="icon-fire icon-white"></i> Demo It</a>

<script type="text/javascript">
$(document).ready(function(e) {

    $("#demoIt").click(function(e) {
		var Article = Backbone.Model.extend({});
	
		var Articles = Backbone.Collection.extend({
			model: Article
		});
		
		var headlineArticles = new Articles();

		headlineArticles.add(
			new Article({
				title: "How to use Backbone",
				author: "Phil"
			})
		);

		headlineArticles.add(
			new Article({
				title: "How to succeed in business without really trying",
				author: "J Pierrepont Finch"
			})
		);
	
		alert('There are ' + headlineArticles.length + ' headline articles');
	});
});
</script>

</section>

<hr/>
<p style="height:50px"></p>


<section id="models">

<h3>Listening to Collections</h3>
    
<pre class="prettyprint">&lt;script type="text/javascript">
    var headlineArticles = new Articles();
    
    headlineArticles.on("add", function(article) {
    	alert('New Article: ' + article.get("title") + ' added');
    });

    headlineArticles.add(
        new Article({
            title: "How to use Backbone",
            author: "Phil"
        })
    );

    headlineArticles.add(
        new Article({
            title: "How to succeed in business without really trying",
            author: "J Pierrepont Finch"
        })
    );    
&lt;/script></pre>

<a id="demoIt2" class="btn btn-primary"><i class="icon-fire icon-white"></i> Demo It</a>

<script type="text/javascript">
$(document).ready(function(e) {

    $("#demoIt2").click(function(e) {
		var Article = Backbone.Model.extend({});
	
		var Articles = Backbone.Collection.extend({
			model: Article
		});
		
		var headlineArticles = new Articles();

		headlineArticles.on("add", function(article) {
    		alert('New Article: ' + article.get("title") + ' added');
	    });
	
		headlineArticles.add(
			new Article({
				title: "How to use Backbone",
				author: "Phil"
			})
		);

		headlineArticles.add(
			new Article({
				title: "How to succeed in business without really trying",
				author: "J Pierrepont Finch"
			})
		);
	});
});
</script>

</section>



<hr/>
<p style="height:50px"></p>


<section id="models">

<h3>Listening to Models in a Collection</h3>
    
<pre class="prettyprint">&lt;script type="text/javascript">
    var headlineArticles = new Articles();
    
    headlineArticles.on("change", function(article) {
    	alert('Article updated: ' + article.get("title"));
    });

    var article = new Article({
            title: "How to use Backbone",
            author: "Phil"
        });
              
    headlineArticles.add(article);
		
    article.set("title", "Backbone and Me");
    article.set("author", "Matt");
&lt;/script></pre>

<a id="demoIt3" class="btn btn-primary"><i class="icon-fire icon-white"></i> Demo It</a>

<script type="text/javascript">
$(document).ready(function(e) {

    $("#demoIt3").click(function(e) {
		var Article = Backbone.Model.extend({});
	
		var Articles = Backbone.Collection.extend({
			model: Article
		});
		
		var headlineArticles = new Articles();

		headlineArticles.on("change", function(article) {
    		alert('Article updated: ' + article.get("title"));
    	});

    	var article = new Article({
            title: "How to use Backbone",
            author: "Phil"
        });
              
    	headlineArticles.add(article);
		
		article.set("title", "Backbone and Me");
		article.set("author", "Matt");
	});
});
</script>

<hr/>
<p style="height:50px"></p>

<h3>Listening to specific changes to Models in a Collection</h3>
    
<pre class="prettyprint">&lt;script type="text/javascript">
    var headlineArticles = new Articles();
    
    headlineArticles.on("change:author", function(article, author) {
    	alert('Article author updated: ' + article.get("title") + ' now written by ' + author);
    });

    var article = new Article({
            title: "How to use Backbone",
            author: "Phil"
        });
              
    headlineArticles.add(article);
		
    article.set("title", "Backbone and Me");
    article.set("author", "Matt");
&lt;/script></pre>

<a id="demoIt4" class="btn btn-primary"><i class="icon-fire icon-white"></i> Demo It</a>

<script type="text/javascript">
$(document).ready(function(e) {

    $("#demoIt4").click(function(e) {
		var Article = Backbone.Model.extend({});
	
		var Articles = Backbone.Collection.extend({
			model: Article
		});
		
		var headlineArticles = new Articles();

		headlineArticles.on("change:author", function(article, author) {
    		alert('Article author updated: ' + article.get("title") + ' now written by ' + author);
    	});

    	var article = new Article({
            title: "How to use Backbone",
            author: "Phil"
        });
              
    	headlineArticles.add(article);
		
		article.set("title", "Backbone and Me");
		article.set("author", "Matt");
	});
});
</script>

</section>

<hr/>
<p style="height:50px"></p>

<section id="sync">

<h3>Synchronising a Collection with a Server</h3>
    
<pre class="prettyprint">&lt;script type="text/javascript">
    var Article = Backbone.Model.extend({});

    var Articles = Backbone.Collection.extend({
    	model: Article,
        url: '/rest/articles/'
    });
    
    var headlineArticles = new Articles();

    headlineArticles.on("reset", function(collection) {
        alert(collection.length + ' articles loaded');
    });

    headlineArticles.fetch();
&lt;/script></pre>

<a id="demoIt5" class="btn btn-primary"><i class="icon-fire icon-white"></i> Demo It</a>

<script type="text/javascript">
$(document).ready(function(e) {

    $("#demoIt5").click(function(e) {
		Backbone.emulateHTTP = true;
		
		var Article = Backbone.Model.extend({});
	
		var Articles = Backbone.Collection.extend({
			model: Article,
			url: 'rest/articles/'
		});
		
		var headlineArticles = new Articles();
	
		headlineArticles.on("reset", function(collection) {
			alert(collection.length + ' articles loaded');
		});
	
		headlineArticles.fetch();	
	});
});
</script>


</demo:layout>
