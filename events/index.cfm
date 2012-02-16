<cfimport prefix="demo" taglib="../libs/">

<demo:layout active="events">


<header class="jumbotron subhead" id="overview">
<h1>Events</h1>

	<p class="lead">Events can be mixed in to any object, giving the object the ability to bind and trigger custom named events.</p>

</header>

<h3>Mix it in</h3>
<pre class="prettyprint">&lt;script type="text/javascript">
    var object = {};
    
    _.extend(object, Backbone.Events);
&lt;/script></pre>

<h3>Add a callback</h3>
    
<pre class="prettyprint">&lt;script type="text/javascript">
    object.on("homer", function(msg) {
      alert(msg + " hoo!");
    });
&lt;/script></pre>

<h3>Trigger it</h3>
    
<pre class="prettyprint">&lt;script type="text/javascript">    
    object.trigger("homer", "Woo");
&lt;/script></pre>
    
<a id="demoIt" class="btn btn-primary"><i class="icon-fire icon-white"></i> Demo It</a>

<script type="text/javascript">
$(document).ready(function(e) {

    $("#demoIt").click(function(e) {
		var object = {};    
		_.extend(object, Backbone.Events);
	
		object.on("homer", function(msg) {
		  alert(msg + " hoo!");
		});
	
		object.trigger("homer", "Woo");        
    });
});
</script>

</demo:layout>
