package com.example;

// public class TestView extends AppCompatActivity {

import com.synconset.FakeR;
import android.app.Activity;
import android.app.ActionBar;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.TextView;

public class TestView extends Activity {
    private static final String TAG = "TestView";
    private FakeR fakeR;
    
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        fakeR = new FakeR(this);
        setContentView(fakeR.getId("layout", "activity_main"));
    }

    public void cancelClicked(View ignored) {
        setResult(RESULT_OK, null);
        finish();
    }
}
