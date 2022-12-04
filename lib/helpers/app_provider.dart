import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../providers/provider.dart';

abstract class AppProvider {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => UserProvider()),
  ];
}
