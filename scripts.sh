###
 # @Author: clingxin
 # @Date: 2021-05-24 10:12:55
 # @LastEditors: clingxin
 # @LastEditTime: 2021-05-24 10:38:55
 # @FilePath: /flutter_firebase_test/scripts.sh
###
# android
 1, set applicationId to io.caolingxin.* in android/app/build.gradle
 2, search and replace com.example.* to io.caolingxin.* in related files in android
 3, set minSkdVersion to 21 in android/app/build.gradle
 # in firebase console
 1, create a new application
 2, register app for android with same applicationID
 3, download google-service.json to android/app/
 4, add classpath'com.google.gms:google-services:4.3.8' into android/gradle/build.gradle
 5, add apply plugin: 'com.google.gms.google-services' into android/app/build.gradle

 # ios
1, open ios folder in xcode
2, Runner/General change bundle Identifier to io.caolingxin.*
# in firebase console
1, register app for ios with same applicationID
2, download GoogleService-Info.plist into xcode/Runner/Runner, make sure check the "Copy items if needed"

# provision firestore database for test
1, setup the database in test mode
2, add flutter dependents