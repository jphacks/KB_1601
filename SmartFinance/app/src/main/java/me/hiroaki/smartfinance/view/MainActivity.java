package me.hiroaki.smartfinance.view;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorListenerAdapter;
import android.support.v4.view.animation.FastOutSlowInInterpolator;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.view.animation.Interpolator;

import io.realm.Realm;
import io.realm.RealmObject;
import io.realm.RealmQuery;
import io.realm.RealmResults;
import me.hiroaki.smartfinance.R;
import me.hiroaki.smartfinance.model.Account;

public class MainActivity extends AppCompatActivity {
    public static final int REQUEST_CODE_DEBT = 100;
    public static final int REQUEST_CODE_ASSET = 200;
    public static final int REQUEST_CODE_JOB = 300;

    private boolean mOpenFlag = false;
    RecyclerView recyclerView;
    FloatingActionButton open, debt, asset, job, done;
    static final Interpolator FAST_OUT_SLOW_IN_INTERPOLATOR = new FastOutSlowInInterpolator();
    private static final int ANIMATION_DURATION = 300;
    private static final int ANIMATION_DURATION2 = 400;
    private static final int ANIMATION_DURATION3 = 500;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        findViewByIds();
        setListeners();

    }

    @Override
    protected void onResume() {
        super.onResume();
        Realm realm = Realm.getDefaultInstance();
        RealmQuery<Account> query = realm.where(Account.class);
        RealmResults<Account> result = query.findAll();

        AccountsRecyclerAdapter adapter = new AccountsRecyclerAdapter(this, result);
        recyclerView.setAdapter(adapter);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));

    }

    private void findViewByIds() {
        recyclerView = (RecyclerView) findViewById(R.id.recycler_view);
        open = (FloatingActionButton) findViewById(R.id.open);
        debt = (FloatingActionButton) findViewById(R.id.debt);
        asset = (FloatingActionButton) findViewById(R.id.asset);
        job = (FloatingActionButton) findViewById(R.id.job);
        done = (FloatingActionButton) findViewById(R.id.done);
    }

    private void setListeners() {
        // openボタン
        open.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                moveButtonDebt(mOpenFlag);
                moveButtonAsset(mOpenFlag);
                moveButtonJob(mOpenFlag);
                mOpenFlag = !mOpenFlag;
            }
        });

        // debtボタン
        debt.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(MainActivity.this, InputDebtActivity.class);
                startActivityForResult(intent, REQUEST_CODE_DEBT);
            }
        });

        // assetボタン
        asset.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(MainActivity.this, InputAssetActivity.class);
                startActivityForResult(intent, REQUEST_CODE_ASSET);
            }
        });

        // jobボタン
        job.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(MainActivity.this, InputJobActivity.class);
                startActivityForResult(intent, REQUEST_CODE_JOB);
            }
        });

        // doneボタン
        done.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(MainActivity.this, ExpensiveActivity.class);
                startActivity(intent);
            }
        });
    }

    /**
     * Debtボタンアニメーション
     *
     * @param openFlag true: 開いている
     */
    private void moveButtonDebt(boolean openFlag) {
        if (!openFlag) {
            ViewCompat.animate(debt)
                    .alpha(1.0f)
                    .translationY(-300)
                    .setDuration(ANIMATION_DURATION)
                    .setInterpolator(FAST_OUT_SLOW_IN_INTERPOLATOR)
                    .setListener(new ViewPropertyAnimatorListenerAdapter() {
                        @Override
                        public void onAnimationEnd(View view) {
                            view.setVisibility(View.VISIBLE);
                        }
                    })
                    .start();
        } else {
            ViewCompat.animate(debt)
                    .alpha(0.0f)
                    .translationY(0)
                    .setDuration(ANIMATION_DURATION)
                    .setInterpolator(FAST_OUT_SLOW_IN_INTERPOLATOR)
                    .setListener(new ViewPropertyAnimatorListenerAdapter() {
                        @Override
                        public void onAnimationEnd(View view) {
                        }
                    })
                    .start();
        }
    }

    /**
     * assetボタンアニメーション
     *
     * @param openFlag true: 開いている
     */
    private void moveButtonAsset(boolean openFlag) {
        if (!openFlag) {
            ViewCompat.animate(asset)
                    .alpha(1.0f)
                    .translationY(-200)
                    .translationX(200)
                    .setDuration(ANIMATION_DURATION2)
                    .setInterpolator(FAST_OUT_SLOW_IN_INTERPOLATOR)
                    .setListener(new ViewPropertyAnimatorListenerAdapter() {
                        @Override
                        public void onAnimationEnd(View view) {
                            view.setVisibility(View.VISIBLE);
                        }
                    })
                    .start();
        } else {
            ViewCompat.animate(asset)
                    .alpha(0.0f)
                    .translationY(0)
                    .translationX(0)
                    .setDuration(ANIMATION_DURATION2)
                    .setInterpolator(FAST_OUT_SLOW_IN_INTERPOLATOR)
                    .setListener(new ViewPropertyAnimatorListenerAdapter() {
                        @Override
                        public void onAnimationEnd(View view) {
                        }
                    })
                    .start();
        }
    }

    /**
     * Jobボタンアニメーション
     *
     * @param openFlag true: 開いている
     */
    private void moveButtonJob(boolean openFlag) {
        if (!openFlag) {
            ViewCompat.animate(job)
                    .alpha(1.0f)
                    .translationX(300)
                    .setDuration(ANIMATION_DURATION3)
                    .setInterpolator(FAST_OUT_SLOW_IN_INTERPOLATOR)
                    .setListener(new ViewPropertyAnimatorListenerAdapter() {
                        @Override
                        public void onAnimationEnd(View view) {
                            view.setVisibility(View.VISIBLE);
                        }
                    })
                    .start();
        } else {
            ViewCompat.animate(job)
                    .alpha(0.0f)
                    .translationX(0)
                    .setDuration(ANIMATION_DURATION3)
                    .setInterpolator(FAST_OUT_SLOW_IN_INTERPOLATOR)
                    .setListener(new ViewPropertyAnimatorListenerAdapter() {
                        @Override
                        public void onAnimationEnd(View view) {
                        }
                    })
                    .start();
        }
    }

}
