package me.hiroaki.smartfinance.view;

import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.EditText;

import me.hiroaki.smartfinance.R;

public class InputDebtActivity extends AppCompatActivity {

    FloatingActionButton fab;
    EditText name, mount, interest, payment, times;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_input_debt);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        findViewByIds();
        setListeners();
    }

    private void findViewByIds() {
        fab = (FloatingActionButton) findViewById(R.id.fab);
        name = (EditText) findViewById(R.id.name);
        mount = (EditText) findViewById(R.id.mount);
        interest = (EditText) findViewById(R.id.interest);
        payment = (EditText) findViewById(R.id.payment);
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
