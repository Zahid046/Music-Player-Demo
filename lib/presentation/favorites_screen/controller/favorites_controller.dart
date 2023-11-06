import 'package:zahid_mahmud_s_application1/core/app_export.dart';
import 'package:zahid_mahmud_s_application1/presentation/favorites_screen/models/favorites_model.dart';

/// A controller class for the FavoritesScreen.
///
/// This class manages the state of the FavoritesScreen, including the
/// current favoritesModelObj
class FavoritesController extends GetxController {
  Rx<FavoritesModel> favoritesModelObj = FavoritesModel().obs;
}
