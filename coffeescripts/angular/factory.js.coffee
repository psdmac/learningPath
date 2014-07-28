myApp.factory 'User',[ ->
  userdata = undefined
  data: ->
    userdata
]

$headers = 
  "X-Parse-Application-Id": "EY0Vzni9XsJTNKnIU6EW3Ix1lUfZiaxQIbGyjqrp"
  "X-Parse-REST-API-Key": "g8TmGA58slpHeRENDxQHC1G8tq9M8njMNzan0rCi"

myApp.factory 'ParseData',['$http', ($http) ->
  createTool: (data) ->
    $http
      method: 'POST'
      url: 'https://api.parse.com/1/classes/Tool'
      headers: $headers
      data: data
    .success (res) ->
      res
  getToolList: (data) ->
    $http
      method: 'GET'
      url: 'https://api.parse.com/1/classes/Tool'
      headers: $headers
    .success (res) ->
      res
  queryToolList: (data) ->
    $http
      method: 'GET'
      url: 'https://api.parse.com/1/classes/Tool'
      headers: $headers
      data: data
    .success (res) ->
      res
  getTagList: (data) ->
    $http
      method: 'GET'
      url: 'https://api.parse.com/1/classes/ToolTag'
      headers: $headers
    .success (res) ->
      res
]