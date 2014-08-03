var myApp;

myApp = angular.module('myApp', ['ngRoute', 'ngCookies', 'ngSanitize', 'textAngular']);

myApp.config([
  '$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
    $routeProvider.when('/toolkit', {
      templateUrl: '/views/tool.html',
      controller: 'ToolCtrl'
    }).when('/login', {
      templateUrl: '/views/login.html',
      controller: 'LoginCtrl'
    }).when('/signup', {
      templateUrl: '/views/signup.html',
      controller: 'SignUpCtrl'
    }).when('/toolkit/create', {
      templateUrl: 'views/create-tool.html',
      controller: 'CreateCtrl'
    }).when('/path', {
      templateUrl: '/views/path.html',
      controller: 'PathCtrl'
    }).when('/platform', {
      templateUrl: '/views/platform.html'
    }).otherwise({
      redirectTo: '/toolkit'
    });
    $locationProvider.html5Mode(false);
    return $locationProvider.hashPrefix("!");
  }
]);

myApp.controller('HeaderCtrl', [
  '$scope', '$rootScope', '$location', '$timeout', '$cookieStore', 'User', function($scope, $rootScope, $location, $timeout, $cookieStore, User) {
    return $scope.loginWithToken = function() {};
  }
]);

myApp.controller('TabCtrl', [
  '$scope', '$rootScope', '$location', function($scope, $rootScope, $location) {
    return $scope.$on('$locationChangeSuccess', function() {
      return $scope.currentRoute = $location.path();
    });
  }
]);

myApp.controller('ToolCtrl', [
  '$scope', '$rootScope', '$location', 'ParseData', function($scope, $rootScope, $location, ParseData) {
    $scope.getToolList = function() {
      return ParseData.getToolList().success(function(res) {
        $scope.lists = res.results;
        return $scope.total = res.results.length;
      });
    };
    $scope.getTagList = function() {
      return ParseData.getTagList().success(function(res) {
        return $scope.tags = res.results;
      });
    };
    $scope.filterTag = function() {
      var Tool, query;

      Tool = Parse.Object.extend("Tool");
      query = new Parse.Query(Tool);
      angular.forEach($scope.tags, function(tag) {
        if (tag.value) {
          return query.equalTo(tag.objectId, tag.value.toString());
        }
      });
      return query.find({
        success: function(results) {
          $scope.total = results.length;
          if (results.length === 0) {
            $scope.lists.length = 0;
            return $scope.$apply();
          } else {
            $scope.lists.length = 0;
            return angular.forEach(results, function(result) {
              $scope.lists.push(result.attributes);
              return $scope.$apply();
            });
          }
        },
        error: function(error) {
          return alert("Error: " + error.code + " " + error.message);
        }
      });
    };
    $scope.checkTag = function(id, tags) {
      if ($.inArray(id, tags) >= 0) {
        return true;
      } else {
        return false;
      }
    };
    $scope.queryTool = function(data) {
      return ParseData.queryToolList(data).success(function(res) {});
    };
    $scope.getToolList();
    return $scope.getTagList();
  }
]);

myApp.directive('showImg', function() {
  return function(scope, el, attrs) {
    return $(el).error(function() {
      return $(this).hide();
    });
  };
});
