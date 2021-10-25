import '../../unifedi_api_model.dart';
import 'chat/unifedi_api_instance_chat_limits_model.dart';
import 'field/unifedi_api_instance_field_limits_model.dart';
import 'media/unifedi_api_instance_media_limits_model.dart';
import 'poll/unifedi_api_instance_poll_limits_model.dart';
import 'status/unifedi_api_instance_status_limits_model.dart';

abstract class IUnifediApiInstanceLimits implements IUnifediApiResponsePart {
  IUnifediApiInstancePollLimits? get poll;

  IUnifediApiInstanceFieldLimits? get field;

  IUnifediApiInstanceMediaLimits? get media;

  IUnifediApiInstanceChatLimits? get chat;

  IUnifediApiInstanceStatusLimits? get status;
}
