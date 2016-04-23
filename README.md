# iOS Phonegap app share extension (images) with ionic


iOS Phonegap app share extension (images) with ionic


Share extensions give users a convenient way to share content with other entities, such as social sharing websites or upload services. For example, in an app that includes a Share button, users can choose a Share extension that represents a social sharing website and then use it to post a comment or other content.  Link

    In iOS Share extension create new share project in existing project.

     1) Create and add share extension project on your app.
     
File >>New >>Target ...>>Application Extension >>Share Extension >>Next (Click on).

     2) Add share Project Details : product name ,Organization identifier ...etc .. >> finish.

     3) Replace : ShareViewController.h and ShareViewController.m file.
      
     4) Add Content Handle Plugin files on share project 
           ContentHandlePlugin.h and ContentHandlePlugin.m
        
     5) Add contenthandleplugin.js file on ionic www js file . 
          Add indexshareimage.html on your ionic www directory.

     6) Add www ionic directory on share project (add directory with reference ).

     7) Main project confix.xml file in add on share project.
 
     8) Add on confix.xml file .
                   1) In <content src="index.html" /> (index.htm replace with indexshareimage.html)
                   2) <feature name="ContentHandlePlugin"> 
                            <param name="ios­package" onload="true" value="ContentHandlePlugin" /> 
                       </feature> 

     9) Add framework on share project 
                      1) MobileCoreServices.framework 
                      2) CoreGraphics.framework
                      3) AssetsLibrary.framework 
                      4) libCordova.a 

    10) In contenthandleplugin.js file have function.

                1) showShareImages(images) // return image list
                2) closeView() call for Cancel button of share view close 
           
                    Cancel and Send button used like : (app.js ) 
        
         app.controller('MainCtrl', function($scope) { $scope.cancelshareview = function() {
         closeView();//Cancel button event };
         $scope.sendshareview = function() { // send button event
          //Apply your logic for image upload on server
         closeView();
         }; }
       

 Note : indexshareimage.html demo page of ionic framework.

More info : http://lokesh-patel.blogspot.in/2015/11/ios-phonegap-app-share-extension-images.html

If You Like Plugin ,Please Buy a Cup of Coffee! (https://www.paypal.com/in/cgi-bin/webscr?cmd=_flow&SESSION=tm8rOQltlq6UktOywExjLUHW-iHHQGB6FINQMxaU4DVdWQY6vt1cIJh87Tu&dispatch=5885d80a13c0db1f8e263663d3faee8d6625bf1e8bd269586d425cc639e26c6a)
