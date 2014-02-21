angular.module('Todo').controller('ListCtrl', ['$scope', '$location', '$routeParams', 'listsService', function ($scope, $location, $routeParams, listsService) {
  
  $scope.listId = $routeParams.listId;

  $scope.currentList = [];
  listsService.getCurrentList($scope.listId, function(data){
      $scope.currentList = data;
  });

  $scope.viewLists = function() {
    $location.url('/lists');
  };

  $scope.createList = function() {
    $location.url('/list/new');
  };

}]);
