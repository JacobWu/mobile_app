import 'package:dio/dio.dart';
import 'dart:async';

class HttpUtils {

  /// global dio object
  static Dio dio;

  /// default options
  static const String API_PREFIX = 'http://172.17.105.33:5050/api/';
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 3000;


  /// 生成Dio实例
  static Dio getInstance() {
    if (dio == null) {
      //通过传递一个 `BaseOptions`来创建dio实例
      var options = BaseOptions(
          baseUrl: API_PREFIX,
          connectTimeout: CONNECT_TIMEOUT,
          receiveTimeout: RECEIVE_TIMEOUT);
      dio = new Dio(options);
    }
    return dio;
  }

  /// http request methods
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  /// request method
  static Future<Map> request (
      String url,
      { data, method }) async {

    data = data ?? {};
    method = method ?? 'GET';

    /// restful 请求处理
    data.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });

    /// 打印请求相关信息：请求地址、请求方式、请求参数
    print('请求地址：【' + method + '  ' + url + '】');
    print('请求参数：' + data.toString());

    Dio dio = getInstance();
    var res;
    if (method == "get") {
      // get
      var response = await dio.get(url);
      res = response.data;
    } else {
      // post
      var response = await dio.post(url, data: data);
      res = response.data;
    }
    return res;
  }
//    var result;
//
//    try {
//      Response response = await dio.request(url, data: data, options: new Options(method: method));
//
//      result = response.data;
//
//      /// 打印响应相关信息
//      print('响应数据：' + response.toString());
//    } on DioError catch (e) {
//      /// 打印请求失败相关信息
//      print('请求出错：' + e.toString());
//    }
//
//    return result;
//  }


  /// get
  static Future<Map> get(url, data) => request(url, data: data);

  /// post
  static Future<Map> post(url, data) =>
      request(url, data: data, method: "post");


  /// 清空 dio 对象
  static clear () {
    dio = null;
  }

}