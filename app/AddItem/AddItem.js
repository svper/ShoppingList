'use strict';

angular.module('myApp.AddItem', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/AddItem', {
    templateUrl: 'AddItem/AddItem.html',
    controller: 'AddItemCtrl'
  });
}])

.controller('AddItemCtrl', [function() {

}]);