import 'package:aw_pilot_helper/screens/about/about_screen.dart';
import 'package:aw_pilot_helper/screens/entry/entry_screen.dart';
import 'package:aw_pilot_helper/screens/home/bloc/planes_cubit.dart';
import 'package:aw_pilot_helper/screens/previous_entries/previous_entries_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenRoute extends MaterialPageRoute<void> {
  HomeScreenRoute()
      : super(
          builder: (context) => BlocProvider<PlanesCubit>(
            create: (context) => PlanesCubit(context.read()),
            child: const HomeScreen(),
          ),
        );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final planesState = context.watch<PlanesCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('AW Pomocnik Pilota'),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: PreviousEntriesTile(),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text('O aplikacji'),
              onTap: () => Navigator.of(context).push(AboutScreenRoute()),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          ...planesState.when(
            initial: () => [],
            loadInProgress: () => [
              const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            ],
            loadFailure: () => [],
            loadSuccess: (planes) => [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Nowy wpis',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final plane = planes[index];

                    return ListTile(
                      leading: const Icon(Icons.add),
                      title: Text(plane.name),
                      subtitle: Text(plane.type),
                      onTap: () => Navigator.of(context).push(
                        EntryScreenRoute.create(plane),
                      ),
                    );
                  },
                  childCount: planes.length,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
