import 'package:clean_architecture/view/cubits/home_page_navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HomePageNavigationCubit, HomePageNavigationState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar:
              NavigationBar(
                selectedIndex: _getIndexBasedOnLocation(GoRouter.of(context).location),
                onDestinationSelected: (destination) {
                  switch (destination) {
                    case 0:
                      context.push("/a");
                      break;
                    case 1:
                      context.push("/b");
                      break;
                    case 2:
                      context.push("/c");
                      break;
                  }
                },
                destinations: const [
                  NavigationDestination(
                      icon: Icon(Icons.grid_view), label: 'Picture Grid'),
                  NavigationDestination(
                      icon: Icon(Icons.delete_forever),
                      label: 'Pic details'),
                  NavigationDestination(
                      icon: Icon(Icons.group_add_sharp), label: 'label 3'),
                ],
              ),
          body: child,
        );
      },
    );
  }

  void handleIndexChanged(int pageIndex, BuildContext context) {
    print("handling page index $pageIndex");
    switch (pageIndex) {
      case 0:
        context.go("/a");
        break;
      case 1:
        if (context.read<HomePageNavigationCubit>().state.selectedItemId ==
            null) {
          context.go("/b");
        } else {
          context.go(
              "/b/${context.read<HomePageNavigationCubit>().state.selectedItemId}");
        }
        break;
      case 2:
        context.go("/c");
        break;
      default:
        context.push("/a");
        break;
    }
  }

  int _getIndexBasedOnLocation(String location) {
    if (location.startsWith("/b")) {
      return 1;
    }

    if (location.startsWith("/a")) {
      return 0;
    }

    if (location.startsWith("/c")) {
      return 2;
    }

    return 0;
  }
}
