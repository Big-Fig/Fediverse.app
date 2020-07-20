package com.fediverse.app2

import android.os.Bundle
import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import android.app.NotificationManager;
import android.content.Context;

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
    }


    override protected fun onResume() {
        super.onResume()
        // Removing All Notifications
        cancelAllNotifications()
    }

    private fun cancelAllNotifications() {
        val notificationManager: NotificationManager =
                getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        notificationManager.cancelAll()
    }
}
