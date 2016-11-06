public class Account
{


	public Account()
	{


	}
	// gets simple balance of account
	public long getBalance()
	{
		this.balance = balance;
		return balance;
	}


	public int getPayment()
	{
		this.payment = payment;
		return payment;
	}


	public int getYears()
	{
		this.time = time;
		return time;
	}


	public double getInterest()
	{
		this.interest = interest;
		return interest;
	}


	// calculates present value of the account
	public long getBalancePV(Account account)
	{
		int n = 0;
		int payment = getPayment();
		double return = getInterest();
		long futureValue = getBalance();


		if (account.getYears() > expense.getPurchaseTime())
		{
			n = expense.getPurchaseTime();
		}
		else
		{
			n = account.getYears();
		}


		if (account instanceof asset)
		{
			return calcPV(futureValue, payment, n, interest);
		}
		else if (account instanceof debt)
		{
			return calcPV(futureValue, payment, n, interest);
		}
		else if (account instanceof job)
		{
			return calcPV(futureValue, payment, n, interest);
		}
		else
		{
			return calcPV(futureValue, payment, n, interest);
		}
	}


	public long calcPV(long futureValue, int payment, int n, double interest)
	{
		if (payment == 0)
		{
			return futureValue * ( 1 / ( 1 + (long)interest) ^ (long)n)
}
else
{
	return (long) payment * ( ( ( (1 + (long) interest) ^ (long) n ) - 1) / (long) interest)
} 
	}
}
