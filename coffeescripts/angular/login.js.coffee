myApp.controller 'LoginCtrl', ['$scope','$rootScope','$location','$cookieStore','User', ($scope, $rootScope, $location, $cookieStore, User) ->
# email,publish_actions,user_friends
  $scope.loginWithFb = ->
    Parse.FacebookUtils.logIn "email,user_friends",
      success: (user) ->
        if !user.existed()
          # User signed up and logged in through Facebook!
          User.data = user
          console.log User.data
          $rootScope.authStatus = true
          $cookieStore.put 'session', user._sessionToken
          $scope.$apply()
        else
          # User logged in through Facebook!
          User.data = user
          console.log User.data
          $rootScope.authStatus = true
          $cookieStore.put 'session', user._sessionToken
          $scope.$apply()
      error: (user, error) ->
        alert "您取消了授權登入."
        $rootScope.authStatus = false
        $scope.$apply()
]

myApp.controller 'SignUpCtrl', ['$scope','$rootScope','$location', ($scope, $rootScope, $location) ->
  $scope.signup = ->
    # console.log 'signup'
    # console.log $scope.user.username
    # console.log $scope.user.email
    # console.log $scope.user.password
    # console.log $scope.user.rpassword
    user =  new Parse.User()
    user.set("username", $scope.user.username)
    user.set("password", $scope.user.password)
    user.set("email", $scope.user.email)
    user.signUp null,
      success: (user) ->
        # Hooray! Let them use the app now.
        alert 'success'
      error: (user, error) ->
        # Show the error message somewhere and let the user try again.
        alert("Error: " + error.code + " " + error.message);
  $scope.user = {}
]