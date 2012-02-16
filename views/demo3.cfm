<cfimport prefix="demo" taglib="../libs/">

<demo:layout header="no">

    <h1>Articles</h1>
    <ul id="articles"></ul>

    <script type="text/javascript">
    var Article = Backbone.Model.extend({});

        var Articles = Backbone.Collection.extend({
    	    model: Article
        });
    
        var headlineArticles = new Articles();
	
		var ArticlesList = Backbone.View.extend({
	
			initialize: function() {
				this.collection.on("reset", this.render);

				this.render();
			},
			
			render: function() {
                _.each(this.collection, function(article) {
					console.log(article);
                });
			}
	
		});

        var articlesView = new ArticlesList({
    	    el: $("#articles"),
			collection: headlineArticles
        });
    </script>

</demo:layout>
