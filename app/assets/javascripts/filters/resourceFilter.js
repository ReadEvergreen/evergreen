evergreen.filter('resourceFilter', function() {
  return function( collection, searchText ) {

    searchText = searchText.toLowerCase();

    var filteredCollection = []

    angular.forEach( collection, function( resource ) {
      var title = resource.title.toLowerCase();
      var description = resource.description.toLowerCase();
      var collection_titles = resource.collection_titles.toLowerCase();
      var owner = resource.owner_username.toLowerCase();

      if (title.indexOf(searchText) > -1 || description.indexOf(searchText) > -1 || collection_titles.indexOf(searchText) > -1 || owner.indexOf(searchText) > -1) {
        filteredCollection.push(resource);
      };
    });

    return filteredCollection;

  };
});