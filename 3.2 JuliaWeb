begin
	using Pkg
	const deps = [pair.second for pair in Pkg.dependencies()]
	const direct_deps = filter(p -> p.is_direct_dep, deps)
	const pkgs = [x.name for x in direct_deps]
	if "HtmlTables" ∉ pkgs
	    @info "Installing HtmlTables for Julia $(VERSION)..."
	    Pkg.add(url="https://github.com/vanderpp/HtmlTables.jl/")
	end
	if "HTTP" ∉ pkgs
	    @info "Installing HTTP for Julia $(VERSION)..."
	    Pkg.add("HTTP")
	end
	
end

using HtmlTables, HTTP

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
		<a href=/secondPage>Visit second page</a>
		<br>
		<br>
		<a href=/dataPage>Visit third page with datatable</a>
		
	
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
			<title> Second page </title>
			</head>

			<body>
			<h1> Welcome to the second page </h1>
			<p> Second page </p>
			<a href=/>Return to Homepage</a>
			</body>
		</html>"
	end
	function dataPage(req::HTTP.Messages.Request)
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
		HTTP.register!(ROUTER,"GET","/dataPage",dataPage)
		HTTP.register!(ROUTER, "GET", "/secondPage", secondPage)
		HTTP.register!(ROUTER, "GET", "/page", page)
		HTTP.register!(ROUTER, "GET", "/" , home)
end


#server = HTTP.serve!(ROUTER, "127.0.0.1", 80)

#close(server)
