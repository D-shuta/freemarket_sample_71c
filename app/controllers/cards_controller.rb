class CardsController < ApplicationController
  def new
    @card = Card.all
  end

  def destroy
    @card = Card.find(params[:id])
    card.destroy
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    card.update(card_params)
  end

  private
  def card_params
    params.require(:cade).permit(:card_name,:card_number,:cvc,:exp_month,:exp_year)
    
  end
end
