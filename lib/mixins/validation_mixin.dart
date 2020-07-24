class ValidationMixin {
  String validateEmail(String email) {
    return email.contains('@') ? null : 'قم بادخال بريد الكتروني صحيح';
  }

  String validateUsername(String username) {
    return username.length > 0 ? null : 'قم بادخال اسم المستخدم';
  }

  String validateName(String username) {
    return username.length > 0 ? null : 'من فضلك قم بادخال الاسم';
  }

  String validateContactText(String username) {
    return username.length > 0 ? null : 'من فضلك قم بادخال نص الرسالة';
  }

  String validateDescription(String username) {
    return username.length > 0 ? null : 'من فضلك قم بادخال الوصف';
  }

  String validateDropdownRegister(dynamic value) {
    return value != 0 ? null : 'قم باختيار البلد';
  }

  String validateDropdownCategories(dynamic value) {
    return value != 0 ? null : 'قم باختيار القسم';
  }

  String validateDropdownReasons(dynamic value) {
    return value != 0 ? null : 'قم باختيار سبب التواصل';
  }

  String validatePhone(String phone) {
    if (phone.length == 0) {
      return 'من فضلك قم بإدخال رقم الجوال';
    } else {
      return null;
    }
  }

  String validateQuestion(String question) {
    return question.length > 0 ? null : 'من فضلك قم بادخال نص السؤال';
  }

  String validateAnswer(String answer) {
    return answer.length > 0 ? null : 'من فضلك قم بادخال نص الإجابة';
  }

  String validatePassword(String password) {
    return password.length > 5
        ? null
        : 'يجب أن تحتوي كلمة المرور على 6 حروف على الأقل';
  }
}
