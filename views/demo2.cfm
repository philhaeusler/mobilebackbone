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
				this.render();
			},
			
			render: function() {
				alert('Render ' + this.collection.length + ' articles');
			}
	
		});

        var articlesView = new ArticlesList({
    	    id: "articles",
			collection: headlineArticles
        });
    </script>

</demo:layout>
