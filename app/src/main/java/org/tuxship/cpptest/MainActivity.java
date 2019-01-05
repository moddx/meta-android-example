//
// Created by Matthias Ervens on 05/11/18.
// Copyright (c) 2018 Matthias Ervens. All rights reserved.
//

package org.tuxship.cpptest;

import android.app.Application;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.design.widget.FloatingActionButton;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.TextView;
import android.widget.Toast;


public class MainActivity extends AppCompatActivity {

    // Used to load the 'native-lib' library on application startup.
    static {
        System.loadLibrary("native-lib");
    }

    static Application STATIC_APP;

    private static Context getContext() {
        if(STATIC_APP == null) return null;
        return STATIC_APP.getApplicationContext();
    }

    TextView tv;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        STATIC_APP = this.getApplication();
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        // Example of a call to a native method
        tv = (TextView) findViewById(R.id.sample_text);
        tv.setText(stringFromJNI());

        Handler handler = new Handler(message -> {
            Log.d("Meta", "onCreate: " + message);

            tv.setText(message.getData().getString("text"));

            return true;
        });

        FloatingActionButton fab = findViewById(R.id.fab);
        fab.setOnClickListener(view -> {
            tv.setText("Calculating..");

            int n = (int) (Math.random() * 100d) % 16;
            Toast.makeText(this, "Rolled a " + n, Toast.LENGTH_SHORT).show();

            Thread t = new Thread(() -> {       // todo use a dedicated thread w/ looper to dispatch work
                int[] results = scheduleJNI(n);

                String text = stringFromJNI();
                for (int i = 0; i < results.length; i++) {
                    text += "\nn: " + i + ", fib: " + results[i];
                }

                Message m = new Message();
                Bundle b = new Bundle();
                b.putString("text", text);
                m.setData(b);
                handler.sendMessage(m);
            });
            t.start();
        });

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    /**
     * A native method that is implemented by the 'native-lib' native library,
     * which is packaged with this application.
     */
    public native String stringFromJNI();

    public native int[] scheduleJNI(int fibn);

}
