module ApplicationHelper
  def active_if(path)
    path == controller_path ? 'active' : ''
  end

  def default_meta_tags
    {
      site: 'MyPalette',
      title: 'MyPalette',
      reverse: true,
      separator: '|',
      description: 'webサイトの色の組み合わせを確認できるカラーアプリ。各パーツごとに好きな色を選ぶだけで理想のカラーリングを見つけることができます。webサイトの色の組み合わせを試したいならMyPalette',
      keywords: 'キーワード',
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      icon: [
        { href: image_url('favicon.ico') },
        { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: 'MyPalette',
        title: 'MyPalette',
        description: 'webサイトの色の組み合わせを確認できるカラーアプリ。各パーツごとに好きな色を選ぶだけで理想のカラーリングを見つけることができます。webサイトの色の組み合わせを試したいならMyPalette',
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@engineer_aion',
      }
    }
  end
end
