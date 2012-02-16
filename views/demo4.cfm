<cfimport prefix="demo" taglib="../libs/">

<cfif CGI.SERVER_NAME EQ "thingsico.de">
	<cfset base = "/demos/backbone">
<cfelse>
	<cfset base = "">
</cfif>

<demo:layout header="no">

    <h1>Articles</h1>
    <ul id="articles"></ul>

    <script type="text/javascript">
	Backbone.emulateHTTP = true;
	
	var Article = Backbone.Model.extend({});
	<cfoutput>
	var Articles = Backbone.Collection.extend({
		model: Article,
		url: '#base#/rest/articles/'
	});
	</cfoutput>
	var headlineArticles = new Articles();

	var ArticlesList = Backbone.View.extend({

		initialize: function() {
			this.collection.on("reset", this.render, this);

			this.render();
		},
		
		render: function() {
			this.$el.empty();

			_.each(this.collection.models, function(article) {
				this.$el.append('<li><strong>' + article.get("title") + '</strong> by ' + article.get("author") + '</li>');
			}, this);
		}

	});

	var articlesView = new ArticlesList({
		el: $("#articles"),
		collection: headlineArticles
	});
	 
	headlineArticles.fetch();	
    </script>

</demo:layout>
