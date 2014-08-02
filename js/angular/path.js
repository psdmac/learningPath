myApp.controller('PathCtrl', [
  '$scope', '$rootScope', '$location', 'ParseData', function($scope, $rootScope, $location, ParseData) {
    $scope.platforms = [
      {
        value: false,
        zh_tw: 'Web',
        classify: [
          {
            zh_tw: '內容經營',
            value: false
          }, {
            zh_tw: '購物網站',
            value: false
          }, {
            zh_tw: '靜態頁面',
            value: false
          }
        ]
      }, {
        value: false,
        zh_tw: 'App'
      }, {
        value: false,
        zh_tw: 'Game'
      }
    ];
    return $scope.components = [
      {
        zh_tw: '購物車',
        value: false
      }, {
        zh_tw: '客服系統',
        value: false
      }, {
        zh_tw: '即時通知',
        value: false
      }, {
        zh_tw: '後台管理',
        value: false
      }
    ];
  }
]);
