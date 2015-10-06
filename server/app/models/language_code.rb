class LanguageCode < ActiveHash::Base

  self.data = [
    # id, name
    {
      :id => 1,
      :name => 'en-us'
    },
    {
      :id => 2,
      :name => 'en-gb'
    }
  ]

end
