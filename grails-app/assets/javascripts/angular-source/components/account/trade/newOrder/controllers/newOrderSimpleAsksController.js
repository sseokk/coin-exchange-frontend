//=require ../services/newOrderSimpleAsksService

'use strict';

angular.module('account.trade.newOrder').controller('NewOrderSimpleAsksController', [
    '$scope', '$filter', '$rootScope', 'NewOrderSimpleAsksService', function ($scope, $filter, $rootScope, asksService) {
        var loaded = false;

        $scope.$on('refreshEvent', function(event, data) {
            loadAsks();
        });

        loadAsks();

        function loadAsks(){
            asksService.query()
                .success(function (data) {
                    $scope.orderBook = data;
                    setPaginationParams();
                    recalculateMinAndMax();
                    filterCollection();

                    $scope.$parent.asksLoaded = true;
                    loaded = true;

                }).error(function () {
                    $scope.orderBook = [];
                });
        }

        $scope.deleteOrder = function (order) {
            var index = $scope.orderBook.indexOf(order);
            $scope.orderBook.splice(index, 1);
            recalculateMinAndMax();
            filterCollection();
        };

        $scope.isLoaded = function () {
            return !loaded;
        };

        $scope.sort = {
            reverse: false
        };

        $scope.getSortingClass = function (columnName) {
            var className = 'sorting';

            if ($scope.sort.predicate === columnName) {
                $scope.sort.reverse ? className += '_asc' : className += '_desc';
            }

            return className;
        };

        $scope.updateSorting = function (columnName) {
            if ($scope.sort.predicate === columnName) {
                $scope.sort.reverse = !$scope.sort.reverse;
            } else {
                $scope.sort.predicate = columnName;
                $scope.sort.reverse = true;
            }

            $scope.orderBook = $filter('orderBy')($scope.orderBook, columnName, $scope.sort.reverse);
            setPaginationParams();
            recalculateMinAndMax();
            filterCollection();
        };

        //Sorting params
        function setPaginationParams() {
            $scope.currentPage = 1;
            $scope.maxSize = 1;
            $scope.totalItems = $scope.orderBook.length;
        }

        $scope.pageChanged = function () {
            recalculateMinAndMax();
            filterCollection();
        };

        function filterCollection() {
            $scope.filteredOrderBook = $scope.orderBook.slice($scope.currentMinIndex, $scope.currentMaxIndex);
        }

        function recalculateMinAndMax() {
            $scope.currentMinIndex = ($scope.currentPage - 1) * 10;
            $scope.currentMaxIndex = Math.min($scope.totalItems, $scope.currentPage * 10);
        }

        $scope.setLabelStyles = function (label) {
            var className = 'label-';
            switch (label) {
                case 'PartiallyFilled':
                    className += 'important';
                    break;
                case 'Accepted':
                    className += 'success';
                    break;
                case 'Complete':
                    className += 'success';
                    break;

                default:
                    className += 'inverse';
            }

            return className;
        };
    }]);
