import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool hideBack;
  const BasicAppBar({
    this.title,
    this.hideBack = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: title ??
          Image.asset('assets/images/spotify_extended_logo.png', width: 120),
      leading: hideBack
          ? null
          : Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                onPressed: () => context.pop(),
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: .03),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
