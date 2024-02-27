import 'package:flutter/material.dart';
import 'package:graphify_example/core/responsibility.dart';
import 'package:graphify_example/features/widgets/appbar.dart';
import 'package:graphify_example/features/widgets/github_floating_button.dart';
import 'package:graphify_example/features/widgets/sidebar.dart';


class ScaffoldWrapper extends StatelessWidget {

  const ScaffoldWrapper({super.key, required this.title, required this.child, this.backTo, this.hasAppBar = true});

  final bool hasAppBar;
  final String? backTo;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {

    final device = Responsibility.getDevice(MediaQuery.of(context).size);

    return Scaffold(
      appBar: device != ResponsibilityType.desktop ? (hasAppBar ? AppBarWidget(
        title: title,
        backTo: backTo,
      ) : null) : null,
      body: Row(
        children: [

          if (device == ResponsibilityType.desktop) const Sidebar(),

          Expanded(
            child: Column(
              children: [

                if (device == ResponsibilityType.desktop) ...[

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),

                ],

                Expanded(
                  child: child,
                ),

              ],
            ),
          )

        ],
      ),
      floatingActionButton: GithubFloatingActionButton(),
    );
  }

}
