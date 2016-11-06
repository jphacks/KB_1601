package me.hiroaki.smartfinance.model;

/**
 * Created by hiroaki on 2016/11/05.
 */

public class Expense extends Account {
    private int purchaseTime;


    public Expense(String name, long balance, double interest, int paymentPerYear, int time, int purchaseTime) {
        super(name, balance, interest, paymentPerYear, time);
        this.purchaseTime = purchaseTime;
    }


    public int getPurchaseTime()
    {
        int time = purchaseTime;
        return time;
    }


    public long getPV()
    {
        return getBalancePV(this, getPurchaseTime());
    }


}
