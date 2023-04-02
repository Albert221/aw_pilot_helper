import 'package:aw_pilot_helper/app.dart';
import 'package:aw_pilot_helper/data/api/api_client.dart';
import 'package:aw_pilot_helper/data/entry_repository.dart';
import 'package:aw_pilot_helper/data/plane_specification_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'screens/previous_entries/bloc/previous_entries_cubit.dart';

const _apiUrl = 'https://aw-pilot-helper.herokuapp.com/api';
const _apiToken =
    'secret';

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
