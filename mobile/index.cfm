<cfimport prefix="demo" taglib="../libs/">

<demo:layout active="mobile">

<header class="jumbotron subhead" id="overview">
  <h1>Going Mobile</h1>

	<p class="lead">Connected, sometimes...</p>

</header>

<section id="models">

<h3>An Offline Collection</h3>
    
<pre class="prettyprint">&lt;script type="text/javascript">
    var OfflineCollection = Backbone.Collection.extend({
    	
        localStorageKey: "",
        
        initialize: function() {
            this.on("change", this.saveToLocalStorage, this);
            this.on("reset", this.saveToLocalStorage, this);
            
            this.loadFromLocalStorage();
        },
        
        loadFromLocalStorage: function() {
            if (this.localStorageKey == '') return false;
            
            var cachedStore = localStorage.getItem(this.localStorageKey);
            if (!cachedStore) {
                return false;
            }
		
            try {
                var store = JSON.parse(cachedStore);
                this.reset( store, {silent: true} );
            }
            catch(e) {
                localStorage.removeItem(this.localStorageKey);
                return false;
            }
        },
        
        saveToLocalStorage: function() {
            if (this.localStorageKey == '') return false;

            localStorage.setItem(this.localStorageKey, JSON.stringify(this.toJSON()));
        }
        
    });
&lt;/script></pre>

</demo:layout>
