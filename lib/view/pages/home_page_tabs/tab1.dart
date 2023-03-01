import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_architecture/view/cubits/pictures_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Tab1 extends StatelessWidget {
  Tab1({super.key}) {
    print("Tab 1 constructor");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.centerRight,
        children: [
          Image.asset("assets/images/yellow_background.jpg", fit: BoxFit.cover),
          Column(
            children: [
              BlocBuilder<PicturesCubit, PicturesState>(
                buildWhen: (prev, curr) => prev.pictures != curr.pictures,
                builder: (context, state) {
                  return Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(16.0),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent:
                              MediaQuery.of(context).size.width / 3,
                          childAspectRatio: 1,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1),
                      itemCount: (state.pictures ?? []).length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            print("Tapped in picture");
                            context
                                .push("/b/${(state.pictures ?? [])[index].id}");
                          },
                          behavior: HitTestBehavior.translucent,
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                    (state.pictures ?? [])[index].downloadUrl,
                                memCacheHeight: 150,
                                memCacheWidth: 150,
                              ),
                              Text(
                                "${(state.pictures ?? [])[index].author}\n${(state.pictures ?? [])[index].id}",
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: Colors.white,
                                    ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              SizedBox(
                height: 150,
                child: BlocBuilder<PicturesCubit, PicturesState>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        state.hasPrev == true
                            ? IconButton(
                                onPressed: () {
                                  context
                                      .read<PicturesCubit>()
                                      .onPreviousPageRequested();
                                },
                                icon: const Icon(Icons.chevron_left_outlined))
                            : const SizedBox.shrink(),
                        SizedBox(
                          width: 150,
                          child: TextField(
                            onSubmitted: (limit) {
                              int? intLimit = int.tryParse(limit);
                              if (intLimit != null) {
                                context
                                    .read<PicturesCubit>()
                                    .onLimitChanged(intLimit);
                              } else {
                                print("this should be an integer");
                              }
                            },
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                label: Text(
                              "pictures limit",
                            )),
                          ),
                        ),
                        Text("Current page ${state.pageNumber ?? 1}"),
                        state.hasNext == true
                            ? IconButton(
                                onPressed: () {
                                  context
                                      .read<PicturesCubit>()
                                      .onNextPageRequested();
                                },
                                icon: const Icon(Icons.chevron_right_outlined))
                            : const SizedBox.shrink(),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
