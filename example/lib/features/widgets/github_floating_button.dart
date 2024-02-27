import 'package:flutter/material.dart';

class GithubFloatingActionButton extends FloatingActionButton {

  GithubFloatingActionButton({
    Key? key,
    String url = "https://github.com/warioddly/graphify",
  }) : super(
      key: key,
      onPressed: () {
        debugPrint('Open in browser $url');
      },
      child: const Icon(Icons.open_in_browser),
  );


}