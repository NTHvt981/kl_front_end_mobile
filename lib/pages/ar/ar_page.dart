import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class ArPage extends StatefulWidget {
  ArPage({
    @required Key key,
  }): super(key: key);

  @override
  _ArPageState createState() => _ArPageState();
}

class _ArPageState extends State<ArPage> {
  UnityWidgetController _unityWidgetController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your outfits'),
      ),
      body: SafeArea(
        bottom: false,
        child: WillPopScope(
          // ignore: missing_return
          onWillPop: null,
          child: Container(
            child: UnityWidget(
              onUnityCreated: onUnityCreate,
              fullscreen: false,
            ),
          ),
        ),
      ),
    );
  }

  void onUnityCreate(UnityWidgetController controller) {
    _unityWidgetController = controller;
  }
}
