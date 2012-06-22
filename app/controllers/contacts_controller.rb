class ContactsController < ApplicationController
  def index
    @board_members = Member.find(:all,
                                 :conditions => "bt.description != 'Member'",
                                 :joins => "as m inner join board_titles as bt on m.board_title_id = bt.id",
                                 :order => "bt.id, m.last_name")
  end
end
