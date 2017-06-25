class ItemImage < ApplicationRecord
    belongs_to :item
    has_attached_file :image
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    def item_image_url
        return image.url(:original)
    end
end