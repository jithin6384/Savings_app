class AccountsController < ApplicationController
 
 def home

 end

 def index
 	#@accounts = Account.all
   # if Count.last.count == nil 
   #    count = 1 
   # else
   # debugger
      count = Count.last.count
   # end
      count = count + params[:format].to_i
      if params[:format].present?
        @date = count.day.ago.strftime("%d/%m/%Y %H:%M")
      else 
        @date = 0.day.ago.strftime("%d/%m/%Y %H:%M")
      end
        Count.last.update(count: count)
        d= Date.parse(@date)
        @d = d
        @accounts = Account.where(created_at: d.midnight..d.end_of_day)
        @accounts_first_date = Account.first.created_at.to_date
 end

 def new
   @account = Account.new
 end

 def edit
   @account = Account.find(params[:id])
 end

 def create 
   @account = Account.new(account_params)
   @account.user = User.first
   if @account.save
   	  flash[:notice] = "price was succesfully updated"
      redirect_to account_path(@account)
   else 
      render 'new'
   end
 end

 def update
   @account = Account.find(params[:id])
   if @account.update(account_params)
   	  flash[:notice]="price was succesfully edited"
      redirect_to account_path(@account)
   else
   	  render 'edit'
   	end
 end

 def show
   @account = Account.find(params[:id])
 end

 private

  def account_params
   params.require(:account).permit(:items_brought, :amount_spent)
  end

end