var evergreen = angular.module('evergreen', ['ui.router', 'restangular'])

.config( ['$stateProvider', '$urlRouterProvider', 'RestangularProvider',
  function($stateProvider, $urlRouterProvider, RestangularProvider) {

    // REST Config
    RestangularProvider.setBaseUrl('/api');
    RestangularProvider.setRequestSuffix('.json');
    RestangularProvider.setDefaultHttpFields({
      'content-type': 'application/json'
    });

    // Routing
    $urlRouterProvider.otherwise('/home');

    $stateProvider

      .state('home', {
        url: '/home',
        templateUrl: '/templates/nav/home.html',
        controller: function($scope) {
          $scope.test = "hello, world!";
        }
      })

      .state('about', {
        url: '/about',
        templateUrl: '/templates/nav/about.html'
      })

      .state('contact', {
        url: '/contact-us',
        templateUrl: '/templates/nav/contact.html'
      })

      .state('mission', {
        url: '/mission',
        templateUrl: '/templates/nav/mission.html'
      })

      // ADMIN DASHBOARD
      .state('admin', {
        url: '/admin',
        views: {
          '': {
            templateUrl: '/templates/admin/main.html',
            controller: 'AdminCtrl',
            resolve: {
              users: ['Restangular', function(Restangular) {
                return Restangular.all('admin/users').getList();
              }]
            }
          }
        }
      })

      .state('admin.dashboard', {
        url: '/dashboard',
        views: {
          'sidebar': {
            templateUrl: '/templates/admin/sidebar.html',
            controller: function($scope) { console.log("SIDEBAR") }
          },

          'dashboard': {
            templateUrl: '/templates/admin/dashboard.html',
            controller: function($scope) { console.log("DASHBOARD") }
          }
        }
      })

      .state('admin.dashboard.users', {
        url: '/users',
        templateUrl: '/templates/admin/dashboard/users.html',
        controller: function($scope) { console.log("USERS") }
      })

      .state('admin.dashboard.sectors', {
        url: '/sectors',
        templateUrl: '/templates/admin/dashboard/sectors.html',
        controller: function($scope) { console.log("SECTORS") }
      })

      .state('admin.dashboard.collections', {
        url: '/collections',
        templateUrl: '/templates/admin/dashboard/collections.html',
        controller: function($scope) { console.log("COLLECTIONS") }
      })

      .state('admin.dashboard.resources', {
        url: '/resources',
        templateUrl: '/templates/admin/dashboard/resources.html',
        controller: function($scope) { console.log("RESOURCES") }
      })

  }])

evergreen.run(['$rootScope',
  function($rootScope) {
    $rootScope.$on('$stateChangeError', console.log.bind(console));
  }]);