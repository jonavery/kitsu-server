# == Schema Information
#
# Table name: stats
#
#  id         :integer          not null, primary key
#  stats_data :jsonb            not null
#  type       :string           not null, indexed => [user_id]
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null, indexed => [type], indexed
#
# Indexes
#
#  index_stats_on_type_and_user_id  (type,user_id) UNIQUE
#  index_stats_on_user_id           (user_id)
#
# Foreign Keys
#
#  fk_rails_9e94901167  (user_id => users.id)
#

class Stat < ApplicationRecord
  class MangaFavoriteYear < Stat
    include Stat::FavoriteYear

    # recalculate
    def media_column
      :manga
    end

    def media_start_date
      'manga.start_date'
    end

    # increment & decrement
    def self.media_type
      'Manga'
    end
  end
end
