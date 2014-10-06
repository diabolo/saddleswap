require 'coderay'
module SH
  def some
    3
  end

  def peek
    print CodeRay.scan(page.body, :html).term
  end

  def submit_form
    find('input[@name="commit"]').click
  end

  def should_see_success_message
    expect(page.find(alert_success_finder).text.strip).to_not be_blank
  end

  def alert_success_finder
    #css to find the node containing the msg inside a success alert box
    '.alert-box.success .msg'
  end
end
World SH


