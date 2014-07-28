var $headers;

myApp.factory('User', [
  function() {
    var userdata;

    userdata = void 0;
    return {
      data: function() {
        return userdata;
      }
    };
  }
]);

$headers = {
  "X-Parse-Application-Id": "EY0Vzni9XsJTNKnIU6EW3Ix1lUfZiaxQIbGyjqrp",
  "X-Parse-REST-API-Key": "g8TmGA58slpHeRENDxQHC1G8tq9M8njMNzan0rCi"
};

myApp.factory('ParseData', [
  '$http', function($http) {
    return {
      createTool: function(data) {
        return $http({
          method: 'POST',
          url: 'https://api.parse.com/1/classes/Tool',
          headers: $headers,
          data: data
        }).success(function(res) {
          return res;
        });
      },
      getToolList: function(data) {
        return $http({
          method: 'GET',
          url: 'https://api.parse.com/1/classes/Tool',
          headers: $headers
        }).success(function(res) {
          return res;
        });
      },
      queryToolList: function(data) {
        return $http({
          method: 'GET',
          url: 'https://api.parse.com/1/classes/Tool',
          headers: $headers,
          data: data
        }).success(function(res) {
          return res;
        });
      },
      getTagList: function(data) {
        return $http({
          method: 'GET',
          url: 'https://api.parse.com/1/classes/ToolTag',
          headers: $headers
        }).success(function(res) {
          return res;
        });
      }
    };
  }
]);
