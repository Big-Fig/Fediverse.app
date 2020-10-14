package com.fediverse.app

import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.os.Build
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        registerNotificationChannels()
    }

    override fun onResume() {
        super.onResume()
        // Removing All Notifications
        cancelAllNotifications()
    }

    private fun registerNotificationChannels() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val notificationManager = getSystemService(NOTIFICATION_SERVICE) as NotificationManager

            registerNotificationChannel(notificationManager,
                    "follow",
                    getString(R.string.notification_channel_follow_title),
                    getString(R.string.notification_channel_follow_desc))
            registerNotificationChannel(notificationManager,
                    "favourite",
                    getString(R.string.notification_channel_favourite_title),
                    getString(R.string.notification_channel_favourite_desc))

            registerNotificationChannel(notificationManager,
                    "reblog",
                    getString(R.string.notification_channel_reblog_title),
                    getString(R.string.notification_channel_reblog_desc))
            registerNotificationChannel(notificationManager,
                    "mention",
                    getString(R.string.notification_channel_mention_title),
                    getString(R.string.notification_channel_mention_desc))
            registerNotificationChannel(notificationManager,
                    "poll",
                    getString(R.string.notification_channel_poll_title),
                    getString(R.string.notification_channel_poll_desc))
            registerNotificationChannel(notificationManager,
                    "move",
                    getString(R.string.notification_channel_move_title),
                    getString(R.string.notification_channel_move_desc))
            registerNotificationChannel(notificationManager,
                    "follow_request",
                    getString(R.string.notification_channel_follow_request_title),
                    getString(R.string.notification_channel_follow_request_desc))
            registerNotificationChannel(notificationManager,
                    "pleroma:emoji_reaction",
                    getString(R.string.notification_channel_pleroma_emoji_reaction_title),
                    getString(R.string.notification_channel_pleroma_emoji_reaction_desc))
            registerNotificationChannel(notificationManager,
                    "pleroma:chat_mention",
                    getString(R.string.notification_channel_pleroma_chat_mention_title),
                    getString(R.string.notification_channel_pleroma_chat_mention_desc))

        }
    }

    private fun registerNotificationChannel(
            notificationManager: NotificationManager,
            channelId: String, name: String, descriptionText: String) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val importance = NotificationManager.IMPORTANCE_DEFAULT
            val mChannel = NotificationChannel(channelId, name, importance)
            mChannel.description = descriptionText
            notificationManager.createNotificationChannel(mChannel)
        }
    }

    private fun cancelAllNotifications() {
        val notificationManager: NotificationManager =
                getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        notificationManager.cancelAll()
    }
}
