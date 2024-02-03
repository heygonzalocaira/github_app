import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fulltimeforce_challenge/home/bloc/home_bloc.dart';
import 'package:fulltimeforce_challenge/l10n/l10n.dart';
import 'package:fulltimeforce_challenge/profile/profile.dart';
import 'package:fulltimeforce_challenge/utils/widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.profileAppBarTitle),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const LoadingProfile();
              }
              if (state is HomeSuccess) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 64),
                    SizedBox(
                      width: 160,
                      height: 160,
                      child: ClipOval(
                        key: const Key('Circle Profile'),
                        child: Image.network(
                          state.commits.first.avatarUrl,
                          loadingBuilder: (
                            BuildContext context,
                            Widget child,
                            ImageChunkEvent? loadingProgress,
                          ) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return const ShimmerCircle(radius: 80);
                            }
                          },
                          errorBuilder: (
                            BuildContext context,
                            Object error,
                            StackTrace? stackTrace,
                          ) {
                            return const Center(
                              child: Icon(
                                Icons.error,
                                color: Colors.red,
                                size: 40,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ProfileCard(
                      title: l10n.authorText,
                      subtitle: state.commits.first.authorName,
                    ),
                    ProfileCard(
                      title: l10n.gmailText,
                      subtitle: state.commits.first.email,
                    ),
                    ProfileCard(
                      title: l10n.githubUserText,
                      subtitle: state.commits.first.authorLogin,
                    ),
                  ],
                );
              }
              if (state is HomeError) {
                return Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.error, color: Colors.red),
                        const SizedBox(height: 8),
                        Text(state.errorMessage),
                      ],
                    ),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
