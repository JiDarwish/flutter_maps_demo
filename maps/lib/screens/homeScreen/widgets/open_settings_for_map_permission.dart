import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class OpenSettingsForMapPermission extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Open settings'),
              onPressed: () async => await openAppSettings(),
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Text('Please grant location to be able to continue'),
            ),
          ],
        ),
      ),
    );
  }
}
