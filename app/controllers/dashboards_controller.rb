class DashboardsController < ApplicationController
  def index
    @claims = Claim.limit(10)
  end

  def show
    # @claims = Claim.all
  end

  def support
  end

  def claims
    redirect_to "http://localhost:3002"
  end
  
  def vendors
    redirect_to "http://localhost:3003/"
  end

end

