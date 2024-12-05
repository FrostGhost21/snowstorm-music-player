import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:snowstorm_v2/ui/first_time.dart';
import 'package:snowstorm_v2/ui/jellyfin.dart';
import 'package:snowstorm_v2/ui/local_files.dart';
import 'package:snowstorm_v2/ui/login.dart';
import 'package:snowstorm_v2/ui/ui_mockup.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const FirstTime(),
  ),
  GoRoute(
    path: '/local/setup',
    builder: (context, state) => const LocalFiles(),
  ),
  GoRoute(
    path: '/jellyfin',
    builder: (context, state) => const Jellyfin(),
  ),
  GoRoute(path: '/jellyfin/login', builder: (context, state) => const Login())
]);
void main() {
  runApp(const UIMockup());
}
