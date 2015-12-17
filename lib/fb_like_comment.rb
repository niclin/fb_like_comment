require "fb_like_comment/version"
require "fb_like_comment/railtie" if defined?(Rails)

module FbLikeComment
def social_plugin(plugin_name, options)
    width  = options.delete(:width)
    height = options.delete(:height)
    style  = "border:none; overflow:hidden; width:#{width}px; height:#{height}px;"
    src    = "http://www.facebook.com/plugins/#{plugin_name}.php?#{options.to_param}"

    content_tag(:iframe, "", src: src, scrolling: "no", frameborder: "0", style: style,
                allowtransparency: "true")
  end

  def fb_like(like_url, custom_options={})
    options = {
      href: like_url,
      send: false,
      layout: "button_count",
      show_faces: false,
      width: 90
    }

    options.merge! custom_options

    social_plugin("like", options)
  end

  def fb_comments(url, custom_options={})
    options = {
      href: url,
      num_posts: 10
    }

    options.merge! custom_options

    social_plugin("comments", options)
  end
end
