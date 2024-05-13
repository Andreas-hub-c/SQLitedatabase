
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


begin
	using SQLite
	SqlStatement = "SELECT * FROM Soldier"
	databaseFile = "weaponshop2324_SOURCE.db"
	databaseConnection = SQLite.DB(databaseFile)
	SqlResult = DBInterface.execute(databaseConnection, SqlStatement);
end


begin
	using DataFrames
	df =  DataFrame(SqlResult)
end


using HtmlTables, HTTP


ENV["htmltables_dbpath"] = raw"C:\Users\mille.b\Documents\juliaSC622\weaponshop2324_SOURCE.db"


begin
	const ROUTER = HTTP.Router()
	
	function home(req::HTTP.Messages.Request)
	html_content = "<html>
		<head>
		<title> Static webpage 3.4 </title>
		</head>
	
		<body>
		<h1>Static webpage 3.4</h1>
		<p> A group project of Maelfeyt, Mille, Ulrichts, Vandersmissen, Pelgrims-Rens and Wellens </p>
	
		<a href=/page>Visit first page</a>
		</body>
	 </html>"
	end
	
	function page(req::HTTP.Messages.Request)
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
			<table>

			$(htmlTableForQuery("SELECT * FROM Soldier"))
		
			</table>
		
			</body>
		</html>"
		
	end
	
	
		HTTP.register!(ROUTER, "GET", "/page", page)
		HTTP.register!(ROUTER, "GET", "/" , home)
end

					


server = HTTP.serve!(ROUTER, "127.0.0.1", 80)


#close(server)

