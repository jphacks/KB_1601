package me.hiroaki.smartfinance.view;

import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.EditText;

import me.hiroaki.smartfinance.R;

public class InputAssetActivity extends AppCompatActivity {

    FloatingActionButton fab;
    EditText name, balance, interest, times;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_input_asset);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        findViewByIds();
        setListeners();
    }

    private void findViewByIds() {
        fab = (FloatingActionButton) findViewById(R.id.fab);
        name = (EditText) findViewById(R.id.name);
        balance = (EditText) findViewById(R.id.balance);
        interest = (EditText) findViewById(R.id.interest);
        times = (EditText) findViewById(R.id.times);
    }

    private void setListeners() {
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

            }
        });
    }

}
