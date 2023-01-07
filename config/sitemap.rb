# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://mypalette.link"

SitemapGenerator::Sitemap.create do
  add new_palette_path
  add palettes_path
  add new_palette_second_path
  add palette_seconds_path
end
