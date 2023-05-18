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

  Widget listDesign(
      {String? image,
      String? title,
      String? discountPercentage,
      String? price,
      String? rating,
      String? stocks,
      }) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColor.WHITE_COLOR,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: const [
          BoxShadow(
            blurRadius: 3,
            offset: Offset(0, 0),
            color: AppColor.PRIMARY_COLOR,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(flex: 3, child: Image.network(image!)),
          HorizontalGap(
            gap: 20.w,
          ),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextDesign(
                  text: title,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColor.TEXT_COLOR,
                ),
                VerticalGap(gap: 10.h,),
                Row(
                  children: [
                    TextDesign(
                      text: "\$$price",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColor.TEXT_COLOR,
                    ),
                    TextDesign(
                      text: " (-$discountPercentage)",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColor.TEXT_COLOR,
                    ),
                  ],
                ),

                VerticalGap(gap: 10.h,),
                Wrap(
                  children: [
                    TextDesign(
                      text: "Rating $rating",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColor.TEXT_COLOR,
                    ),
                    HorizontalGap(gap: 10.w,),
                    TextDesign(
                      text: "Stock ($stocks)",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColor.TEXT_COLOR,
                    ),
                  ],
                ),

              ],
            ),
          ),
        ],
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
                  padding: EdgeInsets.all(20.w),
                  itemBuilder: (context, index) => listDesign(
                    title: provider
                        .productListResponseModel?.products?[index].title,
                    image: provider
                        .productListResponseModel?.products?[index].thumbnail,
                    rating: provider
                        .productListResponseModel?.products?[index].rating
                        .toString(),
                    discountPercentage: provider.productListResponseModel
                        ?.products?[index].discountPercentage
                        .toString(),
                    price: provider
                        .productListResponseModel?.products?[index].price
                        .toString(),
                    stocks: provider
                        .productListResponseModel?.products?[index].stock
                        .toString(),
                  ),
                  separatorBuilder: (context, index) => VerticalGap(
                    gap: 20.h,
                  ),
                  itemCount:
                      provider.productListResponseModel?.products?.length ?? 0,
                );
        },
      ),
    );
  }
}
