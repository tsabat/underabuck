class Sellable < ApplicationRecord
  def self.next_import(vendor_id:)
    max(:import_id).where(vendor_idj: vendor_id).to_i + 1
  end
end
