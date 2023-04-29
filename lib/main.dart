import 'package:aw_pilot_helper/app.dart';
import 'package:aw_pilot_helper/data/api/api_client.dart';
import 'package:aw_pilot_helper/data/entry_repository.dart';
import 'package:aw_pilot_helper/data/plane_specification_repository.dart';
import 'package:aw_pilot_helper/data/storage/entry_storage.dart';
import 'package:aw_pilot_helper/data/storage/plane_specification_storage.dart';
import 'package:aw_pilot_helper/screens/previous_entries/bloc/previous_entries_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

const _apiUrl = String.fromEnvironment('API_URL');
const _apiToken = String.fromEnvironment('API_TOKEN');

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
                connectTimeout: const Duration(seconds: 5),
                receiveTimeout: const Duration(seconds: 5),
                sendTimeout: const Duration(seconds: 5),
              ),
            ),
            baseUrl: _apiUrl,
          ),
        ),
        Provider<EntryStorage>(create: (context) => EntryStorage()),
        Provider<PlaneSpecificationStorage>(
          create: (context) => PlaneSpecificationStorage(),
        ),
        Provider<EntryRepository>(
          create: (context) => EntryRepository(context.read()),
          dispose: (context, repository) => repository.dispose(),
        ),
        Provider<PlaneSpecificationRepository>(
          create: (context) => PlaneSpecificationRepository(
            context.read(),
            context.read(),
          )..update(),
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
