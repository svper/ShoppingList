'use strict';

angular.module('myApp.List', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/List', {
    templateUrl: 'List/List.html',
    controller: 'ListCtrl'
  });
}])

.controller('ListCtrl', [function() {

}]);