package com.example.demo32_wifi_list;

import android.net.wifi.ScanResult;
import android.net.wifi.WifiManager;
import android.os.Bundle;

import java.util.List;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

public class MainActivity extends FlutterActivity {
  private static final String CHANNEL = "samples.flutter.io/wifi";

  @Override
  public void onCreate(Bundle savedInstanceState) {

    super.onCreate(savedInstanceState);

    new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
            new MethodCallHandler() {
              @Override
              public void onMethodCall(MethodCall call, Result result) {
                if (call.method.equals("getWiFiList")) {
                  List<ScanResult> list = getWiFiList();
                  for (ScanResult scanResult : list) {
                    System.out.println("\n网络名：" + scanResult.SSID
                            + "，信号强度："+scanResult.level + "/n"
                            + "，地址：" + scanResult.BSSID + "/n"
                    );
                  }
                  result.success(1);
                } else {
                  result.notImplemented();
                }
              }
            });
  }

  private List<ScanResult> getWiFiList() {

    WifiManager wifiManager = (WifiManager) getApplicationContext().getSystemService(WIFI_SERVICE);
    return wifiManager.getScanResults();
  }
}
