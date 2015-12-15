
function contenthandleplugin() {}

contenthandleplugin.prototype.callbackMap = {};
contenthandleplugin.prototype.callbackIdx = 0;

contenthandleplugin.prototype.getCancel = function(success,fail) {
    return cordova.exec(success,fail,"ContentHandlePlugin","cancel",[""]);
};

cordova.addConstructor(function() {
                       if(!window.plugins)
                       {
                       window.plugins = {};
                       }
                       window.plugins.contenthandleplugin = new contenthandleplugin();
                       });


function showShareImages(images)
{
    images = images.split(',');
    var div = document.getElementsByTagName('body')[0];
    var scope = angular.element(div).scope();
    var rootScope = scope.$root;
    var currentStart = 0
    rootScope.items = "";
    rootScope.items = [];
    rootScope.addItems = function() {
        for (var i = currentStart; i < images.length-1; i++) {
            rootScope.items.push(images[i]);
        }
    }
    rootScope.addItems()
    rootScope.$apply();
}

function closeView()
{
    window.plugins.contenthandleplugin.getCancel(function(value){},function() { });
}
