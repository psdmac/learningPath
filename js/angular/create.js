myApp.controller('CreateCtrl', [
  '$scope', '$rootScope', '$location', 'ParseData', function($scope, $rootScope, $location, ParseData) {
    $scope.htmlContent = '<h2>Try me!</h2><p>textAngular is a super cool WYSIWYG Text Editor directive for AngularJS</p><p><b>Features:</b></p><ol><li>Automatic Seamless Two-Way-Binding</li><li style="color: blue;">Super Easy <b>Theming</b> Options</li><li>Simple Editor Instance Creation</li><li>Safely Parses Html for Custom Toolbar Icons</li><li>Doesn&apos;t Use an iFrame</li><li>Works with Firefox, Chrome, and IE8+</li></ol><p><b>Code at GitHub:</b> <a href="https://github.com/fraywing/textAngular">Here</a> </p>';
    $scope.getTagList = function() {
      return ParseData.getTagList().success(function(res) {
        $scope.tags = res.results;
        return console.log(res.results);
      });
    };
    $scope.getTagList();
    return $scope.createTool = function() {
      var Tool, tags, tool;

      Tool = Parse.Object.extend("Tool");
      tool = new Tool();
      tags = [];
      angular.forEach($scope.tags, function(tag) {
        if (tag.value) {
          tags.push(tag.objectId);
          return tool.set(tag.objectId, tag.value.toString());
        } else if (tag.value === void 0) {
          tag.value = false;
          return tool.set(tag.objectId, tag.value.toString());
        } else {
          return tool.set(tag.objectId, tag.value.toString());
        }
      });
      tool.set("name", $scope.tool.name);
      tool.set("image", $scope.tool.iconLink);
      tool.set("link", $scope.tool.appLink);
      tool.set("company", $scope.tool.company);
      tool.set("description", $scope.htmlContent);
      tool.set("shortDescription", $scope.shortDescription);
      tool.set("tags", tags);
      $scope.ajax = true;
      return tool.save(null, {
        success: function(tool) {
          alert('New object created with objectId: ' + tool.id);
          console.log('create success');
          $scope.ajax = false;
          return $location.path('/toolkit');
        },
        error: function(tool, error) {
          return alert('Failed to create new object, with error code: ' + error.message);
        }
      });
    };
  }
]);
