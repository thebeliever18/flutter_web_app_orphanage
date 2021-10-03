calculateAge(DateTime birthDate) {
  DateTime currentDate = DateTime.now();
  int age = currentDate.year - birthDate.year;
  int month1 = currentDate.month;
  int month2 = birthDate.month;
  if (month2 > month1) {
    age--;
  } else if (month1 == month2) {
    int day1 = currentDate.day;
    int day2 = birthDate.day;
    if (day2 > day1) {
      age--;
    }
  }
  return age.toString();
}

String displayDateOnly;
String displayDateOfBirth;
covertDateTimeDateOfBirth(_dateTime) {
  if (_dateTime == null && displayDateOfBirth == null) {
    return "  Enter date of birth";
  } else if (displayDateOfBirth is String) {
    return "  $displayDateOfBirth";
  } else {
    var date = DateTime.parse("$_dateTime");
    var formattedDate = "  ${date.month}-${date.day}-${date.year}";
    return formattedDate;
  }
}

covertDateTimeDate(_dateTime) {
  if (_dateTime == null && displayDateOnly == null) {
    return "  Choose date";
  } else if (displayDateOnly is String) {
    return "  $displayDateOnly";
  } else {
    var date = DateTime.parse("$_dateTime");
    var formattedDate = "  ${date.month}-${date.day}-${date.year}";
    return formattedDate;
  }
}
