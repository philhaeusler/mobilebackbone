<cfimport prefix="demo" taglib="../libs/">

<demo:layout active="models">

<header class="jumbotron subhead" id="overview">
  <h1>Models</h1>

	<p class="lead">Models contain your data with methods to work with them.  They can be synced to a single document in your database or they can just live in your application.</p>

</header>

<section id="models">
<h3>Create a Model class</h3>
<pre class="prettyprint">&lt;script type="text/javascript">
    var Article = Backbone.Model.extend({});
&lt;/script></pre>

<h3>Create a Model</h3>
    
<pre class="prettyprint">&lt;script type="text/javascript">
    var myArticle = new Article();
    myArticle.set("title", "How to use Backbone");
    myArticle.set("author", "Phil");
&lt;/script></pre>

<p>or </p>

<pre class="prettyprint">&lt;script type="text/javascript">
    var myArticle = new Article({
        title: "How to use Backbone",
        author: "Phil"
    });
&lt;/script></pre>


<h3>Read properties</h3>
    
<pre class="prettyprint">&lt;script type="text/javascript">
    alert(myArticle.get("title") + " by " + myArticle.get("author"));
&lt;/script></pre>

<a id="demoIt" class="btn btn-primary"><i class="icon-fire icon-white"></i> Demo It</a>

<script type="text/javascript">
$(document).ready(function(e) {

    $("#demoIt").click(function(e) {
		var Article = Backbone.Model.extend({});
		var article = new Article();
		article.set("title", "How to use Backbone");
    	article.set("author", "Phil");
		alert(article.get("title") + " by " + article.get("author"));
	});
});
</script>

</section>

<hr/>
<p style="height:50px"></p>

<section id="extending">

<h3>Extending Models</h3>
<pre class="prettyprint">&lt;script type="text/javascript">
    var Article = Backbone.Model.extend({
    
        allowedToEdit: function(account) {
            return (this.isNew() || account.get("name") == this.get("author"));
        }
    
    });
    
    var user = setUpSomewhereElse; 
    var myArticle = new Article();
    
    if (!myArticle.allowedToEdit(user)) {
        alert('You cannot edit ' + myArticle.get("title"));
        return;
    }
&lt;/script></pre>

</section>

<hr/>
<p style="height:50px"></p>

<section id="listening">

<h3>Listening to Models</h3>
<pre class="prettyprint">&lt;script type="text/javascript">
    var myArticle = new Article({
        title: "How to use Backbone",
        author: "Phil"
    });
    
    myArticle.on("change:author", function(model, value, options) {
    	alert(model.get("title") + " is now written by " + value);
    });
    
    myArticle.set("author", "Matt");
&lt;/script></pre>

<a id="demoIt2" class="btn btn-primary"><i class="icon-fire icon-white"></i> Demo It</a>

<script type="text/javascript">
$(document).ready(function(e) {

    $("#demoIt2").click(function(e) {
		var Article = Backbone.Model.extend({});
		var myArticle = new Article({
			title: "How to use Backbone",
			author: "Phil"
		});
	
		myArticle.on("change:author", function(model, value, options) {
			alert(model.get("title") + " is now written by " + value);
		});
		
		myArticle.set("author", "Matt");
	});
});
</script>

</section>

</demo:layout>
