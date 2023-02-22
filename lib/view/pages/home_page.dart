import 'package:clean_architecture/view/cubits/pictures_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PicturesCubit, PicturesState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BlocConsumer<PicturesCubit, PicturesState>(
            listener: (context, state) {
              handleIndexChanged(state.pageIndex, context);
            },
            builder: (context, state) {
              return NavigationBar(
                selectedIndex: state.pageIndex,
                onDestinationSelected: (destination) {
                  context.read<PicturesCubit>().onPageIndexChanged(destination);
                },
                destinations: const [
                  NavigationDestination(
                      icon: Icon(Icons.dangerous), label: 'label 1'),
                  NavigationDestination(
                      icon: Icon(Icons.delete_forever), label: 'label 2'),
                  NavigationDestination(
                      icon: Icon(Icons.group_add_sharp), label: 'label 3'),
                ],
              );
            },
          ),
          body: child,
        );
      },
    );
  }

  void handleIndexChanged(int pageIndex, BuildContext context) {
     switch (pageIndex) {
      case 0:
        context.push("/a");
        break;
      case 1:
        context.push("/b");
        break;
      case 2:
        context.push("/c");
        break;
      default:
        context.push("/a");
        break;
    }
  }
}
