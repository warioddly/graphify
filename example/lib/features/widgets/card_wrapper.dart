
import 'package:flutter/material.dart';
import 'package:graphify_example/core/responsibility.dart';

class CardWrapper extends StatelessWidget {

  const CardWrapper({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {

    final ResponsibilityType device = Responsibility.getDevice(MediaQuery.of(context).size);

    return Center(
      child: GridView(
          primary: false,
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: device == ResponsibilityType.desktop ? 5 : device == ResponsibilityType.tablet ? 2 : 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: children
      ),
    );
  }
}
