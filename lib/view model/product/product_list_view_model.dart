import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppy/model/login/login_response_model.dart';
import 'package:shoppy/model/product/product_list_response_model.dart';
import 'package:shoppy/service/api_service.dart';
import 'package:shoppy/service/api_status.dart';
import 'package:shoppy/utils/api_collection.dart';
import 'package:shoppy/view/product/product_list.dart';

class ProductListViewModel with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  ApiError? _apiError;

  ApiError? get apiError => _apiError;

  ProductListResponseModel? _productListResponseModel;

  ProductListResponseModel? get productListResponseModel =>
      _productListResponseModel;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  setProductListResponseModel(ProductListResponseModel value) {
    _productListResponseModel = value;
    notifyListeners();
  }

  setApiError(ApiError value) {
    _apiError = value;
    notifyListeners();
  }

  productListApiCall() async {
    setLoading(true);
    var response = await ApiService.apiGetCall(
      url: ApiCollection.PRODUCT_LIST,
    );
    if (response is Success) {
      Object data = productListResponseModelFromJson(response.response.toString());
      setProductListResponseModel(data as ProductListResponseModel);
    } else if (response is Failure) {
      ApiError apiError = ApiError(response: response.response);
      setApiError(apiError);
    }
    setLoading(false);
  }
}
