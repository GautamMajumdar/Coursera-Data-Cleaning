# Coursera data cleaning Quiz 2 (cdcQ2) 

library(httr)
require(httpuv)
require(jsonlite)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications
#    Insert your values below - if secret is omitted, it will look it up in
#    the GITHUB_CONSUMER_SECRET environmental variable.
#
#    Use http://localhost:1410 as the callback url
myapp <- oauth_app("cdcQ2", "4bba2eebfbf11b526ca7", secret="bb61ecc9f0a965072c02daf566de4b1a59fb0f59")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)

# 5. turn the JSON data into a nice data frame
jsonData<-fromJSON(toJSON(content(req)))
print(jsonData[jsonData$url=="https://api.github.com/repos/jtleek/datasharing","created_at"])