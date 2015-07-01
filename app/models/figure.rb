class Figure <ActiveRecord::Base
  has_many :figure_titles
  has_many :titles, :through => :figure_titles
  has_many :landmarks

  def add_titles_by_name=(titles_string)
    self.titles.clear
    titles = titles_string.split(",")
    titles.each do |title|
      title_obj = Title.find_or_create_by(:name => title.strip)

      figuretitle = self.figure_titles.build(:title => title_obj)
      figuretitle.save 
    end
  end

end