<cfset data = GetHTTPRequestData()>
<cfset content = ToString(data.content)>

<cfif data.method EQ "GET">

<cfcontent type="application/json" reset="yes">[
    {"title": "The Cat in the Hat", "author": "Dr Seuss"},        
    {"title": "How to use Backbone", "author": "Phil"},
    {"title": "How to succeed in business without really trying", "author": "J Pierrepont Finch"}
]<cfexit method="exittemplate">

<cfelseif data.method EQ "POST">

<cfcontent type="application/json" reset="yes"><cfoutput>#Left(content, 500)#</cfoutput><cfexit method="exittemplate">

</cfif>
