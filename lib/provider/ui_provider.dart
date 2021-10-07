import 'package:flutter/foundation.dart';

class UiProvider extends ChangeNotifier{
   
   int _selectedOpt = 0;

   // ignore: unnecessary_getters_setters
   int get selectedOpt{
      return _selectedOpt;
   }

   set selectedOpt( int i ){
      _selectedOpt = i;
      notifyListeners();
   }
}