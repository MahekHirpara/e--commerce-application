class EValidator{
  static  String? validationEmptyText(String? fieldName,String value){
    if(value.isEmpty || value == null){

      return '$fieldName is required';
    }
    return null;
  }
  static String? passwordValidation(String passowrd){
    if(passowrd.isEmpty || passowrd == null){

      return 'Password is required';
    }
    else if(passowrd.length<6){

    return 'Password must be 6 latter';
    }else if(!passowrd.contains(RegExp(r'[!@#$%^&*(),.?":{}\<>]'))){
      return 'Password must be contains at least one special character';
    }
    return null;
  }
  static String? emailValidation(String email){
    final emailRegEx = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if(email.isEmpty || email == null){

      return 'Email is required';
    }
    else if(!emailRegEx.hasMatch(email)){

      return 'Invalid email address';
    }
   return null;
  }
  static String? nameValidation(String name){
    if(name.isEmpty){
      return 'Name is required';
    }else{
      return null;
    }
  }
  static String? phoneValidation(String phone){
    String patttern = r'(^(?:[+0]9)?[0-9]{10}$)';
    RegExp regExp = new RegExp(patttern);
    if(phone.isEmpty || phone == null ){
      return 'Phone number is required';
    }
    else if(!regExp.hasMatch(phone)){
      return 'Please enter valid phone number';
    }
    else{
      return null;
    }
  }
}