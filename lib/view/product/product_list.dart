import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shoppy/view%20model/product/product_list_view_model.dart';
import 'package:shoppy/widgets/circular_loader.dart';
import 'package:shoppy/widgets/gap.dart';
import 'package:shoppy/widgets/text_design.dart';

import '../../utils/app_color.dart';

class ProductList extends StatefulWidget {
  ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late ProductListViewModel _productListViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productListViewModel =
        Provider.of<ProductListViewModel>(context, listen: false);
    _productListViewModel.productListApiCall();
  }

  Widget listDesign({String? title}) {
    return Container(
      child: TextDesign(
        text: title,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: AppColor.PRIMARY_COLOR,
        title: TextDesign(
          text: "Product List",
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: AppColor.WHITE_COLOR,
        ),
      ),
      body: Consumer<ProductListViewModel>(
        builder: (context, provider, child) {
          return provider.isLoading
              ? const CircularLoader()
              : ListView.separated(
                  itemBuilder: (context, index) => listDesign(
                      title: provider
                          .productListResponseModel?.products?[index].title),
                  separatorBuilder: (context, index) => const VerticalGap(),
                  itemCount:
                      provider.productListResponseModel?.products?.length ?? 0,
                );
        },
      ),
    );
  }
}
