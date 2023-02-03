import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed:_openAppReview, 
              child:Text('Click')),
          )
        ],
      ),
    );
  }

   void _openAppReview() async {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {

      /// NOTE: use this SPARINGLY -> restricted by quota
      /// triggers the In-App Review prompt
      //inAppReview.requestReview();

      /// NOTE: NOT restricted by quota
      ///
      /// opens:
      /// - Google Play Store on Android,
      /// - App Store with a review screen on IOS & MacOS
      /// - Microsoft Store on Windows.
      ///
      /// Use this if you want to permanently provide a button or other
      /// call-to-action to let users leave a review
      ///
      /// appStoreId is only required on IOS and MacOS and can be found in
      /// App Store Connect under General > App Information > Apple ID.
      ///   exp: https://apps.apple.com/app/app-name/id1111111111
      ///     -> id: id1111111111
      ///
      /// microsoftStoreId is only required on Windows:
      ///   exp: https://www.microsoft.com/store/apps/<microsoftStoreId>
      inAppReview.openStoreListing(
        appStoreId: 'com.artifitia.zelato_app',
        // microsoftStoreId: '...',
      );
    }
  }

}


//com.artfs.review_do