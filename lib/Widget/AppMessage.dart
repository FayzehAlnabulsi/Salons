import 'dart:io';

class AppMessage {
  static String successfulRequest = 'successful';
  static String unAuthorized = 'unAuthorized';
  static String serverExceptions = 'serverExceptions';
  static String socketException = 'socketException';
  static String timeoutException = 'timeoutException';
  static String formatException = 'formatException';
  static String unAuthorizedText =
      'انتهت صلاحية الجلسة'; //"نحن آسفون ولكننا غير قادرين على التحقق من هويتك. يجب عليك تسجيل الدخول";
  static String tryAgain = 'إعادة المحاولة';
  static String serverText = "حدث خطأ ما اثناء معالجة طلبك";
  static String socketText = 'لايوجد اتصال بالانترنت';
  static String timeoutText =
      'يبدو أن الخادم يستغرق وقتًا طويلاً للاستجابة، حاول مجدداً بعد فترة';
  static String formatText = 'حدث خطا ما';
  static String initial = 'initial';
  static String loading = 'loading';
  static String loaded = 'loaded';
  static String noData = 'لاتوجد بيانات لعرضها';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  static Map<String, String> headersWithToken({required String token}) => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
  static Map<String, String> headersMultiFile({required String token}) => {
        'Content-Type': 'multipart/form-data',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
//====================================================================

  static String rule = 'مستخدميين النظام';
  static String paymentGetaway = 'بوابات الدفع';
  static String settingsText = 'الاعدادات';

//===================================================================
  static String documentationText = 'التوثيق';
  static String verifyMerchant = 'توثيق التجار';
  static String verifyCelebrities = 'توثيق المشاهير';
  static String requestText = 'الطلبات';
  static String requestDetails = 'تفاصيل الطلب';
  static String manageUsersText = 'إدارة المستخدمين';
  static String manageOrdersText = 'إدارة الطلبات';
  static String couponsText = 'الكبونات';
  static String livesText = 'البث';
  static String specialLivesText = 'البثوث المميزة';
  static String livesManagementText = 'ادارة البثوث';
  static String warningsText = 'الإنذارات';
  static String livesWarningsText = 'انذارات البث';
  static String advWarningsText = 'انذارات الإعلانات';
  static String contractText = 'العقود';
  static String support = 'الدعم الفني';
  static String logOut = 'تسجيل الخروج';
  static String reportsText = 'البلاغات';
  static String rejectResonText = 'اسباب الرفض';
  static String advertisingLicenseText = 'الرخص الاعلانية';
  static String commercialRegisterText = 'السجلات التجارية';
  static String socialMediaText = 'صفحات التواصل';
  static String userContractsText = 'عقود المستخدمين';
  static String celebratyContractsText = 'عقود المشاهير';
  static String usersDataText = 'المستخدمين';
  static String celebrityText = 'المشاهير';
  static String celebrityManagementText = 'ادارة المشاهير';
  static String mandatoryTx = 'حقل اجباري';
  static String invalidPassword =
      'يجب أن يكون طول نص كلمة المرور على الأقل 8 حروفٍ/حرفًا'; //'كلمة المرور يجب ان لا تقل عن 8 خانات';
  static String noMatch = 'كلمة المرور و تأكيد كلمة المرور لا تتطابق';
  static String startWithZero = 'يجب ان لا يبدأ رقم الجوال بالرقم 0';
  static String startWith5 = 'يجب ان يبدأ رقم الجوال بالرقم 5';
  static String noLessThan9 = "يجب ان يكون رقم الجوال 9 خانات";
  static String descriptionLength = 'يجب ان لا يزيد الوصف عن 200 خانة';
  static String descriptionMinLength = 'الحد الادنى لحروف الوصف 80 حرف';
  static String descriptionGiftMinLength = 'الحد الادنى لحروف الوصف 40 حرف';
  static String subjectLength = 'الحد الاقصى لحروف الموضوع 25 حرف';
  static String description = 'الوصف';
  static String shouldNotStartWithNumber = 'يجب ان لا يبدا الكوبون برقم';
  static String englishOnlyCoupon =
      'يجب ان يكون اسم الكوبون حروف وارقام انجليزية';
  static String noLessThan4 = "الحد الادنى 4 خانات";
  static String noMoreThan14 = "يجب ان  لا يكون الاسم اكثر من  14 خانات";
  static String arabicOnlyValidation = 'يجب ان يكون الاسم حروف باللغة العربية ';
  static String pleaseEnterFullName = 'الرجاء كتابة الاسم الثلاثي الكامل';
  static String englishOnlyValidation =
      'يجب ان يكون اسم المستخدم باللغة الانجليزية';
  static String notZero = 'يجب ان يكون اكبر من صفر';
  static String confirmDelete = 'هل انت متاكد من اكمال عملية الحذف؟';
  static String yes = 'نعم';
  static String no = 'لا';
  static String rowNumber = 'م';
  static String action = 'الإجراءات';
  static String name = 'الاسم';
  static String fullName = 'الاسم الرباعي';
  static String famousName = 'اسم الشهرة';
  static String activeDate = 'اخر زيارة';
  static String date = 'التاريخ';
  static String status = 'الحالة';
  static String doc = 'ملف التوثيق';
  static String adminPanel = 'لوحة التحكم';
  static String show = 'عرض';
  static String accept = 'قبول';
  static String acceptConfirm = 'هل انت متاكد من اكمال عملية القبول؟';
  static String confirm = 'هل انت متاكد من اكمال العملية؟';
  static String rejectConfirm = 'هل انت متاكد من اكمال عملية الرفض؟';
  static String rejectReasonConfirm = ' الرجاء ادخال سبب الرفض';
  static String reject = 'رفض';
  static String upLodeFile = 'من فضلك قم باختيار ملف التوثيق';
  static String reUploaded = 'اعادة رفع ملف التوثيق';
  static String filterResult = "نتائج التصفية";
  static String acceptable = 'مقبول';
  static String unacceptable = 'مرفوض';
  static String cansel = 'الغاء';
  static String updlode = 'رفع';
  static String new_ = 'جديد';
  static String apply = 'تطبيق';
  static String search = 'البحث';
  static String socialPage = 'صفحة التواصل';
  static String celebrityCategory = 'التصنيف';
  static String documentationType = 'نوع التوثيق';
  static String verify = 'موثق';
  static String notVerify = 'غير موثق';
  static String more = 'المزيد';
  static String delete = 'حذف';
  static String supportType = 'نوع الدعم';
  static String complete = 'مكتمل';
  static String notComplete = 'غير مكتمل';
  static String contractFile = 'ملف العقد';
  static String profile = 'الملف الشخصي';
  static String email = 'البريد الالكتروني';
  static String region = 'المنطقة';
  static String city = 'المدينة';
  static String phone = 'رقم الجوال';
  static String gender = 'الجنس';
  static String catogary = 'التصنيف';
  static String logIn = 'تسجيل الدخول';
  static String userName = 'اسم المستخدم';
  static String password = 'كلمة المرور';

  static String dateEmpty = 'الرجاء اختيار التاريخ';
  static String couponName = 'اسم الكوبون';
  static String discountPercentage = 'نسبة الخصم';
  static String couponUseTimesForOne = 'عدد مرات الاستخدام';
  static String fromToDates = 'تاريخ البداية والنهاية';
  static String couponDetails = 'تفاصيل الكوبون';
  static String save = 'حفظ';
  static String all = 'الكل';
  static String specificCelebrity = 'مشهور محدد';
  static String couponTo = 'الكوبون يشمل';
  static String searchByCelebrityData =
      'ابحث باسم الشهرة او الاسم الرباعي او اسم المستخدم';
  static String searchByUserData =
      'ابحث بالاسم او الاسم الرباعي او اسم المستخدم';
  static String searchBySupportData =
      'ابحث بالاسم او موضوع الرسالة او تفاصيل الرسالة';
  static String notLess = 'لا يمكنك تقليل عدد المستفيدين';
  static String searchCelebrity = 'ابحث عن مشهور';
  static String randomErrorMessage = 'حدث خطآ ما حاول لاحقا';
  static String addedSuccessfully = 'تمت الاضافة بنجاح';
  static String editedSuccessfully = 'تم التعديل بنجاح';
  static String deletedSuccessfully = 'تم الحذف بنجاح';
  static String reset = 'إعادة تعيين';
  static String selectDate = 'اختر التاريخ';
  static String listError = 'هذه القائمة غير متوفرة حاليا';
  static String result = 'نتيجة';
  static String active = 'نشط';
  static String notActive = 'غير نشط';
  static String percentage = 'النسبة';
  static String searchByCouponName = 'ابحث باسم الكوبون';
  static String close = 'إغلاق ';
  static String rejectReason = 'سبب الرفض';
  static String deleteReason = 'سبب الحذف';
  static String theUser = 'المستخدم';
  static String celebrity = 'مشهور';
  static String user = 'مستخدم';
  static String details = 'تفاصيل';
  static String messageDetails = 'تفاصيل الرسالة';
  static String subject = 'موضوع الرسالة';
  static String adSubject = 'الموضوع ';
  static String attachment = 'المرفق';
  static String contact = 'تواصل';
  static String cancel = 'استبعاد';
  static String add = 'اضافة';
  static String edit = 'تعديل';
  static String addRejectReason = 'اضافة سبب رفض';
  static String userType = 'نوع المستخدم';
  static String remove = 'ازالة';
  static String addedToList = 'مضاف الى القائمة';
  static String notAddedToList = 'غير مضاف الى القائمة';
  static String invalidFormat = 'لايوجد ملف لعرضه';
  static String invalidEmail = "البريد الالكتروني غير صالح";
  static String title = 'العنوان';
  static String note = 'الملاحظة';
  static String warnContent = 'محتوى الانذار';
  static String celebrityBannedSuccessfully =
      'تم حظر المشهور و اغلاق البث بنجاح';
  static String searchByCelebrity = 'ابحث باسم المشهور';
  static String searchByCelebrityOrUser = 'ابحث باسم المشهور او المستخدم';
  static String orderNumber = 'رقم الطلب';
  static String reportReason = 'سبب البلاغ';
  static String chat = 'المحادثة';
  static String viewChat = 'معاينة المحادثة';
  static String orderInformation = 'معلومات الطلب';
  static String price = 'سعر الطلب';
  static String orderType = 'نوع الطلب';
  static String tax = 'قيمة الضريبة المضافة';
  static String priceAfterDiscount = 'السعر بعد الخصم';
  static String discount = 'قيمة الخصم';
  static String discountCode = 'كوبون الخصم';
  static String platform = 'المنصة';
  static String advTiming = 'وقت الاعلان';
  static String advType = 'نوع الاعلان';
  static String giftFrom = 'إهداء من';
  static String giftTo = 'إهداء الى';
  static String giftType = 'نوع الإهداء';
  static String occasionType = 'نوع المناسبة';
  static String duration = 'المدة الزمنية';
  static String meetingPlace = 'مكان اللقاء';
  static String meetingType = 'نوع اللقاء';
  static String meetingTime = 'وقت اللقاء';
  static String dateFrom = 'تاريخ البداية';
  static String dateTo = 'تاريخ النهاية';
  static String couldntOpenUrl = 'حدث خطأ اثناء فتح الملف';
  static String nationality = 'الجنسية';
  static String back = 'تراجع';
  static String accountStatus = 'حالة الحساب';
  static String alerts = 'التنبيهات';
  static String activeAccount = 'تفعيل الحساب';
  static String unActiveAccount = 'تعطيل الحساب';
  static String activeAccountBody = 'هل انت متاكد من تفعيل الحساب؟';
  static String unActiveAccountBody = 'هل انت متاكد من تعطيل الحساب';

  static String spacialLive = 'تمييز البث';
  static String spacialLiveBody = 'هل انت متاكد من تمييز البث؟';
  static String unSpacialLive = 'إلغاء تمييز البث';
  static String unSpacialLiveBody = 'هل انت متاكد من إلغاء تمييز البث؟';

  static String enabled = 'مفعل';
  static String disabled = 'معطل';
  static String notes = 'الملاحظات';
  static String authDate = 'تاريخ التوثيق';
  static String addNotes = 'اضافة ملاحظة';
  static String fillAllFields = 'املء كل الحقول ادناه';

  static String editVerifyInfo = 'تعديل بيانات التوثيق';
  static String idNumber = 'رقم الرخصة';
  static String idFile = 'ملف الرخصة الاعلامية';
  static String update = 'تعديل البيانات';
  static const String emailAndUsernameTaken =
      'البريد الالكتروني واسم المستخدم موجود مسبقا';
  static const String usernameTaken = 'اسم المستخدم موجود مسبقا';
  static const String emailTaken = 'البريد الالكتروني موجود مسبقا';
  static const String invalidEmailFormat = 'صيغة البريد الالكتروني غير صحيحة';
  static const String phoneNumberTaken = 'رقم الجوال مستخدم مسبقا ';
  static const String fullNameBlocked = 'لايمكنك استخدام الاسم الرباعي اعلاه';
  static const String nameBlocked = 'لايمكنك استخدام اسم الشهرة اعلاه ';
  static const String invalidNameFormat = 'صيغة الاسم الرباعي غير صالحة';
  static const String documentHolderName = 'اسم صاحب الوثيقة';
  static const String documentCode = 'رمز الوثيقة';
  static const String otherDocuments = 'مستندات اخرى';
  static const String ownerName = 'اسم المالك';
  static const String tradeName = 'الاسم التجاري';
  static const String commercialRegister = 'السجل التجاري';
  static const String commercialRegisterCode = 'رقم السجل التجاري';
  static const String freelanceDocument = 'وثيقة العمل الحر';
  static const String accountType = 'نوع الحساب';
  static const String file = 'ملف الطلب';
  static const String advFeature = 'صفة الاعلان';
  static const String product = 'منتج';
  static const String service = 'خدمة';
  static const String mustAttend = 'يلزم الحضور';
  static const String mustNotAttend = 'لا يلزم الحضور';
  static const String morning = 'صباحا';
  static const String noon = 'مساءا';
  static const String resetPass = 'اعادة تعيين كلمة المرور';
  static const String confirmPass = 'تاكيد كلمة المرور';
  static const String changePassword = "تغير كلمة المرور";
  static const String addLink = 'اضافة رابط';
  static const String sharingType = "نوع المشاركة";
  static const priceAfterDeduction = "السعر بعد الخصم";
  static const platformPercentage = "نسبة المنصة";
  static const priceAfterTax = "السعر مع الضريبة";
  static const pricePecentageTax = 'ضريبة نسبة المنصة';
  static const endDateEmpty = 'الرجاء تحديد تاريخ النهاية';
  static const inValidUrl = 'الرابط المدخل غير صالح';
  static const validatingUrl = 'جاري التحقق من الرابط';
  static const orderOwner = 'معلومات طالب الخدمة';
  static const priceDetails = 'تفاصيل السعر';
  static const orderProvider = 'معلومات مقدم الخدمة';
  static const String celebrities = 'مشاهير';
  static const String theCelebrities = 'المشاهير';
  static const String newlyRegistered = 'المسجلين حديثا';
  static const String mostCategories = 'انشط التصنيفات';
  static const String mostCities = 'انشط المدن';
  static const String mostRequestedCelebrities = 'المشاهير الاكثر طلبا';
  static const String users = 'المستخدمين';
  static const String merchants = 'التجار';
  static const String company = 'شركة/مؤسسة';
  static const String person = 'فرد';
  static const String orders = 'الطلبات';
  static const String noActionOrder = 'لم يتم الرد';
  static const String activePlatforms = 'المنصات الاكثر طلب';
  static const String activeOrderType = 'الانواع الاكثر طلب';
  static const String quickAuthTiltle = 'تسجيل الدخول السريع';
  static String quickAuthContent =
      "هل تريد تفعيل تسجيل الدخول السريع ${Platform.isAndroid ? 'باستخدام البصمة' : Platform.isIOS ? 'باستخدام بصمة الوجه' : ''}";
  static String other = "اخرى";
  static String currentPassword = 'كلمة المرور الحالية';
  static String accountInfo = 'معلومات الحساب';
//
}
