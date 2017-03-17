require 'olap'

class HomeController < ApplicationController
  before_action :olap
  layout 'application', only: :index

  def index

    @markers = @bi.by_country('all')
  end

  def show
    @country        = params[:country]
    country         = TZInfo::Country.all.select {|c| c.name == params[:country]}.first.try(:code) || 'AR'
    @manufacturers  = @bi.by_country_and_manufacturer(country)

    render layout: false
  end

  def list
    country      = TZInfo::Country.all.select {|c| c.name == params[:country]}.first.try(:code) || 'AR'
    manufacturer = params[:manufacturer]

    @markers  = @bi.by_country_and_manufacturer_and_marker(country, manufacturer)
    render layout: false
  end

  private

  def olap
    @bi = Olap::Bi::Paintball.new
  end
end
