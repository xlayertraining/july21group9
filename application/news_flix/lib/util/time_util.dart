
import 'package:intl/intl.dart';
import 'package:untitled2/util/log_util.dart';

class TimeUtil {

  static String convertTimeStamp(int timeInMilli) {
    String dateTimeString = '';

    try {
      var dt = DateTime.fromMillisecondsSinceEpoch(timeInMilli * 1000);
      var d12 = DateFormat('dd/MM/yyyy, hh:mm a').format(dt);
      dateTimeString = d12;
    } catch (e, s) {
      Log.e(e, s);
    }
    return dateTimeString;
  }

}