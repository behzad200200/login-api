'use strict';

angular.module('myApp.login', ['ngRoute'])
    .config(['$routeProvider', function($routeProvider){
        $routeProvider.when('/login',{
            templateUrl: 'login/login.html',
            controller: 'loginController'
        })
    }])
    .controller('loginController',['$auth', '$scope', '$location', function($auth, $scope, $location){
        $scope.credentials = {};
        $scope.errors = {};
        $scope.submitLogin = function(credentials){
            $auth.submitLogin(credentials)
                .then(function(res){
                    $location.path('/view2')
                })
                .catch(function(res){
                    $scope.errors = res.errors
                })

        }
    }])
