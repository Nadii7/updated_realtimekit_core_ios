import Flutter
import RealtimeKitFlutterCoreKMM

class RtkVideoViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger
    var mobileClient: CoreRealtimeKitClient

    init(messenger: FlutterBinaryMessenger, client: CoreRealtimeKitClient) {
        self.messenger = messenger
        mobileClient = client
        super.init()
    }

    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }

    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        guard let map = args as? [String: Any],
              let isSelfParticipant = map["isSelfParticipant"] as? Bool
        else {
            NSLog("RealtimeKit: invalid video view arguments: \(String(describing: args))")
            return RtkEmptyPlatformView(frame: frame)
        }

        let participant: CoreRtkMeetingParticipant
        if isSelfParticipant {
            participant = mobileClient.localUser
        } else {
            guard let id = map["id"] as? String,
                  let remoteParticipant = mobileClient.participants.joined.first(where: { $0.id == id })
            else {
                NSLog("RealtimeKit: remote video participant was missing or not joined")
                return RtkEmptyPlatformView(frame: frame)
            }
            participant = remoteParticipant
        }

        return RtkVideoView(frame: frame, viewIdentifier: viewId, participant: participant)
    }
}

private final class RtkEmptyPlatformView: NSObject, FlutterPlatformView {
    private let container: UIView

    init(frame: CGRect) {
        container = UIView(frame: frame)
        super.init()
    }

    func view() -> UIView {
        container
    }
}
