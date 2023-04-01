import 'package:aw_pilot_helper/app.dart';
import 'package:aw_pilot_helper/data/entry_repository.dart';
import 'package:aw_pilot_helper/data/plane_specification_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'screens/previous_entries/bloc/previous_entries_cubit.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<EntryRepository>(
          create: (context) => EntryRepository(),
          dispose: (context, repository) => repository.dispose(),
        ),
        Provider<PlaneSpecificationRepository>(
          create: (context) => PlaneSpecificationRepository(),
          dispose: (context, repository) => repository.dispose(),
        ),
        BlocProvider(
          create: (context) => PreviousEntriesCubit(context.read()),
        ),
      ],
      child: const AWHelperApp(),
    ),
  );
}
