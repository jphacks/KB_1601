package me.hiroaki.smartfinance.model;

/**
 * Created by hiroaki on 2016/11/06.
 */

public class Accounts
{
    // var for updating total balance: money the user HAS
    long totalBal = 0;


    // calculates balance of accounts array not including expense account


    public long totalBal(Account[] accounts)
    {
        // loop through the accounts array and add balances
        for (int i = 0; i < accounts.length - 1; i++)
        {
            totalBal += accounts[i].getBalance();
        }
        return totalBal;
    }



    //calculates balance of accounts if purchase time != 0


    public void totalBalPV(Account[] accounts)
    {
        //loop through accounts array and calculate present value of each account then
// add to totalBal


        for (int i = 0; i < accounts.length - 1; i++)
        {
            totalBal += accounts[i].getBalancePV(accounts[i], accounts.length - 1);
        }
    }
}