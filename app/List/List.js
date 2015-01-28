'use strict';

angular.module('myApp.List', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/List', {
    templateUrl: 'List/List.html',
    controller: 'ListCtrl'
  });
}])

.controller('ListCtrl', ['$scope','$http',function($scope,$http) {
        $scope.filters = { };

        $scope.getShops = function(){
            $http.post('Backend/server.php?method=shops', { }).
                success(function(data, status) {
                    $scope.shops = data;
                });
        };

        $scope.getItems = function(){
            $http.post('Backend/server.php?method=items', { }).
                success(function(data, status) {
                    $scope.items = data;
                });
        };

        $scope.save = function(item){
            if(item && item.Description){
                console.log(item);
                $http.post('Backend/server.php?method=add', { "item": item}).
                    success(function(data, status) {
                        $scope.getItems();
                    });
            }
        };

        $scope.delete = function(id){
            console.log(id);
            $http.post('Backend/server.php?method=done&id=' +id, { }).
                success(function(data, status) {
                    $scope.getItems();
                });
        };


        $scope.getItems();
        $scope.getShops();

    }]);