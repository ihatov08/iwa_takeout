module ApplicationHelper
  def default_meta_tags
    {
      title:       'いわていくあうと',
      description: '岩手県でテイクアウトができる飲食店まとめサイトです。',
      keywords:    '岩手県,テイクアウト',
      separator:   "&mdash;".html_safe,
      og: {
        title:    'いわていくあうと',
        type:     'website',
        description: '岩手県でテイクアウトができる飲食店まとめサイトです。',
        url:      'https://www.iwate-takeout.com/',
        image:    image_url("iwate2.jpg")
      }
    }
  end
end
