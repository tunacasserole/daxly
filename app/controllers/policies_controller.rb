class PoliciesController < ApplicationController
  before_action :set_policy, except:  [:index, :new, :create]

  def index
    @policies = Policy.limit(10)

    respond_to do |format|
      format.json { render json: process_search(Policy, search: '%') }
      format.html
    end
  end


  # GET /studio/policys/1 (will redirect to edit)
  # GET /studio/policys/1.json
  def show
    respond_to do |format|
      format.html { redirect_to action: 'edit', id: @policy.id }
      format.json do
        render json: { rows: (@policy.nil? ? [] : [@policy.marshall]),
         status: (@policy.nil? ? 404 : 200),
         total: (@policy.nil? ? 0 : 1) }
       end
     end
  end # def show

  # GET /studio/policys/new
  # GET /studio/policys/new.json
  def new
    @policy = Policy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json do
        render json: { rows: (@policy.nil? ? [] : [@policy.marshall]),
         status: (@policy.nil? ? 404 : 200),
         total: (@policy.nil? ? 0 : 1) }
       end
     end
  end # def new

  # POST /studio/policys
  # POST /studio/policys.json
  def create
    @policy = Policy.new(policy_params)
    respond_to do |format|
      if @policy.save
        flash[:success] = 'The policy was successfully created.'
        format.html { redirect_to policys_path }
        format.json { render json: { rows: [@policy.marshall], status: 200, total: 1 } }
      else
        notice = "An error occured while creating the policy. #{@policy.errors.full_messages.to_sentence}."
        flash[:error] = notice
        format.html { render action: 'new', alert: notice }
        format.json { render json: { errors: @policy.errors, status: :unprocessable_entity } }
      end
    end
  end # def create

  # GET /studio/policys/1/edit
  def edit
  end # def edit

  # PATCH /studio/policys/1
  # PATCH /studio/policys/1.json
  def update
    @policy = Policy.find(policy_params[:id])
    respond_to do |format|
      if @policy.update_attributes(policy_params)
        flash[:success] = 'The policy was successfully updated.'
        format.html { redirect_to edit_policy_url(@policy.id) }
        format.json { render json: { rows: [@policy.marshall], status: 200, total: 1 } }
      else
        base = 'Failed to save the policy. '
        flash[:error] = 'An error occured while updating the policy.'
        format.html { render action: 'edit', alert: base + @policy.errors.full_messages.to_sentence + '.' }
        format.json { render json: { errors: @policy.errors, status: :unprocessable_entity } }
      end
    end
  end # def update

  # DELETE /studio/policys/1
  # DELETE /studio/policys/1.json
  def destroy
    @policy.destroy
    respond_to do |format|
      format.html { redirect_to policys_url }
      format.json { render json: { status: 200 } }
    end
  end

  private

  def set_policy
    @policy = Policy.where(id: params[:id]).first
  end

  # Returns the strong parameters from the request
  def policy_params
    params.require(:policy).permit(Policy.column_names)
  end # def policy_params


end # class PoliciesController
