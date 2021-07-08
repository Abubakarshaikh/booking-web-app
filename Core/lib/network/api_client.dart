import 'package:core/models/failure.dart';
// import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

// import 'package:dio/dio.dart';

class ApiBaseHelper {
  static final String url = 'http://35.209.18.171:8080';

  static BaseOptions opts = BaseOptions(
    baseUrl: url,
    responseType: ResponseType.json,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );

  static Dio createDio() {
    return Dio(opts);
  }

  static Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.add(
        InterceptorsWrapper(
            onRequest: (options, handlers) => requestInterceptor(options),
            onError: (e, handler) async {
              return e.response?.data;
            }),
      );
  }

  static dynamic requestInterceptor(RequestOptions options) async {
    // Get your JWT token
    const token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTYyNTI3MTE4NSwianRpIjoiZjc4MDY2ZGItNzdlZC00M2U0LThjZDQtYjY3OWVhOWVjNmQ0IiwidHlwZSI6ImFjY2VzcyIsInN1YiI6MSwibmJmIjoxNjI1MjcxMTg1LCJleHAiOjE2MjYxMzUxODV9.7sBB1bC4B5wTAj85Fzvt8IeMrupU2eJeU4eSHTpBr_Y';
    options.headers.addAll({"Authorization": "Bearer: $token"});
    return options;
  }

  static final dio = createDio();
  static final baseAPI = addInterceptors(dio);

  Future<Response> getHTTP(String url) async {
    try {
      Response response = await baseAPI.get(url);
      print(response.data);
      return response;
    } on DioError catch (e) {
      // Handle error
      return ServerFailure.create(e);
    }
  }

  // Future<Response> postHTTP(String url, dynamic data) async {
  //   try {
  //     Response response = await baseAPI.post(url, data: data);
  //     return response;
  //   } on DioError catch (e) {
  //     // Handle error
  //   }
  // }

  // Future<Response> putHTTP(String url, dynamic data) async {
  //   try {
  //     Response response = await baseAPI.put(url, data: data);
  //     return response;
  //   } on DioError catch (e) {
  //     // Handle error
  //   }
  // }

  // Future<Response> deleteHTTP(String url) async {
  //   try {
  //     Response response = await baseAPI.delete(url);
  //     return response;
  //   } on DioError catch (e) {
  //     // Handle error
  //   }
  // }
}

// class ApiClient {
//   static final String url = 'http://35.209.18.171:8080';

//   static BaseOptions opts = BaseOptions(
//     baseUrl: url,
//     responseType: ResponseType.json,
//     connectTimeout: 30000,
//     receiveTimeout: 30000,
//   );

//   static Dio createDio() {
//     return Dio(opts);
//   }

//   static Dio addInterceptors(Dio dio) {
//     return dio
//       ..interceptors.add(
//         InterceptorsWrapper(
//             onRequest: (options, handlers) => requestInterceptor(options),
//             onError: (e, handler) async {
//               return e.response?.data;
//             }),
//       );
//   }

//   static dynamic requestInterceptor(RequestOptions options) async {
//     // Get your JWT token
//     const token =
//         'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTYyNTI3MTE4NSwianRpIjoiZjc4MDY2ZGItNzdlZC00M2U0LThjZDQtYjY3OWVhOWVjNmQ0IiwidHlwZSI6ImFjY2VzcyIsInN1YiI6MSwibmJmIjoxNjI1MjcxMTg1LCJleHAiOjE2MjYxMzUxODV9.7sBB1bC4B5wTAj85Fzvt8IeMrupU2eJeU4eSHTpBr_Y';
//     options.headers.addAll({"Authorization": "Bearer: $token"});
//     return options;
//   }

//   static final dio = createDio();
//   static final baseAPI = addInterceptors(dio);

//   Future<Either<Failure, Response?>> get(String url) async {
//     try {
//       Response response = await baseAPI.get(url);
//       return Right(response);
//     } on DioError catch (e) {
//       // Handle error
//       return Left(ServerFailure.create(e));
//     }
//   }

//   Future<Either<Failure, Response?>> post(String url, dynamic data) async {
//     try {
//       Response response = await baseAPI.post(url, data: data);
//       return Right(response);
//     } on DioError catch (e) {
//       // Handle error
//       return Left(ServerFailure.create(e));
//     }
//   }

//   Future<Either<Failure, Response?>> put(String url, dynamic data) async {
//     try {
//       Response response = await baseAPI.put(url, data: data);
//       return Right(response);
//     } on DioError catch (e) {
//       // Handle error
//       return Left(ServerFailure.create(e));
//     }
//   }

//   Future<Either<Failure, Response?>> delete(String url) async {
//     try {
//       Response response = await baseAPI.delete(url);
//       return Right(response);
//     } on DioError catch (e) {
//       // Handle error
//       return Left(ServerFailure.create(e));
//     }
//   }
// }
