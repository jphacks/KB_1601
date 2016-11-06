package me.hiroaki.smartfinance.model;

import android.os.Parcel;
import android.os.Parcelable;

import io.realm.RealmModel;

/**
 * Created by hiroaki on 2016/11/05.
 */

public class Debt extends Account implements Parcelable {
    private int payments;

    public Debt() {
        super();
    }

    private Debt(Parcel in) {
        this.payments = in.readInt();
        setName(in.readString());
        setBalance(in.readLong());
        setInterest(in.readDouble());
        setPayment(in.readInt());
        setTime(in.readInt());
    }

    public static final Creator<Debt> CREATOR
            = new Creator<Debt>() {
        public Debt createFromParcel(Parcel in) {
            return new Debt(in);
        }

        public Debt[] newArray(int size) {
            return new Debt[size];
        }
    };

    public Debt(String name, long balance, double interest, int paymentPerYear, int time, int payments) {
        super(name, balance, interest, paymentPerYear, time);
        this.payments = payments;
    }

    public int getPayments() {
        return payments;
    }

    public void setPayments(int payments) {
        this.payments = payments;
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(payments);
        parcel.writeString(getName());
        parcel.writeLong(getBalance());
        parcel.writeDouble(getInterest());
        parcel.writeInt(getPayment());
        parcel.writeInt(getTime());
    }
}
