package me.hiroaki.smartfinance.model;

import io.realm.RealmList;
import io.realm.RealmModel;
import io.realm.RealmObject;
import io.realm.annotations.PrimaryKey;
import io.realm.annotations.RealmClass;

/**
 * Created by hiroaki on 2016/11/06.
 */

public class Data  {

    @PrimaryKey
    private int id;

    private RealmList<Account> accounts;

    long result = 0;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public RealmList<Account> getAccounts() {
        return accounts;
    }

    public void setAccounts(RealmList<Account> accounts) {
        this.accounts = accounts;
    }

    public void getCurrBalance(Account[] accounts)
    {
        Expense expense = (Expense) accounts[accounts.length - 1];


        //if (expense.getPurchaseTime() == 0)
        //{
        Accounts accounts1 = new Accounts();
        result = expense.getPV() - accounts1.totalBal(accounts);
		/*}
		else
		{
			result = expense.getPV() - accounts.totalBalancePV();
		}*/

        // print statements should be in onClick() of button
        System.out.println("Money have: " + accounts1.totalBal(accounts));
        System.out.println("Money required: " + result);
    }

}
