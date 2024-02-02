import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fulltimeforce_challenge/home/bloc/home_bloc.dart';
import 'package:fulltimeforce_challenge/home/widgets/custom_bottom_nav_bar.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        githubRepository: context.read<GithubRepository>(),
      )..add(LoadDataEvent()),
      child: HomeView(navigationShell: navigationShell),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: navigationShell,
      ),
      bottomNavigationBar: CustomBottomNavBar(navigationShell: navigationShell),
      extendBody: true,
    );
  }
}
