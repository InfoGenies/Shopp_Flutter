# shope_app_flutter

A new Flutter project.

## Screenshots

  WelocmePage                 |   SignIn        |  SignUp
:-------------------------:|:-------------------------:|:-------------------------:
![](https://firebasestorage.googleapis.com/v0/b/shopappflutter-73fe5.appspot.com/o/Screen%2FScreenshot_20230516-143552.jpg?alt=media&token=c482b0ca-b392-4f41-b5ce-6bff7f615ba1)|![](https://firebasestorage.googleapis.com/v0/b/shopappflutter-73fe5.appspot.com/o/Screen%2FScreenshot_20230516-143617.jpg?alt=media&token=aba0e7c6-627e-43f1-ba73-b403d2528f28)|![](https://firebasestorage.googleapis.com/v0/b/shopappflutter-73fe5.appspot.com/o/Screen%2FScreenshot_20230516-143810.jpg?alt=media&token=4756a256-8e9f-40bc-b0dd-bb14515730a8)



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
│    │──checkout 
│    │   │──widgets
│    │       │──adress_view.dart
│    │       │──delivery_time.dart
│    │       └──summary.dart 
│    └────check_out_view.dart 
│    │──details
│    │   └──details_view.dart 
│    │──home
│    │   │──component
│    │   │   │──category_view.dart
│    │   │   │──product_view.dart
│    │   │   └──search_text_form_field.dart 
│    │   └──home_view.dart
│    │──login    
│    │    │──widgets
│    │    │   │──custtom_button.dart
│    │    │   │──custtom_button_social.dart
│    │    │   │──custtom_text.dart
│    │    │   │──custtom_text_form_field.dart
│    │    │   └──summary.dart 
│    │    │──login_view.dart   
│    │    └──register_view.dart
│    │──oder_history
│    │   │──widgets
│    │   │   └──order_detailed.dart
│    │   └──order_history_view.dart 
│    │─profile   
│    │  │──widgets 
│    │  │   │──cards_view.dart 
│    │  │   │──edite_profile_view.dart
│    │  │   └──notifications_view.dart
│    │  └──profile_view.dart 
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
