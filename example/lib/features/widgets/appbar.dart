


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {

  const AppBarWidget({super.key, required this.title, this.backTo});

  final String title;
  final String? backTo;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      leading: backTo != null
          ? IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(backTo!)
      )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
