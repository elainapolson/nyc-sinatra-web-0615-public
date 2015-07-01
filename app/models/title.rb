class Title <ActiveRecord::Base
  has_many :figures, :through => :figure_titles
  has_many :figure_titles

  def add_figures_by_name=(figures_string)
    self.figures.clear
    figures = figures_string.split(",")
    figures.each do |figure|
      figure_obj = Figure.find_or_create_by(:name => figure.strip)
      figuretitle = self.figure_titles.build(:figure => figure_obj)
      figuretitle.save 
    end
  end
end