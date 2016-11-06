package me.hiroaki.smartfinance.view;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.View;
import android.widget.EditText;

import com.xignite.sdk.api.webservices.XigniteGlobalCurrencies.Models.Currencies;
import com.xignite.sdk.api.webservices.XigniteGlobalCurrencies.XigniteGlobalCurrencies;
import com.xignite.sdk.api.webservices.XigniteGlobalQuotes.*;
import com.xignite.sdk.exceptions.XigniteApiException;


import me.hiroaki.smartfinance.R;

public class ExpensiveActivity extends AppCompatActivity {
    private static final String TAG = ExpensiveActivity.class.getSimpleName();

    FloatingActionButton fab;
    EditText name, mount, payment, interest, times;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_expensive);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        findViewByIds();
        setListeners();
    }

    private void findViewByIds() {
        fab = (FloatingActionButton) findViewById(R.id.fab);
        name = (EditText) findViewById(R.id.name);
        mount = (EditText) findViewById(R.id.mount);
        payment = (EditText) findViewById(R.id.payment);
        interest = (EditText) findViewById(R.id.interest);
        times = (EditText) findViewById(R.id.times);
    }

    private void setListeners() {
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                XigniteGlobalCurrencies currencies = new XigniteGlobalCurrencies("BB5E376504C5430A8012AF4B1C6D3E96");
                Currencies list = null;
                try {
                    list = currencies.listActiveCurrencies();
                } catch (XigniteApiException e) {
                    e.printStackTrace();
                }

                if (list.Outcome.equals("Success")) {
                    for (int i = 0; i < list.CurrencyList.length; i++) {
                        System.out.println(list.CurrencyList[i].Symbol + ": " + list.CurrencyList[i].Name);
                    }
                } else {
                    System.out.println("Call failed: " + list.Message);
                }
                Log.d(TAG, "Call took: " + list.Delay);


                Intent intent = new Intent(ExpensiveActivity.this, ResultActivity.class);
                startActivity(intent);
            }
        });
    }

}
