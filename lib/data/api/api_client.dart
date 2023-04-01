import 'package:aw_pilot_helper/data/api/response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/planes?populate=fuelTanks,weights')
  Future<PaginatedDataPlaneSpecification> getPlaneSpecifications({
    @Query('pagination[page]') required int page,
    @Query('pagination[pageSize]') int pageSize = 25,
  });
}
