myApp.controller('LoginCtrl', [
  '$scope', '$rootScope', '$location', '$cookieStore', 'User', function($scope, $rootScope, $location, $cookieStore, User) {
    return $scope.loginWithFb = function() {
      return Parse.FacebookUtils.logIn("email,user_friends", {
        success: function(user) {
          if (!user.existed()) {
            User.data = user;
            console.log(User.data);
            $rootScope.authStatus = true;
            $cookieStore.put('session', user._sessionToken);
            return $scope.$apply();
          } else {
            User.data = user;
            console.log(User.data);
            $rootScope.authStatus = true;
            $cookieStore.put('session', user._sessionToken);
            return $scope.$apply();
          }
        },
        error: function(user, error) {
          alert("您取消了授權登入.");
          $rootScope.authStatus = false;
          return $scope.$apply();
        }
      });
    };
  }
]);

myApp.controller('SignUpCtrl', [
  '$scope', '$rootScope', '$location', function($scope, $rootScope, $location) {
    $scope.signup = function() {
      var user;

      user = new Parse.User();
      user.set("username", $scope.user.username);
      user.set("password", $scope.user.password);
      user.set("email", $scope.user.email);
      return user.signUp(null, {
        success: function(user) {
          return alert('success');
        },
        error: function(user, error) {
          return alert("Error: " + error.code + " " + error.message);
        }
      });
    };
    return $scope.user = {};
  }
]);
