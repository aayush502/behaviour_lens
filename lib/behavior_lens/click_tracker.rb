# frozen_string_literal: true

class BehaviorLens::ClickTracker

  def track(link)
    click = Click.find_or_initialize_by(link: link)
    click.count += 1
    click.save
  end

  # Retrieve the most clicked link
  def most_clicked
    Click.order(count: :desc).first
  end

  # Generate a report of all clicks
  def report
    Click.all.map { |click| { link: click.link, count: click.count } }
  end
end
