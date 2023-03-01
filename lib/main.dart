import 'package:clean_architecture/di/di.dart';
import 'package:clean_architecture/view/cubits/home_page_navigation_cubit.dart';
import 'package:clean_architecture/view/cubits/pictures_cubit.dart';
import 'package:clean_architecture/view/pages/home_page.dart';
import 'package:clean_architecture/view/pages/home_page_tabs/tab1.dart';
import 'package:clean_architecture/view/pages/home_page_tabs/tab2.dart';
import 'package:clean_architecture/view/pages/home_page_tabs/tab3.dart';
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

  final GoRouter _router = GoRouter(
    initialLocation: "/a",
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          pageBuilder: (BuildContext context, GoRouterState state, Widget c) {
            return NoTransitionPage(
                child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      getIt<HomePageNavigationCubit>(param1: (String a) {}),
                ),
                BlocProvider(
                  create: (context) => getIt<PicturesCubit>(),
                ),
              ],
              child: HomePage(child: c),
            ));
          },
          routes: [
            GoRoute(
                path: "/a",
                pageBuilder: (context, GoRouterState b) {
                  return NoTransitionPage(child: Tab1());
                }),
            GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: "/b/:picture_id",
              pageBuilder: (context, GoRouterState b) => NoTransitionPage(
                child: BackButtonListener(
                    onBackButtonPressed: () async {
                      print("back button listener");
                      return true;
                    },
                    child: Tab2(
                      pictureId: b.params['picture_id'],
                    )),
              ),
            ),
            GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: "/b",
              pageBuilder: (context, GoRouterState b) => const NoTransitionPage(
                child: Placeholder(
                  color: Colors.blue,
                ),
              ),
            ),
            GoRoute(
              path: "/c",
              pageBuilder: (context, GoRouterState b) =>
                  const NoTransitionPage(child: Tab3()),
            ),
          ]),
    ],
  );
}
