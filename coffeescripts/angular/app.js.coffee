myApp = angular.module 'myApp', ['ngRoute','ngCookies','ngSanitize','textAngular']

myApp.config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
  $routeProvider
    .when '/toolkit',
      templateUrl: '/views/tool.html'
      controller: 'ToolCtrl'
    .when '/login',
      templateUrl: '/views/login.html'
      controller: 'LoginCtrl'
    .when '/signup',
      templateUrl: '/views/signup.html'
      controller: 'SignUpCtrl'
    .when '/toolkit/create',
      templateUrl: 'views/create-tool.html'
      controller: 'CreateCtrl'
    .otherwise
      redirectTo: '/toolkit'
  $locationProvider.html5Mode false
  $locationProvider.hashPrefix "!"
]

myApp.controller 'HeaderCtrl', ['$scope','$rootScope','$location','$timeout','$cookieStore','User', ($scope, $rootScope, $location, $timeout, $cookieStore, User) ->
  $scope.loginWithToken = ->
    # console.log 'loginWithToken'
    # console.log $cookieStore.get 'session'
    # Parse.User.become("session-token-here").then (user) ->
    #   alert 'The current user is now set to user.'
    # , (error) ->
    #   alert 'The token could not be validated.'
]

myApp.controller 'TabCtrl', ['$scope','$rootScope','$location', ($scope, $rootScope, $location) ->
  # $scope.currentRoute = $location.path()
  # $scope.$on '$locationChangeSuccess', ->
  #   $scope.currentRoute = $location.path()
  # currentUser = Parse.User.current()
  # if currentUser
  #   console.log 'already login'
  #   $rootScope.authStatus = true
  # else
  #   console.log 'need login'
  #   $rootScope.authStatus = false
  #   $location.path '/login'
]

myApp.controller 'ToolCtrl', ['$scope','$rootScope','$location','ParseData', ($scope, $rootScope, $location, ParseData) ->
  $scope.getToolList = ->
    ParseData.getToolList().success (res) ->
      $scope.lists = res.results
      $scope.total = res.results.length
      console.log res.results
  $scope.getTagList = ->
    ParseData.getTagList().success (res) ->
      $scope.tags = res.results
  # tag 變動時從新搜尋
  $scope.filterTag = ->
    console.log $scope.tags
    Tool = Parse.Object.extend("Tool")
    query = new Parse.Query(Tool)
    angular.forEach $scope.tags, (tag) ->
      if tag.value
        query.equalTo(tag.objectId, tag.value.toString())
    query.find
      success: (results) ->
        $scope.total = results.length
        if results.length is 0
          $scope.lists.length = 0
          $scope.$apply()
        else
          $scope.lists.length = 0
          angular.forEach results, (result) ->
            $scope.lists.push result.attributes
            $scope.$apply()
      error: (error) ->
        alert "Error: " + error.code + " " + error.message

  $scope.checkTag = (id, tags) ->
    if $.inArray(id, tags) >= 0
      return true
    else
      return false
    # queryString = '{'
    # i = 0
    # angular.forEach $scope.tags, (tag) ->
    #   console.log tag.value
    #   i = i + 1
    #   if i is $scope.tags.length
    #     if tag.value
    #       queryString = queryString + '\"' + tag.objectId + '\"' + ': true }'
    #     else
    #       queryString = queryString + ' }'
    #     console.log queryString
    #     # console.log encodeURI queryString
    #     $scope.queryTool(queryString)
    #   else
    #     if tag.value and i is 1
    #       queryString = queryString + '\"' + tag.objectId + '\"' + ': true'
    #     else if tag.value
    #       queryString = queryString + ',' + '\"' + tag.objectId + '\"' + ': true'
  $scope.queryTool = (data) ->
    ParseData.queryToolList(data).success (res) ->
      console.log res

  # 取得工具清單
  $scope.getToolList()
  # 取得 tag 清單
  $scope.getTagList()
]

