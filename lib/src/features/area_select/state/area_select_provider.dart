import 'package:bd_app_v0/src/features/area_select/state/area_select_controller.dart';
import 'package:bd_app_v0/src/features/area_select/state/area_select_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final areaSelectProvider =
    NotifierProvider<AreaSelectNotifier, AreaSelectState>(
      AreaSelectNotifier.new,
    );
