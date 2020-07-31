package mt.innovation.flurry;

import android.content.Context;
import android.util.Log;

import com.flurry.android.FlurryAgent;
import com.flurry.android.FlurryAgentListener;
import java.util.HashMap;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FlurryPlugin */
public class FlurryPlugin implements MethodCallHandler {

  private Context activity;
  private MethodChannel channel;

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "flurry");
    channel.setMethodCallHandler(new FlurryPlugin(registrar.activeContext(), channel));
  }

  public FlurryPlugin(Context activity, MethodChannel channel) {
    this.activity = activity;
    this.channel = channel;
    this.channel.setMethodCallHandler(this);
  }

  // private void logEvent(String message, Map<String, String> params) {
  //   FlurryAgent.logEvent(message, params);
  // }

  private void setUserId(String userId) {
    FlurryAgent.setUserId(userId);
  }

  @Override
  public void onMethodCall(MethodCall call, final Result result) {
    if (call.method.equals("initialize")) {
      String API_KEY = call.argument("api_key_android");
      boolean showLog = call.argument("is_log_enabled");

      // initializeFlurry(API_KEY, showLog);

      new FlurryAgent.Builder().withLogEnabled(showLog).withCaptureUncaughtExceptions(true)
          .withContinueSessionMillis(10000).withLogLevel(Log.DEBUG).withListener(new FlurryAgentListener() {
            @Override
            public void onSessionStarted() {
              // result.success(null);
            }
          }).build(activity, API_KEY);
          result.success(null);
    } else if (call.method.equals("logEvent")) {
      String message = call.argument("message").toString();
      // logEvent(message, call.argument("params"));
      HashMap<String, String> params = call.argument("params");
      FlurryAgent.logEvent(message, params);
      result.success(null);

    } else if (call.method.equals("userId")) {
      String userId = call.argument("userId").toString();
      setUserId(userId);
      result.success(null);

    } else {
      result.notImplemented();
    }
  }
}
