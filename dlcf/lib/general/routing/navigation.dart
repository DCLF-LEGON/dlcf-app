import 'package:dlcf/general/routing/nav_config.dart';
import 'package:dlcf/screens/about/about_us.dart';
import 'package:dlcf/screens/bookmarks/bookmarks.dart';
import 'package:dlcf/screens/discover/discover.dart';
import 'package:dlcf/screens/doctrine/bible_doctrine.dart';
import 'package:dlcf/screens/doctrine/doctrine_detail.dart';
import 'package:dlcf/screens/documents/church_documents.dart';
import 'package:dlcf/screens/documents/document_detail.dart';
import 'package:dlcf/screens/give/give_card.dart';
import 'package:dlcf/screens/give/give_momo.dart';
import 'package:dlcf/screens/give/success.dart';
import 'package:dlcf/screens/home/channel_messages.dart';
import 'package:dlcf/screens/home/components/gallery_category_images.dart';
import 'package:dlcf/screens/home/home.dart';
import 'package:dlcf/screens/error/error.dart';
import 'package:dlcf/screens/home/video_page.dart';
import 'package:dlcf/screens/leaders/leaders.dart';
import 'package:dlcf/screens/login/login.dart';
import 'package:dlcf/screens/membership/membership_detail.dart';
import 'package:dlcf/screens/membership/membership_screen.dart';
import 'package:dlcf/screens/notes/components/add_note_form.dart';
import 'package:dlcf/screens/notes/components/edit_note_form.dart';
import 'package:dlcf/screens/notes/components/note_detail.dart';
import 'package:dlcf/screens/notes/notes.dart';
import 'package:dlcf/screens/notification/notification.dart';
import 'package:dlcf/screens/onboarding/loading_page.dart';
import 'package:dlcf/screens/onboarding/onboarding.dart';
import 'package:dlcf/screens/otp/otp_verified.dart';
import 'package:dlcf/screens/otp/verify_otp.dart';
import 'package:dlcf/screens/profile/profile.dart';
import 'package:dlcf/screens/reset_password/reset_password.dart';
import 'package:dlcf/screens/reset_password/reset_password_success.dart';
import 'package:dlcf/screens/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: RouteNames.loadingPage,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: LoadingPage(),
          );
        },
        routes: [
          GoRoute(
            path: RouteNames.onboarding,
            name: RouteNames.onboarding,
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: Onboarding(),
              );
            },
          ),
          GoRoute(
            path: RouteNames.signup,
            name: RouteNames.signup,
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: SignUp(),
              );
            },
          ),
          GoRoute(
            path: RouteNames.login,
            name: RouteNames.login,
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: Login(),
              );
            },
          ),
          GoRoute(
            path: RouteNames.home,
            name: RouteNames.home,
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: HomeScreen(),
              );
            },
          ),
          GoRoute(
            path: '${RouteNames.gallerycategoryimages}:id/:name',
            name: RouteNames.gallerycategoryimages,
            pageBuilder: (context, state) {
              return MaterialPage(
                child: GalleryCategoryImagesScreen(
                  categoryId: state.params['id']!,
                  categoryName: state.params['name']!,
                ),
              );
            },
          ),
          GoRoute(
            path: RouteNames.churchdocuments,
            name: RouteNames.churchdocuments,
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: ChurchDocumentScreen(),
              );
            },
          ),
          GoRoute(
            path: '${RouteNames.readdocument}:id/:title/:document',
            name: RouteNames.readdocument,
            pageBuilder: (context, state) {
              return MaterialPage(
                child: DocumentDetailScreen(
                  id: state.params['id']!,
                  document: state.params['document']!,
                  title: state.params['title']!,
                ),
              );
            },
          ),
          GoRoute(
            path: RouteNames.verifyotp,
            name: RouteNames.verifyotp,
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: VerifyOtp(),
              );
            },
          ),
          GoRoute(
            path: RouteNames.otpverified,
            name: RouteNames.otpverified,
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: OTPVerified(),
              );
            },
          ),
          GoRoute(
            path: RouteNames.resetpassword,
            name: RouteNames.resetpassword,
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: ResetPassword(),
              );
            },
          ),
          GoRoute(
            path: RouteNames.resetpasswordsuccess,
            name: RouteNames.resetpasswordsuccess,
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: ResetPasswordSuccess(),
              );
            },
          ),
          GoRoute(
            path: RouteNames.discover,
            name: RouteNames.discover,
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: Discover(),
              );
            },
          ),
          GoRoute(
            path: RouteNames.bookmarks,
            name: RouteNames.bookmarks,
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: BookmarksScreen(),
              );
            },
          ),
          GoRoute(
            path: RouteNames.notes,
            name: RouteNames.notes,
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: Notes(),
              );
            },
          ),
          GoRoute(
            path: RouteNames.addnote,
            name: RouteNames.addnote,
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: AddNoteFormScreen(),
              );
            },
          ),
          GoRoute(
            path: '${RouteNames.editnote}:noteID/:title/:note',
            name: RouteNames.editnote,
            pageBuilder: (context, state) {
              return MaterialPage(
                child: EditNoteFormScreen(
                  noteID: state.params['noteID']!.toString(),
                  title: state.params['title']!,
                  note: state.params['note']!,
                ),
              );
            },
          ),
          GoRoute(
            path: '${RouteNames.notedetail}:id/:title/:note/:createdAt',
            name: RouteNames.notedetail,
            pageBuilder: (context, state) {
              return MaterialPage(
                child: NoteDetailScreen(
                  id: state.params['id']!.toString(),
                  title: state.params['title']!,
                  note: state.params['note']!,
                  createdAt: state.params['createdAt']!,
                ),
              );
            },
          ),
          GoRoute(
            path: RouteNames.notification,
            name: RouteNames.notification,
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: NotificationScreen(),
              );
            },
          ),
          GoRoute(
            path: RouteNames.profile,
            name: RouteNames.profile,
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: Profile(),
              );
            },
          ),
          GoRoute(
            path: RouteNames.membershipform,
            name: RouteNames.membershipform,
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: MembershipFormScreen(),
              );
            },
          ),
          GoRoute(
            path: RouteNames.membershipdetail,
            name: RouteNames.membershipdetail,
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: MembersshipInfoDetailScreen(),
              );
            },
          ),
          GoRoute(
            path:
                '${RouteNames.video}:url/:title/:description/:preacher/:thumbnailUrl',
            name: RouteNames.video,
            pageBuilder: (context, state) {
              return MaterialPage(
                child: VideoScreen(
                  url: state.params['url']!,
                  title: state.params['title']!,
                  description: state.params['description']!,
                  preacher: state.params['preacher']!,
                  thumbnailUrl: state.params['thumbnailUrl']!,
                ),
              );
            },
          ),
          GoRoute(
            path: '${RouteNames.channelmessages}:channelName/:channelID',
            name: RouteNames.channelmessages,
            pageBuilder: (context, state) {
              return MaterialPage(
                child: ChannelMessages(
                  channelName: state.params['channelName']!,
                  channelID: state.params['channelID']!,
                ),
              );
            },
          ),
          GoRoute(
            path: RouteNames.give,
            name: RouteNames.give,
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: GiveScreen(),
              );
            },
          ),
          GoRoute(
            path: RouteNames.doctrine,
            name: RouteNames.doctrine,
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: DoctrineScreen(),
              );
            },
          ),
          GoRoute(
            path: '${RouteNames.doctrinedetail}:id/:title/:body',
            name: RouteNames.doctrinedetail,
            pageBuilder: (context, state) {
              return MaterialPage(
                child: DoctrineDetailScreen(
                  body: state.params['body']!,
                  id: int.parse(state.params['id']!),
                  title: state.params['title']!,
                ),
              );
            },
          ),
          GoRoute(
            path: '${RouteNames.givemomo}:network',
            name: RouteNames.givemomo,
            pageBuilder: (context, state) {
              return MaterialPage(
                child: GiveMomoScreen(
                  network: state.params['network']!,
                ),
              );
            },
          ),
          GoRoute(
            path: RouteNames.givesuccess,
            name: RouteNames.givesuccess,
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: GiveSuccessful(),
              );
            },
          ),
          GoRoute(
            path: RouteNames.aboutus,
            name: RouteNames.aboutus,
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: AboutUsPage(),
              );
            },
          ),
          GoRoute(
            path: RouteNames.leaders,
            name: RouteNames.leaders,
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: LeadersScreen(),
              );
            },
          ),
          GoRoute(
            path: RouteNames.error,
            name: RouteNames.error,
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: ErrorScreen(),
              );
            },
          ),
        ],
      ),
    ],
  );
}
