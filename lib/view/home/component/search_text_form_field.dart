
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shope_app_flutter/core/view_model/controller.dart';

class SearchTextFormField extends StatelessWidget {
  const SearchTextFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      shadowColor: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade100,
        ),
        child: Obx(() => TextField(
          autofocus: false,
          controller: homeViewModel.searchTextEditController,
          onSubmitted: (val) {
           // productController.getProductByName(keyword: val);
            controlViewModel.changeSelectedValue(1);
          },
          onChanged: (val) {
            homeViewModel.searchVal.value = val;
          },
          decoration: InputDecoration(
              suffixIcon: homeViewModel.searchVal.value.isNotEmpty
                  ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  FocusScope.of(context)
                      .requestFocus(FocusNode());
                  homeViewModel.searchTextEditController
                      .clear();
                  homeViewModel.searchVal.value = '';
               //   productController.getProducts();
                },
              )
                  : null,
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14, vertical: 16),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none),
              hintText: "Search...",
              prefixIcon: const Icon(Icons.search)),
        )),
      ),
    );

  }
}
