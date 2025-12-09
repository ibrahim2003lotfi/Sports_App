class AppRoutes {
  // Auth Routes
  static const INITIAL = '/';
  static const LOGIN = '/login';
  static const SIGNUP = '/signup';
  static const ONBOARDING = '/onboarding';
  static const FORGOT_PASSWORD = '/forgot_password';
  
  // Home Routes
  static const HOME = '/home';
  static const PROFILE = '/profile';
  static const SETTINGS = '/settings';
  
  // Article Routes
  static const ARTICLE_DETAIL = '/article/:id';
  
  // Search Routes
  static const SEARCH = '/search';
  
  // Admin Routes
  static const ADMIN_DASHBOARD = '/admin/dashboard';
  static const ADMIN_CREATE_ARTICLE = '/admin/create-article';
  static const ADMIN_EDIT_ARTICLE = '/admin/edit-article/:id';
  static const ADMIN_ARTICLES = '/admin/articles';
  
  // Super Admin Routes
  static const SUPER_ADMIN_DASHBOARD = '/super-admin/dashboard';
  static const SUPER_MANAGE_USERS = '/super-admin/manage-users';
  static const SUPER_MANAGE_ADMINS = '/super-admin/manage-admins';
  static const SUPER_ALL_ARTICLES = '/super-admin/all-articles';
}