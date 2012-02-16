<cfimport prefix="demo" taglib="../libs/">

<demo:layout header="no">

    <h1>Articles</h1>
    <ul id="articles"></ul>

    <script type="text/javascript">
		var ArticlesList = Backbone.View.extend({
	
			initialize: function() {
				alert('Initialize view');
			},
			
			render: function() {
				alert('Render view');
			}
	
		});

        var articlesView = new ArticlesList({
    	    id: "articles"
        });
    </script>

</demo:layout>
