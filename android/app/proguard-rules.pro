#Flutter Wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }
# prod flavor for flutter_config
-keep class com.fediverse.app.BuildConfig { *; }
# dev flavor for flutter_config
-keep class com.fediverse.app2.BuildConfig { *; }