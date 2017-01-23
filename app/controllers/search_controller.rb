class SearchController < ApplicationController
  def search
    value = params[:search]
    @people = Person.where("lower(firstname) LIKE ? OR lower(lastname) LIKE ? OR lower(description) LIKE ?", "%#{value["text"].downcase}%","%#{value["text"].downcase}%","%#{value["text"].downcase}%").all.uniq
    @bills = Bill.where('lower(name) LIKE ?',"%#{value['text'].downcase}%").all
    searches_path
  end
end
