# shope_app_flutter

Shopp is An E-Commerce  application that is a convenient and user-friendly platform that allows users to effortlessly purchase a wide range of products, including shoes, smartwatches, TVs, and more. With a simple and intuitive interface, users can browse through an extensive catalog, explore various product options, and make secure purchase

## Screenshots

  WelocmePage                 |   SignInPage        |  SignUpPage |   SignUpPage 2                 |   HomePage        |  DetailedProductPage
:-------------------------:|:-------------------------:|:-------------------------: | :-------------------------:|:-------------------------:|:-------------------------:
![](https://firebasestorage.googleapis.com/v0/b/shopappflutter-73fe5.appspot.com/o/Screen%2FScreenshot_20230516-143552.jpg?alt=media&token=c482b0ca-b392-4f41-b5ce-6bff7f615ba1)|![](https://firebasestorage.googleapis.com/v0/b/shopappflutter-73fe5.appspot.com/o/Screen%2FScreenshot_20230516-143617.jpg?alt=media&token=aba0e7c6-627e-43f1-ba73-b403d2528f28)|![](https://firebasestorage.googleapis.com/v0/b/shopappflutter-73fe5.appspot.com/o/Screen%2FScreenshot_20230516-143810.jpg?alt=media&token=4756a256-8e9f-40bc-b0dd-bb14515730a8) | ![](https://firebasestorage.googleapis.com/v0/b/shopappflutter-73fe5.appspot.com/o/Screen%2FScreenshot_20230516-143852.jpg?alt=media&token=7eef92c4-f8cd-4db5-9448-227bf3172970)|![](https://firebasestorage.googleapis.com/v0/b/shopappflutter-73fe5.appspot.com/o/Screen%2FScreenshot_20230516-144127.jpg?alt=media&token=9c506f18-a97b-44e7-b13e-9a6f5b79ff2d)|![](https://firebasestorage.googleapis.com/v0/b/shopappflutter-73fe5.appspot.com/o/Screen%2FScreenshot_20230516-144207.jpg?alt=media&token=3a1b9328-2fe7-451e-812f-2be964fb9542) 

## Table 2
EmptyProductPage         |   CartePage1     |  CartePage2  |  SavingOrderPage1 |   SavingOrderPage2   |  SavingOrderPage3 
:-------------------------:|:-------------------------:|:-------------------------: | :-------------------------:|:-------------------------:|:-------------------------:
![](https://firebasestorage.googleapis.com/v0/b/shopappflutter-73fe5.appspot.com/o/Screen%2FScreenshot_20230516-144151.jpg?alt=media&token=860dddab-4ef6-4bc6-9767-416dddf91b82)|![](https://firebasestorage.googleapis.com/v0/b/shopappflutter-73fe5.appspot.com/o/Screen%2FScreenshot_20230516-144232.jpg?alt=media&token=5391f16c-e81b-467a-9f81-61edf8ac3f5e)|![](https://firebasestorage.googleapis.com/v0/b/shopappflutter-73fe5.appspot.com/o/Screen%2FScreenshot_20230516-144242.jpg?alt=media&token=3d10d75e-2a42-403b-b19a-766470d7007e) | ![](https://firebasestorage.googleapis.com/v0/b/shopappflutter-73fe5.appspot.com/o/Screen%2FScreenshot_20230516-144255.jpg?alt=media&token=10acc7fd-11bf-450a-9102-89dd18c171d4)|![](https://firebasestorage.googleapis.com/v0/b/shopappflutter-73fe5.appspot.com/o/Screen%2FScreenshot_20230516-144437.jpg?alt=media&token=759a4768-934f-4028-aa4c-6130ad7658a5)|![](https://firebasestorage.googleapis.com/v0/b/shopappflutter-73fe5.appspot.com/o/Screen%2FScreenshot_20230516-144500.jpg?alt=media&token=a212664a-fa6d-4429-acef-98797137bf19)
## Table 3
ProfilPage         |   UserInfoPage     |  OrderPage  |  DetailedOrderPage |   NoConnectionPage |
:-------------------------:|:-------------------------:|:-------------------------: | :-------------------------:| :-------------------------:|
![](https://firebasestorage.googleapis.com/v0/b/shopappflutter-73fe5.appspot.com/o/Screen%2FScreenshot_20230516-144514.jpg?alt=media&token=e81d780b-e94a-4313-b50b-b4b5b5fd751c)|![](https://firebasestorage.googleapis.com/v0/b/shopappflutter-73fe5.appspot.com/o/Screen%2FScreenshot_20230516-144642.jpg?alt=media&token=008c5a93-3a50-426e-85be-baeb49161bbc)|![](https://firebasestorage.googleapis.com/v0/b/shopappflutter-73fe5.appspot.com/o/Screen%2FScreenshot_20230516-144642.jpg?alt=media&token=008c5a93-3a50-426e-85be-baeb49161bbc) | ![](https://firebasestorage.googleapis.com/v0/b/shopappflutter-73fe5.appspot.com/o/Screen%2FScreenshot_20230516-144658.jpg?alt=media&token=0b1bfe1c-17df-4a43-a301-dbc7f86d9d2c)|![](https://firebasestorage.googleapis.com/v0/b/shopappflutter-73fe5.appspot.com/o/Screen%2FScreenshot_20230517-095714.jpg?alt=media&token=e2f1f6a1-8819-4a60-87e9-f5e5f2a745a9) 

## Directory Structure
```
lib
│───constant.dart
│───main.dart
└───core
│    │───service
│    |    │──local
│    |    |   └──local_carte.dart
│    |    |──remote
│    |        │──auth_service.dart
│    |        │──checkout_service.dart
│    |        │──firestore_user.dart
│    |        └──home_service.dart     
│    |───view_model
│    |    │──auth_view_model.dart
│    |    │──checkout_view_model.dart
│    |    │──control_view_model.dart
│    |    │──controller.dart
│    |    │──home_view_model.dart
│    |    │──profil_view_model.dart
│    |    └──select_image_view_model.dart     
│    |───network_viewmodel.dart
└───extension
│    │──color_extension.dart
│    │──string_extension.dart
└───helper
│    │──binding.dart
└───model
│    │──category_model.dart
│    │──current_adress.dart
│    │──order_model.dart
│    │──product_model.dart
│    │──product_model.g.dart
│    └──user_model.dart   
└───view
│    │──cart
│    │   └──carte_view.dart   
│    │──category
│    │   └──category_grid_view.dart
│    │ 
│    │──checkout 
│    │   │──widgets
│    │       │──adress_view.dart
│    │       │──delivery_time.dart
│    │       └──summary.dart 
│    └────check_out_view.dart
│    │ 
│    │──details
│    │   └──details_view.dart
│    │ 
│    │──home
│    │   │──component
│    │   │   │──category_view.dart
│    │   │   │──product_view.dart
│    │   │   └──search_text_form_field.dart 
│    │   └──home_view.dart
│    │ 
│    │──login    
│    │    │──widgets
│    │    │   │──custtom_button.dart
│    │    │   │──custtom_button_social.dart
│    │    │   │──custtom_text.dart
│    │    │   │──custtom_text_form_field.dart
│    │    │   └──summary.dart 
│    │    │──login_view.dart   
│    │    └──register_view.dart
│    │ 
│    │──oder_history
│    │   │──widgets
│    │   │   └──order_detailed.dart
│    │   └──order_history_view.dart
│    │ 
│    │─profile   
│    │  │──widgets 
│    │  │   │──cards_view.dart 
│    │  │   │──edite_profile_view.dart
│    │  │   └──notifications_view.dart
│    │  └──profile_view.dart
│    │
│    │
│    └──welcome_page_view.dart 
│
│
│
│
## Pull Requests

I welcome and encourage all pull requests. It usually will take me within 24-48 hours to respond to any issue or request.

## Flutter projects
 Project Name        |Stars        
:-------------------------|-------------------------
[Twitter clone](https://github.com/TheAlphamerc/flutter_twitter_clone)| [![GitHub stars](https://img.shields.io/github/stars/Thealphamerc/flutter_twitter_clone?style=social)](https://github.com/login?return_to=%2FTheAlphamerc%flutter_twitter_clone)
|[Healthcare App](https://github.com/TheAlphamerc/flutter_healthcare_app) |[![GitHub stars](https://img.shields.io/github/stars/Thealphamerc/flutter_healthcare_app?style=social)](https://github.com/login?return_to=%2FTheAlphamerc%flutter_healthcare_app)
|[Smart course](https://github.com/TheAlphamerc/flutter_smart_course) |[![GitHub stars](https://img.shields.io/github/stars/Thealphamerc/flutter_smart_course?style=social)](https://github.com/login?return_to=%2FTheAlphamerc%flutter_smart_course)
|[Pokedex](https://github.com/TheAlphamerc/flutter_pokedex)|[![GitHub stars](https://img.shields.io/github/stars/Thealphamerc/flutter_pokedex?style=social)](https://github.com/login?return_to=%2FTheAlphamerc%flutter_pokedex)
|[Authentication](https://github.com/TheAlphamerc/flutter_login_signup)|[![GitHub stars](https://img.shields.io/github/stars/Thealphamerc/flutter_login_signup?style=social)](https://github.com/login?return_to=%2FTheAlphamerc%flutter_login_signup)
|[Wallet App](https://github.com/TheAlphamerc/flutter_wallet_app)|[![GitHub stars](https://img.shields.io/github/stars/Thealphamerc/flutter_wallet_app?style=social)](https://github.com/login?return_to=%2FTheAlphamerc%flutter_wallet_app)
|[News App](https://github.com/TheAlphamerc/flutter_news_app)|[![GitHub stars](https://img.shields.io/github/stars/Thealphamerc/flutter_news_app?style=social)](https://github.com/login?return_to=%2FTheAlphamerc%flutter_news_app)
|[Watch App](https://github.com/TheAlphamerc/flutter_SoftUI_watchApp)|[![GitHub stars](https://img.shields.io/github/stars/Thealphamerc/flutter_SoftUI_watchApp?style=social)](https://github.com/login?return_to=%2FTheAlphamerc%flutter_SoftUI_watchApp)
|[Smart Home App](https://github.com/TheAlphamerc/flutter_smart_home_app)|[![GitHub stars](https://img.shields.io/github/stars/Thealphamerc/flutter_smart_home_app?style=social)](https://github.com/login?return_to=%2FTheAlphamerc%flutter_smart_home_app)
|[Yatch Booking App](https://github.com/TheAlphamerc/flutter_yatch_booking)|[![GitHub stars](https://img.shields.io/github/stars/Thealphamerc/flutter_yatch_booking?style=social)](https://github.com/login?return_to=%2FTheAlphamerc%flutter_yatch_booking)

## Flutter plugins
Plugin Name        | Stars        
:-------------------------|-------------------------
|[Empty widget](https://github.com/TheAlphamerc/empty_widget) |[![GitHub stars](https://img.shields.io/github/stars/Thealphamerc/empty_widget?style=social)](https://github.com/login?return_to=%2FTheAlphamerc%empty_widget)
|[Add Thumbnail](https://github.com/TheAlphamerc/flutter_plugin_add_thumbnail) |[![GitHub stars](https://img.shields.io/github/stars/Thealphamerc/flutter_plugin_add_thumbnail?style=social)](https://github.com/login?return_to=%2FTheAlphamerc%flutter_plugin_add_thumbnail)
|[Filter List](https://github.com/TheAlphamerc/flutter_plugin_filter_list)| [![GitHub stars](https://img.shields.io/github/stars/Thealphamerc/flutter_plugin_filter_list?style=social)](https://github.com/login?return_to=%2FTheAlphamerc%flutter_plugin_filter_list)

## Created & Maintained By

[Sonu Sharma](https://github.com/TheAlphamerc) ([Twitter](https://www.twitter.com/TheAlphamerc)) ([Youtube](https://www.youtube.com/user/sonusharma045sonu/)) ([Insta](https://www.instagram.com/_sonu_sharma__)) ([Dev.to](https://dev.to/thealphamerc))
  ![Twitter Follow](https://img.shields.io/twitter/follow/thealphamerc?style=social) 


> If you found this project helpful or you learned something from the source code and want to thank me, consider buying me a cup of :coffee:
>
> * [PayPal](https://www.paypal.me/TheAlphamerc/)

> You can also nominate me for Github Star developer program
> https://stars.github.com/nominate

## Visitors Count

<img align="left" src = "https://profile-counter.glitch.me/flutter_ecommerce_app/count.svg" alt ="Loading">
