class ExpensesController < ApplicationController
  def index
    @group = Group.find_by(user: current_user, id: params[:group_id])
    @expenses = @group.expenses.order(created_at: :desc)
  end

  def new
    @expense = Expense.new
    @groups = Group.all.where(user: current_user)
  end

  def create
    @expense = Expense.new(expense_params)
    @groups = params[:groups] || []
    @groups.each do |id|
      group = Group.find(id) unless id == ''
      @expense.groups << group unless group.nil?
    end
    @expense.author = current_user
    respond_to do |format|
      if @expense.save
        format.html { redirect_to group_expenses_path, notice: 'Expenditure successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html do
          redirect_to group_expenses_path, status: :unprocessable_entity,
                                           notice: 'Expenditure not added. All fields mandatory'
        end
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
