enum InstanceLocation { local, remote }

extension InstanceLocationExtension on InstanceLocation {
  bool get isLocal => this == InstanceLocation.local;

  bool get isRemote => this == InstanceLocation.remote;
}
