import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_search_22day/data/repository/pixabay_photo_repository_impl.dart';
import 'package:image_search_22day/domain/model/photo.dart';
import 'package:image_search_22day/domain/use_case/get_top_five_viewed_photo_use_case.dart';
import 'package:image_search_22day/presentation/detail/detail_screen.dart';
import 'package:image_search_22day/presentation/main/main_screen.dart';
import 'package:image_search_22day/presentation/main/main_view_model.dart';
import 'package:provider/provider.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return ChangeNotifierProvider(
          create: (_) => MainViewModel(
            GetTopFiveViewedPhotoUseCase(
              PixabayPhotoRepositoryImpl(),
            ),
          ),
          child: const MainScreen(),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'detail',
          builder: (BuildContext context, GoRouterState state) {
            final photo = state.extra as Photo;
            return DetailScreen(photo: photo);
          },
        ),
      ],
    ),
  ],
);
