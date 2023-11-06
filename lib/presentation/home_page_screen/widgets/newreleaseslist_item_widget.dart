import '../controller/home_page_controller.dart';
import '../models/newreleaseslist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:zahid_mahmud_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class NewReleasesListItemWidget extends StatelessWidget {
  NewReleasesListItemWidget(
    this.newReleasesListItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  NewReleasesListItemModel newReleasesListItemModelObj;

  var controller = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 159.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => CustomImageView(
              imagePath: newReleasesListItemModelObj.urgentSiege!.value,
              height: 181.v,
              width: 159.h,
              radius: BorderRadius.circular(
                12.h,
              ),
            ),
          ),
          SizedBox(height: 8.v),
          Obx(
            () => Text(
              newReleasesListItemModelObj.urgentSiege1!.value,
              style: theme.textTheme.titleMedium,
            ),
          ),
          SizedBox(height: 2.v),
          Obx(
            () => Text(
              newReleasesListItemModelObj.damnedAnthem!.value,
              style: CustomTextStyles.bodyMediumOnPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
