import '../favorites_screen/widgets/favorites_item_widget.dart';
import 'controller/favorites_controller.dart';
import 'models/favorites_item_model.dart';
import 'package:flutter/material.dart';
import 'package:zahid_mahmud_s_application1/core/app_export.dart';
import 'package:zahid_mahmud_s_application1/presentation/top_playlists_screen/top_playlists_screen.dart';
import 'package:zahid_mahmud_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:zahid_mahmud_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:zahid_mahmud_s_application1/widgets/app_bar/appbar_trailing_image.dart';
import 'package:zahid_mahmud_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:zahid_mahmud_s_application1/widgets/custom_bottom_bar.dart';

class FavoritesScreen extends GetWidget<FavoritesController> {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 22.v),
          child: Column(
            children: [
              _buildPlaylist(),
              SizedBox(height: 24.v),
              _buildFavorites(),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 48.h,
      leading: AppBarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(left: 24.h, top: 14.v, bottom: 13.v),
        onTap: () {
          onTapArrowLeft();
        },
      ),
      centerTitle: true,
      title: AppBarTitle(text: "lbl_favourites".tr),
      actions: [
        AppBarTrailingImage(
          imagePath: ImageConstant.imgMenu,
          margin: EdgeInsets.fromLTRB(24.h, 14.v, 24.h, 13.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildPlaylist() {
    return SizedBox(
      height: 181.v,
      width: 342.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
              imagePath: ImageConstant.imgPlaylistBackground2, height: 181.v, width: 342.h, radius: BorderRadius.circular(8.h), alignment: Alignment.center),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.all(16.h),
              decoration: AppDecoration.gradientBlackToBlack.copyWith(borderRadius: BorderRadiusStyle.customBorderBL8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 72.v, bottom: 4.v),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("lbl_did_you_like_it".tr, style: theme.textTheme.headlineMedium),
                        SizedBox(height: 3.v),
                        Text("lbl_843_tracks".tr, style: theme.textTheme.bodyLarge),
                      ],
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgPlay,
                    height: 50.adaptSize,
                    width: 50.adaptSize,
                    margin: EdgeInsets.only(top: 99.v),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFavorites() {
    return Expanded(
      child: Obx(
        () => ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(height: 8.v);
          },
          itemCount: controller.favoritesModelObj.value.favoritesItemList.value.length,
          itemBuilder: (context, index) {
            FavoritesItemModel model = controller.favoritesModelObj.value.favoritesItemList.value[index];
            return FavoritesItemWidget(
              model,
              onTapFavoritesOption: () {
                onTapFavoritesOption();
              },
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Get.toNamed(getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homePageScreen;
      case BottomBarEnum.Top:
        return AppRoutes.topPlaylistsScreen;
      case BottomBarEnum.Favorites:
        return AppRoutes.favoritesScreen;
      case BottomBarEnum.Search:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.topPlaylistsScreen:
        return TopPlaylistsScreen();
      case AppRoutes.favoritesScreen:
        return FavoritesScreen();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the artistsScreen when the action is triggered.
  onTapFavoritesOption() {
    Get.toNamed(AppRoutes.artistsScreen);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
