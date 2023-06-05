// ignore: constant_identifier_names

// ignore_for_file: constant_identifier_names

// Class for all the endpoints used in the app
class EndPoints {
  static const String BASE = 'http://165.232.71.253';
  static const String baseUrl = 'http://165.232.71.253/api/';
  static const String login = '${baseUrl}login/';
  static const String signup = '${baseUrl}sign-up/';
  static const String logout = '${baseUrl}logout/';
  static const String profile = '${baseUrl}user-profile/';
  static const String changePassword = '${baseUrl}change-password/';
  static const String verifyOTP = '${baseUrl}verify-otp/';
  static const String resendOTP = '${baseUrl}resend-otp/';
  static const String categories = '${baseUrl}categories/';
  static const String allMessages = '${baseUrl}all-messages/';
  static const String messageDetail = '${baseUrl}message-detail/';
  static const String categoryMessages = '${baseUrl}category-messages/';
  static const String likeMessage = '${baseUrl}like-message/';
  static const String likeVideo = '${baseUrl}like-video/';
  static const String leaders = '${baseUrl}leaders/';
  static const String preachers = '${baseUrl}preachers/';
  static const String doctrines = '${baseUrl}doctrines/';
  static const String doctrineDetail = '${baseUrl}doctrine-detail/';
  static const String bookmarks = '${baseUrl}bookmarks/';
  static const String addBookmark = '${baseUrl}add-bookmark/';
  static const String removeBookmark = '${baseUrl}remove-bookmark/';
  static const String generalNotes = '${baseUrl}general-notes/';
  static const String addGeneralNote = '${baseUrl}add-general-note/';
  static const String updateGeneralNote = '${baseUrl}update-general-note/';
  static const String deleteNote = '${baseUrl}delete-note/';
  static const String makeDonation = '${baseUrl}make-donation/';
  static const String logoutall = '${baseUrl}logoutall/';
  static const String youtubevideos = '${baseUrl}youtube-videos/';
  static const String gallery = '${baseUrl}gallery/';

  static const String createUpdateMessageNote =
      '${baseUrl}create-update-message-note/';
}
