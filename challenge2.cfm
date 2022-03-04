<!--- 
Challenge 2
Edit File challenge2.cfm

Step 1
Create a function called getPlayers in challenge.cfc and output an array list in the provided table below.
Height
Weight
HomeTown
Major
Step 2
Alternate the background color of every other row using "yellow" as the background color.
Bonus: Using AJAX via the provided jQuery library, display data and time on the page. Complete the function getDateTime() in the challenge.cfc component to get the date and time.
--->
<cfset variables.thisBaseURL = getPageContext().getRequest().GetRequestUrl()>
<cfset variables.thisBaseURL = getDirectoryFromPath(left(variables.thisBaseURL, len(variables.thisBaseURL) - len(getPageContext().getRequest().getPathInfo())))>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>Challenge 2</title>
	<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="stylesheet.css" media="screen" >
	<style>
		#players-table tr:nth-child(even) {background: rgb(214, 201, 12)}
		#players-table tr:nth-child(odd) {background: #FFF}
	</style>
	<script>
		$(document).ready( function () {
			/* Get players data and populate players-table table */
 			fetch("<cfoutput>#variables.thisBaseURL#</cfoutput>challenge.cfc?method=getplayers")
				.then(response => response.json())
				.then(response => {
 					if (response.SUCCESS){
						 let dataArr = $.parseJSON(response.QRY);
 						 $.each(dataArr, function(i, item) {
							$('#players').append("<tr>\
											<td>"+item.FULLNAME+"</td>\
											<td>"+item.HEIGHT+"</td>\
											<td>"+item.WEIGHT+"</td>\
											<td>"+item.HOMETOWN+"</td>\
											<td>"+item.MAJOR+"</td>\
											</tr>");
						});
					} else {
						$('#players').append("<tr><td colspan='5'>No records found.</td></tr>");
					}
				})
				.catch(console.error);

			/* Get date and time and display on screen */
			fetch("<cfoutput>#variables.thisBaseURL#</cfoutput>challenge.cfc?method=getdatetime")
				.then(response => response.json())
				.then(response => {
					let dateStr = response.replace('"', '');
					$("#date-time").text("Current date and time: " + dateStr);
				})
				.catch(console.error);				
		}) 
	</script>
</head>
<body>
	<p id="date-time">Current date and time:</p>
	<table style="width: 600px;" id="players-table">
	<tr>
		<th>Full Name</th>
		<th>Height</th>
		<th>Weight</th>
		<th>Home town</th>
		<th>Major</th>
	</tr>
	<!---  Using the query above output the data in rows with alternating row colors. --->
	<tbody id="players">
	</tbody>
	</table>
</body>
</html>
