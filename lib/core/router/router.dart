import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_search_day51/data/repository/pixabay_repository.dart';
import 'package:image_search_day51/domain/model/photo.dart';
import 'package:image_search_day51/domain/use_case/get_top_five_most_viewd_use_case.dart';
import 'package:image_search_day51/presentation/detail/detail_screeen.dart';
import 'package:image_search_day51/presentation/main/main_screen.dart';
import 'package:image_search_day51/presentation/main/main_view_model.dart';
import 'package:provider/provider.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return ChangeNotifierProvider(
          create: (_) => MainViewModel(
            GetTopFiveMostViewdImagesUseCase(
              PixabayPhotoRepositoryImpl(),
            ),
          ),
          child: const MainScreen(),
        );
      },
    ),
  ],
);
