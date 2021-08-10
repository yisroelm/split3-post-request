1. Clone down the repo
2. Cd into the repository folder
3. Run ruby split3.rb and let the server run
4. In another terminal run ```curl -X POST -d "{\"string_to_cut\": \"iamyourlyftdriver\"}" http://localhost:8000/test -w "\n"``` (or any other string you'd like)

This application is a ruby post handler that parses Json, and runs a method that outputs every third character of a string, and returns the end result after hitting a WEBrick server.
