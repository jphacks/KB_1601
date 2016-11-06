package me.hiroaki.smartfinance.model;

import android.os.Parcel;
import android.os.Parcelable;

import io.realm.RealmModel;

/**
 * Created by hiroaki on 2016/11/05.
 */

public class Job extends Account implements Parcelable {

    public Job() {}

    private Job(Parcel in) {
        setName(in.readString());
        setBalance(in.readLong());
        setInterest(in.readDouble());
        setPayment(in.readInt());
        setTime(in.readInt());
    }

    public static final Creator<Job> CREATOR
            = new Creator<Job>() {
        public Job createFromParcel(Parcel in) {
            return new Job(in);
        }

        public Job[] newArray(int size) {
            return new Job[size];
        }
    };

    public Job(String name, long balance, double interest, int paymentPerYear, int time) {
        super(name, balance, interest, paymentPerYear, time);
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(getName());
        parcel.writeLong(getBalance());
        parcel.writeDouble(getInterest());
        parcel.writeInt(getPayment());
        parcel.writeInt(getTime());
    }
}
