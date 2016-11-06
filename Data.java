public class Data
{
	//Account[] accounts = new Account[];
	
	long result = 0;
	
	public void getCurrBalance(Account[] accounts)
	{
		Account expense = new Account();
		expense = accounts[accounts.length()];


		//if (expense.getPurchaseTime() == 0)
		//{
			result = expense.getPV() - accounts.totalBalance();
		/*}
		else
		{
			result = expense.getPV() - accounts.totalBalancePV();
		}*/
		
		// print statements should be in onClick() of button
		System.out.println("Money have: " + accounts.totalBalance());
		System.out.println("Money required: " + result);
		
return result;
	}


	public Data (Account[] accounts)
	{
		this.accounts = accounts;
	}
}
