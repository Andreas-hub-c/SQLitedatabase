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
		<title> Statische webpagina 3.1 </title>
		</head>
	
		<body>
		<h1>Maelfeyt, Mille, Ulrichts, Vandersmissen, Ulrichts, Wellens</h1>
		<p> Statische webpagina 3.1 </p>
	
		<a href=/page>Visit first page</a>
		<br>
		<br>
		<a href=/secondPage>Visit second page</a>
		
	
		</body>
	 </html>"
	end
	function page(req::HTTP.Messages.Request)
		"<html>
			<head>
			<title> Eerste pagina</title>
			</head>

			<body>
			<h1> Welkom op de eerste pagina </h1>
			<p> Eerste pagina </p> 
			<a href=/>Return</a>
			</body>
		</html>"
	end
	
	function secondPage(req::HTTP.Messages.Request)
		"<html>
			<head>
			<title> Tweede pagina </title>
			</head>

			<body>
			<h1> Welkom op de tweede pagina </h1>
			<p> Tweede pagina </p>
			<a href=/>Return</a>
			</body>
		</html>"
	end
		HTTP.register!(ROUTER, "GET", "/secondPage", secondPage)
		HTTP.register!(ROUTER, "GET", "/page", page)
		HTTP.register!(ROUTER, "GET", "/" , home)
end

#server = HTTP.serve!(ROUTER, "127.0.0.1", 80)

#close(server)
