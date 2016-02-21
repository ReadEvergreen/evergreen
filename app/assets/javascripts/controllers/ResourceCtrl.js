evergreen.controller('ResourceCtrl',
  ['$scope', '$stateParams', 'Restangular', 'resources', 'resourceService',
  function($scope, $stateParams, Restangular, resources, resourceService) {

    $scope.init = function() {
      resourceService.setResources(resources);
      $scope.setResourceVars();
    };

    $scope.setResourceVars = function() {
      $scope.resources = resourceService.getResources();
    };

    $scope.destroyResource = function(resource) {
      Restangular.one('users', $stateParams["user_id"])
                 .one("resources", resource.id)
                 .remove().then( function() {
        resourceService.remove(resource);
        $scope.setResourceVars();
      });
    };

    $scope.toggleSort = function(column) {
      if (column === $scope.sort) {
        $scope.sortDescending ^= true;
      } else {
        $scope.sort = column;
        $scope.sortDescending = false;
      };
    };

    $scope.sortIcon = function(column) {
      if ($scope.sort === column) {
        return $scope.sortDescending
          ? 'fa fa-chevron-up fa-1x'
          : 'fa fa-chevron-down fa-1x';
      };
    };

    $scope.init();

  }]);