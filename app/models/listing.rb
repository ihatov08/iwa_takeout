# == Schema Information
#
# Table name: listings
#
#  id                     :bigint           not null, primary key
#  address                :string           not null
#  description            :text
#  google_map_url         :string
#  holidays               :string
#  hours                  :string
#  image_url              :text
#  main_image             :string
#  postal_code            :string
#  published              :boolean          default(FALSE), not null
#  support_project        :boolean          default(FALSE), not null
#  suspension_information :string
#  tabelog_url            :string
#  tel                    :string
#  title                  :string           not null
#  website_url            :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  category_id            :bigint           not null
#  city_id                :bigint           not null
#  facebook_id            :string
#  google_my_map_id       :bigint
#  instagram_id           :string
#  prefecture_id          :bigint           not null
#  twitter_id             :string
#
# Indexes
#
#  index_listings_on_category_id       (category_id)
#  index_listings_on_city_id           (city_id)
#  index_listings_on_google_my_map_id  (google_my_map_id)
#  index_listings_on_prefecture_id     (prefecture_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (city_id => cities.id)
#  fk_rails_...  (google_my_map_id => google_my_maps.id)
#  fk_rails_...  (prefecture_id => prefectures.id)
#
class Listing < ApplicationRecord
  paginates_per 24
  belongs_to :category
  belongs_to :prefecture
  belongs_to :city
  belongs_to :google_my_map, optional: true

  with_options presence: true do
    validates :address
    validates :title
  end

  mount_uploader :main_image, ImageUploader

  has_many :listing_staffs
  has_many :client_staffs, through: :listing_staffs

  has_many :foods, dependent: :destroy
  accepts_nested_attributes_for :foods, allow_destroy: true

  has_many :menus, dependent: :destroy
  accepts_nested_attributes_for :menus, allow_destroy: true

  has_rich_text :content

  scope :published, -> { where(published: true) }

  def full_address
    "#{prefecture.name} #{city.name} #{address}"
  end

  def image_url_or_main_image?
    image_url? || main_image?
  end

  def image_url_or_main_image
    if image_url?
      image_url
    else
      main_image.url
    end
  end

  def self.engan_exclude
    %w(大槌 釜石 大船渡 陸前高田 山田)
  end

  SNS = %w(instagram twitter facebook)

  SNS.each do |sns|
    define_method("#{sns}_url=") do |val|
      self["#{sns}_id"] = File.basename(val) rescue nil
    end

    define_method("#{sns}_url") do
      if self["#{sns}_id"].present?
        "https://www.#{sns}.com/#{send("#{sns}_id")}"
      else
        nil
      end
    end
  end

  def images_from_website
    return nil unless website_url
    Rails.logger.info website_url
    html = URI.open(website_url){|f| f.read }
    doc = Nokogiri::HTML.parse(html)

    doc.search("img").map{|img| img["src"]}
  end

  def title_with_suspension_information
    if suspension_information?
      "【#{suspension_information}】#{title}"
    else
      title
    end
  end
end
