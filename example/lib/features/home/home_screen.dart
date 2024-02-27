
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphify_example/features/widgets/scaffold_wrapper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const title = 'Graphify Examples';

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      title: title,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: List.generate(30, (index) => Card(
                child: ListTile(
                  title: Text('Item $index'),
                  onTap: () => context.go('/basic-line'),
                ),
              )).toList(),
            ),
          ),
        ),
      )
    );
  }

}
