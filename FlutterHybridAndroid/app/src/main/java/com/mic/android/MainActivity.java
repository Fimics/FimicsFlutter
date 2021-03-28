package com.mic.android;

import android.os.Bundle;
import android.view.View;
import android.widget.EditText;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        EditText paramInput = findViewById(R.id.paramInput);
        findViewById(R.id.jump).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String inputParams = paramInput.getText().toString().trim();
                FlutterAppActivity.start(MainActivity.this, inputParams);
            }
        });
    }
}
