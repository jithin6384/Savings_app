class AccountsController < ApplicationController
 
 def home

 end

 def index
 	@accounts = Account.all
 end

 def new
   @account = Account.new
 end

 def edit
   @account = Account.find(params[:id])
 end

 def create 
   @account = Account.new(account_params)
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