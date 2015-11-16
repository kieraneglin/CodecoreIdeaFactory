class AddAttachmentToIdeas < ActiveRecord::Migration
  def change
    add_column "ideas", "attachment", :string
  end
end
