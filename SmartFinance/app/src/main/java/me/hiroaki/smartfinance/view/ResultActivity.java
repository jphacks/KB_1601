package me.hiroaki.smartfinance.view;

import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.TextView;

import me.hiroaki.smartfinance.R;

public class ResultActivity extends AppCompatActivity {

    FloatingActionButton fab;
    TextView iHave, iNeed, potential, advice;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_result);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        findViewByIds();
        setListeners();

    }

    private void findViewByIds() {
        fab = (FloatingActionButton) findViewById(R.id.fab);
        iHave = (TextView) findViewById(R.id.i_have);
        iNeed = (TextView) findViewById(R.id.i_need);
        potential = (TextView) findViewById(R.id.potential);
        advice = (TextView) findViewById(R.id.advice);
    }

    private void setListeners() {
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

            }
        });
    }

}
