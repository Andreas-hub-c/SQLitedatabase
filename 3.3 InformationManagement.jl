
begin
	using Pkg;
	Pkg.add(url="https://github.com/vanderpp/HtmlTables.jl/")
end

using HtmlTables, HTTP

ENV["htmltables_dbpath"]=raw"C:\Users\wellens.a\Documents\juliaSC622\weaponshop2324_SOURCE.db" # verwijs hier naar je eigen dbpath, anders zal de code niet werken :)

htmlTable("soldier")

begin
	const ROUTER = HTTP.Router()
	
	function home(req::HTTP.Messages.Request)
	"<html>
		<head>
		<title> Static webpage 3.2 </title>
		</head>
	
		<body>
		<h1>Static webpage 3.2</h1>
		<p> A group project of Maelfeyt, Mille, Ulrichts, Vandersmissen, Pelgrims-Rens and Wellens </p>
	
		<a href=/page>Visit first page</a>
		<br>
		<br>
		<a href=/secondPage>Visit second page with datatable 3.3</a>
		<br>
		<br>
		<a href=/thirdPage>Visit third page with datatable 3.2</a>
		
	
		</body>
	 </html>"
	end
	
	function page(req::HTTP.Messages.Request)
		"<html>
			<head>
			<title> First page</title>
			</head>

			<body>
			<h1> Welcome to the first page </h1>
			<p> First page </p> 
			<a href=/>Return to Homepage</a>
			</body>
		</html>"
	end
	
	function secondPage(req::HTTP.Messages.Request)
		"<html>
			<head>
			<style>
				table, th, td {
					border: 1px solid black;
				}
				</style>
			<title> Second page </title>
			</head>

			<body>
			<h1> Welcome to the second page </h1>
			<p> Second page </p>
			<a href=/>Return to Homepage</a>

			$(htmlTable("soldier"))
			
			
			</body>
		</html>"
	end
	
	function thirdPage(req::HTTP.Messages.Request)
	"<html>
			<head>
				<title> Third page </title>

			<style>
				table, td, th{
				border:1px solid black;
				}
			</style>
			</head>

			<body>
				<h1> Welcome to the third page with datatable </h1>
				<p> Third page </p>
				<a href=/>Return to Homepage</a>
				<br>
				<br>
			<table>
				<tr><th>title1</th><th>title2</th><th>title3</th><th>title4</th></tr>
				<tr><td>data11</td><td>data21</td><td>data31</td><td>data41</td></tr>
				<tr><td>data12</td><td>data22</td><td>data32</td><td>data42</td></tr>
				<tr><td>data13</td><td>data23</td><td>data33</td><td>data43</td></tr>
				<tr><td>data14</td><td>data24</td><td>data34</td><td>data44</td></tr>
			</table>
			</body>
		</html>"	
	end

	
		HTTP.register!(ROUTER,"GET","/thirdPage", thirdPage)
		HTTP.register!(ROUTER, "GET", "/secondPage", secondPage)
		HTTP.register!(ROUTER, "GET", "/page", page)
		HTTP.register!(ROUTER, "GET", "/" , home)
end

server = HTTP.serve!(ROUTER, "127.0.0.1", 50)

#close(server)
