class ExportController < ApplicationController
  def show
    # html = params[:html]

    ac = ActionController::Base.new()
    html_string = ac.render_to_string :template => 'export/users.html'

    respond_to do |format|
      # some other formats like: format.html { render :show }
      format.pdf do
        pdf = Prawn::Document.new
        pdf.styled_text html_string
        send_data pdf.render,
                  filename: "export.pdf",
                  type: 'application/pdf',
                  disposition: 'inline'
      end
    end
  end
end
