import 'package:flutter/material.dart';

class DialogExample {
  GlobalKey<NavigatorState> navigatorKey=GlobalKey(); 
  // const DialogExample({super.key});
  late String title, content;
  DialogExample(this.title, this.content);
  showCustomeDialog() {
    return showDialog(
        context: navigatorKey.currentContext!,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          );
        });
  }
}
