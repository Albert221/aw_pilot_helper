import 'package:aw_pilot_helper/app.dart';
import 'package:aw_pilot_helper/data/api/api_client.dart';
import 'package:aw_pilot_helper/data/entry_repository.dart';
import 'package:aw_pilot_helper/data/plane_specification_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'screens/previous_entries/bloc/previous_entries_cubit.dart';

const _apiUrl = 'http://localhost:1337/api';
const _apiToken =
    '063ec42189b26037bb64a34d97a18092c7454af099335581725274c2ec201e9c198524a5a164bb355733790827d029a5c6ab2113e4168daad52af1f1c263f08169d40bfd1878fd5816174d2d15499292de3d48bf559e79feffec988490828f1102938320ea1354ec15cf050ab112403fef8d637447325aad37c69bc9bc204e77';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<ApiClient>(
          create: (context) => ApiClient(
            Dio(
              BaseOptions(
                headers: <String, String>{
                  'Authorization': 'Bearer $_apiToken',
                },
              ),
            ),
            baseUrl: _apiUrl,
          ),
        ),
        Provider<EntryRepository>(
          create: (context) => EntryRepository(),
          dispose: (context, repository) => repository.dispose(),
        ),
        Provider<PlaneSpecificationRepository>(
          create: (context) =>
              PlaneSpecificationRepository(context.read())..update(),
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
