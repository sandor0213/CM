class AddVacancyIdToApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :vacancy_id, :integer
  end
end
