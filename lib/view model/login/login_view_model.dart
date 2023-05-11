import 'package:flutter/cupertino.dart';
import 'package:shoppy/model/login/login_response_model.dart';
import 'package:shoppy/service/api_service.dart';
import 'package:shoppy/service/api_status.dart';
import 'package:shoppy/utils/api_collection.dart';

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

  setLoginResponseModel(LoginResponseModel value) {
    _loginResponseModel = value;
    notifyListeners();
  }

  setApiError(ApiError value) {
    _apiError = value;
    notifyListeners();
  }

  loginApiCall() async {
    setLoading(true);
    Map map = {};
    map['username'] = usernameController.text;
    map['password'] = passwordController.text;
    var response =
        await ApiService.apiPostCall(url: ApiCollection.LOGIN, body: map,);
    if (response is Success) {
      Object data = loginResponseModelFromJson(response as String);
      setLoginResponseModel(data as LoginResponseModel);
    } else if(response is Failure){
      ApiError apiError = ApiError(response: response.response);
      setApiError(apiError);
    }
    setLoading(false);
  }
}
