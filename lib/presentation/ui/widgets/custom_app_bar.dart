import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_search_delegate.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Image.asset(
          'assets/icons/app_logo.png',
          height: 25,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            showSearch(
              context: context,
              delegate: CustomSearchDelegate(hintText: 'Search'),
            );
          },
          icon: const Icon(Icons.search, color: Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/nurullah.jpg'),
            backgroundColor: Colors.redAccent,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}