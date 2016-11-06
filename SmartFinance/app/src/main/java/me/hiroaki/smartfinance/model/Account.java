package me.hiroaki.smartfinance.model;

import io.realm.RealmModel;
import io.realm.annotations.RealmClass;

/**
 * Created by hiroaki on 2016/11/05.
 */

public class Account  {

    private String name;
    private long balance;
    private double interest;
    private int payment;
    private int time;


    public Account(String name, long balance, double interest, int payment, int time) {
        this.name = name;
        this.balance = balance;
        this.interest = interest;
        this.payment = payment;
        this.time = time;
    }

    public Account() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getBalance() {
        return balance;
    }

    public void setBalance(long balance) {
        this.balance = balance;
    }

    public double getInterest() {
        return interest;
    }

    public void setInterest(double interest) {
        this.interest = interest;
    }

    public int getPayment() {
        return payment;
    }

    public void setPayment(int payment) {
        this.payment = payment;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }


    // calculates present value of the account
    public long getBalancePV(Account account, int purchaseTime) {
        int n = 0;
        int payment = getPayment();
        double interest = getInterest();
        long futureValue = getBalance();


        if (account.getTime() > purchaseTime) {
            n = purchaseTime;
        } else {
            n = account.getTime();
        }


        if (account instanceof Asset) {
            return calcPV(futureValue, payment, n, interest);
        } else if (account instanceof Debt) {
            return calcPV(futureValue, payment, n, interest);
        } else if (account instanceof Job) {
            return calcPV(futureValue, payment, n, interest);
        } else {
            return calcPV(futureValue, payment, n, interest);
        }
    }


    public long calcPV(long futureValue, int payment, int n, double interest) {
        if (payment == 0) {
            return futureValue * (1 / (1 + (long) interest) ^ (long) n);
        } else {
            return (long) payment * ((((1 + (long) interest) ^ (long) n) - 1) / (long) interest);
        }
    }
}
