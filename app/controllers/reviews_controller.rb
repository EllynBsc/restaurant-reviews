class ReviewsController < ApplicationController

  def new #GET, form ready to be filled
    # raise
    # 1.fetch the restaurant for which i want to attach a review to
    @restaurant = Restaurant.find(params[:restaurant_id])
    # 2.create an empty review instance/box ready to be filled in by the user
    @review = Review.new
    # raise
  end

  def create #POST
    # 1.fetch the restaurant from the parametized url
    @restaurant = Restaurant.find(params[:restaurant_id])
    # 2.create the review with the strong params
    @review = Review.new(the_reviews_strong_params)
    # 3. we want to assign the review to the restaureant of the url
    @review.restaurant_id =  @restaurant.id
    # @review.restaurant = @restaurant
    # raise
    # 4.save the review instance in the DB
    # @review.save
    # 5.redirect the user
    # redirect_to restaurant_path(@restaurant)


    # RENDER VALIDATION ERRORS IF USER NOT FILLING THE PROPER INFOS
    if @review.save #save returns you a boolean
      redirect_to restaurant_path(@restaurant)
    else
      render :new #this is not a new http request, this is just rendering the action again
    end
  end


  private

  def the_reviews_strong_params
    params.require(:review).permit(:content)
  end

end
