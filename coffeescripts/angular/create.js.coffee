myApp.controller 'CreateCtrl', ['$scope','$rootScope','$location','ParseData', ($scope, $rootScope, $location, ParseData) ->
  $scope.htmlContent = '<h2>Try me!</h2><p>textAngular is a super cool WYSIWYG Text Editor directive for AngularJS</p><p><b>Features:</b></p><ol><li>Automatic Seamless Two-Way-Binding</li><li style="color: blue;">Super Easy <b>Theming</b> Options</li><li>Simple Editor Instance Creation</li><li>Safely Parses Html for Custom Toolbar Icons</li><li>Doesn&apos;t Use an iFrame</li><li>Works with Firefox, Chrome, and IE8+</li></ol><p><b>Code at GitHub:</b> <a href="https://github.com/fraywing/textAngular">Here</a> </p>'
  $scope.getTagList = ->
    ParseData.getTagList().success (res) ->
      $scope.tags = res.results
      console.log res.results
  $scope.getTagList()

  $scope.createTool = ->
    Tool = Parse.Object.extend("Tool")
    tool = new Tool()
    # 建立一個 tags 矩陣，放 tag 的 objectId
    tags = []
    angular.forEach $scope.tags, (tag) ->
      if tag.value
        # 把 objectId 蒐集一個陣列
        tags.push tag.objectId
        tool.set(tag.objectId, tag.value.toString())
      else if tag.value is undefined
        tag.value = false
        tool.set(tag.objectId, tag.value.toString())
      else
        tool.set(tag.objectId, tag.value.toString())
    tool.set("name", $scope.tool.name)
    tool.set("image", $scope.tool.iconLink)
    tool.set("link", $scope.tool.appLink)
    tool.set("company", $scope.tool.company)
    tool.set("description", $scope.htmlContent)
    tool.set("shortDescription", $scope.shortDescription)
    tool.set("tags", tags)
    $scope.ajax = true
    tool.save(null,
      success: (tool) ->
        alert 'New object created with objectId: ' + tool.id
        console.log 'create success'
        $scope.ajax = false
        $location.path '/toolkit'
      error: (tool, error) ->
        alert 'Failed to create new object, with error code: ' + error.message
    )

  # $scope.doTag = ->
  #   console.log $scope.tags
  #   data = '{'
  #   temp = []
  #   angular.forEach $scope.tags, (tag) ->
  #     if tag.value is undefined
  #       tag.value = false
  #     temp.push tag.objectId
  #     if temp.length is $scope.tags.length
  #       data = data + tag.objectId+': '+tag.value+ '}'
  #       data = angular.toJson data
  #       console.log $.parseJSON data
  #     else
  #       data = data + tag.objectId+': '+tag.value+ ', '
  #       console.log tag.objectId+': '+tag.value+ ','
  #       # console.log data
  # $scope.createTool = ->
  #   data = 
  #     name: $scope.tool.name
  #     image: $scope.tool.iconLink
  #     link: $scope.tool.appLink
  #     company: $scope.tool.company
  #     description: $scope.htmlContent
  #     shortDescription: $scope.shortDescription
  #     tags: $scope.tags

  #   tagJson = angular.toJson(data).slice(0,-1) + ','
  #   temp = []
  #   angular.forEach $scope.tags, (tag) ->
  #     if tag.value is undefined
  #       tag.value = false
  #     temp.push tag.objectId
  #     if temp.length is $scope.tags.length
  #       tagJson = tagJson+'\"'+ tag.objectId+'\"'+': '+'\"'+tag.value+'\"'+ '}'
  #       tagJson = angular.fromJson tagJson
  #       console.log tagJson
  #       $scope.ajax = true
  #       ParseData.createTool(tagJson).success (res) ->
  #         console.log 'create success'
  #         $scope.ajax = false
  #         $location.path '/toolkit'
  #     else
  #       tagJson = tagJson+'\"'+ tag.objectId+'\"'+': '+'\"'+tag.value+'\"'+ ', '
]

