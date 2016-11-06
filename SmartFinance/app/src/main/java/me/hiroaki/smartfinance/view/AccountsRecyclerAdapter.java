package me.hiroaki.smartfinance.view;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.AbstractList;
import java.util.ArrayList;

import me.hiroaki.smartfinance.R;
import me.hiroaki.smartfinance.model.Account;

/**
 * Created by hiroaki on 2016/11/06.
 */

public class AccountsRecyclerAdapter extends RecyclerView.Adapter<AccountsRecyclerAdapter.ViewHolder> {
    Context context;
    AbstractList<Account> accounts;

    public AccountsRecyclerAdapter(Context context, AbstractList<Account> accounts) {
        this.context = context;
        this.accounts = accounts;
    }

    @Override
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(context);
        View view = inflater.inflate(R.layout.item_accounts, parent, false);
        ViewHolder viewHolder = new ViewHolder(view);
        return viewHolder;
    }

    @Override
    public void onBindViewHolder(ViewHolder holder, int position) {
        Account account = accounts.get(position);
        holder.name.setText(account.getName());
    }

    @Override
    public int getItemCount() {
        return accounts.size();
    }

    class ViewHolder extends RecyclerView.ViewHolder {
        View view;
        TextView name;

        public ViewHolder(View itemView) {
            super(itemView);
            view = itemView;
            name = (TextView) view.findViewById(R.id.name);
        }
    }
}
