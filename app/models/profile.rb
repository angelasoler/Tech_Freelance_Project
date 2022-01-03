class Profile < ApplicationRecord
  validates :full_name, :birth_date, :educational_background,
            :work_field, :about_me, :work_experience, presence: { on: :create }
  validates :about_me, length: { in: 15..120 }
  validate :name_and_surname, :valid_date, on: :create

  belongs_to :freelancer
  has_one_attached :photo
  has_many :proposals, dependent: :destroy

  
  def name_and_surname
    return unless full_name.present? && full_name.split.size == 1

    errors.add(:full_name, I18n.t('name_and_surname', scope: 'activerecord.errors.messages'))
  end

  def valid_date
    errors.add(:birth_date, I18n.t('valid_date', scope: 'activerecord.errors.messages')) unless birth_date && birth_date.is_a?(Date)
  end
end
