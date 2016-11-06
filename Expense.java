public class Expense
{


	public int getPurchaseTime()
	{
		int time = purchaseTime;
		return time;
	}


	public long getPV(Expense expense)
	{
		return getBalancePV(Expense expense);
	}
}
