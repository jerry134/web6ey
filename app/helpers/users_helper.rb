module UsersHelper

  def gravatar_for(user, options={size:25})
    gravatar_image_tag(user.email, class: 'img-circle', gravatar: options)
  end
end
