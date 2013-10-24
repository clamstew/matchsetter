module UsersHelper

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def make_day_availability_text(integer)
    case integer
      when 1 then "Monday"
      when 2 then " _"
      when 3 then " _"
      when 4 then "Tuesday"
      when 5 then " _"
      when 6 then " _"
      when 7 then "Wednesday"
      when 8 then " _"
      when 9 then " _"
      when 10 then "Thursday"
      when 11 then " _"
      when 12 then " _"
      when 13 then "Friday"
      when 14 then " _"
      when 15 then " _"
      when 16 then "Saturday"
      when 17 then " _"
      when 18 then " _"
      when 19 then "Sunday"
      when 20 then " _"
      when 21 then " _"
    end 
  end
end