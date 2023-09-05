package basic_utilities_main; 

import androidx.annotation.NonNull;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.BinaryMessenger;

public class BasicUtilitiesCk implements FlutterPlugin {

    // Add any necessary fields or methods here

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        // Initialize your plugin when it's attached to the Flutter engine
        // You can access the binary messenger and other Flutter services here
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        // Clean up resources when your plugin is detached from the Flutter engine
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        // Initialize your plugin when it's attached to an activity
        // This is usually where you'd set up any platform-specific functionality
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {
        // Clean up resources when your plugin is detached due to configuration changes
    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
        // Reinitialize your plugin when it's reattached after configuration changes
    }

    @Override
    public void onDetachedFromActivity() {
        // Clean up resources when your plugin is detached from an activity
    }

    // Add any other methods and functionality specific to your plugin here
}
