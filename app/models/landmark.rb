class Landmark <ActiveRecord::Base
  belongs_to :figure

  def add_figure_by_name=(figure_name)
    # self.figure.clear
    figure = Figure.find_or_create_by(:name => figure_name)
    self.figure_id = figure.id
    self.save
  end

end

# params = { landmarks => { name => name, # year_completed => year_completed, add_figure_by_name => figure_name } }

# landmarks[name] = name