package com.example.evgenijastasin.testfilemanager;

import android.os.Environment;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Log.e("file_path", getExternalFilesDir(null).toString());
        Log.e("file_path", Environment.getExternalStorageDirectory().toString());
    }
}

//storage/emulated/0/Android/data/com.example.evgenijastasin.testfilemanager/files
//storage/emulated/0
