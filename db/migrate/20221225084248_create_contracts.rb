class CreateContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :contracts do |t|
      t.string :userAddress
      t.string :deployedAddress

      t.timestamps
    end
  end
end
