// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en_US = {
  "app": {
    "theme": {
      "chooser": {
        "label": "Color scheme"
      },
      "type": {
        "dark": "Dark",
        "light": "Light",
        "system": "System"
      }
    },
    "custom_list": {
      "title": "\"{}\" list statuses",
      "accounts": {
        "label": "Accounts in list",
        "action": {
          "add": "Add following account"
        }
      },
      "create": {
        "title": "Create list"
      },
      "edit": {
        "title": "Edit list"
      },
      "list": {
        "title": "Lists"
      },
      "form": {
        "field": {
          "title": {
            "label": "Title*",
            "hint": "List name"
          }
        }
      }
    },
    "emoji": {
      "custom": {
        "empty": "This instance don't have custom emojis"
      },
      "recent": {
        "empty": "No recent emojis"
      },
      "category": {
        "empty": "This category don't have suitable emojis"
      }
    },
    "share": {
      "title": "Share",
      "external": {
        "title": "Share to external app",
        "field": {
          "share_as_link": "Share as link"
        },
        "progress": {
          "title": "Share",
          "progress": {
            "content": "Sharing..."
          }
        }
      },
      "toast": {
        "success": "Shared successfully"
      },
      "with_message": {
        "field": {
          "message": {
            "label": "Message",
            "hint": "Describe content (optional)"
          }
        }
      },
      "action": {
        "share": "Share",
        "share_to_external": "Share to external app",
        "share_to_chats": "Share to Chats",
        "share_to_conversations": "Share to DMs"
      }
    },
    "poll": {
      "metadata": {
        "hide_results": "Hide results",
        "show_results": "View results",
        "expires": {
          "expired": "Poll ended",
          "not_expired": "{} left"
        },
        "total_votes": "{} votes"
      },
      "vote": "Vote"
    },
    "datetime": {
      "title": "Select date",
      "picker": {
        "action": {
          "ok": "Set time",
          "cancel": "Cancel"
        }
      }
    },
    "account": {
      "statuses": {
        "tab": {
          "with_replies": "With replies",
          "without_replies": "Posts",
          "pinned": "Pinned",
          "media": "Media"
        }
      },
      "list": {
        "privacy": "Some information may be missed due to privacy settings"
      },
      "follower": {
        "title": "{} followers"
      },
      "following": {
        "title": "{} followings"
      },
      "action": {
        "follow": "Follow",
        "request_follow": "Request follow",
        "unfollow": "Unfollow",
        "follow_requested": "Requested",
        "message": "Message",
        "block": "Block",
        "unblock": "Unblock",
        "block_domain": "Block domain {}",
        "unblock_domain": "Unblock domain {}",
        "mute": "Mute",
        "unmute": "Unmute",
        "open_in_browser": "Open in browser",
        "report": {
          "label": "Report",
          "success": {
            "toast": "Successfully reported"
          },
          "fail": {
            "title": "Failed to report",
            "content": "Something wrong"
          }
        },
        "popup": {
          "title": "More actions for:"
        }
      },
      "info": {
        "followers": "Followers",
        "following": "Following",
        "statuses": "Statuses"
      },
      "my": {
        "follow_request": {
          "title": "Follow requests"
        },
        "account_block": {
          "title": "Account blocks"
        },
        "account_mute": {
          "title": "Account mutes"
        },
        "domain_block": {
          "title": "Domain blocks"
        },
        "statuses": {
          "bookmarked": {
            "title": "Bookmarks"
          },
          "favourited": {
            "title": "Favourites"
          }
        },
        "settings": {
          "title": "Account settings",
          "field": {
            "websockets_enabled": {
              "label": "WebSockets real-time updates",
              "description": "Disable to reduce battery usage"
            },
            "new_chats_enabled": {
              "label": "Replace DM with chats",
              "description": "Not supported on non-Pleroma instances"
            },
            "always_show_spoiler": {
              "label": "Show spoilers by default"
            },
            "always_show_nsfw": {
              "label": "Show NSFW by default"
            },
            "default_visibility": {
              "label": "Default post visibility"
            },
            "media_nsfw_by_default": {
              "label": "Mark media NSFW by default"
            },
            "media_auto_init": {
              "label": "Media auto-init"
            },
            "media_auto_play": {
              "label": "Media auto-play"
            }
          },
          "action": {
            "scheduled_posts": "Scheduled posts",
            "draft_posts": "Draft posts",
            "lists": "Lists",
            "bookmarked": "Bookmarks",
            "favourited": "Favourites",
            "follow_requests": "Follow requests",
            "account_blocks": "Account blocks",
            "account_mutes": "Account mutes",
            "domain_blocks": "Domain blocks"
          }
        },
        "edit": {
          "title": "Edit account",
          "media": {
            "upload": {
              "failed": {
                "notification": {
                  "title": "Failed to upload",
                  "exceed_size": {
                    "content": "File size is {} MB, but max is {} MB"
                  }
                }
              }
            }
          },
          "action": {
            "save": "Save"
          },
          "unsaved": {
            "dialog": {
              "title": "You have unsaved changes",
              "action": {
                "discard": "Discard"
              }
            }
          },
          "field": {
            "avatar": {
              "dialog": {
                "title": "Confirm selection?",
                "action": {
                  "select_and_crop": "Select & crop",
                  "cancel": "Cancel"
                }
              }
            },
            "header": {
              "label": "Header",
              "dialog": {
                "title": "Confirm selection?",
                "action": {
                  "select": "Select",
                  "crop": "Crop",
                  "cancel": "Cancel"
                }
              }
            },
            "background_image": {
              "label": "Background image",
              "action": {
                "add": "Add"
              }
            },
            "display_name": {
              "label": "Display name*"
            },
            "note": {
              "label": "Note"
            },
            "locked": {
              "label": "Locked to followers only"
            },
            "custom_field": {
              "label": "Link field #{}",
              "name": {
                "label": "Name*"
              },
              "value": {
                "label": "URL*"
              },
              "action": {
                "add_new": "Add link field"
              }
            }
          }
        }
      },
      "select": {
        "title": "Select account"
      }
    },
    "async": {
      "pleroma": {
        "error": {
          "common": {
            "dialog": {
              "title": "Pleroma API error",
              "content": "Message: {}"
            }
          },
          "throttled": {
            "dialog": {
              "title": "Throttled. Server blocked action.",
              "content": "Too much operations per minute. Please wait before do something again."
            }
          },
          "invalid_credentials": {
            "dialog": {
              "title": "Invalid credentials",
              "content": "Session expired"
            }
          }
        }
      },
      "socket": {
        "error": {
          "dialog": {
            "title": "Check your connection",
            "content": "No network or remote server unavailable"
          }
        }
      },
      "timeout": {
        "error": {
          "dialog": {
            "title": "Timeout reached",
            "content": "No network or remote server unavailable"
          }
        }
      }
    },
    "auth": {
      "instance": {
        "logout": {
          "dialog": {
            "title": "Log Out",
            "content": "Log out of {}"
          }
        },
        "chooser": {
          "action": {
            "add_instance": "Add account"
          }
        },
        "current": {
          "context": {
            "loading": {
              "loading": {
                "title": "Loading Instance",
                "content": "{}"
              },
              "cant_load": {
                "content": "Can't load {} instance.\nApp error or session expired",
                "action": {
                  "refresh": "Refresh",
                  "choose_different_account": "Choose different account",
                  "logout": "Logout"
                }
              }
            }
          }
        },
        "join": {
          "new": {
            "title": "Join new instance"
          },
          "action": {
            "tos": {
              "prefix": "By using Fedi, you agree to our ",
              "terms": "Terms",
              "postfix": "."
            },
            "login": "Login",
            "sign_up": "Sign up"
          },
          "field": {
            "host": {
              "hint": "Fedi.app",
              "helper": "Pleroma or Mastodon Instance"
            }
          },
          "progress": {
            "dialog": {
              "content": "Checking instance"
            }
          },
          "fail": {
            "dialog": {
              "title": "Fail to connect to instance. You can try verified fedi.app or pleroma.com",
              "content": "Details: {}"
            }
          },
          "registration_disabled": {
            "dialog": {
              "title": "Instance owner disabled registration",
              "content": "Try any other instance, like fedi.app"
            }
          },
          "invites_only": {
            "dialog": {
              "title": "Instance owner limit registration to invites-only",
              "content": "Try any other instance, or register by invite link in your browser"
            }
          }
        },
        "register": {
          "title": "Create account",
          "approval_required": {
            "notification": {
              "title": "Success registration",
              "content": "You can once moderators will approve your account"
            }
          },
          "field": {
            "username": {
              "label": "Username*",
              "hint": "e.g. lain",
              "error": {
                "invalid": "Please enter a valid username"
              }
            },
            "captcha": {
              "label": "Captcha*",
              "hint": "Characters from picture"
            },
            "email": {
              "label": "Email Address*",
              "hint": "you@example.com",
              "error": {
                "invalid": "Please enter a valid email"
              }
            },
            "password": {
              "label": "Password*",
              "hint": "Password",
              "error": {
                "too_small": "Password must be at least 4 characters"
              }
            },
            "confirm_password": {
              "label": "Password confirmation*",
              "hint": "Password",
              "error": {
                "not_match": "Password and password confirmation must match"
              }
            }
          },
          "progress": {
            "dialog": {
              "content": "Creating account"
            }
          },
          "success": {
            "dialog": {
              "title": "Success",
              "content": "You can now login with given credentials"
            }
          },
          "fail": {
            "dialog": {
              "title": "Server Error",
              "content": "Response: {}"
            }
          },
          "action": {
            "create_account": "Sign up"
          }
        }
      }
    },
    "chat": {
      "share": {
        "title": "Share to chats"
      },
      "list": {
        "new_items": {
          "action": {
            "tap_to_load_new": {
              "one": "{} new chat. Tap to load.",
              "other": "{} new chats. Tap to load."
            }
          }
        }
      },
      "accounts": {
        "title": "Chat accounts"
      },
      "action": {
        "more": "More"
      },
      "preview": {
        "you": "You: {}"
      },
      "start": {
        "title": "Start chat"
      },
      "post": {
        "field": {
          "content": {
            "hint": "Start a message"
          }
        },
        "error": {
          "empty": {
            "dialog": {
              "title": "Can't send empty message"
            }
          }
        },
        "action": {
          "post": "Post"
        }
      }
    },
    "conversation": {
      "share": {
        "title": "Share to DMs"
      },
      "post": {
        "field": {
          "content": {
            "hint": "Start a message"
          }
        }
      },
      "list": {
        "new_items": {
          "action": {
            "tap_to_load_new": {
              "one": "{} new conversation. Tap to load.",
              "other": "{} new conversations. Tap to load."
            }
          }
        }
      },
      "accounts": {
        "title": "Conversation accounts"
      },
      "action": {
        "more": "More"
      },
      "preview": {
        "you": "You: {}"
      },
      "start": {
        "title": "Start conversation"
      }
    },
    "file": {
      "image": {
        "crop": {
          "title": "Crop as"
        }
      }
    },
    "home": {
      "tab": {
        "timelines": {
          "tab": {
            "public": "All",
            "home": "Home",
            "local": "Local"
          }
        },
        "conversations": {
          "title": "DM",
          "action": {
            "switch_to_chats": "To Chats"
          }
        },
        "chats": {
          "title": "Chats",
          "not_supported_on_mastodon": "Chats not supported on Mastodon instances",
          "not_supported_on_pleroma": "This instance don't support chats yet",
          "action": {
            "switch_to_dms": "To DM"
          }
        }
      }
    },
    "notification": {
      "action": {
        "popup": {
          "title": "Notification actions"
        },
        "mark_as_read": "Mark as read",
        "dismiss": "Dismiss"
      },
      "list": {
        "new_items": {
          "action": {
            "tap_to_load_new": {
              "one": "{} new notification. Tap to load.",
              "other": "{} new notifications. Tap to load."
            }
          }
        }
      },
      "push": {
        "settings": {
          "title": "Push notifications settings",
          "field": {
            "favourites": {
              "label": "Favourites"
            },
            "follows": {
              "label": "Follows"
            },
            "mentions": {
              "label": "Mentions"
            },
            "reblogs": {
              "label": "Reblogs"
            },
            "polls": {
              "label": "Polls"
            },
            "chat": {
              "label": "Chat"
            }
          }
        }
      },
      "header": {
        "follow": "Followed you",
        "favourite": "Liked: {}",
        "mention": "<b>Mentioned you:</b> {}",
        "reblog": "Reblogged: {}",
        "poll": "Poll notification",
        "move": "Move notification",
        "followRequest": "Follow request",
        "pleromaEmojiReaction": "{} for: \"{}\"",
        "pleromaChatMention": "Chat mention in \"{}\"",
        "unknown": "Unknown: {}"
      },
      "dismissed": "Dismissed"
    },
    "timeline": {
      "loading": "Loading timelines",
      "create": {
        "title": "Create new timeline",
        "field": {
          "title": {
            "label": "Title",
            "hint": "Timeline name"
          },
          "id": {
            "label": "Unique id"
          }
        }
      },
      "type": {
        "home": "Home",
        "public": "Public",
        "custom_list": "List",
        "hashtag": "Hashtag",
        "account": "Account",
        "field": {
          "label": "Type",
          "null": "Not selected",
          "chooser": {
            "dialog": {
              "title": "Choose timeline type"
            }
          }
        }
      },
      "storage": {
        "title": "Timelines",
        "empty": "Nothing found"
      },
      "settings": {
        "title": "'{}' timeline settings",
        "reply_visibility_filter": {
          "self": "Self",
          "following": "Following",
          "field": {
            "label": "Reply visibility filter",
            "null": "Not selected",
            "chooser": {
              "dialog": {
                "title": "Choose reply visibility filter"
              }
            }
          }
        },
        "only_from_remote_account": {
          "field": {
            "label": "Only from account",
            "null": "Not selected"
          }
        },
        "with_remote_hashtag": {
          "field": {
            "label": "With hashtag",
            "hint": "pleroma"
          }
        },
        "only_in_remote_list": {
          "field": {
            "label": "Only in list",
            "null": "Not selected",
            "chooser": {
              "dialog": {
                "title": "Choose list"
              }
            }
          }
        },
        "field": {
          "not_supported": {
            "desc": "Not supported on this instance"
          },
          "only_with_media": {
            "label": "Only with media"
          },
          "only_remote": {
            "label": "Only remote"
          },
          "web_sockets_updates": {
            "label": "WebSockets updates",
            "disabled": {
              "desc": "WebSockets disabled in account settings"
            }
          },
          "only_local": {
            "label": "Only local"
          },
          "only_pinned": {
            "label": "Only pinned"
          },
          "with_muted": {
            "label": "With muted"
          },
          "exclude_reblogs": {
            "label": "Exclude reblogs"
          },
          "exclude_replies": {
            "label": "Exclude replies"
          },
          "exclude_nsfw": {
            "label": "Exclude NSFW"
          }
        }
      }
    },
    "list": {
      "empty": "Items not found",
      "cant_update_from_network": "Can't update from network",
      "loading": {
        "state": {
          "can_loading": "Can load more",
          "no_more_data": "No more data",
          "failed": "Failed to load more"
        }
      },
      "refresh": {
        "unable_to_fetch": "Unable to refresh",
        "up_to_date": "Everything up to date"
      }
    },
    "media": {
      "player": {
        "error": {
          "desc": "Something wrong",
          "action": {
            "reload": "Reload",
            "more_details": "More details"
          }
        }
      },
      "attachment": {
        "type": {
          "gallery": "Gallery",
          "photo": "Photo",
          "video": "Video",
          "file": "File",
          "audio": "Audio"
        },
        "add_to_gallery": {
          "progress": {
            "content": "Saving..."
          },
          "success": {
            "toast": "Saved"
          },
          "error": {
            "dialog": {
              "title": "Can't save media",
              "content": "Media type is not supported, network not available or permission not granted"
            }
          }
        },
        "details": {
          "title": "Media attachment",
          "not_supported_type": "Not supported type {}"
        },
        "upload": {
          "failed": {
            "notification": {
              "title": "Failed to upload",
              "exceed_size": {
                "content": "File size is {} MB, but max is {} MB"
              }
            }
          },
          "remove": {
            "dialog": {
              "content": "Are you sure you want to remove the attachment?",
              "action": {
                "remove": "Remove",
                "cancel": "Cancel"
              }
            }
          }
        }
      }
    },
    "search": {
      "title": "Search",
      "recent": {
        "title": "Recent",
        "empty": "No recent searches"
      },
      "tab": {
        "all": "All",
        "accounts": "Users",
        "statuses": "Posts",
        "hashtags": "Hashtags"
      },
      "desc": {
        "empty": "Search term is empty",
        "value": "Results for: '{}'"
      },
      "field": {
        "input": {
          "hint": "Search"
        }
      }
    },
    "splash": {
      "state": {
        "error": "Error during initialization. Try to re-install app"
      }
    },
    "status": {
      "draft": {
        "title": "Drafts",
        "state": {
          "canceled": "Canceled",
          "already_posted": "Already posted"
        },
        "edit": {
          "title": "Edit Draft"
        }
      },
      "emoji": {
        "error": {
          "cant_add": {
            "dialog": {
              "title": "Can't add emoji",
              "content": "Error: {}"
            }
          }
        }
      },
      "thread": {
        "start": {
          "loading": "Loading start status"
        },
        "post": {
          "hint": "Reply to @{}"
        }
      },
      "list": {
        "new_items": {
          "action": {
            "tap_to_load_new": {
              "one": "{} new post. Tap to load.",
              "other": "{} new posts. Tap to load."
            }
          }
        }
      },
      "scheduled": {
        "title": "Queue",
        "state": {
          "canceled": "Canceled",
          "already_posted": "Already posted"
        },
        "datetime": {
          "picker": {
            "title": "Schedule"
          }
        },
        "edit": {
          "title": "Scheduled post"
        }
      },
      "share": {
        "title": "Share status",
        "progress": {
          "content": "Sharing..."
        }
      },
      "collapsible": {
        "action": {
          "collapse": "Collapse",
          "expand": "Expand"
        }
      },
      "action": {
        "delete": "Delete",
        "comment": "Comment",
        "favourite": "Favourite",
        "reblog": "Reblog",
        "report": "Report",
        "mute": "Mute conversation",
        "unmute": "Unmute conversation",
        "open_in_browser": "Open in browser",
        "pin": "Pin",
        "unpin": "Unpin",
        "bookmark": "Bookmark",
        "unbookmark": "Unbookmark",
        "copy_link": "Copy link",
        "share_as_text": "Share as text",
        "share_as_link": "Share as link",
        "share_to_chats": "Share to Chats",
        "share_to_dms": "Share to DMs",
        "more": "More",
        "show_this_thread": "Show this thread",
        "popup": {
          "title": "Status Actions",
          "more_actions_for": "More actions for:"
        }
      },
      "nsfw": {
        "chip": "NSFW!",
        "action": {
          "view": "Tap to view"
        }
      },
      "deleted": {
        "desc": "Status deleted"
      },
      "spoiler": {
        "chip": "Spoilers!",
        "action": {
          "view": "Tap to view"
        }
      },
      "copy_link": {
        "toast": "Copied"
      },
      "favourited_by": {
        "title": "Favourited by"
      },
      "reblogged_by": {
        "title": "Reblogged by"
      },
      "post": {
        "poll": {
          "field": {
            "option": {
              "hint": "Option {}"
            },
            "multiply": {
              "label": "Multiple selection"
            },
            "length": {
              "label": "Poll length",
              "picker": {
                "title": "Poll length"
              }
            }
          }
        },
        "schedule": {
          "error": {
            "not_in_future": {
              "dialog": {
                "title": "Invalid time",
                "content": "Schedule time must be at least 5 minutes in the future"
              }
            }
          },
          "dialog": {
            "action": {
              "cancel": "Cancel",
              "edit": "Edit",
              "clear": "Clear"
            },
            "title": "Schedule",
            "content": {
              "not_scheduled": "Not scheduled",
              "scheduled": "Scheduled at: {}"
            }
          }
        },
        "dialog": {
          "async": {
            "content": "Posting..."
          },
          "error": {
            "title": {
              "post": "Failed to post status",
              "schedule": "Failed to schedule status"
            },
            "content": "Error: {}"
          }
        },
        "toast": {
          "success": {
            "post": "Status posted",
            "schedule": "Status scheduled"
          }
        },
        "action": {
          "post": "Post"
        },
        "visibility": {
          "title": "Visibility",
          "state": {
            "public": "Public",
            "unlisted": "Unlisted",
            "direct": "Direct",
            "list": "List",
            "private": "Private"
          },
          "action": {
            "cancel": "Cancel"
          }
        },
        "nsfw": {
          "title": "NSFW"
        },
        "mention": {
          "content": {
            "one": "1 mention",
            "many": "{} mentions"
          }
        },
        "error": {
          "empty": {
            "dialog": {
              "title": "Can't send empty message"
            }
          },
          "poll": {
            "dialog": {
              "title": "Enter at least two poll options"
            }
          }
        },
        "field": {
          "subject": "Subject (optional)",
          "message": {
            "hint": "What’s going on today?"
          }
        },
        "new": {
          "title": "New status",
          "unsaved": {
            "dialog": {
              "title": "You have unsaved changes",
              "action": {
                "save_as_draft": "Save as draft",
                "discard": "Discard"
              }
            }
          }
        }
      },
      "reblog": {
        "header": "reposted"
      },
      "reply": {
        "header": "reply to",
        "loading": {
          "progress": "Loading original status",
          "failed": "Failed to load original status"
        },
        "replying_to": "Replying to {}"
      }
    },
    "tos": {
      "title": "Terms of service"
    }
  },
  "async": {
    "init": {
      "state": {
        "not_started": "Async init not started",
        "failed": "Failed to init {}"
      }
    }
  },
  "camera": {
    "state": {
      "error": "Error: {}",
      "initializing": "Initializing",
      "not_initialized": "Non initialized"
    }
  },
  "file": {
    "picker": {
      "empty": "You don't have any media",
      "single": {
        "title": "Choose media",
        "video": {
          "confirm": {
            "dialog": {
              "title": "Video",
              "action": {
                "select": "Select",
                "cancel": "Cancel"
              }
            }
          }
        }
      }
    },
    "gallery": {
      "empty": "You don't have media",
      "state": {
        "loading_not_started": "Loading not started"
      },
      "folder": {
        "empty": "This folder doesn't have media"
      }
    }
  },
  "pagination": {
    "list": {
      "empty": "Nothing found"
    }
  },
  "permission": {
    "grant": {
      "action": {
        "grant": "Grant permission"
      }
    }
  },
  "dialog": {
    "progress": {
      "content": "Loading...",
      "action": {
        "cancel": "Cancel"
      }
    },
    "error": {
      "title": "Something wrong",
      "content": "An error has occurred. Please retry your action again. \n{}"
    },
    "action": {
      "ok": "OK",
      "cancel": "Cancel"
    }
  },
  "form": {
    "field": {
      "value": {
        "error": {
          "null": {
            "desc": "Required"
          }
        }
      },
      "text": {
        "email": {
          "error": {
            "invalid": {
              "desc": "Invalid email"
            }
          }
        },
        "url": {
          "error": {
            "invalid": {
              "desc": "Invalid URL"
            }
          }
        },
        "password": {
          "error": {
            "not_match": {
              "desc": "Password and confirm password must match"
            }
          }
        },
        "error": {
          "empty": {
            "desc": "Must be not empty"
          },
          "length": {
            "min_only": {
              "desc": "Must be at least {} characters"
            },
            "max_only": {
              "desc": "Must be less than {} characters"
            },
            "min_and_max": {
              "desc": "Must be between {} and {} characters"
            }
          }
        }
      }
    }
  },
  "link": {
    "error": {
      "dialog": {
        "title": "Can't launch URL",
        "content": "URL {} have invalid format"
      }
    }
  },
  "media": {
    "player": {
      "initializing": "Initializing: {}",
      "failed": "Failed to load: {}"
    }
  },
  "duration": {
    "day": {
      "one": "{} day",
      "many": "{} days",
      "other": "{} days"
    },
    "hour": {
      "one": "{} hour",
      "many": "{} hours",
      "other": "{} hours"
    },
    "minute": {
      "one": "{} minute",
      "many": "{} minutes",
      "other": "{} minutes"
    }
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en_US": en_US};
}
