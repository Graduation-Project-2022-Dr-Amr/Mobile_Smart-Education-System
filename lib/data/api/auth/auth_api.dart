import 'package:dio/dio.dart';
import 'package:smart_education/data/api/api_constants.dart';
import 'package:smart_education/data/api/dio_helper.dart';

class AuthApi {
  DioHelper dioHelper = DioHelper();

  Future login(LoginData data) async {
    try {
      final Response response = await dioHelper.dio.post(ApiConstants.loginRoute, data: data.toJson());
      return response.data;
    } on DioError catch (e) {
      print("Dio Error ${e.toString()}");
    }catch (err) {
      print('Error in Login $err');
    }
  }


  Future register(RegisterData data) async {
    try {
      final Response response = await dioHelper.dio.post(dioHelper.formatPath(ApiConstants.registerRoute), data: data.toJson());
      return response.data;
    } on DioError catch (e) {
      print(e.message);
    }catch (err) {
      print('Error in Register $err');
    }
  }
}

class LoginData {
  final String username;
  final String password;

  LoginData(this.username, this.password);

  toJson() => {'username': username, 'password': password};
}


class RegisterData {
  final String password;
  final String password_confirm;
  final String email;
  final String username;
  final String name;

  RegisterData(this.password, this.password_confirm, this.email, this.username, this.name);

  toJson() => {'login': this.email,
    'password': this.password};
}

