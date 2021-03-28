package com.mic.android;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.ViewGroup;
import android.widget.FrameLayout;

import androidx.appcompat.app.AppCompatActivity;

import io.flutter.view.FlutterView;

public class FlutterAppActivity extends AppCompatActivity implements IShowMessage {
    public final static String INIT_PARAMS = "initParams";
    private UIPresenter uiPresenter;
    private BasicMessageChannelPlugin basicMessageChannelPlugin;
    private EventChannelPlugin eventChannelPlugin;

    public static void start(Context context, String initParams) {
        Intent intent = new Intent(context, FlutterAppActivity.class);
        intent.putExtra(INIT_PARAMS, initParams);
        context.startActivity(intent);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        String initParams = getIntent().getStringExtra(INIT_PARAMS);
        FlutterView flutterView = new FlutterView(this);
        FrameLayout.LayoutParams layout =
            new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        setContentView(flutterView, layout);
        eventChannelPlugin = EventChannelPlugin.registerWith(flutterView);
        //注册Flutter plugin
        MethodChannelPlugin.registerWith(flutterView);
        basicMessageChannelPlugin = BasicMessageChannelPlugin.registerWith(flutterView);
        uiPresenter = new UIPresenter(this, "通信与混合开发", this);
    }

    @Override
    public void onShowMessage(String message) {
        uiPresenter.showDartMessage(message);
    }

    @Override
    public void sendMessage(String message, boolean useEventChannel) {
        if (useEventChannel) {
            eventChannelPlugin.send(message);
        } else {
            basicMessageChannelPlugin.send(message, this::onShowMessage);
        }
    }
}
