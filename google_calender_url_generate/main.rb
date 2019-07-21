class GoogleCalender
  attr_reader :text, :dates, :location, :trp, :sprop, :add

  def initialize(text:, dates: '', location: '', trp: false, sprop: '', add: '')
    @text = text
    @dates = dates
    @location = location
    @trp = trp
    @sprop = sprop
    @add = add
  end

  def url_generate
    URI.encode_www_form_component(
      format(
        url_template,
        text,
        dates,
        location,
        trp.to_s,
        sprop,
        add
      )
    )
  end

  private

  def url_template
    'https://www.google.com/calendar/render?action=TEMPLATE&text=%s&dates=%s&location=%s&trp=%s&sprop=%s&add=%s'.freeze
  end
end

puts GoogleCalender.new(text: 'test').url_generate

