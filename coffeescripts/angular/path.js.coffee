myApp.controller 'PathCtrl', ['$scope','$rootScope','$location','ParseData', ($scope, $rootScope, $location, ParseData) ->
  $scope.platforms = [
    {
      value: false
      zh_tw: 'Web'
      classify: [
        {
          zh_tw: '內容經營'
          value: false
        },
        {
          zh_tw: '購物網站'
          value: false
        },
        {
          zh_tw: '靜態頁面'
          value: false
        }
      ]
    },
    {
      value: false
      zh_tw: 'App'
    },
    {
      value: false
      zh_tw: 'Game'
    }
  ]
  $scope.components = [
    {
      zh_tw: '購物車'
      value: false
    }
    {
      zh_tw: '客服系統'
      value: false
    }
    {
      zh_tw: '即時通知'
      value: false
    }
    {
      zh_tw: '後台管理'
      value: false
    }
  ]
  $scope.tools = [
    {
      title: 'Weebly - 创建独一无二的网站、博客和网店就是如此简单'
      link: 'http://www.weebly.com/'
      image: 'http://eadesign.me/wp-content/uploads/2013/03/weebly-logo.jpg'
      descript: '创建独一无二的网站、博客和网店就是如此简单'
    }
    {
      title: 'squarespace'
      link: 'http://www.squarespace.com/'
      image: 'http://s.websiteplanet.com/wp-content/uploads/2014/07/Squarespace.png'
    }
    {
      title: 'Wix'
      link: 'http://www.wix.com/'
      image: 'http://cmxhub.com/wp-content/uploads/2014/05/wix.jpg'
    }
    {
      title: 'Wordpress'
      link: 'https://zh-tw.wordpress.com/'
      image: 'http://wow-wp.org/wp-content/uploads/2011/10/wordpress.png'
    }
  ]
  $scope.results = [
    {
      title: '了解 Web 運作'
      link: 'http://courses.tutsplus.com/courses/tools-of-the-modern-web-developer'
      rank: 'Beginner'
      image: 'https://cms-assets.tutsplus.com/legacy-courses/CRS-54.png'
      price: 'Free'
    }
    {
      title: '前端開發簡介'
      link: 'https://www.youtube.com/watch?v=jgclkz6l88I'
      rank: 'Beginner'
      image: 'https://cms-assets.tutsplus.com/legacy-courses/CRS-106275.png'
      price: 'Free'
    }
    {
      title: 'HTML & CSS'
      link: 'http://courses.tutsplus.com/courses/30-days-to-learn-html-css'
      rank: 'Beginner'
      image: 'https://cms-assets.tutsplus.com/legacy-courses/CRS-40.png'
      price: 'Free'
    }
    {
      title: 'jQuery for Designer'
      link: 'http://courses.tutsplus.com/courses/jquery-for-designers'
      rank: 'Beginner'
      image: 'https://cms-assets.tutsplus.com/legacy-courses/CRS-101176.png'
      price: '$25'
    }
  ]
]