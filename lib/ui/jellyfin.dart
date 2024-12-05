import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Jellyfin extends ConsumerWidget {
  const Jellyfin({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Text("in jellyfin"),
    );
  }
}
