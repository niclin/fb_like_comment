module FbLikeCommentHelper
  class Railtie < Rails::Railtie
    initializer "FbLikeCommentHelper.view_helpers" do
      ActionView::Base.send :include, FbLikeComment
    end
  end
end
