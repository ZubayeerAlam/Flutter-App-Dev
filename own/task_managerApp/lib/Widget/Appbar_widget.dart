import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/app_color.dart';

class Appbar_Widget extends StatelessWidget implements PreferredSize {
  const Appbar_Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.P_Color,
      title: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: Image.network(
              "https://images.unsplash.com/photo-1682685790910-1f3c5d8e7b9e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
            ).image,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Zubayeer Alam",
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(color: Colors.white70),
              ),
              Text(
                "zubayeer.alam@example.com",
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(color: Colors.white70),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
