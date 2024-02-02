import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fulltimeforce_challenge/commits/widgets/commit_card.dart';
import 'package:fulltimeforce_challenge/commits/widgets/loading_view.dart';
import 'package:fulltimeforce_challenge/home/bloc/home_bloc.dart';
import 'package:fulltimeforce_challenge/l10n/l10n.dart';

import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class CommitsPage extends StatelessWidget {
  const CommitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.commitAppBarTitle),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const LoadingView();
          }
          if (state is HomeSuccess) {
            return state.commits.isNotEmpty
                ? SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: StackedCardCarousel(
                      type: StackedCardCarouselType.fadeOutStack,
                      spaceBetweenItems: 125,
                      initialOffset: 20,
                      items: state.commits
                          .map(
                            (commit) => CommitCard(
                              title: commit.authorLogin,
                              subtitle: commit.message,
                              imageUrl: commit.avatarUrl,
                              date: commit.date,
                            ),
                          )
                          .toList(),
                    ),
                  )
                : Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.sentiment_dissatisfied,
                            color: Colors.blue,
                          ),
                          SizedBox(height: 8),
                          Text('No commits to show'),
                        ],
                      ),
                    ),
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
    );
  }
}
