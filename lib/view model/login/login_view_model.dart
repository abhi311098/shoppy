import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppy/model/login/login_response_model.dart';
import 'package:shoppy/service/api_service.dart';
import 'package:shoppy/service/api_status.dart';
import 'package:shoppy/utils/api_collection.dart';
import 'package:shoppy/view/product/product_list.dart';

class LoginViewModel with ChangeNotifier {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  ApiError? _apiError;

  ApiError? get apiError => _apiError;

  LoginResponseModel? _loginResponseModel;

  LoginResponseModel? get loginResponseModel => _loginResponseModel;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  setLoginResponseModel(LoginResponseModel value, BuildContext context) async {
    _loginResponseModel = value;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("userName", _loginResponseModel?.username ?? "");
    preferences.setInt("userId", _loginResponseModel?.id ?? 0);
    preferences.setString("userToken", _loginResponseModel?.token ?? "");
    preferences.setString("userNameAndLast", "${_loginResponseModel?.firstName} ${_loginResponseModel?.lastName}");
    Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => ProductList())));
    notifyListeners();
  }

  setApiError(ApiError value) {
    _apiError = value;
    notifyListeners();
  }

  loginApiCall(context) async {
    setLoading(true);
    Map map = {};
    map['username'] = usernameController.text;
    map['password'] = passwordController.text;
    var response =
        await ApiService.apiPostCall(url: ApiCollection.LOGIN, body: map,);
    if (response is Success) {
      Object data = loginResponseModelFromJson(response.response.toString());
      setLoginResponseModel(data as LoginResponseModel, context);
    } else if(response is Failure){
      ApiError apiError = ApiError(response: response.response);
      setApiError(apiError);
    }
    setLoading(false);
  }
}
