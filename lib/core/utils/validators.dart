class Validators {
  // Validate email
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال البريد الإلكتروني'; // Please enter your email
    }
    const emailPattern = r'^[^@\s]+@[^@\s]+\.[^@\s]+$';
    final isValid = RegExp(emailPattern).hasMatch(value);
    return isValid ? null : 'البريد الإلكتروني غير صالح'; // Invalid email
  }

  // Validate password
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال كلمة المرور'; // Please enter your password
    }
    if (value.length < 6) {
      return 'يجب أن تكون كلمة المرور 6 أحرف على الأقل'; // Password must be at least 6 characters
    }
    return null; // Valid password
  }

  // Validate phone number
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال رقم الهاتف'; // Please enter your phone number
    }
    const phonePattern = r'^\+?[0-9]{10,15}$'; // Adjust the pattern as needed
    final isValid = RegExp(phonePattern).hasMatch(value);
    return isValid ? null : 'رقم الهاتف غير صالح'; // Invalid phone number
  }

  // Validate required fields
  static String? validateRequiredField(String? value) {
    if (value == null || value.isEmpty) {
      return 'هذا الحقل مطلوب'; // This field is required
    }
    return null; // Valid input
  }
}

/* 
TextFormField(
  decoration: InputDecoration(labelText: 'البريد الإلكتروني'), // Email
  validator: Validators.validateEmail,
),
 */