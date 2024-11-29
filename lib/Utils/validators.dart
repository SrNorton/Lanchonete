bool emailValid(String email){
  final RegExp regex = RegExp(r"^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$");
  return regex.hasMatch(email);
}

bool phoneValid(String phone){
  final RegExp regex = RegExp(r'^\(?[0-9]{2,3}\)?[- ]?[0-9]{7,8}$');

  return regex.hasMatch(phone);
}