import 'dart:async';

import 'package:clean_architecture/di/di.dart';
import 'package:clean_architecture/view/cubits/pictures_cubit.dart';
import 'package:clean_architecture/view/pages/home_page.dart';
import 'package:clean_architecture/view/pages/home_page_tabs/tab1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

void main() {
  setupServiceLocator();
  runApp(MyApp());
}

void setupServiceLocator() {
  configureDependencies();
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Clean Arch Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }

  final _router = GoRouter(
    initialLocation: "/a",
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          pageBuilder: (BuildContext context, GoRouterState state, Widget c) =>
              NoTransitionPage(
                child: BlocProvider(
                  create: (context) => getIt<PicturesCubit>(),
                  child:
                      HomePage(child: BlocBuilder<PicturesCubit, PicturesState>(
                    builder: (a, b) {
                      return Center(
                        child: c,
                      );
                    },
                  )),
                ),
              ),
          routes: [
            GoRoute(
                path: "/a",
                pageBuilder: (context, GoRouterState b) =>
                    const NoTransitionPage(child: Tab1())),
            GoRoute(
                parentNavigatorKey: _shellNavigatorKey,
                path: "/b",

                pageBuilder: (context, GoRouterState b) => NoTransitionPage(
                      child: Center(
                        child: Text(
                            "${b.fullpath}\n${b.location} ${getIt<PicturesCubit>().state.pageIndex}"),
                      ),
                    )),
            GoRoute(
                path: "/c",
                pageBuilder: (context, GoRouterState b) => NoTransitionPage(
                      child: Center(
                        child: Text(
                            "${b.fullpath}\n${b.location}"),
                      ),
                    )),
          ]),
    ],
  );


}
