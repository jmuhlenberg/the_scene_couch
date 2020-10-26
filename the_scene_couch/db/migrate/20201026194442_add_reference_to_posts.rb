class AddReferenceToPosts < ActiveRecord::Migration[5.2]
  def change
    # add_reference : {table_name}, {foreign_object}, {options}
    add_reference :posts, :user, index: true, foreign_key: true
  end
end
