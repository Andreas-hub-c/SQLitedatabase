using HTTP

function handle_request(req::HTTP.Request)
  # Extract requested path
  path = req.path

  # Define response based on path
  if path == "/"
    response = HTTP.Response(200, "<h1>Welcome to the main page!</h1>")
  elseif path == "/page1"
    response = HTTP.Response(200, "<h1>This is page 1 content</h1>")
  elseif path == "/page2"
    response = HTTP.Response(200, "<h1>This is page 2 content</h1>")
  elseif path == "/page3"
    response = HTTP.Response(200, """
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <title>Page 3 with Table</title>
        </head>
        <body>
            <h1>Page 3 with HTML Table</h1>
            <table>
                <tr>
                    <th>Name</th>
                    <th>Age</th>
                    <th>City</th>
                </tr>
                <tr>
                    <td>Alice</td>
                    <td>30</td>
                    <td>Brussels</td>
                </tr>
                <tr>
                    <td>Bob</td>
                    <td>25</td>
                    <td>London</td>
                </tr>
                <tr>
                    <td>Charlie</td>
                    <td>40</td>
                    <td>Paris</td>
                </tr>
            </table>
        </body>
        </html>""")
  else
    response = HTTP.Response(404, "<h1>Page not found!</h1>")
  end

  # Return the response
  return response
end
server = HTTP.Server(:port => 8080, :handler => handle_request)
println("Server started on port 8080")
