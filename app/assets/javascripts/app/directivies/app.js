'use strict';

// Declare app level module which depends on views, and components
angular.module('myApp', [
    'ngRoute',
    'ng-token-auth',
    'myApp.view1'
]).
    config(['$routeProvider', function($routeProvider) {
        $routeProvider.otherwise({redirectTo: '/view1'});
    }])
    .config(['$authProvider', function($authProvider){
        $authProvider.configure({
            apiUrl: 'http://127.0.0.1:3000'
        })
    }])
    .controller('ApplicationController', ['$rootScope','$auth', function($rootScope, $auth){
        $rootScope.test_data = 'behzad';
        $rootScope.isLogin = function(){
            if($rootScope.user.length > 0){
                return true
            }else{
                return false
            }
        }
        $rootScope.logout = function(){
            console.log($auth)
            $auth.destroyAccount($rootScope.currentUser);
        }
    }])
    .directive('setBackgroundColor', ['$location', function($location){
        var link = function(scope, element, attrs){
            var replaceClass = function(element,name){
                element.className = "full-page"
                element.addClass(name);
            }
            var updateBackground = function(){
                switch($location.path()){
                    case '/view1':
                        replaceClass(element, 'sign-in');
                        break;
                    case '/login':
                        replaceClass(element, 'login');
                    default :
                        replaceClass(element, 'login');
                }
            }
            scope.$on('$routeChangeStart', function(){
                updateBackground();
            })
        };
        return {
            link: link
        }
    }])
    .directive( 'goClick', function ( $location ) {
        return function ( scope, element, attrs ) {
            var path;

            attrs.$observe( 'goClick', function (val) {
                path = val;
            });

            element.bind( 'click', function () {
                scope.$apply( function () {
                    $location.path( path );
                });
            });
        };
    });