import 'package:zahid_mahmud_s_application1/core/app_export.dart';
import 'package:zahid_mahmud_s_application1/presentation/top_playlists_screen/models/top_playlists_model.dart';

/// A controller class for the TopPlaylistsScreen.
///
/// This class manages the state of the TopPlaylistsScreen, including the
/// current topPlaylistsModelObj
class TopPlaylistsController extends GetxController {
  Rx<TopPlaylistsModel> topPlaylistsModelObj = TopPlaylistsModel().obs;
}
