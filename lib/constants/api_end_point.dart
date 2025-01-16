abstract final class ApiEndPoints {
  static String _baseUrl = 'https://arimako.com';
  static String apiUrl = '/connector/api';

  static void setBaseUrl(String newBaseUrl) {
    _baseUrl = newBaseUrl.trim(); // Trim to remove any leading/trailing spaces
  }

  static String get baseUrl => _baseUrl;

  // API endpoints
  static String get loginUrl => '$_baseUrl/oauth/token';
  static String get getUser => '$_baseUrl$apiUrl/user/loggedin';
  static String get notification => '$_baseUrl$apiUrl/notifications';
  static String get getUsers => '$_baseUrl$apiUrl/user';
  static String get getLeave => '$_baseUrl$apiUrl/getUserLeave';
  static String get getLeaveType => '$_baseUrl$apiUrl/getLeaveType';
  static String get getListUserLeave => '$_baseUrl$apiUrl/essentials-leaves';
  static String get updateShippingStatus => '$_baseUrl$apiUrl/update-shipping-status';
  static String get updateLeaveStatus => '$_baseUrl$apiUrl/essentials-leaves/';
  static String get tax => '$_baseUrl$apiUrl/tax';
  static String get listSell => '$_baseUrl$apiUrl/sell';
  static String get updateQtyAvailable => '$_baseUrl$apiUrl/sell/';
  static String get paymentAccount => '$_baseUrl$apiUrl/payment-accounts';
  static String get createExpense => '$_baseUrl$apiUrl/expense';
  static String get updatePassword => '$_baseUrl$apiUrl/update-password';
  static String get checkIn => '$_baseUrl$apiUrl/clock-in';
  static String get checkOut => '$_baseUrl$apiUrl/clock-out';
  static String get getAttendance => '$_baseUrl$apiUrl/get-attendance/';
  static String get listAttendance => '$_baseUrl$apiUrl/attendance/';
  static String get expenseCategory => '$_baseUrl$apiUrl/expense-categories';
  static String get contact => '$_baseUrl$apiUrl/contactapi';
  static String get getContact => '$contact?type=customer&per_page=500';
  static String get addContact => '$contact?type=customer';
  static String get followerUp => '$_baseUrl$apiUrl/crm/follow-ups';
  static String get followerUpResource => '$_baseUrl$apiUrl/crm/follow-up-resources';
  static String get followupCategory => '$_baseUrl$apiUrl/taxonomy?type=followup_category';
  static String get listLead => '$_baseUrl$apiUrl/crm/leads';
  static String get customerDue => '$contact/';
  static String get addContactPayment => '$contact-payment';
  static String get listAllProduct => '$_baseUrl$apiUrl/product';
  static String get listAllBusinessLocation => '$_baseUrl$apiUrl/business-location';
  static String get getSingleBusinessLocation => '$_baseUrl$apiUrl/business-location/';
  static String get listPaymentMethods => '$_baseUrl$apiUrl/payment-methods';
  static String get listPaymentAccounts => '$_baseUrl$apiUrl/payment-accounts';
  static String get expenseList => '$_baseUrl$apiUrl/expense';
  static String get getDocument => '$_baseUrl$apiUrl/document_get';
  static String get addDocument => '$_baseUrl$apiUrl/document_add';
  static String get viewDocument => '$_baseUrl$apiUrl/document_view';
  static String get deleteDocument => '$_baseUrl$apiUrl/document_delete';
  static String get updateDocument => '$_baseUrl$apiUrl/document_edit';
  static String get groupCustomer => '$_baseUrl$apiUrl/customer-groups';
  static String get customerPayment => '$_baseUrl$apiUrl/customer-payment';
  static String get customerSell => '$_baseUrl$apiUrl/sell';
  static String get rewardPoint => '$_baseUrl$apiUrl/reward-point';
  static String get activitie => '$_baseUrl$apiUrl/activity';
  static String get ledger => '$_baseUrl$apiUrl/crm/ledger';
  static String get todo => '$_baseUrl$apiUrl/todo';
  static String get comment => '$_baseUrl$apiUrl/comment';
  static String get deleteComment => '$_baseUrl$apiUrl/delete-comment';
  static String get deleteMedia => '$_baseUrl$apiUrl/deleteDocument';
  static String get addMedia => '$_baseUrl$apiUrl/uploadDocument';
  static String get getDoc => '$_baseUrl$apiUrl/DocumentApi';
  static String get downLoad => '$_baseUrl$apiUrl/download';
  static String get reminder => '$_baseUrl$apiUrl/reminder';
  static String get knowledgebase => '$_baseUrl$apiUrl/knowledge_baseApi';
}
