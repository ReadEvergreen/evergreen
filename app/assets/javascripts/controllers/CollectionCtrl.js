evergreen.controller('CollectionCtrl',
  ['$scope', 'Restangular', 'collections', 'sectors', 'collectionService',
  function($scope, Restangular, collections, sectors, collectionService) {

    $scope.init = function() {
      collectionService.setCollections(collections);
      $scope.sectors = sectors;
      $scope.setCollectionVars();
    };

    // admin vars
    $scope.setCollectionVars = function() {
      $scope.addCollectionForm = false;
      $scope.collection = {};
      $scope.collections = collectionService.getCollections();
      angular.forEach($scope.collections, function(collection) {
        synIDs = collectionService.getSynthesisIDs(collection);
        collection["synthesis"] = synIDs.join(", ");
      });
    };

    $scope.createCollection = function(collection) {
      Restangular.all('collections').post(collection)
        .then( function(response) {
          console.log(response);
          collectionService.addCollection(response)
          $scope.setCollectionVars();
        }, function() {
          $scope.setCollectionVars();
        });
    };

    $scope.destroyCollection = function(collection) {
      collection.remove().then( function() {
        collectionService.remove(collection);
        $scope.setCollectionVars();
      });
    };

    $scope.toggleAddForm = function() {
      $scope.addCollectionForm = !$scope.addCollectionForm;
    };

    $scope.init();

  }]);