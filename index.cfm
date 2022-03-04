<cfoutput>
<html lang="en">
<head>
    <title>A test page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <meta name="description" content="Code Challenge for CF Dev">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <style>
    .invisible {
        visibility: hidden;
    }
</style>
</head>
<body>
    <div class="jumbotron text-center">
    <h1>Welcome to my code challenge!</h1>
    <p>Find each fo the assignments' links below.</p>
    <p><i>Javier Becerril</i></p>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h3>Challenge 1</h3>
                <p>This is the assignment to submit a form and send an email. Access form <a href="challenge1.cfm">here</a>.</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <h3>Challenge 2</h3>
                <p>This is the assignment to accomplishing. Access the page <a href="challenge2.cfm">here</a>.</p>
                <ul>
                    <li>Create a function called getPlayers in challenge.cfc and output an array list in the provided table.</li>
                    <li>Alternate the background color of every other row using "yellow" as the background color.</li>
                    <li>Bonus: Using AJAX via the provided jQuery library, display data and time on the page. Complete the function getDateTime() in the challenge.cfc component to get the date and time.</li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <h3>Challenge 3</h3>
                <p>This is the assignment to accomplishing. Access the page <a href="challenge3.cfm">here</a>.</p>
                <ul>
                    <li>
                        <ul>
                            <li>In challenge.cfc, edit the getplayers() function that returns the same query as in challenge 2</li>
                            <li>Create an optional argument called "dob".</li>
                            <li>If the argument is NOT present all players should be returned.</li>
                            <li>If the argument IS present only players born AFTER the date passed in the argument should be returned.</li>
                            <li>Return the results of the  query as the return value of the "getPlayers()" function</li>
                        </ul>
                    </li>
                    <li>
                        <ul>
                            <li>Use "CreateObject" to instantiat the challenge.cfc component.</li>
                            <li>Use the  instance of challenge.cfc and get back a query from getPlayers() containing only players born after 1985.</li>
                            <li>Use the query to output all the records and alternate the row colors as before.</li>
                        </ul>
                    </li>
                    <li>Bonus: Implement a formated UI for the data returned. Functionality may include, but are not limited to column sorting, instant search, and alternate row colors. Use the provided datatable jQuery plugin or replace with another.</li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>
</cfoutput>