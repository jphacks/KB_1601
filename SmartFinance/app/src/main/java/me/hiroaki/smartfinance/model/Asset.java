package me.hiroaki.smartfinance.model;

import android.os.Parcel;
import android.os.Parcelable;

import io.realm.RealmModel;
import io.realm.RealmObject;
import io.realm.annotations.RealmClass;

/**
 * Created by hiroaki on 2016/11/05.
 */
@RealmClass
public class Asset extends Account implements Parcelable, RealmModel{

    public Asset() {
        super();
    }

    private Asset(Parcel in) {
        setName(in.readString());
        setBalance(in.readLong());
        setInterest(in.readDouble());
        setPayment(in.readInt());
        setTime(in.readInt());
    }

    public static final Creator<Asset> CREATOR
            = new Creator<Asset>() {
        public Asset createFromParcel(Parcel in) {
            return new Asset(in);
        }

        public Asset[] newArray(int size) {
            return new Asset[size];
        }
    };

    public Asset(String name, long balance, double interest, int paymentPerYear, int time) {
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
